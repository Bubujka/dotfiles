#!/bin/bash
for file in *; do
  if [ -d "$file" ]; then
    stow "$file"
  fi
done
