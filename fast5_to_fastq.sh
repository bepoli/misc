#!/bin/bash
# Extract fastq from a multiread fast5 file.
# For single-read fast5 files consider using an alternative
#   (e.g. poretools, nanopolish...)
# Usage:
#   ./fast5_to_fastq.sh <file.fast5> <cpus> <output_dir>
# Example:
#   ./fast5_to_fastq.sh FAQ23372_ea49c7ec_0.fast5 8 fastq_files


set -euo pipefail

fast5=$1
cpus=$2
outdir=$3

mkdir -p fqtmp $outdir
h5ls -r $1 | awk '/Fastq$/ {split($1,a,"/"); print a[$2]' \
  | parallel -j $cpus "h5dump -d /{}/Analyses/Basecall_1D_000/BaseCalled_template/Fastq -o fqtmp/{}.fastq $fast5 >/dev/null"
cat fqtmp/*.fastq | sed -e 's/.*"//' -e 's/^ \+//' | grep -v '^$' gzip > ${outdir}/$(basename $fast5 .fast5).fastq.gz
rm -rf fqtmp

