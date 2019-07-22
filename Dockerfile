# Start with a lightweight Debian image
FROM rocker/r-base:latest
MAINTAINER "Stefan Emmons" stefanemmons@gmail.com

# Get large GeoSpatial libraries

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    wget \
    locales \
    gnupg2 \
    git \
    libglib2.0-0 \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    libgeos++-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libudunits2-dev \
    libglib2.0-dev \
    libcairo2-dev \
    libgdal-dev \
    libproj-dev
    
#Install rJava and default JDK 

RUN apt-get update \
  && apt-get install -y \
    default-jdk \
    r-cran-rjava \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/
