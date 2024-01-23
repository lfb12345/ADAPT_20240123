
DIFF_FILE_NAME=$1

echo

echo 'DASHES="+"$(printf "%0.s-" $(seq 1 273))"+"'

echo

while read -r LINE; do

      FILE_NAME_OLD=`echo "$LINE" | awk '{ print $1 }'`

      FILE_NAME_NEW=`echo "$LINE" | awk '{ print $2 }'`

      echo 'printf "%s\n\n" $DASHES'

      echo

      echo echo 'Old File Name: '$FILE_NAME_OLD

      echo

      echo echo

      echo

      echo echo 'New File Name: '$FILE_NAME_NEW

      echo

      echo 'printf "\n%s\n\n" $DASHES'

      echo

      echo diff $FILE_NAME_OLD $FILE_NAME_NEW

      echo

      echo 'printf "\n%s\n" $DASHES'

      echo

done < $DIFF_FILE_NAME

