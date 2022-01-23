#!/bin/bash
for file in *; do
	if [ -d "$file" ]; then
		cd "$file"
		echo "$file"
		git pull origin master
		cd ..
	fi

done
