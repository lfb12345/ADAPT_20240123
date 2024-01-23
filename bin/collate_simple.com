
XML_FILE_NAME_OLD=$1

XML_FILE_NAME_NEW=`grep '<ResourceID>' $XML_FILE_NAME_OLD | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/spase:\/\///' | sed 's/$/\.xml/'`

XML_DIRECTORY_NAME_NEW=`dirname $XML_FILE_NAME_NEW`

mkdir -p $XML_DIRECTORY_NAME_NEW

cp -p $XML_FILE_NAME_OLD $XML_FILE_NAME_NEW

echo $XML_FILE_NAME_NEW

