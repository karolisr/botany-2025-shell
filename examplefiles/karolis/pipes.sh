#!/usr/bin/env bash

# shellcheck disable=SC2012
# https://www.shellcheck.net/wiki/SC2012
ls -1 | wc -l

cat -p Firstgenes.fa | grep ">"
cat -p Firstgenes.fa | grep -P "(?<=\>)(.*)"
cat -p Firstgenes.fa | grep -P -o "(?<=\>)(.*)"
