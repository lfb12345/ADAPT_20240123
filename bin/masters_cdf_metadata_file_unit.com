
MASTER_CDF_METADATA_FILE_NAME=$1

PARTITION=$2

PARTITION_LOWER=`echo $PARTITION | tr 'A-Z' 'a-z'`

PARTITION_UPPER=`echo $PARTITION | tr 'a-z' 'A-Z'`

GLOBAL_ATTRIBUTE_LINE_NUM=`grep -n ^'Global\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_CDF_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

VARIABLE_ATTRIBUTE_LINE_NUM=`grep -n ^'Variable\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_CDF_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

VARIABLE_INFORMATION_LINE_NUM=`grep -n ^'Variable\ Information\ ([0-9][0-9]*\\ rVariable,\ [0-9][0-9]* zVariables)'$ $MASTER_CDF_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

VARIABLE_LINE_NUM=`grep -n ^'Variable\ ([1-9][0-9]*\ variables)'$ $MASTER_CDF_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

FILE_LINE_NUM=`wc -l $MASTER_CDF_METADATA_FILE_NAME | awk '{ print $1 }'`

echo $MASTER_CDF_METADATA_FILE_NAME'	'$PARTITION_UPPER'	'$GLOBAL_ATTRIBUTE_LINE_NUM'	'$VARIABLE_ATTRIBUTE_LINE_NUM'	'$VARIABLE_INFORMATION_LINE_NUM'	'$VARIABLE_LINE_NUM'	'$FILE_LINE_NUM

case $PARTITION_UPPER in

     FILE_HEADER) HEAD_NUM=$((GLOBAL_ATTRIBUTE_LINE_NUM-1))
                  head -$HEAD_NUM $MASTER_CDF_METADATA_FILE_NAME | grep -v ^'\ *'$ | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/';;

     GLOBAL_ATTRIBUTE) HEAD_NUM=$((VARIABLE_ATTRIBUTE_LINE_NUM-1))
                       TAIL_NUM=$((HEAD_NUM-GLOBAL_ATTRIBUTE_LINE_NUM+1))
                       head -$HEAD_NUM $MASTER_CDF_METADATA_FILE_NAME | tail -$TAIL_NUM | grep -v ^'\ *'$ | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/';;

     VARIABLE_ATTRIBUTE) HEAD_NUM=$((VARIABLE_INFORMATION_LINE_NUM-1))
                         TAIL_NUM=$((HEAD_NUM-VARIABLE_ATTRIBUTE_LINE_NUM+1))
                         head -$HEAD_NUM $MASTER_CDF_METADATA_FILE_NAME | tail -$TAIL_NUM | grep -v ^'\ *'$ | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/';;

     VARIABLE_INFORMATION) HEAD_NUM=$((VARIABLE_LINE_NUM-1))
                           TAIL_NUM=$((HEAD_NUM-VARIABLE_INFORMATION_LINE_NUM+1))
                           head -$HEAD_NUM $MASTER_CDF_METADATA_FILE_NAME | tail -$TAIL_NUM | grep -v ^'\ *'$ | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/';;

     VARIABLE_METADATA) TAIL_NUM=$((FILE_LINE_NUM-VARIABLE_LINE_NUM+1))
                        tail -$TAIL_NUM $MASTER_CDF_METADATA_FILE_NAME | grep -v ^'\ *'$ | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/';;

     *) printf "\nUnknown Master CDF Metadata Section - Partition:   %-25s   Master CDF Metadata File Name:   %s\n\n" $PARTITION $MASTER_CDF_METADATA_FILE_NAME;;

esac

