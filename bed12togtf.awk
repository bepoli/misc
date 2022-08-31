#!/usr/bin/awk -f

BEGIN { FS="\t"; OFS="\t" }
{ print $1,"Bed12ToGtf","transcript",$2+1,$3,0,$6,".","gene_id \""$4"\";" }
{ split($11,l,","); split($12,b,",") }
{ for (i=1;i<=$10;i++) print $1,"Bed12ToGtf","exon",$2+b[i]+1,$2+b[i]+l[i],0,$6,".","gene_id \""$4"\"; transcript_id \""$4"\";" }
