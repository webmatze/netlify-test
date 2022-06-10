#!/bin/sh
mkdir -p public
pandoc -o public/index.html *.md
