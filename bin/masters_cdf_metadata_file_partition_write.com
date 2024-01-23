
MASTER_FILE_NAME_OLD=$1

MASTER_FILE_NAME_NEW=$2

PARTITION=$3

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

MASTER_DIRECTORY_NAME_NEW=`dirname $MASTER_FILE_NAME_NEW`

PARTITION_LOWER=`echo $PARTITION | tr 'A-Z' 'a-z'`

PARTITION_UPPER=`echo $PARTITION | tr 'a-z' 'A-Z'`

if [ ! -d $MASTER_DIRECTORY_NAME_NEW ]; then mkdir -p $MASTER_DIRECTORY_NAME_NEW; fi

GLOBAL_ATTRIBUTE_LINE_NUM=`grep -n ^'Global\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_FILE_NAME_OLD | awk 'BEGIN { FS=":" } ; { print $1 }'`

VARIABLE_ATTRIBUTE_LINE_NUM=`grep -n ^'Variable\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_FILE_NAME_OLD | awk 'BEGIN { FS=":" } ; { print $1 }'`

VARIABLE_INFORMATION_LINE_NUM=`grep -n ^'Variable\ Information\ ([0-9][0-9]*\\ rVariable,\ [0-9][0-9]* zVariables)'$ $MASTER_FILE_NAME_OLD | awk 'BEGIN { FS=":" } ; { print $1 }'`

VARIABLE_LINE_NUM=`grep -n ^'Variable\ ([1-9][0-9]*\ variables)'$ $MASTER_FILE_NAME_OLD | awk 'BEGIN { FS=":" } ; { print $1 }'`

FILE_LINE_NUM=`wc -l $MASTER_FILE_NAME_OLD | awk '{ print $1 }'`

case $PARTITION_UPPER in

     FILE_HEADER) HEAD_NUM=$((GLOBAL_ATTRIBUTE_LINE_NUM-1))
                  head -$HEAD_NUM $MASTER_FILE_NAME_OLD | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/' >> $MASTER_FILE_NAME_NEW;;

     GLOBAL_ATTRIBUTE) HEAD_NUM=$((VARIABLE_ATTRIBUTE_LINE_NUM-1))
                       TAIL_NUM=$((HEAD_NUM-GLOBAL_ATTRIBUTE_LINE_NUM+1))
                       head -$HEAD_NUM $MASTER_FILE_NAME_OLD | tail -$TAIL_NUM | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/' >> $MASTER_FILE_NAME_NEW;;

     VARIABLE_ATTRIBUTE) HEAD_NUM=$((VARIABLE_INFORMATION_LINE_NUM-1))
                         TAIL_NUM=$((HEAD_NUM-VARIABLE_ATTRIBUTE_LINE_NUM+1))
                         head -$HEAD_NUM $MASTER_FILE_NAME_OLD | tail -$TAIL_NUM | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/' >> $MASTER_FILE_NAME_NEW;;

     VARIABLE_INFORMATION) HEAD_NUM=$((VARIABLE_LINE_NUM-1))
                           TAIL_NUM=$((HEAD_NUM-VARIABLE_INFORMATION_LINE_NUM+1))
                           head -$HEAD_NUM $MASTER_FILE_NAME_OLD | tail -$TAIL_NUM | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/' >> $MASTER_FILE_NAME_NEW;;

     VARIABLE_METADATA) TAIL_NUM=$((FILE_LINE_NUM-VARIABLE_LINE_NUM+1))
                        tail -$TAIL_NUM $MASTER_FILE_NAME_OLD | sed 's/\ \ *$//'  | sed '/" "/!s/\ \ *"$/"/' >> $MASTER_FILE_NAME_NEW;;

     *) printf "\nUnknown Master CDF Metadata Section - Partition:   %-25s   OLD Master CDF Metadata File Name:   %-100sNEW Master CDF Metadata File Name:   %-100s\n\n" $PARTITION $MASTER_FILE_NAME_OLD $MASTER_FILE_NAME_NEW;;

esac

#cho

#cho "OLD Master File Name:  "$MASTER_FILE_NAME_OLD

#cho

#cho "NEW Master File Name:  "$MASTER_FILE_NAME_NEW

#cho

#cho "New Master Directory Name:  "$MASTER_DIRECTORY_NAME_NEW

#cho

#cho "Partition Upper:       "$PARTITION_UPPER

#cho

