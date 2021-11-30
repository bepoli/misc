# Miscellaneous bioinformatics utilities

## rmsk2bed
Convert RepeatMasker output to bed or gtf format.
Examples:
```
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.out.gz

# bed format (default)
zcat hg38.fa.out.gz | ./rmsk2bed > rmsk_hg38_open-4.0.3-20130422.bed

# gtf format
zcat hg38.fa.out.gz | ./rmsk2bed -f gtf > rmsk_hg38_open-4.0.3-20130422.bed

# gtf format without classes that could interfere with RNA-seq quantifiers (e.g. TEtranscripts)
zcat hg38.fa.out.gz | ./rmsk2bed -f gtf -t > rmsk_hg38_open-4.0.3-20130422.filtered.bed
```
