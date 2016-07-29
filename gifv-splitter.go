package main

import (
	"flag"
	"os"
	//"image"
)

func main() {
	filePath := flag.String("file", "", "Path to the file which must be split")
	flag.Parse()
	os.Open(*filePath)
}

// func GIFSplitFrames(reader io.Reader) (err error) {
// 	gif, err := gif.DecodeAll(reader)
// }
