package main

import "os/exec"

func main() {
	splitVideoToFrames()
}

func splitVideoToFrames() {
	ffmpegCmd := exec.Command("ffmpeg", "-i", "./examples/test.mp4", "-f", "image2", "-pix_fmt", "bgr24", "/output/test%06d.bmp")
	if ffmpegCmd.Run() != nil {
		panic("Error running ffmpeg command")
	}
}
