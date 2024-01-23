
DIRECTORY=$1

START_TIME=`date`

DATE=`date "+%Y%m%d"`

DIRECTORY=$DIRECTORY/CDAWEB_ID_TO_SPASE_$DATE

if [ ! -d $DIRECTORY/WORK ]; then mkdir -p $DIRECTORY/WORK; fi

cd $DIRECTORY

FILE_NAME_HTML=$DIRECTORY/cdaweb_id_to_spase_html_$DATE.html

FILE_NAME_XQL=$DIRECTORY/cdaweb_id_to_spase_xql_$DATE.html

FILE_NAME_TAB_HTML=$DIRECTORY/cdaweb_id_to_spase_html_$DATE.tab

FILE_NAME_TAB_XQL=$DIRECTORY/cdaweb_id_to_spase_xql_$DATE.tab

curl -sS https://heliophysicsdata.gsfc.nasa.gov/queries/CDAWeb_SPASE.html >& $FILE_NAME_HTML

curl -sS https://heliophysicsdata.gsfc.nasa.gov/queries/CDAWeb_SPASE.xql >& $FILE_NAME_XQL

cat $FILE_NAME_HTML | sed '/<a href="https:\/\/cdaweb.gsfc.nasa.gov\/misc\/Note/s//\n<a href="https:\/\/cdaweb.gsfc.nasa.gov\/misc\/Note/g' | sed 's/<\/td><\/tr>/\n<\/td><\/tr>/' | awk '{ printf("%s\n",$0) }' | grep ^'<a href="https://cdaweb.gsfc.nasa.gov/misc/Note' | awk 'BEGIN { FS="[<>]" } ; { print $3"	"$11"	"$17"	"$23 }' | sed 's/	spase:\/\//	/' | sed 's/\ 	/	/g' >& $FILE_NAME_TAB_HTML

cat $FILE_NAME_XQL | sed '/<a href="https:\/\/cdaweb.gsfc.nasa.gov\/misc\/Note/s//\n<a href="https:\/\/cdaweb.gsfc.nasa.gov\/misc\/Note/g' | sed 's/<\/td><\/tr>/\n<\/td><\/tr>/' | awk '{ printf("%s\n",$0) }' | grep ^'<a href="https://cdaweb.gsfc.nasa.gov/misc/Note' | awk 'BEGIN { FS="[<>]" } ; { print $3"	"$11"	"$17"	"$23 }' | sed 's/	spase:\/\//	/' | sed 's/\ 	/	/g' >& $FILE_NAME_TAB_XQL

FILE_NAME_CDAWEB_ID_TO_SPASE_PRODUCT_KEY_LIST=$DIRECTORY/cdaweb_id_to_spase_product_key_list_$DATE.tab

if [ -e $FILE_NAME_CDAWEB_ID_TO_SPASE_PRODUCT_KEY_LIST ]; then rm $FILE_NAME_CDAWEB_ID_TO_SPASE_PRODUCT_KEY_LIST; fi

REGISTRY_LIST=`awk 'BEGIN { FS="	" } ; { print $2 }' $FILE_NAME_TAB_HTML $FILE_NAME_TAB_XQL | awk 'BEGIN { FS="/" } ; { print $1 }' | grep -v ^''$ | sort | uniq`

for REGISTRY in $REGISTRY_LIST

do

    git clone -q git@github.com:hpde/$REGISTRY

    grep -r '<ProductKey>' $REGISTRY | grep '\.xml:' | sed 's/\.xml:\ *//' | awk 'BEGIN { FS="[<>]" } ; { print $3"	"$1 }' | sed 's/@[0-9][0-9]*//' | sort | uniq >> $FILE_NAME_CDAWEB_ID_TO_SPASE_PRODUCT_KEY_LIST

done

FILE_NAME_CDAWEB_ID_TO_SPASE_NOTES=$DIRECTORY/cdaweb_id_to_spase_notes_$DATE.html

curl -sS https://cdaweb.gsfc.nasa.gov/misc/Notes.html >& $FILE_NAME_CDAWEB_ID_TO_SPASE_NOTES

FIRST_LINE_NUM=`grep -n '<dd><a href="' $FILE_NAME_CDAWEB_ID_TO_SPASE_NOTES | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

HEAD_NUM=`grep -n '<dd><a href="' $FILE_NAME_CDAWEB_ID_TO_SPASE_NOTES | tail -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

TAIL_NUM=$((HEAD_NUM-FIRST_LINE_NUM+1))

