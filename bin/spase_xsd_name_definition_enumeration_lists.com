
SPASE_XSD_FILE_NAME=$1

SPASE_XSD_FILE_NAME_TEMP=spase_xsd_name_definition_enumeration_lists_$$.txt

SPASE_XSD_FILE_NAME_LIST_TEMP=spase_xsd_name_definition_enumeration_list_$$.txt

SPASE_XSD_FILE_NAME_TERM_TEMP=spase_xsd_name_definition_enumeration_term_$$.txt

SPASE_XSD_FILE_LINE_NUM=`wc -l $SPASE_XSD_FILE_NAME | awk '{ print $1 }'`

ENUMERATION_LISTS_LINE_NUM=`grep -n ^'Enumeration Lists'$ $SPASE_XSD_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

START_LINE_NUM=$((ENUMERATION_LISTS_LINE_NUM+2))

TAIL_NUM=$((SPASE_XSD_FILE_LINE_NUM-START_LINE_NUM))

COMMENT_LINE_NUM=`tail -$TAIL_NUM $SPASE_XSD_FILE_NAME | grep -n ^'================================ -->'$ | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

HEAD_NUM=$((START_LINE_NUM+COMMENT_LINE_NUM-4))

TAIL_NUM=$((COMMENT_LINE_NUM-4))

head -$HEAD_NUM $SPASE_XSD_FILE_NAME | tail -$TAIL_NUM &> $SPASE_XSD_FILE_NAME_TEMP

SPASE_XSD_FILE_LINE_NUM_TEMP=`wc -l $SPASE_XSD_FILE_NAME_TEMP | awk '{ print $1 }'`

TYPE=simpleType

ENUMERATION_LIST_LIST=`grep ^'<xsd:'$TYPE' name=".*">'$ $SPASE_XSD_FILE_NAME_TEMP | awk 'BEGIN { FS="\"" } ; { print $2 }' | grep -v ^Version$`

LIST_NUM=-1

for ENUMERATION_LIST in $ENUMERATION_LIST_LIST

do

    LIST_NUM=$((LIST_NUM+1))

    LIST_NUM_TEXT=`printf "%03d\n" $LIST_NUM`

    ENUMERATION_LIST_LINE_NUM=`grep -n ^'List: '$ENUMERATION_LIST$ $SPASE_XSD_FILE_NAME_TEMP | awk 'BEGIN { FS=":" } ; { print $1 }'`

    TAIL_NUM=$((SPASE_XSD_FILE_LINE_NUM_TEMP-ENUMERATION_LIST_LINE_NUM-3))

    COMMENT_LINE_NUM=`tail -$TAIL_NUM $SPASE_XSD_FILE_NAME_TEMP | grep -n ^'</xsd:simpleType>'$ | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

    HEAD_NUM=$((ENUMERATION_LIST_LINE_NUM+COMMENT_LINE_NUM+3))

    TAIL_NUM=$COMMENT_LINE_NUM

    head -$HEAD_NUM $SPASE_XSD_FILE_NAME_TEMP | tail -$TAIL_NUM &> $SPASE_XSD_FILE_NAME_LIST_TEMP

    SPASE_XSD_FILE_LINE_NUM_LIST_TEMP=`wc -l $SPASE_XSD_FILE_NAME_LIST_TEMP | awk '{ print $1 }'`

    TYPE=simpleType

    printf "List Num\tTerm Num\t\tSPASE Term Type\tEnumeration List Name\tSPASE Enumeration Term Name\tSPASE Enumeration List Definition\t\tNew Definition\tEditor\n\t\t\t\t\t\t\\t\t\t\n"

    spase_xsd_name_definition.com $SPASE_XSD_FILE_NAME_LIST_TEMP $TYPE $ENUMERATION_LIST | awk 'BEGIN { FS="	" } ; { print "Enumeration List	"$2"		"$3 }' | sed 's/^/'$LIST_NUM_TEXT'			/' | sed 's/$/			/'

    printf "\t\t\t\t\t\t\t\t\t\n"

    ENUMERATION_TERM_LIST=`grep ^'<xsd:enumeration value=".*">'$ $SPASE_XSD_FILE_NAME_LIST_TEMP | awk 'BEGIN { FS="\"" } ; { print $2 }'`

    TERM_NUM=-1

    for ENUMERATION_TERM in $ENUMERATION_TERM_LIST

    do

        TERM_NUM=$((TERM_NUM+1))

        TERM_NUM_TEXT=`printf "%03d\n" $TERM_NUM`

        ENUMERATION_LIST_TERM_LINE_NUM=`grep -n ^'<xsd:enumeration value="'$ENUMERATION_TERM'">'$ $SPASE_XSD_FILE_NAME_LIST_TEMP | awk 'BEGIN { FS=":" } ; { print $1 }'`

        TAIL_NUM=$((SPASE_XSD_FILE_LINE_NUM_LIST_TEMP-ENUMERATION_LIST_TERM_LINE_NUM+1))

        HEAD_NUM=`tail -$TAIL_NUM $SPASE_XSD_FILE_NAME_LIST_TEMP | grep -n ^'</xsd:enumeration>'$ | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

        tail -$TAIL_NUM $SPASE_XSD_FILE_NAME_LIST_TEMP | head -$HEAD_NUM &> $SPASE_XSD_FILE_NAME_TERM_TEMP

        TYPE=enumeration

        spase_xsd_name_definition.com $SPASE_XSD_FILE_NAME_TERM_TEMP $TYPE $ENUMERATION_TERM | sed 's/^enumeration/'$LIST_NUM_TEXT'	'$TERM_NUM_TEXT'		Enumeration Term	'$ENUMERATION_LIST'/' | sed 's/$/			/'

        rm $SPASE_XSD_FILE_NAME_TERM_TEMP

    done

    printf "\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\n"

    rm $SPASE_XSD_FILE_NAME_LIST_TEMP

done

rm $SPASE_XSD_FILE_NAME_TEMP

