#!/bin/sh

S3_BUCKET=$1
ID=$2

aws s3 cp $S3_BUCKET/final.contigs.fa - | prodigal -a ${ID}_genes.faa -d ${ID}_genes.fna -f gff -o ${ID}_genes.gff -p meta

agrep -d '\>' 'partial=00' ${ID}_genes.faa > ${ID}_genes_complete.faa
agrep -v -d '\>' 'partial=00' ${ID}_genes.faa > ${ID}_genes_partial.faa
agrep -d '\>' 'partial=00' ${ID}_genes.fna > ${ID}_genes_complete.fna
agrep -v -d '\>' 'partial=00' ${ID}_genes.fna > ${ID}_genes_partial.fna

aws --region=us-west-2 s3 sync . $S3_BUCKET/

rm -v ${ID}_genes*
