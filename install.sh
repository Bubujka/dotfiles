#!/bin/bash
git submodule init
git submodule update

for file in *; do
  if [ -d "$file" ]; then
    echo $file
    stow "$file" -t ~/
  fi
done
