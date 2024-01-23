
METADATA_FILE_NAME=$1

GLOBAL_ATTRIBUTE_NUM=`grep ^'Global Attributes' $METADATA_FILE_NAME | sed 's/^Global Attributes\ (//' | sed 's/ attributes)//'`

GLOBAL_ATTRIBUTE_LINE_NUM=`grep -n ^'Global Attributes' $METADATA_FILE_NAME | sed 's/:.*$//'`

VARIABLE_ATTRIBUTE_NUM=`grep ^'Variable Attributes' $METADATA_FILE_NAME | sed 's/^Variable Attributes\ (//' | sed 's/ attributes)//'`

VARIABLE_ATTRIBUTE_LINE_NUM=`grep -n ^'Variable Attributes' $METADATA_FILE_NAME | sed 's/:.*$//'`

R_VARIABLE_NUM=`grep ^'Variable Information' $METADATA_FILE_NAME | awk 'BEGIN { FS="[()]" } ; { print $2 }' | awk '{ print $1 }'`

Z_VARIABLE_NUM=`grep ^'Variable Information' $METADATA_FILE_NAME | awk 'BEGIN { FS="[()]" } ; { print $2 }' | awk '{ print $3 }'`

T_VARIABLE_NUM=$((R_VARIABLE_NUM+Z_VARIABLE_NUM))

VARIABLE_INFORMATION_LINE_NUM=`grep -n ^'Variable Information' $METADATA_FILE_NAME | sed 's/:.*$//'`

echo

echo 'Metadata File NAME: '$METADATA_FILE_NAME

echo

grep ^'Global Attributes' $METADATA_FILE_NAME

echo

grep ^'Variable Attributes' $METADATA_FILE_NAME

echo

grep ^'Variable Information' $METADATA_FILE_NAME

echo

echo 'R Variable Num:     '$R_VARIABLE_NUM

echo

echo 'Z Variable Num:     '$Z_VARIABLE_NUM

echo

echo 'Total Variable Num: '$T_VARIABLE_NUM

head -$GLOBAL_ATTRIBUTE_LINE_NUM $METADATA_FILE_NAME | tail -2

HEAD_NUM=$((VARIABLE_ATTRIBUTE_LINE_NUM-1))

TAIL_NUM=$((VARIABLE_ATTRIBUTE_LINE_NUM-GLOBAL_ATTRIBUTE_LINE_NUM-1))

head -$HEAD_NUM $METADATA_FILE_NAME | tail -$TAIL_NUM | sed '/^==*$/s///' | sed '/^[A-z]/s/^/GLOBAL_ATTRIBUTE:   /'

HEAD_NUM=$((VARIABLE_INFORMATION_LINE_NUM-1))

TAIL_NUM=$((VARIABLE_ATTRIBUTE_NUM+2))

head -$VARIABLE_ATTRIBUTE_LINE_NUM $METADATA_FILE_NAME | tail -1

head -$HEAD_NUM $METADATA_FILE_NAME | tail -$TAIL_NUM | sed '/^==*$/s///' | sed '/^[A-z]/s/^/VARIABLE_ATTRIBUTE: /'

