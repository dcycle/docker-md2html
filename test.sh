#!/bin/bash
#
# Test the image.
#
set -e

echo "Get the latest alpine"
docker pull alpine

echo "Build the image"
docker build -t local-dcycle-md2html-image .

echo "Run the image"
docker run --rm -v $(pwd)/example01:/app/code local-dcycle-md2html-image -t html5 README.md -o README.html
echo ""
echo "All tests passing!"
echo ""
