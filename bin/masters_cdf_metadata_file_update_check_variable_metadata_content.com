
MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME=$1

PARAMETER=$2

FILE_LINE_NUM=`wc -l $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME | awk '{ print $1 }'`

PARAMETER_LINE_NUM=`grep -n ^$PARAMETER'\ ' $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

DASH_TAIL_NUM=$((FILE_LINE_NUM-PARAMETER_LINE_NUM-1))

DASH_LINE_NUM=`tail -$DASH_TAIL_NUM $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME | grep -n ^'--*'$ | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

HEAD_NUM=$((PARAMETER_LINE_NUM+DASH_LINE_NUM-1))

TAIL_NUM=$((DASH_LINE_NUM-3))

if [ $DASH_LINE_NUM ]; then

   head -$HEAD_NUM $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME | tail -$TAIL_NUM

else

   TAIL_NUM=$((DASH_TAIL_NUM-1))

   tail -$TAIL_NUM $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME

fi

#
#  echo
#
#  echo "File Line Num:        "$FILE_LINE_NUM
#
#  echo
#
#  echo "Parameter Line Num:   "$PARAMETER_LINE_NUM
#
#  echo
#
#  echo "Dash Tail Num:        "$DASH_TAIL_NUM
#
#  echo
#
#  echo "Dash Line Num:        "$DASH_LINE_NUM
#
#  echo
#
#  echo "Head Num:             "$HEAD_NUM
#
#  echo
#
#  echo "Tail Num:             "$TAIL_NUM
#
#  echo
#

