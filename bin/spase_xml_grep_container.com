
SPASE_XML_FILE_NAME=$1

SPASE_XML_CONTAINER_NAME=$2

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

SPASE_XML_CONTAINER_LINE_NUM_LIST_NUM=`grep '<'$SPASE_XML_CONTAINER_NAME'>' $SPASE_XML_FILE_NAME | wc -l | awk '{ print $1 }'`

if [ $SPASE_XML_CONTAINER_LINE_NUM_LIST_NUM -gt 0 ]; then

   SPASE_XML_CONTAINER_LINE_NUM_LIST=`grep -n '<'$SPASE_XML_CONTAINER_NAME'>' $SPASE_XML_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

   SPASE_XML_FILE_LINE_COUNT=`wc -l $SPASE_XML_FILE_NAME | awk '{ print $1 }'`

   HIT_NUM=-1

   printf "%s\n\n" $HASHES

   for SPASE_XML_CONTAINER_LINE_NUM in $SPASE_XML_CONTAINER_LINE_NUM_LIST

   do

       HIT_NUM=$((HIT_NUM+1))

       HIT_NUM_TEXT=`printf "%03d\n" $HIT_NUM`

       TAIL_NUM=$((SPASE_XML_FILE_LINE_COUNT-SPASE_XML_CONTAINER_LINE_NUM+1))

       HEAD_NUM=`tail -$TAIL_NUM $SPASE_XML_FILE_NAME | grep -n '</'$SPASE_XML_CONTAINER_NAME'>' | awk 'BEGIN { FS=":" } ; { print $1 }' | head -1`

       printf "%s\t%d\t%d\t%d\t%d\t%s\n\n" $HIT_NUM_TEXT $SPASE_XML_FILE_LINE_COUNT $SPASE_XML_CONTAINER_LINE_NUM $HEAD_NUM $TAIL_NUM $SPASE_XML_FILE_NAME

       tail -$TAIL_NUM $SPASE_XML_FILE_NAME | head -$HEAD_NUM | sed 's/^[ 	][ 	]*</</' | sed 's%^%'$SPASE_XML_FILE_NAME':  %' | sed 's/[ 	]*//'

       if [ $(($HIT_NUM+1)) -lt $SPASE_XML_CONTAINER_LINE_NUM_LIST_NUM ]; then printf "\n%s\n\n" $DASHES; fi

   done

   printf "\n%s\n" $HASHES

fi

