#!/bin/bash

DIRECTORY="../notebooks/users"  # Replace with your directory

echo -n '['

first=true
for file in "$DIRECTORY"/*; do
  if [ "$first" = true ]; then
    first=false
  else
    echo -n ','
  fi
  echo -n " $(basename $file)"
done

echo ']'
