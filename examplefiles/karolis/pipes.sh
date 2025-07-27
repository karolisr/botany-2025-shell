#!/usr/bin/env bash

# shellcheck disable=SC2012
# https://www.shellcheck.net/wiki/SC2012
ls -1 | wc -l

cd examplefiles/intro_to_CLI

cat -p Firstgenes.fa | grep ">"
cat -p Firstgenes.fa | grep -P "(?<=\>)(.*)"
cat -p Firstgenes.fa | grep -P -o "(?<=\>)(.*)"
