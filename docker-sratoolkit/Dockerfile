FROM ubuntu:latest

MAINTAINER Alex Sczyrba, asczyrba@cebitec.uni-bielefeld.de

RUN apt-get -y update && apt-get install -y wget python unzip curl
RUN wget "http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.6.3/sratoolkit.2.6.3-ubuntu64.tar.gz"
RUN tar xzf sratoolkit.2.6.3-ubuntu64.tar.gz
RUN cp -r sratoolkit.2.6.3-ubuntu64/bin/* /usr/bin && rm -rf sratoolkit.2.6.3-ubuntu64*
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws 

RUN echo "#!/bin/sh" > /usr/local/bin/sra2s3.sh && \
    echo "fastq-dump --split-3 --gzip \$1" >> /usr/local/bin/sra2s3.sh && \
    echo "aws s3 cp --region=us-west-2 \${1}* \${2}/" >> /usr/local/bin/sra2s3.sh && \
    chmod +x /usr/local/bin/sra2s3.sh

# Default command
WORKDIR /data
CMD sra2s3.sh
