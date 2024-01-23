
TARGET_DIRECTORY=$1

FILE_NAME=$2

RESOURCE_ID_NEW=$3

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

FILE_NAME_DIRECTORY=`dirname $RESOURCE_ID_NEW`

mkdir -p $TARGET_DIRECTORY/$FILE_NAME_DIRECTORY

RESOURCE_ID_OLD=`grep '<ResourceID>' $FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/spase:\/\///'`

RELEASE_DATE=`date "+%Y-%m-%d"`'T12:34:56.000Z'

NUMERICAL_DATA_LINE_NUM=`grep -n '<NumericalData>' $FILE_NAME | sed 's/:.*$//'`

RESOURCE_HEADER_CLOSE_LINE_NUM=`grep -n '</ResourceHeader>' $FILE_NAME | sed 's/:.*$//'`

HEAD_NUM=$((RESOURCE_HEADER_CLOSE_LINE_NUM-1))

TAIL_NUM=$((HEAD_NUM-NUMERICAL_DATA_LINE_NUM-1))

echo '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' &> spase_resource_id_update_$$.xml

echo '<Spase xmlns="http://www.spase-group.org/data/schema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.spase-group.org/data/schema http://www.spase-group.org/data/schema/spase-2_3_1.xsd">' >> spase_resource_id_update_$$.xml

echo '   <Version>2.3.1</Version>' >> spase_resource_id_update_$$.xml

echo '   <NumericalData>' >> spase_resource_id_update_$$.xml

echo '      <ResourceID>spase://'$RESOURCE_ID_NEW'</ResourceID>' >> spase_resource_id_update_$$.xml

head -$HEAD_NUM $FILE_NAME | tail -$TAIL_NUM | sed "/<ReleaseDate>/s/>.*</>"$RELEASE_DATE"</" >> spase_resource_id_update_$$.xml

echo '         <PriorID>spase://'$RESOURCE_ID_OLD'</PriorID>' >> spase_resource_id_update_$$.xml

FILE_NAME_LINE_NUM=`wc -l $FILE_NAME | awk '{ print $1 }'`

TAIL_NUM=$((FILE_NAME_LINE_NUM-RESOURCE_HEADER_CLOSE_LINE_NUM+1))

tail -$TAIL_NUM $FILE_NAME >> spase_resource_id_update_$$.xml

spase_xml_flatten.com spase_resource_id_update_$$.xml

spase_xml_tab.com spase_resource_id_update_$$.xml &> spase_xml_tab_wrapper_$$.xml

mv spase_xml_tab_wrapper_$$.xml $TARGET_DIRECTORY/$RESOURCE_ID_NEW.xml

printf "%s\n\n" $DASHES

vxo_validation_check.com $TARGET_DIRECTORY/$RESOURCE_ID_NEW.xml | grep -v ^$

printf "\n%s\n" $DASHES

rm spase_resource_id_update_$$.xml

