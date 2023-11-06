# Docker Demo

About... https://docker-curriculum.com/

## Dockerfile
https://hub.docker.com/search

Minimal:
```
FROM: alpine:latest
CMD ["/bin/sh", "-c", "echo 'It works!'"]
```

c++ dev linux
```
FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y curl libc6-dev
```

PDFix SDK CLI 
```
FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y curl
RUN curl -o linux.tar.gz http://dl.pdfix.net:8000/download?file=pdfix_sdk_7.1.1.28_4e683a49_linux.tar.gz
RUN mkdir /pdfix && tar -xvzf linux.tar.gz --directory /pdfix
```

## Build & Run Examples

Build:
```
docker build --rm -t pdfix-demo . 
```
run:
```
docker run -it pdfix-demo /bin/bash  
```

Platform:
```
docker build --platform linux/amd64 --rm -t pdfix-demo . 
```
```
docker run --platform linux/amd64 -it pdfix-demo /bin/bash  
```

Mount folder:
```
docker run --platform linux/amd64 -it -v $PWD/:/pdf pdfix-demo /bin/bash  
```
Run pdfix
```
docker run --platform linux/amd64 -it -v $PWD/pdf:/pdf -w /pdfix/bin/x64 pdfix-demo /bin/bash  
```

CLI add-tags
```
./pdfix_app add-tags -i /pdf/example.pdf -o /pdf/tagged.pdf --preflight
```

## Orher resources

### Run container and get name
```
docker run -it pdfix-demo --name my-container-name
```

### Get container IP
```
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' {container_name_or_id}
```
output
```
172.17.0.2
```

### Run web server example
Simple web server 

- https://docs.docker.com/language/nodejs/containerize/
- https://docs.docker.com/language/python/containerize/
- https://hub.docker.com/_/nginx

## Clear build cache
```
docker builder prune
```