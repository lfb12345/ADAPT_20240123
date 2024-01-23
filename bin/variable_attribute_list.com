
METADATA_FILE_NAME=$1

VARIABLE_ATTRIBUTE_NUM=`grep ^'Variable Attributes' $METADATA_FILE_NAME | sed 's/^Variable Attributes\ (//' | sed 's/ attributes)//'`

VARIABLE_ATTRIBUTE_LINE_NUM=`grep -n ^'Variable Attributes' $METADATA_FILE_NAME | sed 's/:.*$//'`

VARIABLE_INFORMATION_LINE_NUM=`grep -n ^'Variable Information' $METADATA_FILE_NAME | sed 's/:.*$//'`

HEAD_NUM=$((VARIABLE_INFORMATION_LINE_NUM-1))

TAIL_NUM=$((VARIABLE_ATTRIBUTE_NUM+2))

head -$VARIABLE_ATTRIBUTE_LINE_NUM $METADATA_FILE_NAME | tail -2

head -$HEAD_NUM $METADATA_FILE_NAME | tail -$TAIL_NUM | sed '/^==*$/s///'

