
METADATA_FILE_NAME=$1

GLOBAL_ATTRIBUTE_NUM=`grep ^'Global Attributes' $METADATA_FILE_NAME | sed 's/^Global Attributes\ (//' | sed 's/ attributes)//'`

GLOBAL_ATTRIBUTE_LINE_NUM=`grep -n ^'Global Attributes' $METADATA_FILE_NAME | sed 's/:.*$//'`

VARIABLE_ATTRIBUTE_LINE_NUM=`grep -n ^'Variable Attributes' $METADATA_FILE_NAME | sed 's/:.*$//'`

HEAD_NUM=$((VARIABLE_ATTRIBUTE_LINE_NUM-1))

TAIL_NUM=$((VARIABLE_ATTRIBUTE_LINE_NUM-GLOBAL_ATTRIBUTE_LINE_NUM-1))

head -$HEAD_NUM $METADATA_FILE_NAME | tail -$TAIL_NUM | sed '/^==*$/s///' | grep  ^'[A-z]' | sed 's/\ .*$//'

