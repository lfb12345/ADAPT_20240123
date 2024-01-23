
COLLATION_DIRECTORY=$1

XML_FILE_NAME=$2

METADATA_CONTACT=$3

NOTE=$4

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

RELEASE_DATE=`date "+%Y-%m-%d"`'T12:34:56.789'

SPASE_RESOURCE_ID=`grep '<ResourceID>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/spase:\/\///'`

OUTPUT_DIRECTORY=$COLLATION_DIRECTORY/`dirname $SPASE_RESOURCE_ID`

if [ ! -d $OUTPUT_DIRECTORY ]; then mkdir -p $OUTPUT_DIRECTORY; fi

COLLATION_FILE_NAME=$OUTPUT_DIRECTORY/`basename $SPASE_RESOURCE_ID`.xml

SPASE_RESOURCE_TYPE=`echo $SPASE_RESOURCE_ID | awk 'BEGIN { FS="/" } ; { print $2 }'`

if [ $SPASE_RESOURCE_TYPE != "Person" ]; then

   NOTE=`echo $NOTE | sed 's/|/\ /g'`

   XML_FILE_LINE_NUM=`wc -l $XML_FILE_NAME | awk '{ print $1 }'`

   SPASE_RESOURCE_TYPE_LINE_NUM=`grep -n ^'\ \ \ <'$SPASE_RESOURCE_TYPE'>' $XML_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

   RELEASE_DATE_LINE_NUM=`grep -n ^'\ \ \ \ \ \ \ \ \ <ReleaseDate>' $XML_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

   LAST_CONTACT_LINE_NUM=`grep -n ^'\ \ \ \ \ \ \ \ \ </Contact>' $XML_FILE_NAME | tail -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

   HEAD_NUM=$((RELEASE_DATE_LINE_NUM-1))

   TAIL_NUM=$((RELEASE_DATE_LINE_NUM-SPASE_RESOURCE_TYPE_LINE_NUM))

   echo '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' > $COLLATION_FILE_NAME

   echo '<Spase xmlns="http://www.spase-group.org/data/schema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.spase-group.org/data/schema https://www.spase-group.org/data/schema/spase-2_4_0.xsd">' >> $COLLATION_FILE_NAME

   echo '   <Version>2.4.0</Version>' >> $COLLATION_FILE_NAME

   head -$HEAD_NUM $XML_FILE_NAME | tail -$TAIL_NUM >> $COLLATION_FILE_NAME

   echo '         <ReleaseDate>'$RELEASE_DATE'</ReleaseDate>' >> $COLLATION_FILE_NAME

   echo 

   echo '         <RevisionHistory>' >> $COLLATION_FILE_NAME

   echo '            <RevisionEvent>' >> $COLLATION_FILE_NAME

   echo '               <ReleaseDate>'$RELEASE_DATE'</ReleaseDate>' >> $COLLATION_FILE_NAME

   echo '               <Note>'$NOTE'</Note>' >> $COLLATION_FILE_NAME

   echo '            </RevisionEvent>' >> $COLLATION_FILE_NAME

   echo '         </RevisionHistory>' >> $COLLATION_FILE_NAME

   TAIL_NUM=$((LAST_CONTACT_LINE_NUM-RELEASE_DATE_LINE_NUM))

   head -$LAST_CONTACT_LINE_NUM $XML_FILE_NAME | tail -$TAIL_NUM >> $COLLATION_FILE_NAME

   METADATA_CONTACT_NUM=`grep -c ^'\ \ \ \ \ \ \ \ \ \ \ \ <PersonID>spase://SMWG/Person/'$METADATA_CONTACT'</PersonID>'$ $XML_FILE_NAME`

   if [ $METADATA_CONTACT_NUM -eq 0 ]; then

      echo '         <Contact>' >> $COLLATION_FILE_NAME

      echo '            <PersonID>spase://SMWG/Person/'$METADATA_CONTACT'</PersonID>' >> $COLLATION_FILE_NAME

      echo '            <Role>MetadataContact</Role>' >> $COLLATION_FILE_NAME

      echo '         </Contact>' >> $COLLATION_FILE_NAME

   fi

   METADATA_CONTACT_NUM=`grep -c ^'\ \ \ \ \ \ \ \ \ \ \ \ <PersonID>spase://SMWG/Person/Lee.Frost.Bargatze</PersonID>'$ $XML_FILE_NAME`

   if [ $METADATA_CONTACT_NUM -eq 0 ] && [ $METADATA_CONTACT != Lee.Frost.Bargatze ]; then

      echo '         <Contact>' >> $COLLATION_FILE_NAME

      echo '            <PersonID>spase://SMWG/Person/Lee.Frost.Bargatze</PersonID>' >> $COLLATION_FILE_NAME

      echo '            <Role>MetadataContact</Role>' >> $COLLATION_FILE_NAME

      echo '         </Contact>' >> $COLLATION_FILE_NAME

   fi

   TAIL_NUM=$((XML_FILE_LINE_NUM-LAST_CONTACT_LINE_NUM))

   cat $XML_FILE_NAME | tail -$TAIL_NUM >> $COLLATION_FILE_NAME

else

   echo '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' > $COLLATION_FILE_NAME

   echo '<Spase xmlns="http://www.spase-group.org/data/schema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.spase-group.org/data/schema https://www.spase-group.org/data/schema/spase-2_4_0.xsd">' >> $COLLATION_FILE_NAME

   echo '   <Version>2.4.0</Version>' >> $COLLATION_FILE_NAME

   echo '   <Person>' >> $COLLATION_FILE_NAME

   echo '      <ResourceID>spase://'$SPASE_RESOURCE_ID'</ResourceID>' >> $COLLATION_FILE_NAME

   echo '      <ReleaseDate>'$RELEASE_DATE'</ReleaseDate>' >> $COLLATION_FILE_NAME

   grep -v 'xml version' $XML_FILE_NAME | grep -v ^'<Spase\ ' | grep -v '<Version>' | grep -v '<Person>' | grep -v '<ResourceID>' | grep -v '<ReleaseDate>' >> $COLLATION_FILE_NAME

fi

printf "%s\n\nSPASE_EDITOR_PROCESS_UPDATE\t%s\t%s\n\n%s\n\n" $DASHES $XML_FILE_NAME $COLLATION_FILE_NAME $DASHES

diff $XML_FILE_NAME $COLLATION_FILE_NAME

echo

VERSION_NUM=`grep ^'\ \ \ <Version>' $COLLATION_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/\./_/g'`

vxo_validation_check.com $VERSION_NUM $COLLATION_FILE_NAME

echo

