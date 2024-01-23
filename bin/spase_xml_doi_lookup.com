
DATE=$1

DATA_PRODUCT_ID=$2

DATA_PRODUCT_ID_LOWER=`echo $DATA_PRODUCT_ID | tr 'A-Z' 'a-z'`

DATA_PRODUCT_ID_UPPER=`echo $DATA_PRODUCT_ID | tr 'a-z' 'A-Z'`

XML_FILE_NAME=`grep -r '<ProductKey>'$DATA_PRODUCT_ID_UPPER'</ProductKey>' VXO/$DATE/NASA/NumericalData/ParkerSolarProbe | awk 'BEGIN { FS=":" } ; { print $1 }' | uniq`

if [ $XML_FILE_NAME ]; then

   RESOURCE_ID=`echo $XML_FILE_NAME | sed 's/\.xml$//' | sed 's/^VXO\/'$DATE'\///'`

   RESOURCE_NAME=`grep '<ResourceName>.*</ResourceName>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   if [ "$RESOURCE_NAME" == '' ]; then RESOURCE_NAME=XXX; fi

   DOI=`grep '<DOI>.*</DOI>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   if [ "$DOI" == '' ]; then DOI=XXX; fi

   AUTHORS=`grep '<Authors>.*</Authors>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   if [ "$AUTHORS" == '' ]; then AUTHORS=XXX; fi

   PUBLICATION_DATE=`grep '<PublicationDate>.*</PublicationDate>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   if [ "$PUBLICATION_DATE" == '' ]; then PUBLICATION_DATE=XXX; fi

   PUBLISHED_BY=`grep '<PublishedBy>.*</PublishedBy>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   if [ "$PUBLISHED_BY" == '' ]; then PUBLISHED_BY=XXX; fi

   echo $DATA_PRODUCT_ID'	'$RESOURCE_ID'	'$DOI'	'$PUBLICATION_DATE'	'$PUBLISHED_BY'	'$AUTHORS'	'$RESOURCE_NAME

else

   echo $DATA_PRODUCT_ID'					'

fi

