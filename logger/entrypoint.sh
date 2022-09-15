#!/bin/sh
n=-1
c=0
if [ -n "$3" ]
then
   n=$3
fi

while [ $n -ne $c ]
do
   WAIT=$(shuf -i $1-$2 -n 1)
   sleep $(echo "scale=4; $WAIT/1000" | bc)
   I=$(shuf -i 1-4 -n 1)
   D=`date -Iseconds`
   case "$I" in
      "1") echo "$D test log \`auth_token\` = 18231293y123891 limit 1"
      ;;
      "2") echo "$D test log \`auth_token\` = 18231293y123891 limit 1"
      ;;
      "3") echo "$D test log \`auth_token\` = 18231293y123891 limit 1"
      ;;
      "4") echo "$D test log \`auth_token\` = 18231293y123891 limit 1"
      ;;
   esac
   c=$(( c+1 ))
done
