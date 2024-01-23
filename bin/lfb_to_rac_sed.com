
XML_FILE_NAME=$1

echo 'LFB to RAC SED Conversion:  '$XML_FILE_NAME

sed -f lfb_to_rac.sed $XML_FILE_NAME &> lfb_to_rac_$$.xml

mv lfb_to_rac_$$.xml $XML_FILE_NAME

