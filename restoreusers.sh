#!/bin/bash

CONT=$1
BK=backup

for f in passwd shadow group gshadow setuid setgid; do
  docker cp -a $BK/$f $CONT:/etc/$f
  docker exec $CONT chown -R root:root /etc/$f
done

