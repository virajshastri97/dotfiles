#!/bin/bash
for f in ./.*; do
  if [ -f $f ] && [ $f != ".DS_Store" ]; then
    echo Copying $(basename "$f" ".");
    [ -f "~/${f}" ] && mv "~/$f" "~/$f.bkp";
    cp "./$f" ~/;
  fi
done
