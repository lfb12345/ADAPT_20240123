
METADATA_FILE_NAME=$1

HASH_VALUE=`grep '([1-9][0-9]* entr' $METADATA_FILE_NAME | awk '{ print $1 }' | openssl dgst -sha1 | awk '{ print $2 }'`

echo $HASH_VALUE'	'$METADATA_FILE_NAME

