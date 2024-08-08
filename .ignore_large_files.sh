#!/bin/bash

SIZE_THRESHOLD="+99M"

find . -type f -size $SIZE_THRESHOLD | grep -v '\.git' | while read -r FILE; do
  # echo "$FILE"
  git rm -rf --cached $FILE
  echo "$FILE" | cut -c 3- >> .gitignore
done

sort -u -o .gitignore .gitignore

git add .gitignore

