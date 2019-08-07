# Start with a lightweight Debian image
FROM rocker/r-base:latest
MAINTAINER "Stefan Emmons" stefanemmons@gmail.com

# Remain up-to-date with upgrades

RUN apt-get update -qq \
  && apt-get dist-upgrade -y

# Get large GeoSpatial libraries

RUN apt-get update && \
  apt-get install -t unstable -y --no-install-recommends \
    git \
    gnupg2 \
    locales \
    wget \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    libgeos++-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libudunits2-dev \
    libcairo2-dev/unstable \
    libgdal-dev \
    libproj-dev
    
#Install rJava and default JDK 

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    default-jdk \
    r-cran-rjava \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/
