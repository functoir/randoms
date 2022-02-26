#!/usr/bin/env bash

declare -i num; (( num = 1 ))

while (( ++num <= 100 )); do
  echo "$num"
  ./rho "$num"
done  
