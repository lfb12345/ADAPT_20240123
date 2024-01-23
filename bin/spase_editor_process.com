
FILE_STATUS=$1

COLLATION_DIRECTORY=$2

REGISTRY_DIRECTORY=$3

XML_FILE_NAME=$4

METADATA_CONTACT=$5

NOTE=$6

HASHES=$(printf "%0.s#" $(seq 1 275))

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

SPASE_RESOURCE_ID=`grep '<ResourceID>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/spase:\/\///'`

COLLATION_FILE_NAME=$COLLATION_DIRECTORY/$SPASE_RESOURCE_ID'.xml'

printf "%s\n\n%s\t%s\n\n%s\n\n" $HASHES $XML_FILE_NAME $COLLATION_FILE_NAME $DASHES

if [ -e $REGISTRY_DIRECTORY/$SPASE_RESOURCE_ID.xml ]; then

   cp -p $XML_FILE_NAME /Users/astropooch/Space/SMWT/SPASE_EDITOR/WORK/old_$$.xml

   cp -p $REGISTRY_DIRECTORY/$SPASE_RESOURCE_ID.xml /Users/astropooch/Space/SMWT/SPASE_EDITOR/WORK/new_$$.xml

   /Users/astropooch/bin/spase_xml_tab_wrapper.com /Users/astropooch/Space/SMWT/SPASE_EDITOR/WORK/old_$$.xml

   /Users/astropooch/bin/spase_xml_tab_wrapper.com /Users/astropooch/Space/SMWT/SPASE_EDITOR/WORK/new_$$.xml

   printf "\n%s\n\n" $DASHES

   diff /Users/astropooch/Space/SMWT/SPASE_EDITOR/WORK/old_$$.xml /Users/astropooch/Space/SMWT/SPASE_EDITOR/WORK/new_$$.xml

   rm /Users/astropooch/Space/SMWT/SPASE_EDITOR/WORK/old_$$.xml /Users/astropooch/Space/SMWT/SPASE_EDITOR/WORK/new_$$.xml

   printf "\n%s\n\n" $DASHES

fi

URL_LIST=`grep '<URL>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/&amp;/\&/g'`

for URL in $URL_LIST

do

    curl -kIsS "$URL" &> spase_editor_process_curl_$$.txt 2> spase_editor_process_error_$$.txt

    PROTOCOL=`echo $URL | awk 'BEGIN { FS=":" } ; { print $1 }' | tr 'a-z' 'A-Z'`

    ERROR=`head -1 spase_editor_process_error_$$.txt | sed 's///' | awk 'BEGIN { FS="[()]" } ; { print "CURL Error: "$2 }'`

    if [ ! "$ERROR" ]; then

       CURL_STATUS=`head -1 spase_editor_process_curl_$$.txt | sed 's///'`

       if [ "$CURL_STATUS" == 'HTTP/1.1 200 OK' ]; then

          STATUS=OOO

       else

          STATUS=XXX

       fi

    else

       CURL_STATUS="$ERROR"

       STATUS=XXX

    fi

    rm spase_editor_process_curl_$$.txt spase_editor_process_error_$$.txt

    printf "SPASE_EDITOR_PROCESS\t%s\t%s\t%s\t%s\t%s\t%s\n" $XML_FILE_NAME $COLLATION_FILE_NAME $STATUS "$CURL_STATUS" $PROTOCOL $URL

done

printf "\n%s\n\n" $DASHES

if [ $FILE_STATUS == OOO ]; then

   SPASE_RESOURCE_ID_LIST=`grep -hr 'ID>' $XML_FILE_NAME | grep -v '<PriorID>' | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/spase:\/\///'`

else

   SPASE_RESOURCE_ID_LIST=`grep -hr 'ID>' $XML_FILE_NAME | grep -v '<ResourceID>' | grep -v '<PriorID>' | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/spase:\/\///'`

fi

for SPASE_RESOURCE_ID in $SPASE_RESOURCE_ID_LIST

do

    REGISTRY=`echo $SPASE_RESOURCE_ID | awk 'BEGIN { FS="/" } ; { print $1 }'`

    SPASE_ID_TYPE=`grep 'ID>spase://'$SPASE_RESOURCE_ID'</' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $2 }'`

    if [ -e $REGISTRY_DIRECTORY/$SPASE_RESOURCE_ID.xml ]; then

       SPASE_RESOURCE_ID_STATUS=OOO

    else

       SPASE_RESOURCE_ID_STATUS=XXX

    fi

    printf "SPASE_EDITOR_PROCESS\t%s\t%s\t%s\t%s\t%s\t%s\n" $XML_FILE_NAME $COLLATION_FILE_NAME $SPASE_RESOURCE_ID_STATUS $REGISTRY_DIRECTORY $SPASE_ID_TYPE $SPASE_RESOURCE_ID

done

echo

spase_editor_process_update.com $COLLATION_DIRECTORY $XML_FILE_NAME $METADATA_CONTACT $NOTE

printf "\n%s\n" $HASHES

