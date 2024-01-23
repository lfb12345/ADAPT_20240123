
PRODUCT_KEY=$1

DATE_STYLE=$2

PRODUCT_KEY_LOWER=`echo $PRODUCT_KEY | tr 'A-Z' 'a-z'`

PRODUCT_KEY_UPPER=`echo $PRODUCT_KEY | tr 'a-z' 'A-Z'`

DATE_STYLE_LOWER=`echo $DATE_STYLE | tr 'A-Z' 'a-z'`

DATE_STYLE_UPPER=`echo $DATE_STYLE | tr 'a-z' 'A-Z'`

XML_FILE_NAME='XML_PSP_20210315/cdaweb_'$PRODUCT_KEY_LOWER'_'$DATE_STYLE.xml

VALIDATOR_FILE_NAME='XML_PSP_20210315/cdaweb_'$PRODUCT_KEY_LOWER'_'$DATE_STYLE.validator

XML_FILE_LINE_NUM=`wc -l $XML_FILE_NAME | awk '{ print $1 }'`

XML_LINE_NUM_LIST=`grep ^'Line:\ ' $VALIDATOR_FILE_NAME | awk 'BEGIN { FS="[ ;]" } ; { print $2 }' | sort -n | uniq`

for XML_LINE_NUM in $XML_LINE_NUM_LIST

do

    PARAMETER_LINE_NUM=`head -$XML_LINE_NUM $XML_FILE_NAME | grep -n '<Parameter>' | tail -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

    TAIL_NUM=$((XML_FILE_LINE_NUM-PARAMETER_LINE_NUM+1))

    HEAD_NUM=`tail -$TAIL_NUM $XML_FILE_NAME | grep -n '</Parameter>'$ | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

    PARAMETER_KEY=`tail -$TAIL_NUM $XML_FILE_NAME | head -$HEAD_NUM | grep '<ParameterKey>' | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

    echo $PRODUCT_KEY'	'$DATE_STYLE'	'$XML_LINE_NUM'	'$PARAMETER_KEY

done

