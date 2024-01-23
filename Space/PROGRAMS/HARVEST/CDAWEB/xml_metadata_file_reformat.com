
XML_DIRECTORY_INPUT=$1

XML_DIRECTORY_OUTPUT=$2

DATA_PRODUCT_ID=$3

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

DATA_PRODUCT_ID_LOWER=`echo $DATA_PRODUCT_ID | tr 'A-Z' 'a-z'`

DATA_PRODUCT_ID_UPPER=`echo $DATA_PRODUCT_ID | tr 'a-z' 'A-Z'`

CDAWEB_DIR=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB

XML_DIRECTORY_INPUT=$CDAWEB_DIR/$XML_DIRECTORY_INPUT

XML_FILE_NAME_INPUT=`grep -r '<ProductKey>'$DATA_PRODUCT_ID_UPPER'</ProductKey>' $XML_DIRECTORY_INPUT | uniq | awk 'BEGIN { FS=":" } ; { print $1 }'`

RESOURCE_ID=`grep '<ResourceID>' $XML_FILE_NAME_INPUT | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/^spase:\/\///'`

XML_FILE_NAME_OUTPUT=$CDAWEB_DIR/$XML_DIRECTORY_OUTPUT/$RESOURCE_ID.xml

XML_DIRECTORY_OUTPUT=`dirname $XML_FILE_NAME_OUTPUT`

if [ ! -d $XML_DIRECTORY_OUTPUT ]; then mkdir -p $XML_DIRECTORY_OUTPUT; fi

PARAMETER_LINE_NUM=`grep -n '<Parameter>' $XML_FILE_NAME_INPUT | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

HEAD_NUM=$((PARAMETER_LINE_NUM-1))

head -$HEAD_NUM $XML_FILE_NAME_INPUT &> $XML_FILE_NAME_OUTPUT

printf "%s\n\nInput XML File Name:\t%-23s\n\nOutput XML File Name:\t%-23s\n\n%s\n\n" $DASHES $XML_FILE_NAME_INPUT $XML_FILE_NAME_OUTPUT $DASHES

XML_LINE_NUM=`wc -l $XML_FILE_NAME_INPUT | awk '{ print $1 }'`

PARAMETER_KEY_LIST=`grep ^$DATA_PRODUCT_ID_LOWER'	' masters_cdf_metadata_file_reformat_parameter_list_psp_isois_order_revised.tab | awk 'BEGIN { FS="	" } ; { print $2 }'`

for PARAMETER_KEY in $PARAMETER_KEY_LIST

do

    PARAMETER_KEY_XML_EXIST_NUM=`grep -c '<ParameterKey>'$PARAMETER_KEY'</ParameterKey>' $XML_FILE_NAME_INPUT`

    printf "%s\t%s\n" $PARAMETER_KEY_XML_EXIST_NUM $PARAMETER_KEY

    if [ $PARAMETER_KEY_XML_EXIST_NUM -eq 1 ]; then

       PARAMETER_KEY_LINE_NUM=`grep -n '<ParameterKey>'$PARAMETER_KEY'</ParameterKey>' $XML_FILE_NAME_INPUT | awk 'BEGIN { FS=":" } ; { print $1 }'`

       PARAMETER_ONE_LINE_NUM=`head -$PARAMETER_KEY_LINE_NUM $XML_FILE_NAME_INPUT | grep -n ^'      <Parameter>' | tail -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

       TAIL_NUM=$((XML_LINE_NUM-PARAMETER_ONE_LINE_NUM+1))

       HEAD_NUM=`tail -$TAIL_NUM $XML_FILE_NAME_INPUT | grep -n ^'      </Parameter>' | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

       tail -$TAIL_NUM $XML_FILE_NAME_INPUT | head -$HEAD_NUM | sed '/<Set>/s/EPOCH/Epoch/' >> $XML_FILE_NAME_OUTPUT

#      echo $DASHES

#      echo 'XML Line Num:            '$XML_LINE_NUM

#      echo 'Parameter Key Line Num:  '$PARAMETER_KEY_LINE_NUM

#      echo 'Parameter One Line Num:  '$PARAMETER_ONE_LINE_NUM

#      echo 'Tail Num:                '$TAIL_NUM

#      echo 'Head Num:                '$HEAD_NUM

#      tail -$TAIL_NUM $XML_FILE_NAME_INPUT | head -$HEAD_NUM

#      echo $DASHES

    fi

done

printf "%19s\n%s\n" '</NumericalData>' '</Spase>' >> $XML_FILE_NAME_OUTPUT

printf "\n%s\n" $DASHES

