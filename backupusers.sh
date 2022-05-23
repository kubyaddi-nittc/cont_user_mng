#!/bin/bash

CONT=$1

mkdir -p backup
for $f in passwd shadow group gshadow setuid setgid; do
  docker cp -a $CONT:/etc/$f backup/;
done

