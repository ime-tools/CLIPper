FROM ubuntu:latest

MAINTAINER Daniel Amsel "daniel.amsel@ime.fraunhofer.de"
 

WORKDIR /opt/

RUN apt update && apt upgrade --yes && apt install --yes python \
	python-pip \
	zlib1g-dev \
	pkg-config \
	libpng-dev \
	libfreetype6-dev \
	libbz2-dev \
	liblzma-dev \
	libcurl4-gnutls-dev

RUN pip install cython \
	numpy \
	scipy

RUN easy_install clipper

WORKDIR /data/
