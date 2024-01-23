
XML_FILE_NAME=$1

#

XML_FILE_LINE_NUM=`wc -l $XML_FILE_NAME | awk '{ print $1 }'`

RELEASE_DATE=`date '+%Y-%m-%d'`'T12:34:56.789'

#

PRODUCT_KEY=`grep '<ProductKey>' $XML_FILE_NAME | uniq | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

RESOURCE_ID=`grep '<ResourceID>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/^spase:\/\///'`

RESOURCE_NAME=`grep '<ResourceName>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/^spase:\/\///'`

DESCRIPTION_LINE_NUM=`grep -n ^'         <Description>' $XML_FILE_NAME | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

CITATION_LINE_NUM=`grep -n ^'Citation:\ ' $XML_FILE_NAME | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

CONTACT_LINE_NUM=`grep -n ^'         <Contact>'$ $XML_FILE_NAME | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

#

OUTPUT_XML_DIRECTORY_STEM=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/DELIVERY/PARKER_SOLAR_PROBE/XML_PSP_ISOIS_20210729

OUTPUT_XML_FILE_NAME=$OUTPUT_XML_DIRECTORY_STEM/$RESOURCE_ID.xml

OUTPUT_XML_DIRECTORY=`dirname $OUTPUT_XML_FILE_NAME`

mkdir -p $OUTPUT_XML_DIRECTORY

printf "Output XML File Name:\t%s\n" $OUTPUT_XML_FILE_NAME

#

PI_NAME=`grep '	'$PRODUCT_KEY'\ ' cdaweb_master_clean.tab | awk 'BEGIN { FS="	" } ; { print $13 }' | sed 's/\ \ *$//' | sed 's/\ /|/g'`

if [ $PI_NAME == 'S.|D.|Bale' ]; then PI_NAME='Bale, S. D.'; fi

if [ $PI_NAME == 'D.|J.|McComas' ]; then PI_NAME='McComas, D. J.'; fi

#f [ $PI_NAME == 'J.|C.|Kasper' ]; then PI_NAME='Kasper, J. C.'; fi

#

grep ^$PRODUCT_KEY'	' cdaweb_doi_inventory.tab &> psp_doi_hapi_conversion_$$.tab

RESOURCE_ID_STUB=`awk 'BEGIN { FS="	" } ; { print $2 }' psp_doi_hapi_conversion_$$.tab`

DOI=`awk 'BEGIN { FS="	" } ; { print $3 }' psp_doi_hapi_conversion_$$.tab`

PUBLICATION_DATE=`awk 'BEGIN { FS="	" } ; { print $4 }' psp_doi_hapi_conversion_$$.tab`

PUBLISHED_BY=`awk 'BEGIN { FS="	" } ; { print $5 }' psp_doi_hapi_conversion_$$.tab`

AUTHORS=`awk 'BEGIN { FS="	" } ; { print $6 }' psp_doi_hapi_conversion_$$.tab`

rm psp_doi_hapi_conversion_$$.tab

#

head -7 $XML_FILE_NAME | sed '/^<Spase\ /s/2_3_1/2_4_0/' | sed 's/^\ \ \ <Version>2\.3\.1<\/Version>$/   <Version>2.4.0<\/Version>/' | sed 's/^         <ReleaseDate>.*<\/ReleaseDate>$/         <ReleaseDate>2021-06-08T12:34:56.789<\/ReleaseDate>/' | sed 's/^<Spase xmlns="http:\/\/www.spase-group.org\/data\/schema" xmlns:xsi="http:\/\/www.w3.org\/2001\/XMLSchema-instance" xsi:schemaLocation="http:\/\/www.spase-group.org\/data\/schema http:\/\/www.spase-group.org\/data\/schema\/spase-2_4_0.xsd">/<Spase xmlns="http:\/\/www.spase-group.org\/data\/schema" xmlns:xsi="http:\/\/www.w3.org\/2001\/XMLSchema-instance" xsi:schemaLocation="http:\/\/www.spase-group.org\/data\/schema https:\/\/www.spase-group.org\/data\/schema\/spase-2_4_0.xsd">/' &> $OUTPUT_XML_FILE_NAME

RELEASE_DATE_OLD=2021-07-02T12:34:56.789

#

echo '         <DOI>'$DOI'</DOI>' >> $OUTPUT_XML_FILE_NAME

#

echo '         <ReleaseDate>'$RELEASE_DATE'</ReleaseDate>' >> $OUTPUT_XML_FILE_NAME

echo '         <RevisionHistory>' >> $OUTPUT_XML_FILE_NAME

echo '            <RevisionEvent>' >> $OUTPUT_XML_FILE_NAME

echo '               <ReleaseDate>'$RELEASE_DATE_OLD'</ReleaseDate>' >> $OUTPUT_XML_FILE_NAME

echo '               <Note>Added/Updated SPASE Parameter level metadata for revised PSP data products as needed, Applied quality control for DOI usage, and Added HAPI Access URL to the ADAPT pipeline for SPASE Numerical Data generation, LFB</Note>' >> $OUTPUT_XML_FILE_NAME

echo '            </RevisionEvent>' >> $OUTPUT_XML_FILE_NAME

echo '            <RevisionEvent>' >> $OUTPUT_XML_FILE_NAME

echo '               <ReleaseDate>'$RELEASE_DATE'</ReleaseDate>' >> $OUTPUT_XML_FILE_NAME

echo '               <Note>XXX, LFB</Note>' >> $OUTPUT_XML_FILE_NAME

echo '            </RevisionEvent>' >> $OUTPUT_XML_FILE_NAME

echo '         </RevisionHistory>' >> $OUTPUT_XML_FILE_NAME

#

HEAD_NUM=$((CITATION_LINE_NUM-1))

TAIL_NUM=$((CITATION_LINE_NUM-DESCRIPTION_LINE_NUM))

head -$HEAD_NUM $XML_FILE_NAME | tail -$TAIL_NUM >> $OUTPUT_XML_FILE_NAME

#

echo 'Citation: '$PI_NAME' (2020). '$RESOURCE_NAME' [Data set]. NASA Space Physics Data Facility. '$DOI'</Description>' >> $OUTPUT_XML_FILE_NAME

#

grep ^'         <Acknowledgement>' $XML_FILE_NAME | head -1 >> $OUTPUT_XML_FILE_NAME

#

echo '         <PublicationInfo>' >> $OUTPUT_XML_FILE_NAME

echo '            <Authors>'$AUTHORS'</Authors>' >> $OUTPUT_XML_FILE_NAME

echo '            <PublicationDate>'$PUBLICATION_DATE'</PublicationDate>' >> $OUTPUT_XML_FILE_NAME

echo '            <PublishedBy>'$PUBLISHED_BY'</PublishedBy>' >> $OUTPUT_XML_FILE_NAME

echo '         </PublicationInfo>' >> $OUTPUT_XML_FILE_NAME

#

TAIL_NUM=$(($XML_FILE_LINE_NUM-$CONTACT_LINE_NUM+1))

tail -$TAIL_NUM $XML_FILE_NAME | sed 's/^         <Caveats>Warning: CDAWeb plots not supported$/         <Caveats>* Warning: CDAWeb plots not supported/' | sed '/^         <Description>\* .*\.$/s/\*\ //' >> $OUTPUT_XML_FILE_NAME

