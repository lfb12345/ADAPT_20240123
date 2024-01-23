
XML_FILE_NAME=$1

XML_BASE_NAME=`basename $XML_FILE_NAME`

SPASE_RESOURCE_ID_XML=`grep '<ResourceID>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/spase:\/\///'`

DOI_NUM=`grep -c '<DOI>' $XML_FILE_NAME`

if [ $DOI_NUM -eq 1 ]; then

   DOI=`grep '<DOI>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/^https:\/\/doi.org\///'`

   SPASE_RESOURCE_ID_DOI=`curl -kIsS https://doi.org/$DOI | grep ^'location:\ ' | awk '{ print $2 }' | sed 's/^https:\/\/hpde.io\///' | sed '/\&amp;/s/\&amp;/\\&/' | sed 's/\.html*$//' | sed 's/$//'`

   if [ $SPASE_RESOURCE_ID_DOI ]; then

      if [ $SPASE_RESOURCE_ID_XML == $SPASE_RESOURCE_ID_DOI ]; then

         DOI_STATUS=OOO

      else

         DOI_STATUS=XXX

      fi

   else

      DOI_STATUS=NON

   fi

else

   SPASE_RESOURCE_ID_DOI=---

   DOI=---

   DOI_STATUS=OOO

fi

echo 'DOI_CHECK	'$XML_FILE_NAME'	'$SPASE_RESOURCE_ID_XML'	'$SPASE_RESOURCE_ID_DOI'	'$DOI'	'$DOI_STATUS

