FROM ubuntu

RUN apt-get update && apt-get -y install pandoc

WORKDIR /app/code

ENTRYPOINT [ "pandoc" ]
