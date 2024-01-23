
METADATA_FILE_NAME_PATTERN=$@

METADATA_FILE_NAME_LIST=`find $@ | sort`

for METADATA_FILE_NAME in $METADATA_FILE_NAME_LIST

do

    VARIABLE_LINE_NUM=`grep -n ^'Variable ([1-9][0-9]* variables)' $METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

    LINE_NUM=`wc -l $METADATA_FILE_NAME | awk '{ print $1 }'`

    TAIL_NUM=$((LINE_NUM-VARIABLE_LINE_NUM+2))

    tail -$TAIL_NUM $METADATA_FILE_NAME

done