head -$HEAD_NUM $FILE_NAME_CDAWEB_ID_TO_SPASE_NOTES | tail -$TAIL_NUM >& $DIRECTORY/WORK/cdaweb_id_to_spase_$$.txt

spase_xml_flatten.com $DIRECTORY/WORK/cdaweb_id_to_spase_$$.txt

grep -v ^'<dd>' $DIRECTORY/WORK/cdaweb_id_to_spase_$$.txt | sed 's/<\/dd>$//' | sed 's/:\ //' | awk 'BEGIN { FS="[<>]" } ; { print $3"	"$5 }' | grep -v _GIFWALK'	' | grep -v _R0_ | grep -v '_[12][09][029][289]' >& $FILE_NAME_CDAWEB_ID_TO_SPASE_NOTES

CDAWEB_ID_LIST_NUM=`wc -l $FILE_NAME_CDAWEB_ID_TO_SPASE_NOTES | awk '{ print $1 }'`

CDAWEB_ID_LIST=`awk 'BEGIN { FS="	" } ; { print $1 }' $FILE_NAME_CDAWEB_ID_TO_SPASE_NOTES | tr 'a-z' 'A-Z'`

CDAWEB_ID_LIST_SPASE_RESOURCE_ID_NUM=0

CDAWEB_ID_LIST_PARAMETER_NUM=0

CDAWEB_ID_LIST_DOI_NUM=0

for CDAWEB_ID in $CDAWEB_ID_LIST

do

    SPASE_RESOURCE_ID=`grep ^$CDAWEB_ID'	' $FILE_NAME_CDAWEB_ID_TO_SPASE_PRODUCT_KEY_LIST | awk 'BEGIN { FS="	" } ; { print $2 }'`

    if [ $SPASE_RESOURCE_ID ]; then

       FILE_NAME_XML=$DIRECTORY/$SPASE_RESOURCE_ID.xml

       CDAWEB_ID_LIST_SPASE_RESOURCE_ID_NUM=$((CDAWEB_ID_LIST_SPASE_RESOURCE_ID_NUM+1))

       SPASE_RESOURCE_ID_NUM=1

       PARAMETER_NUM=`grep -c '<Parameter>' $FILE_NAME_XML`

       if [ $PARAMETER_NUM -gt 0 ]; then

          PARAMETER_STATUS=yes

          PARAMETER_EXIST_NUM=1

          CDAWEB_ID_LIST_PARAMETER_NUM=$((CDAWEB_ID_LIST_PARAMETER_NUM+1))

       else

          PARAMETER_STATUS=no

          PARAMETER_EXIST_NUM=0

       fi

       DOI=`grep '<DOI>' $FILE_NAME_XML | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

       if [ $DOI ]; then

          DOI_NUM=1

          CDAWEB_ID_LIST_DOI_NUM=$((CDAWEB_ID_LIST_DOI_NUM+1))

       else

          DOI_NUM=0

       fi

    else

       SPASE_RESOURCE_ID=''

       SPASE_RESOURCE_ID_NUM=0

       PARAMETER_STATUS=''

       PARAMETER_EXIST_NUM=0

       DOI=''

       DOI_NUM=0

    fi

    printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\n" $SPASE_RESOURCE_ID_NUM $PARAMETER_EXIST_NUM $DOI_NUM $CDAWEB_ID "$SPASE_RESOURCE_ID" $PARAMETER_STATUS $DOI >> $DIRECTORY/WORK/cdaweb_id_to_spase_$$.tab

done

FILE_NAME_CDAWEB_ID_TO_SPASE_REPORT=$DIRECTORY/cdaweb_id_to_spase_report_$DATE.txt

printf "\n%s\n\n%s\t%s\t%s\t%s\n\n" "$START_TIME" $CDAWEB_ID_LIST_NUM $CDAWEB_ID_LIST_SPASE_RESOURCE_ID_NUM $CDAWEB_ID_LIST_PARAMETER_NUM $CDAWEB_ID_LIST_DOI_NUM >& $FILE_NAME_CDAWEB_ID_TO_SPASE_REPORT

cat $DIRECTORY/WORK/cdaweb_id_to_spase_$$.tab >> $FILE_NAME_CDAWEB_ID_TO_SPASE_REPORT

echo >> $FILE_NAME_CDAWEB_ID_TO_SPASE_REPORT

date >> $FILE_NAME_CDAWEB_ID_TO_SPASE_REPORT

echo >> $FILE_NAME_CDAWEB_ID_TO_SPASE_REPORT

rm -fR $DIRECTORY/WORK

