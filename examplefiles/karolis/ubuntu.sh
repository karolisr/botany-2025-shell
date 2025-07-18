#!/usr/bin/env bash


# always run before doing install
sudo apt update

sudo apt search vcf
sudo apt search bcftools

sudo apt install bcftools
