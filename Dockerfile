FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y curl
RUN curl -o linux.tar.gz http://dl.pdfix.net:8000/download?file=pdfix_sdk_7.1.1.28_4e683a49_linux.tar.gz
RUN mkdir /pdfix && tar -xvzf linux.tar.gz --directory /pdfix
