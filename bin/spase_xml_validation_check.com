
DIRECTORY=$1

DATA_PRODUCT_ID=$2

DATE_STYLE=$3

DATA_PRODUCT_ID_LOWER=`echo $DATA_PRODUCT_ID | tr 'A-Z' 'a-z'`

DATA_PRODUCT_ID_UPPER=`echo $DATA_PRODUCT_ID | tr 'a-z' 'A-Z'`

DATE_STYLE_LOWER=`echo $DATE_STYLE | tr 'A-Z' 'a-z'`

DATE_STYLE_UPPER=`echo $DATE_STYLE | tr 'a-z' 'A-Z'`

XML_FILE_NAME=$DIRECTORY/cdaweb_$DATA_PRODUCT_ID_LOWER'_'$DATE_STYLE_LOWER.xml

VALIDATOR_FILE_NAME=$DIRECTORY/cdaweb_$DATA_PRODUCT_ID_LOWER'_'$DATE_STYLE_LOWER.validator

XML_FILE_LINE_NUM=`wc -l $XML_FILE_NAME | awk '{ print $1 }'`

LINE_NUM_LIST=`grep ^Line: $VALIDATOR_FILE_NAME | awk 'BEGIN { FS="[ ;]" } ; { print $2 }' | sort -n | uniq`

for LINE_NUM in $LINE_NUM_LIST

do

    XML_ELEMENT_NAME=`head -$LINE_NUM $XML_FILE_NAME | tail -1 | awk 'BEGIN { FS="[<>]" } ; { print $2 }'`

    if [ $XML_ELEMENT_NAME == "Parameter" ]; then

       PARAMETER_START_LINE=$LINE_NUM

       TAIL_NUM=$((XML_FILE_LINE_NUM-$PARAMETER_START_LINE+1))

       PARAMETER_STOP_LINE=`tail -$TAIL_NUM $XML_FILE_NAME | grep -n '</Parameter>' | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

       HEAD_NUM=$(($PARAMETER_START_LINE+PARAMETER_STOP_LINE-1))

       TAIL_NUM=$((PARAMETER_STOP_LINE))

       PARAMETER_KEY=`head -$HEAD_NUM $XML_FILE_NAME | tail -$TAIL_NUM | grep '<ParameterKey>' | head -1 | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

    else

       PARAMETER_START_LINE=`head -$LINE_NUM $XML_FILE_NAME | grep -n '<Parameter>' | tail -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

       TAIL_NUM=$((XML_FILE_LINE_NUM-$PARAMETER_START_LINE+1))

       PARAMETER_STOP_LINE=`tail -$TAIL_NUM $XML_FILE_NAME | grep -n '</Parameter>' | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

       HEAD_NUM=$((PARAMETER_START_LINE+PARAMETER_STOP_LINE-1))

       TAIL_NUM=$((PARAMETER_STOP_LINE))

    fi

    PARAMETER_KEY=`head -$HEAD_NUM $XML_FILE_NAME | tail -$TAIL_NUM | grep '<ParameterKey>' | tail -1 | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

    if [ ! $PARAMETER_KEY ]; then PARAMETER_KEY=MISSING; fi

    VALIDATION_ERROR=`grep ^'Line: '$LINE_NUM';' $VALIDATOR_FILE_NAME | sed 's/Line: '$LINE_NUM';//' | sed 's/{http:\/\/www.spase-group.org\/data\/schema}//g' | sed 's/( /(/' | sed 's/ )/)/'`

    echo $LINE_NUM"	"$XML_ELEMENT_NAME"	"$PARAMETER_KEY"	"$VALIDATION_ERROR

done

