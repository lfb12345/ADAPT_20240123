
MASTER_CDF_METADATA_DIRECTORY_NEW=$1

PARTITION=$2

VERSION_OLD_NEW=$3

MASTER_CDF_METADATA_FILE_NAME=$4

PARTITION_LOWER=`echo $PARTITION | tr 'A-Z' 'a-z'`

PARTITION_UPPER=`echo $PARTITION | tr 'a-z' 'A-Z'`

VERSION_OLD_NEW_LOWER=`echo $VERSION_OLD_NEW | tr 'A-Z' 'a-z'`

VERSION_OLD_NEW_UPPER=`echo $VERSION_OLD_NEW | tr 'a-z' 'A-Z'`

MASTER_CDF_METADATA_FILE_PARTITION_OUTPUT_DIRECTORY=$MASTER_CDF_METADATA_DIRECTORY_NEW/PARTITION/$VERSION_OLD_NEW_UPPER

mkdir -p $MASTER_CDF_METADATA_FILE_PARTITION_OUTPUT_DIRECTORY

MASTER_CDF_METADATA_FILE_BASENAME_ROOT=`basename $MASTER_CDF_METADATA_FILE_NAME | sed 's/\.metadata$//'`

MASTER_CDF_METADATA_PARTITION_FILE_NAME=$MASTER_CDF_METADATA_FILE_PARTITION_OUTPUT_DIRECTORY/$MASTER_CDF_METADATA_FILE_BASENAME_ROOT'_'$PARTITION_LOWER.txt

echo $MASTER_CDF_METADATA_PARTITION_FILE_NAME

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

GLOBAL_ATTRIBUTE_LINE_NUM=`grep -n ^'Global\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_CDF_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

VARIABLE_ATTRIBUTE_LINE_NUM=`grep -n ^'Variable\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_CDF_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

VARIABLE_INFORMATION_LINE_NUM=`grep -n ^'Variable\ Information\ ([0-9][0-9]*\\ rVariable,\ [0-9][0-9]* zVariables)'$ $MASTER_CDF_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

VARIABLE_LINE_NUM=`grep -n ^'Variable\ ([1-9][0-9]*\ variables)'$ $MASTER_CDF_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

FILE_LINE_NUM=`wc -l $MASTER_CDF_METADATA_FILE_NAME | awk '{ print $1 }'`

case $PARTITION_UPPER in

     FILE_HEADER) HEAD_NUM=$((GLOBAL_ATTRIBUTE_LINE_NUM-1))
                  head -$HEAD_NUM $MASTER_CDF_METADATA_FILE_NAME | grep -v ^'\ *'$ | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/' &> $MASTER_CDF_METADATA_PARTITION_FILE_NAME;;

     GLOBAL_ATTRIBUTE) HEAD_NUM=$((VARIABLE_ATTRIBUTE_LINE_NUM-1))
                       TAIL_NUM=$((HEAD_NUM-GLOBAL_ATTRIBUTE_LINE_NUM+1))
                       head -$HEAD_NUM $MASTER_CDF_METADATA_FILE_NAME | tail -$TAIL_NUM | grep -v ^'\ *'$ | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/' &> $MASTER_CDF_METADATA_PARTITION_FILE_NAME;;

     VARIABLE_ATTRIBUTE) HEAD_NUM=$((VARIABLE_INFORMATION_LINE_NUM-1))
                         TAIL_NUM=$((HEAD_NUM-VARIABLE_ATTRIBUTE_LINE_NUM+1))
                         head -$HEAD_NUM $MASTER_CDF_METADATA_FILE_NAME | tail -$TAIL_NUM | grep -v ^'\ *'$ | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/' &> $MASTER_CDF_METADATA_PARTITION_FILE_NAME;;

     VARIABLE_INFORMATION) HEAD_NUM=$((VARIABLE_LINE_NUM-1))
                           TAIL_NUM=$((HEAD_NUM-VARIABLE_INFORMATION_LINE_NUM+1))
                           head -$HEAD_NUM $MASTER_CDF_METADATA_FILE_NAME | tail -$TAIL_NUM | grep -v ^'\ *'$ | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/' &> $MASTER_CDF_METADATA_PARTITION_FILE_NAME;;

     VARIABLE_METADATA) TAIL_NUM=$((FILE_LINE_NUM-VARIABLE_LINE_NUM+1))
                        tail -$TAIL_NUM $MASTER_CDF_METADATA_FILE_NAME | grep -v ^'\ *'$ | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/' &> $MASTER_CDF_METADATA_PARTITION_FILE_NAME;;

     *) printf "\nUnknown Master CDF Metadata Section - Version:   %s   Partition:   %-25s   Master CDF Metadata File Name:   %s\n\n" $VERSION_OLD_NEW $PARTITION $MASTER_CDF_METADATA_FILE_NAME;;

esac

