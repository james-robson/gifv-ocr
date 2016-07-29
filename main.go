package main

import (
	"os/exec"

	_ "github.com/otiai10/gosseract"
	_ "github.com/otiai10/mint"
)

func main() {
	splitVideoToFrames()
}

func splitVideoToFrames() {
	ffmpegCmd := exec.Command("ffmpeg", "-i", "./examples/test.mp4", "-f", "image2", "-pix_fmt", "bgr24", "/output/test%06d.bmp")
	if ffmpegCmd.Run() != nil {
		panic("Error running ffmpeg command")
	}
}
