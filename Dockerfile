FROM ubuntu:trusty

# This will be used to store individual frames
VOLUME ["/output"]

# Grab initial tools required for the rest of the build
RUN apt-get update && apt-get install -y wget software-properties-common
RUN add-apt-repository ppa:ubuntu-lxc/lxd-stable # required for Go
RUN add-apt-repository ppa:mc3man/trusty-media   # required for ffmpeg
RUN apt-get update

# Install Tesseract
RUN apt-get install -y libtesseract-dev libleptonica-dev tesseract-ocr

# Install ffmpeg
RUN apt-get install -y ffmpeg

# Install Go and export $GOPATH
RUN apt-get install -y golang

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# Install the Go app and run
ENV WORKDIR=/go/src/github.com/james-robson/gifv-ocr
WORKDIR $WORKDIR

COPY . $WORKDIR

RUN go install .

ENTRYPOINT /go/bin/gifv-ocr
