#/bin/bash

CONT=$1
GID=$2
GROUP=$3
USERS=users.txt

docker exec $CONT groupadd -g $GID $GROUP
for user in `cut -d: -f1 $USERS`; do
  docker exec $CONT usermod -a -G $GROUP
done
