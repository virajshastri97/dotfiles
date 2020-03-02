#!/bin/bash
for f in ${PWD}/.*; do
  if [ -f $f ] && [ $f != ".DS_Store" ]; then
    echo Copying $(basename "$f" ".");
    mv ~/$f ~/$f.bkp;
    cp "$f" ~/;
  fi
done
