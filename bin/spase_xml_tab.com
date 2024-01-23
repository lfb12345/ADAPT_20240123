
FILE_NAME=$1

RANDOM_NUMBER=$RANDOM

PROGRAM_DIR=/Users/astropooch/bin

FILE_NAME_TEMP=$PROGRAM_DIR/WORK/spase_xml_tab_$RANDOM_NUMBER"_"$$.xml

sed 's/<[A-z]*\/>//' $FILE_NAME > $FILE_NAME_TEMP

$PROGRAM_DIR/spase_xml_flatten.com $FILE_NAME_TEMP

XML_TEXT=$(cat $FILE_NAME_TEMP | sed 's/\ /|/g')

rm $FILE_NAME_TEMP

TAB_COUNT=1

for XML_LINE in $XML_TEXT; do

    WRITTEN=0

    TEST_STRING="${XML_LINE:0:2}"

#   echo $TEST_STRING

#   TEST_STRING=`echo $TEST_STRING | sed 's/<?/\\\<\\\?/'`

    if [ "$TEST_STRING" == '<?' ]; then

       echo $XML_LINE | sed 's/|/\ /g'

       WRITTEN=1

    fi

    TEST_STRING="${XML_LINE:0:6}"

    if [ "$TEST_STRING" == '<Spase' ]; then

       echo $XML_LINE | sed 's/|/\ /g'

       WRITTEN=1

    fi

    TEST_STRING="${XML_LINE:0:9}"

    if [ "$TEST_STRING" == '<Version>' ]; then

       echo "   "$XML_LINE | sed 's/^\ */\ \ \ /'

       WRITTEN=1

    fi

    if [ "$XML_LINE" == '</Spase>' ]; then

       echo $XML_LINE

       WRITTEN=1

    fi

    if [ $WRITTEN == 0 ]; then

       XML_TAG_OPEN_CHECK=$(echo $XML_LINE | grep -c -v ^'<.*>.*</.*>'$)

       if [ "${XML_LINE:0:2}" == '<!' ]; then XML_TAG_OPEN_CHECK=0; fi

       XML_TAG_CLOSE_CHECK=$(echo $XML_LINE | grep -c ^'</.*>'$)

       XML_TAG_OPEN_CHECK=$(($XML_TAG_OPEN_CHECK-$XML_TAG_CLOSE_CHECK))

       if [ "${XML_LINE:0:1}" == '<' ]; then CORRECTION=0; fi

       if [ "${XML_LINE:0:2}" == '<!' ]; then CORRECTION=0; fi

       if [ "${XML_LINE:0:2}" == '<!' ]; then COMMENT_PREFIX="|||"; fi

       if [ "${XML_LINE:0:1}" != '<' ]; then CORRECTION=0; fi

       if [ "${XML_LINE:0:1}" != '<' ]; then PREFIX="|||"; fi

       if [ "${XML_LINE:0:1}" != '<' ] && [ "${XML_LINE:${#XML_LINE}-1:1}" == '>' ]; then CORRECTION=2; fi

       if [ "${XML_LINE:0:1}" != '<' ] && [ "${XML_LINE:${#XML_LINE}-1:1}" == '>' ]; then PREFIX="||||||"; fi

       TAB_COUNT=$(($TAB_COUNT-$CORRECTION))

       if [ $XML_TAG_CLOSE_CHECK == 1 ]; then TAB_COUNT=$(($TAB_COUNT+$XML_TAG_OPEN_CHECK-$XML_TAG_CLOSE_CHECK-$CORRECTION)); fi

       if [ $TAB_COUNT == 0 ]; then echo $COMMENT_PREFIX$PREFIX""$XML_LINE | sed 's/|/\ /g' | sed '/<!--/s/\ \ \ </</'; fi

       if [ $TAB_COUNT == 1 ]; then echo $COMMENT_PREFIX$PREFIX"   "$XML_LINE | sed 's/|/\ /g' | sed '/<!--/s/\ \ \ </</'; fi

       if [ $TAB_COUNT == 2 ]; then echo $COMMENT_PREFIX$PREFIX"      "$XML_LINE | sed 's/|/\ /g' | sed '/<!--/s/\ \ \ </</'; fi

       if [ $TAB_COUNT == 3 ]; then echo $COMMENT_PREFIX$PREFIX"         "$XML_LINE | sed 's/|/\ /g' | sed '/<!--/s/\ \ \ </</'; fi

       if [ $TAB_COUNT == 4 ]; then echo $COMMENT_PREFIX$PREFIX"            "$XML_LINE | sed 's/|/\ /g' | sed '/<!--/s/\ \ \ </</'; fi

       if [ $TAB_COUNT == 5 ]; then echo $COMMENT_PREFIX$PREFIX"               "$XML_LINE | sed 's/|/\ /g' | sed '/<!--/s/\ \ \ </</'; fi

       if [ $TAB_COUNT == 6 ]; then echo $COMMENT_PREFIX$PREFIX"                  "$XML_LINE | sed 's/|/\ /g' | sed '/<!--/s/\ \ \ </</'; fi

       if [ $TAB_COUNT == 7 ]; then echo $COMMENT_PREFIX$PREFIX"                     "$XML_LINE | sed 's/|/\ /g' | sed '/<!--/s/\ \ \ </</'; fi

       if [ $TAB_COUNT == 8 ]; then echo $COMMENT_PREFIX$PREFIX"                        "$XML_LINE | sed 's/|/\ /g' | sed '/<!--/s/\ \ \ </</'; fi

       if [ $XML_TAG_OPEN_CHECK == 1 ]; then TAB_COUNT=$(($TAB_COUNT+$XML_TAG_OPEN_CHECK-$XML_TAG_CLOSE_CHECK)); fi

       PREFIX=""

       COMMENT_PREFIX=""

#      if [ "${XML_LINE:0:2}" == '<!' ]; then TAB_COUNT=$(($TAB_COUNT-1)); fi

    fi

done

