FROM ubuntu

RUN apt-get update && \
  apt-get -y --no-install-recommends install curl wget ca-certificates && \
  rm -rf /var/lib/apt/lists/*

RUN curl -L -O $(curl https://api.github.com/repos/jgm/pandoc/releases/latest \
  | grep browser_download_url \
  | grep linux-amd64 \
  | cut -d '"' -f 4)

RUN tar xvf pandoc-*.tar.gz --strip-components 1 -C /usr/local

WORKDIR /app/code

ENTRYPOINT [ "pandoc" ]
