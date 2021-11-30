#!/usr/bin/env bash

# reverse complement a DNA sequence
revcom() {
  if [ -n "$1" ]; then
    echo "$1" | rev | tr "TACG" "ATGC"
  else
    rev | tr "TACG" "ATGC"
  fi
}

# add header on top of the output containing the command used to generate it
cmdump() {
  cat <( history | tail -1 | sed 's/\ [0-9]\+\ \+/#\ /') -
}

