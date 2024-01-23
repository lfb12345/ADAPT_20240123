
DIRECTORY=$1

XML_FILE_BASE_NAME=$2

REGISTRATION_NUM=`find $DIRECTORY/$XML_FILE_BASE_NAME 2> /dev/null | wc -l | awk '{ print $1 }'`

if [ $REGISTRATION_NUM -eq 1 ]; then

   echo OOO'	'$XML_FILE_BASE_NAME | sed 's/\.xml$//'

else

   echo XXX'	'$XML_FILE_BASE_NAME | sed 's/\.xml$//'

fi

