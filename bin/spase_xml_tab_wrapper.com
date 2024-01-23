
XML_FILE_NAME=$1

RANDOM_NUMBER=$RANDOM

PROGRAM_DIR=/Users/astropooch/bin

OUTPUT_DIR=/Users/astropooch/bin/WORK

if [ ! -d $OUTPUT_DIR ]; then mkdir -p $OUTPUT_DIR; fi

$PROGRAM_DIR/spase_xml_tab.com $XML_FILE_NAME >& $OUTPUT_DIR/spase_xml_tab_wrapper_$RANDOM_NUMBER'_'$$.xml

LINE_NUM_000=`wc -l $XML_FILE_NAME | awk '{ print $1 }'`

mv $OUTPUT_DIR/spase_xml_tab_wrapper_$RANDOM_NUMBER'_'$$.xml $XML_FILE_NAME

LINE_NUM_111=`wc -l $XML_FILE_NAME | awk '{ print $1 }'`

if [ $LINE_NUM_000 -eq $LINE_NUM_111 ]; then

   STATUS=OOO

else

   STATUS=XXX

fi

echo 'SPASE XML Tab File Name:	'$XML_FILE_NAME'	'$STATUS'	'$LINE_NUM_000'	'$LINE_NUM_111

