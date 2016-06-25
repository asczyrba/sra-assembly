docker run -v /vol/scratch:/data --rm -e "AWS_SECRET_ACCESS_KEY=XXX" -e "AWS_ACCESS_KEY_ID=XXX" asczyrba/sratoolkit sra2s3.sh SRR1015285 "s3://MYBUCKET"
