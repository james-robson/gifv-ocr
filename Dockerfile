FROM ubuntu:trusty

# Grab initial tools required for the rest of the build
RUN apt-get update && apt-get install -y wget software-properties-common
RUN add-apt-repository ppa:ubuntu-lxc/lxd-stable # required for Go
RUN add-apt-repository ppa:mc3man/trusty-media   # required for ffmpeg
RUN apt-get update

# Install Go and export $GOPATH
RUN mkdir /go && export GOPATH="/go"
RUN apt-get install -y golang

# Install ffmpeg
RUN apt-get install -y ffmpeg
