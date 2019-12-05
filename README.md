[![CircleCI](https://circleci.com/gh/dcycle/docker-md2html.svg?style=svg)](https://circleci.com/gh/dcycle/docker-md2html)

Translate markdown to html with [pandoc](https://pandoc.org).

For example:

    docker run --rm -v $(pwd)/example01:/app/code \
      dycle/md2html:1 -t html5 README.md -o README.html

See [this project on the Docker Hub](https://hub.docker.com/r/dcycle/md2html/).
