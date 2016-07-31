package main

import (
	"io/ioutil"
	"log"
	"os/exec"

	"github.com/otiai10/gosseract"
	_ "github.com/otiai10/mint"
)

func main() {
	err := splitVideoToFrames()
	if err == nil {
		extractText()
	} else {
		log.Println(err)
	}
}

func extractText() {
	client, err1 := gosseract.NewClient()
	if err1 != nil {
		log.Println(err1)
	}
	extractedText, err2 := client.Src("/output/test000139.jpg").Out()
	if err2 != nil {
		log.Println(err2)
	}
	ioutil.WriteFile("/output/extracted_text.txt", []byte(extractedText), 0644)
}

func splitVideoToFrames() error {
	ffmpegCmd := exec.Command("ffmpeg", "-i", "./examples/test.mp4", "-qscale:v", "2", "/output/test%06d.jpg")
	err := ffmpegCmd.Run()
	return err
}
