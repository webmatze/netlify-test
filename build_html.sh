#!/bin/bash

target_path="public/"
target_filename="index.html"

echo "Generating HTML files into ${target_path} directory..."

for file in $(find . -name *.md)
do
  file=${file#\./}
  filename=${file##*/}
  dir=${file%/*}
  dir=${dir/$filename}

  if [ ${#dir} -eq 0 ]
  then
    echo "transpiling ${filename}"
	  pandoc -s -f markdown+smart --toc ${file} -o ${target_path}/${target_filename}
  else
    echo "transpiling ${dir}/${filename}"
    mkdir -p ${target_path}${dir}
	  pandoc -s -f markdown+smart --toc ${file} -o ${target_path}${dir}/${target_filename}
  fi
done
