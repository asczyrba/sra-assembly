FROM ubuntu:latest

MAINTAINER Alex Sczyrba, asczyrba@cebitec.uni-bielefeld.de

RUN apt-get -y update && apt-get install -y wget python unzip curl && \
    wget "http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.6.3/sratoolkit.2.6.3-ubuntu64.tar.gz" && \
    tar xzf sratoolkit.2.6.3-ubuntu64.tar.gz && \
    cp -r sratoolkit.2.6.3-ubuntu64/bin/* /usr/bin && rm -rf sratoolkit.2.6.3-ubuntu64* && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    echo "#!/bin/sh" > /usr/local/bin/sra2s3.sh && \
    echo "fastq-dump --split-3 --gzip \$1" >> /usr/local/bin/sra2s3.sh && \
    echo "for i in \$1*gz; do aws --region=us-west-2 s3 cp \$i \${2}/; done" >> /usr/local/bin/sra2s3.sh && \
    echo "rm \$1*gz" >> /usr/local/bin/sra2s3.sh && \
    chmod +x /usr/local/bin/sra2s3.sh

# Default command
WORKDIR /data
CMD sra2s3.sh
