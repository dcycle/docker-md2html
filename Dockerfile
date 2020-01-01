FROM ubuntu

# Install packages required to get the latest package from GitHub.
RUN apt-get update && \
  apt-get -y --no-install-recommends install curl wget ca-certificates && \
  rm -rf /var/lib/apt/lists/*

# apt-get install is out of date, so we are using a variant of a technique
# described at
# https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8
# to obtain the latest version of pandoc as a tar.gz file.
RUN curl -L -O $(curl https://api.github.com/repos/jgm/pandoc/releases/latest \
  | grep browser_download_url \
  | grep linux-amd64 \
  | cut -d '"' -f 4)

# see https://pandoc.org/installing.html.
RUN tar xvf pandoc-*.tar.gz --strip-components 1 -C /usr/local

WORKDIR /app/code

ENTRYPOINT [ "pandoc" ]
