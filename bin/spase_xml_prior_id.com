
DATA_PRODUCT_ID=$1

VXO_DIRECTORY=$2

RESOURCE_ID_NEW=$3

DATA_PRODUCT_ID_UPPER=`echo $DATA_PRODUCT_ID | tr 'a-z' 'A-Z'`

XML_FILE_NAME=`grep -cr '<ProductKey>'$DATA_PRODUCT_ID_UPPER'</ProductKey>' $VXO_DIRECTORY/VSPO | grep '\.xml:1'$ | sed 's/\.xml:1$/.xml/'`

if [ $XML_FILE_NAME ]; then

   RESOURCE_ID_OLD=`grep '<ResourceID>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/spase:\/\///'`

   grep '<PriorID>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/spase:\/\///' >& spase_xml_prior_id_$$.txt

   if [ $RESOURCE_ID_OLD != $RESOURCE_ID_NEW ]; then echo $RESOURCE_ID_OLD >> spase_xml_prior_id_$$.txt; fi

   sort spase_xml_prior_id_$$.txt | uniq

   rm spase_xml_prior_id_$$.txt

fi

