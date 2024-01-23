
FILE_NAME=$1

FILE_NAME_UNIX=`echo $FILE_NAME | awk 'BEGIN { FS="\." } ; { print $1"_"$2".txt" }'`

echo $FILE_NAME_UNIX

sed 's///' $FILE_NAME > $FILE_NAME_UNIX

