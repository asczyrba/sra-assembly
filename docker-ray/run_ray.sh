#!/bin/sh

S3_IN=$1
S3_OUT=$2
ID=$3
NUM_CPUS=$4
KMER=$5

aws --region=us-west-2 s3 cp $S3_IN/${ID}_1.fastq.gz .
aws --region=us-west-2 s3 cp $S3_IN/${ID}_2.fastq.gz .
mpiexec -n $NUM_CPUS Ray -k $KMER -p ${ID}_1.fastq.gz ${ID}_2.fastq.gz -o ${ID}_ray_$KMER
aws --region=us-west-2 s3 cp ${ID}_ray_$KMER/Contigs.fasta $S3_OUT/${ID}_ray_$KMER/
aws --region=us-west-2 s3 cp ${ID}_ray_$KMER/ElapsedTime.txt $S3_OUT/${ID}_ray_$KMER/
rm -rf ${ID}_1.fastq.gz ${ID}_2.fastq.gz ${ID}_ray_$KMER
