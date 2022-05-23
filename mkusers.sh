#/bin/bash

CONT=$1
USERS=users.txt

docker cp $USERS $CONT:/
docker exec $CONT newusers /$USERS
for $user in `cut -d: -f1 $USERS`; do
  HM=`cat /$USERS | grep $user | cut -d: -f6`
  docker exec $CONT cp -a /etc/skel/.[a-z][A-Z]* $HM
  docker exec $CONT chown -R $user $HM
  docker exec $CONT chgrp -R `cut /$USERS | grep $user | cut -d: -f4` $HM
done
docker exec $CONT rm /$USERS
