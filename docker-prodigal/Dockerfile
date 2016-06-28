FROM ubuntu:latest

MAINTAINER Alex Sczyrba, asczyrba@cebitec.uni-bielefeld.de

RUN apt-get -y update && apt-get install -y python unzip curl && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

ADD prodigal /usr/local/bin/
ADD run_prodigal.sh /usr/local/bin/
ADD agrep /usr/local/bin/

# Default command
WORKDIR /data
