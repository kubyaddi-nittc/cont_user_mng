#/bin/bash

CONT=$1
USERS=users.txt

echo 'Create users'
docker cp $USERS $CONT:/
docker exec $CONT newusers /$USERS
docker exec $CONT rm /$USERS
echo 'Create users home dir'
docker cp -a $CONT:/etc/skel ./skel
for user in `cut -d: -f1 $USERS`; do
  echo $user
  HM=`grep ^$user $USERS | cut -d: -f6`
  docker exec $CONT rm -rf $HM
  docker cp -a ./skel $CONT:$HM
  docker exec $CONT chown -R $user:`grep ^$user $USERS | cut -d: -f4` $HM
done
rm -rf ./skel
echo 'All done!'
