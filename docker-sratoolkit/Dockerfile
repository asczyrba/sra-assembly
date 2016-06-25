FROM ubuntu:latest

MAINTAINER Alex Sczyrba, asczyrba@cebitec.uni-bielefeld.de


RUN apt-get -y update && apt-get install -y wget && \
    wget "http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.6.3/sratoolkit.2.6.3-ubuntu64.tar.gz" && \
    tar xzf sratoolkit.2.6.3-ubuntu64.tar.gz && \
    cp -r sratoolkit.2.6.3-ubuntu64/bin/* /usr/bin && \
    rm -rf sratoolkit.2.6.3-ubuntu64*
    
# Default command
WORKDIR /data
CMD ["bash"]
