FROM ubuntu:15.04

MAINTAINER Alex Sczyrba, asczyrba@cebitec.uni-bielefeld.de

RUN apt-get -y update && apt-get install -y python unzip curl openssh-server openmpi-bin Ray && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

ADD run_ray.sh /usr/local/bin

# Default command
WORKDIR /data
