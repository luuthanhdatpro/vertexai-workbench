#!/bin/bash

DIRECTORY="/notebooks/users"  # Replace with your directory

echo '{"include": ['

first=true
for file in "$DIRECTORY"/*; do
  if [ "$first" = true ]; then
    first=false
  else
    echo ','
  fi
  echo "{\"file\": \"$(basename "$file")\"}"
done

echo ']}'
