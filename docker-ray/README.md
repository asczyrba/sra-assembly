docker run -v /vol/scratch:/data --rm -e "AWS_SECRET_ACCESS_KEY=XXX" -e "AWS_ACCESS_KEY_ID=XXX" asczyrba/ray run_ray.sh S3_BUCKET_SRC S3_BUCKET_DEST SRA_ID NUM_CPUS KMER
