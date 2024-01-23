
SPASE_XSD_FILE_NAME=$1

TYPE=complexType

SPASE_XSD_FILE_NAME_TEMP=spase_xsd_name_definition_container_$$.txt

COMMENT_LINE_NUM=`grep -n ^'<!-- ================================'$ $SPASE_XSD_FILE_NAME | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

HEAD_LINE_NUM=$((COMMENT_LINE_NUM-2))

head -$HEAD_LINE_NUM $SPASE_XSD_FILE_NAME &> $SPASE_XSD_FILE_NAME_TEMP

CONTAINER_NAME_LIST=`grep ^'<xsd:'$TYPE' name=".*">'$ $SPASE_XSD_FILE_NAME_TEMP | awk 'BEGIN { FS="\"" } ; { print $2 }'`

printf "List Num\t\tSPASE Term Type\tSPASE Container Name\tSPASE Container Definition\t\tNew Definition\tEditor\t\tSPASE Schema Contextual Notes\n\t\t\t\t\t\t\t\t\t\n"

NUM=0

for CONTAINER_NAME in $CONTAINER_NAME_LIST

do

    NUM_ZERO_PADDED=`printf "%03d\n" $NUM`

    spase_xsd_name_definition.com $SPASE_XSD_FILE_NAME_TEMP $TYPE $CONTAINER_NAME | awk 'BEGIN { FS="	" } ; { print "Container	"$2"	"$3"					" }' | sed 's/^/'$NUM_ZERO_PADDED'		/'

    NUM=$((NUM+1))

done

rm $SPASE_XSD_FILE_NAME_TEMP

