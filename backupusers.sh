#!/bin/bash

CONT=$1
BK=backup

mkdir -p $BK
for f in passwd shadow group gshadow subuid subgid; do
  docker cp -a $CONT:/etc/$f $BK
done

