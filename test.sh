set -e
docker pull ubuntu
docker pull dcycle/md2html:1
docker build -t local-dcycle-md2html-image .
docker run --rm -v $(pwd)/example01:/app/code local-dcycle-md2html-image
docker run --rm -v $(pwd)/example01/test:/app/code dcycle/md2html:1
