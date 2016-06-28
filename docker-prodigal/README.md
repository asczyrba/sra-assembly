docker run -v /vol/scratch:/data --rm -e "AWS_SECRET_ACCESS_KEY=XXX" -e "AWS_ACCESS_KEY_ID=XXX" asczyrba/prodigal run_prodigal.sh S3_BUCKET SRA_ID
