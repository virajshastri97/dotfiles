#!/bin/bash
for f in ${PWD}/.*; do
  if [[ -f $f ]] ; then
    echo Copying $(basename "$f" ".")
    cp "$f" ~/
  fi
done
