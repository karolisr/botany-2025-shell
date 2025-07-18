#!/usr/bin/env bash
####################################################
# Stop on first error
set -o errexit
# Set trap on ERR to be inherited by shell functions
set -o errtrace
# Trap errors
trap 'echo Error at line: $LINENO' ERR
####################################################

gunzip --keep input.vcf.gz

bcftools norm --atomize input.vcf > output1.vcf
bcftools view -i 'TYPE="ref" | TYPE="snp"' output1.vcf > output2.vcf
bcftools view -i "FMT/DP[0]>=20" output2.vcf > output3.vcf
bcftools view -i "FMT/DP[1]>=20" output3.vcf > output4.vcf

gzcat input.vcf.gz | bcftools norm --atomize | bcftools view -i 'TYPE="ref" | TYPE="snp"' | bcftools view -i "FMT/DP[0]>=20" | bcftools view -i "FMT/DP[1]>=20" > "output.vcf"

gzcat input.vcf.gz \
    | bcftools view \
    | bcftools norm --atomize 2> /dev/null \
    | bcftools view -i 'TYPE="ref" | TYPE="snp"' \
    | bcftools plugin fill-tags \
    | bcftools view -i "NS=2" \
    | bcftools view -i "FMT/DP[0]>=20" \
    | bcftools view -i "FMT/DP[1]>=20" \
    | bcftools view -i 'NUMALT>=1' \
    | bcftools view -e '(TYPE="snp") & (QUAL<20)' \
    | bcftools view -e 'AC>=1 & MAF<0.05' \
> "output.vcf"
