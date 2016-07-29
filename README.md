# git-ocr

## Purpose
This app is intended to take an animated GIF and identify any frames which contain text. The text should be extracted using OCR.

## Basic usage
mkdir ~/output
docker build -t git-ocr .
docker run -v ~/output:/output git-ocr
