#/bin/bash

CONT=$1
USERS=users.txt

echo 'Create users'
docker cp $USERS $CONT:/
docker exec $CONT newusers /$USERS
docker exec $CONT rm /$USERS
echo 'All done!'
