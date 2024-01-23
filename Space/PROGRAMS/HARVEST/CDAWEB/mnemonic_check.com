
MASTERS_DIR_DATE=$1

XML_DIR=$2

DATA_PRODUCT_ID=$3

CDAWEB_DIR=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB

MASTERS_TAB_FILE_NAME=$CDAWEB_DIR/MASTERS_$MASTERS_DIR_DATE/$DATA_PRODUCT_ID'_00000000_v01.txt'

MASTERS_XML_FILE_NAME=$CDAWEB_DIR/$XML_DIR/cdaweb_$DATA_PRODUCT_ID'_yyyymmdd.xml'

grep -h ^'ASTRO	' $MASTERS_TAB_FILE_NAME | sed 's/^ASTRO	//' | awk 'BEGIN { FS="	" } ; { print $7"	"$39 }' | grep -v ^'parameter_key	mnemonic'$ &> mnemonic_check_$$.tab

MASTERS_XML_LINE_NUM=`wc -l $MASTERS_XML_FILE_NAME | awk '{ print $1 }'`

PARAMETER_KEY_LIST=`awk 'BEGIN { FS="	" } ; { print $1 }' mnemonic_check_$$.tab`

for PARAMETER_KEY in $PARAMETER_KEY_LIST

do

    PARAMETER_KEY_XML_EXIST_NUM=`grep -c '<ParameterKey>'$PARAMETER_KEY'</ParameterKey>' $MASTERS_XML_FILE_NAME`

    MNEMONIC=`grep ^$PARAMETER_KEY'	' mnemonic_check_$$.tab | awk 'BEGIN { FS="	" } ; { print $2 }'`

    if [ $PARAMETER_KEY_XML_EXIST_NUM -eq 1 ]; then

       PARAMETER_KEY_LINE_NUM=`grep -n '<ParameterKey>'$PARAMETER_KEY'</ParameterKey>' $MASTERS_XML_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

       PARAMETER_ONE_LINE_NUM=`head -$PARAMETER_KEY_LINE_NUM $MASTERS_XML_FILE_NAME | grep -n ^'      <Parameter>' | tail -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

       TAIL_NUM=$((MASTERS_XML_LINE_NUM-PARAMETER_KEY_LINE_NUM+1))

       PARAMETER_TWO_LINE_NUM=`tail -$TAIL_NUM $MASTERS_XML_FILE_NAME | grep -n ^'      </Parameter>' | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

       HEAD_NUM=$((PARAMETER_ONE_LINE_NUM+PARAMETER_TWO_LINE_NUM+1))

       TAIL_NUM=$((PARAMETER_TWO_LINE_NUM+2))

       MNEMONIC_XML=`head -$HEAD_NUM $MASTERS_XML_FILE_NAME | tail -$TAIL_NUM | grep 'Mnemonic\ Pattern:\ ' | sed 's/^.*Mnemonic\ Pattern:\ //' | sed 's/<\/Caveats>//' | sed 's/\..*$//'`

    else

       MNEMONIC_XML=''

    fi

    echo $DATA_PRODUCT_ID'	'$PARAMETER_KEY_XML_EXIST_NUM'	'$PARAMETER_KEY'	'$MNEMONIC'	'$MNEMONIC_XML

done

rm mnemonic_check_$$.tab

