#!/bin/bash
DIR=`cd "$(dirname $0)" && pwd `

files="vim vimrc"

for file in $files; do
  ln -s $DIR/$file ~/.$file
done
