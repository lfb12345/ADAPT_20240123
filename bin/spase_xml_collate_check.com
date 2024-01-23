
FILE_NAME=$1

DIR_ROOT=$2

RESOURCE_ID_PATH=`grep "<ResourceID>" $FILE_NAME | sed 's/.*<ResourceID>//' | sed 's/<\/ResourceID>.*//' | sed 's/spase:\/\///' | sed 's/\ //g'`

COLLATED_FILE_NAME=`echo $DIR_ROOT/$RESOURCE_ID_PATH".xml" | sed 's/\/\//\//'`

if [ $FILE_NAME == $COLLATED_FILE_NAME ]; then

   echo "COLLATION VALID||";

else

   echo "COLLATION INVALID";

fi

