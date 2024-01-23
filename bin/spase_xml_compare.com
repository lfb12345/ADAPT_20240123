
DIRECTORY_COMPARE=$1

DIRECTORY_OLD=$2

DIRECTORY_NEW=$3

DATA_PRODUCT_ID=$4

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

STARS='+'$(printf "%0.s*" $(seq 1 273))'+'

XML_FILE_NAME_OLD=`grep -r '<ProductKey>'$DATA_PRODUCT_ID'</ProductKey>' $DIRECTORY_COMPARE/$DIRECTORY_OLD | sed 's/\.xml:.*$/\.xml/'`

XML_FILE_NAME_NEW=`grep -r '<ProductKey>'$DATA_PRODUCT_ID'</ProductKey>' $DIRECTORY_COMPARE/$DIRECTORY_NEW | sed 's/\.xml:.*$/\.xml/'`

DIFF_OUTPUT_FILE_NAME=`echo $XML_FILE_NAME_NEW | sed 's/\.xml$/\.txt/'`

diff $XML_FILE_NAME_OLD $XML_FILE_NAME_NEW &> $DIFF_OUTPUT_FILE_NAME

echo $STARS

echo

echo 'OLD LFB SPASE XML File Name:  '$XML_FILE_NAME_OLD

echo

echo 'NEW RAC SPASE XML File Name:  '$XML_FILE_NAME_NEW

echo

echo 'LFB to RAC Diff File Name:    '$DIFF_OUTPUT_FILE_NAME

echo

echo $STARS

echo

echo $DASHES

echo

echo 'LFB to RAC Diff File Summary for Data Product ID:  '$DATA_PRODUCT_ID

echo

echo $DASHES

echo

LINE_NUM=`grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<ResourceID>' | wc -l | awk '{ print $1 }'`

if [ $LINE_NUM -gt 0 ]; then

   grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<ResourceID>'

   echo

fi

LINE_NUM=`grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<ResourceName>' | wc -l | awk '{ print $1 }'`

if [ $LINE_NUM -gt 0 ]; then

   grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<ResourceName>'

   echo

fi

LINE_NUM=`grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<RelativeStopDate>' | wc -l | awk '{ print $1 }'`

if [ $LINE_NUM -gt 0 ]; then

   grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<RelativeStopDate>'

   echo

fi

LINE_NUM=`grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<Description>' | wc -l | awk '{ print $1 }'`

if [ $LINE_NUM -gt 0 ]; then

   grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<Description>'

   echo

fi

LINE_NUM=`grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<Name>' | wc -l | awk '{ print $1 }'`

if [ $LINE_NUM -gt 0 ]; then

   grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<Name>'

   echo

fi

LINE_NUM=`grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<Caveats>' | wc -l | awk '{ print $1 }'`

if [ $LINE_NUM -gt 0 ]; then

   grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<Caveats>'

   echo

fi

LINE_NUM=`grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<Cadence>' | wc -l | awk '{ print $1 }'`

if [ $LINE_NUM -gt 0 ]; then

   grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep '<Cadence>'

   echo

fi

LINE_NUM=`grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep -v '<ResourceID>' | grep -v '<ResourceName>' | grep -v '<RelativeStopDate>' | grep -v '<Description>' | grep -v '<Name>' | grep -v '<Caveats>' | grep -v '<Cadence>' | wc -l | awk '{ print $1 }'`

if [ $LINE_NUM -gt 0 ]; then

   grep '[<>]' $DIFF_OUTPUT_FILE_NAME | sort | uniq -c | grep -v '<ResourceID>' | grep -v '<ResourceName>' | grep -v '<RelativeStopDate>' | grep -v '<Description>' | grep -v '<Name>' | grep -v '<Caveats>' | grep -v '<Cadence>' | sort -n

   echo

fi

DIFF_CHAR_NUM=`wc -c $DIFF_OUTPUT_FILE_NAME | awk '{ print $1 }'`

if [ $DIFF_CHAR_NUM -eq 0 ]; then

   echo '   *** No Changes found. The Files are identical. ***'

   echo

fi

echo $DASHES

echo

echo $STARS

