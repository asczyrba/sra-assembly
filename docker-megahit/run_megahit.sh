#!/bin/sh

S3_IN=$1
S3_OUT=$2
ID=$3

aws --region=us-west-2 s3 cp $S3_IN/${ID}_1.fastq.gz .
aws --region=us-west-2 s3 cp $S3_IN/${ID}_2.fastq.gz .
megahit --presets meta-sensitive -1 ${ID}_1.fastq.gz -2 ${ID}_2.fastq.gz -o ${ID}_megahit
aws --region=us-west-2 s3 cp ${ID}_megahit/final.contigs.fa $S3_OUT/${ID}_megahit/
aws --region=us-west-2 s3 cp ${ID}_megahit/log $S3_OUT/${ID}_megahit/
rm -rf ${ID}_1.fastq.gz ${ID}_2.fastq.gz ${ID}_megahit
