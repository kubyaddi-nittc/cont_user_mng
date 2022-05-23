#/bin/bash

CONT=$1
GROUP=$2
GID=$3
USERS=users.txt

docker cp $USERS $CONT:/
docker exec $CONT groupadd -g $GID $GROUP
for user in `cut -d: -f1 $USERS`; do
  docker exec $CONT usermod -a -G $GROUP
done
docker exec $CONT rm /$USERS
