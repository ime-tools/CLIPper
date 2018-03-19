ARG baseimage_version=xenial
FROM ubuntu:${baseimage_version}

ARG version=master
ARG VCS_REF
ARG BUILD_DATE

RUN echo "VCS_REF: "${VCS_REF}", BUILD_DATE: "${BUILD_DATE}", branch: "${version}

LABEL maintainer="daniel.amsel@ime.fraunhofer.de" \
      description="Container for the omniCLIP package" \
      version="v1.0.0" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/ime-tools/CLIPper"
 

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
