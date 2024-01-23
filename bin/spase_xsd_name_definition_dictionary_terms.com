
SPASE_XSD_FILE_NAME=$1

TYPE=simpleType

SPASE_XSD_FILE_NAME_TEMP=spase_xsd_name_definition_dictionary_terms_$$.txt

SPASE_XSD_FILE_LINE_NUM=`wc -l $SPASE_XSD_FILE_NAME | awk '{ print $1 }'`

DICTIONARY_TERMS_LINE_NUM=`grep -n ^'Dictionary Terms'$ $SPASE_XSD_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

START_LINE_NUM=$((DICTIONARY_TERMS_LINE_NUM+2))

TAIL_NUM=$((SPASE_XSD_FILE_LINE_NUM-START_LINE_NUM))

COMMENT_LINE_NUM=`tail -$TAIL_NUM $SPASE_XSD_FILE_NAME | grep -n ^'================================ -->'$ | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

HEAD_NUM=$((START_LINE_NUM+COMMENT_LINE_NUM-4))

TAIL_NUM=$((COMMENT_LINE_NUM-4))

head -$HEAD_NUM $SPASE_XSD_FILE_NAME | tail -$TAIL_NUM &> $SPASE_XSD_FILE_NAME_TEMP

DICTIONARY_TERM_LIST=`grep ^'<xsd:'$TYPE' name=".*">'$ $SPASE_XSD_FILE_NAME_TEMP | awk 'BEGIN { FS="\"" } ; { print $2 }'`

printf "List Num\t\tSPASE Term Type\tSPASE Container Name\tSPASE Container Definition\t\tNew Definition\tEditor\n\t\t\t\t\t\t\t\n"

NUM=0

for DICTIONARY_TERM in $DICTIONARY_TERM_LIST

do

    NUM_ZERO_PADDED=`printf "%03d\n" $NUM`

    spase_xsd_name_definition.com $SPASE_XSD_FILE_NAME_TEMP $TYPE $DICTIONARY_TERM | awk 'BEGIN { FS="	" } ; { print "Dictionary Term	"$2"	"$3"			" }' | sed 's/^/'$NUM_ZERO_PADDED'		/'

    NUM=$((NUM+1))

done

rm $SPASE_XSD_FILE_NAME_TEMP

