
SPASE_XSD_FILE_NAME=$1

TYPE=$2

NAME=$3

SPASE_XSD_FILE_NUM=`wc -l $SPASE_XSD_FILE_NAME | awk '{ print $1 }'`

START_LINE_NUM=`grep -n '<xsd:'$TYPE' name="'$NAME'">'$ $SPASE_XSD_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

TAIL_NUM=$((SPASE_XSD_FILE_NUM-START_LINE_NUM+1))

STOP_LINE_NUM=`tail -$TAIL_NUM $SPASE_XSD_FILE_NAME | grep -n ^'</xsd:'$TYPE'>$' | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

HEAD_NUM=$((START_LINE_NUM+STOP_LINE_NUM-1))

TAIL_NUM=$((STOP_LINE_NUM+1))

head -$HEAD_NUM $SPASE_XSD_FILE_NAME | tail -$STOP_LINE_NUM | sed 's/*/ASTERISK/g' &> spase_name_definition_$$.txt

case $TYPE in

     complexType) DEFINITION=`grep ^'<xsd:documentation xml:lang="en">.*</xsd:documentation>'$ spase_name_definition_$$.txt | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`;;

     enumeration) DEFINITION=`grep ^'<xsd:documentation xml:lang="en">.*</xsd:documentation>'$ spase_name_definition_$$.txt | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`;;

     simpleType)  DEFINITION=`grep ^'<xsd:documentation xml:lang="en">.*</xsd:documentation>'$ spase_name_definition_$$.txt | head -1 | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`;;

esac

echo $TYPE"	"$NAME"	"$DEFINITION | sed 's/ASTERISK/*/g'

rm spase_name_definition_$$.txt

