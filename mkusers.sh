#/bin/bash

CONT=$1

docker cp users.txt $CONT:/
docker exec $CONT newusers /users.txt
for $user in `cut -d: -f1 users.txt`; do
  docker exec $CONT cp -a /etc/skel/.[a-z][A-Z]* /home/$user
  docker exec $CONT chown -R $user /home/$user
  docker exec $CONT chgrp -R `cut /users.txt | grep $user | cut -d: -f4` /home/$user
done
docker exec $CONT rm /users.txt
