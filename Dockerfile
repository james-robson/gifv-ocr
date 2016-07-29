FROM ubuntu:trusty

# This will be used to store individual frames
VOLUME ["/output"]

# Grab initial tools required for the rest of the build
RUN apt-get update && apt-get install -y wget software-properties-common
RUN add-apt-repository ppa:ubuntu-lxc/lxd-stable # required for Go
RUN add-apt-repository ppa:mc3man/trusty-media   # required for ffmpeg
RUN apt-get update

# Install Go and export $GOPATH
RUN mkdir -p /go/src/gifv-ocr && export GOPATH="/go"
RUN apt-get install -y golang

# Install ffmpeg
RUN apt-get install -y ffmpeg

ENTRYPOINT ["ffmpeg", "-i", "/go/src/gifv-ocr/examples/test.mp4", "-f", "image2", "-pix_fmt", "bgr24", "/output/test%06d.bmp"]

COPY . /go/src/gifv-ocr
