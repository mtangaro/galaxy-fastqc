####

FROM ubuntu:14.04

MAINTAINER ma.tangaro@gmail.com

# Install OpenJDK 7 JRE 
RUN apt-get update && apt-get install --yes \
    openjdk-7-jre \
    wget \
    unzip

WORKDIR /opt

ENV FASTQC_VERSION=0.11.5

ENV FASTQC_PATH=http://www.bioinformatics.babraham.ac.uk/projects/fastqc

ENV FASTQC_PACKAGE=fastqc_v${FASTQC_VERSION}

RUN wget ${FASTQC_PATH}/FASTQC_PACKAGE

RUN unzip ${FASTQC_PACKAGE}

RUN chmod +x FastQC/fastqc

RUN cp FastQC/fastqc /usr/bin/fastqc

RUN hg clone https://toolshed.g2.bx.psu.edu/repos/devteam/fastqc galaxy-fastqc

RUN cp galaxy-fastqc/rgFastQC.py /usr/bin/rgFastQC.py

RUN chmod a+x /usr/binrgFastQC.py
