
DATA_PRODUCT_ID=$1

DATE_STYLE=$2

METADATA_DIRECTORY=$3

CURL_TEST=$4

DATE=`date +"%y%m%d"`

echo

echo `date` $DATA_PRODUCT_ID $DATE_STYLE $METADATA_DIRECTORY

echo

METADATA_FILE_NAME=`find_master_file_name.com $DATA_PRODUCT_ID $DATE_STYLE $METADATA_DIRECTORY`

echo $METADATA_FILE_NAME

echo

VARIABLE_INFORMATION_LINE_NUM=`grep -n ^"Variable Information" $METADATA_FILE_NAME | sed 's/:.*$//'`

VARIABLE_NUM=`grep ^"Variable (" $METADATA_FILE_NAME | awk '{ print $2 }' | awk 'BEGIN { FS="(" } ; { print $2 }'`

HEAD_NUM=$(($VARIABLE_INFORMATION_LINE_NUM+$VARIABLE_NUM+1))

STRUCTURE_LIST=`head -$HEAD_NUM $METADATA_FILE_NAME | tail -$VARIABLE_NUM | awk '{ print $(NF-1) }' | sed 's/\[//' | sed 's/\]//'`

STRUCTURE_MASK_LIST=(`head -$HEAD_NUM $METADATA_FILE_NAME | tail -$VARIABLE_NUM | awk '{ print $NF }'`)

OCCUR_NUM_ELEMENT=1

STRUCTURE_NUM=0

for STRUCTURE in $STRUCTURE_LIST

do

    INDEX_NUM=`echo $STRUCTURE | sed 's/:.*$//'`

    MASK_LIST=(`echo ${STRUCTURE_MASK_LIST[STRUCTURE_NUM]} | sed 's/^[TF]\///' | awk 'BEGIN { FS="" } ; { for (i=1; i<=NF; i++) printf("%sX",$i) }' | sed 's/X$//' | sed 's/X/ /g'`)

    ELEMENT_LIST=(`echo $STRUCTURE | sed 's/^.*://' | sed 's/\[//' | sed 's/\]//' | sed 's/,/\ /g'`)

    SIZE_TEXT=""

    for ((INDEX=0;INDEX<$INDEX_NUM;INDEX++));

    do

        if [ ${MASK_LIST[INDEX]} == "T" ]; then SIZE_TEXT=$SIZE_TEXT${ELEMENT_LIST[INDEX]}'_'; fi

    done

    ELEMENT_NUM=$((`echo $SIZE_TEXT | sed 's/_/\*/g' | sed 's/\*$//'`))

    if [[ $ELEMENT_NUM -gt $OCCUR_NUM_ELEMENT ]]; then OCCUR_NUM_ELEMENT=$ELEMENT_NUM; fi

    echo $STRUCTURE ${STRUCTURE_MASK_LIST[STRUCTURE_NUM]} $INDEX_NUM $ELEMENT_NUM $OCCUR_NUM_ELEMENT

    STRUCTURE_NUM=$(($STRUCTURE_NUM+1))

done

OCCUR_NUM_PARAMETER=`head -$HEAD_NUM $METADATA_FILE_NAME | tail -$VARIABLE_NUM | awk '{ print $NF }' | grep -c ^'T/'`

if [[ $OCCUR_NUM_ELEMENT -gt 256 ]]; then OCCUR_NUM_ELEMENT=256; fi

sed "s/OCCUR_NUM_PARAMETER/"$VARIABLE_NUM"L/" $CDAWEB_DIR/cdaweb_spase_model_custom_template.pro | sed "s/OCCUR_NUM_ELEMENT/"$OCCUR_NUM_ELEMENT"L/" | sed "s/DATA_PRODUCT_NAME/"$DATA_PRODUCT_ID"/" | sed "s/DATE_STYLE/"$DATE_STYLE"/" > $CDAWEB_DIR/cdaweb_spase_model_custom.pro

IDL_STARTUP=cdaweb_harvest_custom.com

export IDL_STARTUP

VXO_DATE=20231117

LOG_DIRECTORY=$CDAWEB_DIR/LOG

XML_DIRECTORY=$CDAWEB_DIR/XML

VXO_DIRECTORY=$CDAWEB_DIR/VXO/$VXO_DATE

if [ ! -d $LOG_DIRECTORY ]; then mkdir $LOG_DIRECTORY; fi

idl >& $LOG_DIRECTORY/cdaweb_harvest_$DATA_PRODUCT_ID"_"$DATE_STYLE"_"$DATE.log

#xo_validation_check.com 2_4_0 $XML_DIRECTORY/cdaweb_$DATA_PRODUCT_ID"_"$DATE_STYLE.xml &> $XML_DIRECTORY/cdaweb_$DATA_PRODUCT_ID"_"$DATE_STYLE.validator

grep 'ID>' $XML_DIRECTORY/cdaweb_$DATA_PRODUCT_ID"_"$DATE_STYLE.xml | grep -v '<ResourceID>' | grep -v '<PriorID>' | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed "s?^spase://?vxo_registration_check.com "$VXO_DIRECTORY" ?" | sed 's/$/\.xml/' &> $XML_DIRECTORY/vxo_registration_check_$DATA_PRODUCT_ID"_"$DATE_STYLE.com

chmod +x $XML_DIRECTORY/vxo_registration_check_$DATA_PRODUCT_ID"_"$DATE_STYLE.com

$XML_DIRECTORY/vxo_registration_check_$DATA_PRODUCT_ID"_"$DATE_STYLE.com >& $XML_DIRECTORY/vxo_registration_check_$DATA_PRODUCT_ID"_"$DATE_STYLE.txt

#

echo

cat $XML_DIRECTORY/cdaweb_$DATA_PRODUCT_ID"_"$DATE_STYLE.validator

echo

cat $XML_DIRECTORY/vxo_registration_check_$DATA_PRODUCT_ID"_"$DATE_STYLE.txt

echo

vxo_registration_check.com $XML_DIRECTORY cdaweb_$DATA_PRODUCT_ID"_"$DATE_STYLE.xml

echo

#

if [ $CURL_TEST ]; then

   curl_test.com $DATA_PRODUCT_ID $DATE_STYLE $XML_DIRECTORY/cdaweb_$DATA_PRODUCT_ID'_'$DATE_STYLE.xml

   echo

fi

#

echo 'curl_test.com '$DATA_PRODUCT_ID' '$DATE_STYLE' '$XML_DIRECTORY/cdaweb_$DATA_PRODUCT_ID'_'$DATE_STYLE.xml >> $XML_DIRECTORY/curl_test_all.com

chmod +x $XML_DIRECTORY/curl_test_all.com

#XML_DIRECTORY/curl_test_all.com &> $XML_DIRECTORY/curl_test_all.tab

rm $CDAWEB_DIR/cdaweb_spase_model_custom.pro

