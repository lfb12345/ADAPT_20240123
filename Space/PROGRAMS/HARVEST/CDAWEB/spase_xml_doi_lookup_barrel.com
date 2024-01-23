
XML_DIRECTORY=$1

DATA_PRODUCT_ID=$2

DATA_PRODUCT_ID_LOWER=`echo $DATA_PRODUCT_ID | tr 'A-Z' 'a-z'`

DATA_PRODUCT_ID_UPPER=`echo $DATA_PRODUCT_ID | tr 'a-z' 'A-Z'`

XML_FILE_NAME=`grep -r '<ProductKey>'$DATA_PRODUCT_ID_UPPER'</ProductKey>' /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/$XML_DIRECTORY | awk 'BEGIN { FS=":" } ; { print $1 }' | uniq`

if [ $XML_FILE_NAME ]; then

   SPASE_RESOURCE_ID=`grep '<ResourceID>.*</ResourceID>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/^spase:\/\///'`

   RESOURCE_NAME=`grep '<ResourceName>.*</ResourceName>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   if [ "$RESOURCE_NAME" == '' ]; then RESOURCE_NAME=XXX; fi

   DOI=`grep '<DOI>.*</DOI>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   if [ "$DOI" == '' ]; then DOI=XXX; fi

   AUTHORS=`grep '<Authors>.*</Authors>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   if [ "$AUTHORS" == '' ]; then AUTHORS=XXX; fi

   PUBLICATION_DATE=`grep ^'\ \ \ \ \ \ \ \ \ \ \ \ <PublicationDate>.*</PublicationDate>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   DATE_MATCH_NUM=`echo $PUBLICATION_DATE | grep -c ^'[12][09][0-9][0-9]'$`

   if [ "$PUBLICATION_DATE" == '' ]; then

      PUBLICATION_DATE=9999-01-01T00:00:00

      PUBLICATION_YEAR=9999

   else

      if [ $DATE_MATCH_NUM -eq 1 ]; then

         PUBLICATION_YEAR=$PUBLICATION_DATE

         PUBLICATION_DATE=$PUBLICATION_DATE'-01-01T00:00:00'

      else

         PUBLICATION_YEAR=`grep ^'\ \ \ \ \ \ \ \ \ \ \ \ <PublicationDate>.*</PublicationDate>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/-[01][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]$//'`

      fi

   fi

   PUBLISHED_BY=`grep ^'\ \ \ \ \ \ \ \ \ \ \ \ <PublishedBy>.*</PublishedBy>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   if [ "$PUBLISHED_BY" == '' ]; then PUBLISHED_BY=XXX; fi

   AUTHORS='Millan, Robyn M.; Woodger, Leslie A.; McCarthy, Michael P.; Sample, John G.; Smith, David M.; and Warren Z. Rexroad'

   PUBLISHED_BY='NASA Space Physics Data Facility'

   CITATION=$AUTHORS' ('$PUBLICATION_YEAR'). '$RESOURCE_NAME' [Data set]. '$PUBLISHED_BY'.'

   DESCRIPTION=`grep ^'\ \ \ \ \ \ \ \ \ <Description>' $XML_FILE_NAME | head -1 | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   PUBLISHED_BY_PIPE=`echo $PUBLISHED_BY | sed 's/\ /|/g'`

   RESOURCE_NAME_PIPE=`echo $RESOURCE_NAME | sed 's/\ /|/g'`

   AUTHORS_PIPE=`echo $AUTHORS | sed 's/\ /|/g'`

   DESCRIPTION_PIPE=`echo $DESCRIPTION | sed 's/\ /|/g'`

   FORMAT=`grep ^'\ \ \ \ \ \ \ \ \ <Format>.*</Format>'$ $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   PROCESSING_LEVEL=`grep ^'\ \ \ \ \ \ <ProcessingLevel>.*</ProcessingLevel>'$ $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   MEASUREMENT_TYPE_LIST=`grep ^'\ \ \ \ \ \ <MeasurementType>.*</MeasurementType>'$ $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   MEASUREMENT_TYPE_LIST_NUM=`grep -c ^'\ \ \ \ \ \ <MeasurementType>.*</MeasurementType>'$ $XML_FILE_NAME`

   MEASUREMENT_TYPE_000=`grep -c ^'\ \ \ \ \ \ <MeasurementType>.*</MeasurementType>'$ $XML_FILE_NAME | head -1 | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   DOI_DIRECTORY=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/DOI_20220414

   JSON_000_DIRECTORY=$DOI_DIRECTORY/JSON_000

   JSON_001_DIRECTORY=$DOI_DIRECTORY/JSON_001

   if [ ! -d $JSON_000_DIRECTORY ]; then mkdir -p $JSON_000_DIRECTORY; fi

   if [ ! -d $JSON_001_DIRECTORY ]; then mkdir -p $JSON_001_DIRECTORY; fi

   JSON_000_FILE_NAME=$JSON_000_DIRECTORY/datacite_test_$DATA_PRODUCT_ID_LOWER.json

   JSON_001_FILE_NAME=$JSON_001_DIRECTORY/datacite_test_$DATA_PRODUCT_ID_LOWER.json

   if [ $MEASUREMENT_TYPE_LIST_NUM -eq 1 ]; then

      MEASUREMENT_TYPE_000=`grep ^'\ \ \ \ \ \ <MeasurementType>.*</MeasurementType>'$ $XML_FILE_NAME | head -1 | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

      sed 's?SPASE_RESOURCE_ID?'$SPASE_RESOURCE_ID'?' $DOI_DIRECTORY/datacite_draft_doi_barrel_template_001_subject_001.json | sed 's/DOI/'$DOI'/' | sed 's/PUBLICATION_YEAR/'$PUBLICATION_YEAR'/' | sed 's/PUBLISHED_BY/'$PUBLISHED_BY_PIPE'/' | sed 's?RESOURCE_NAME?'$RESOURCE_NAME_PIPE'?' | sed 's?DESCRIPTION?'$DESCRIPTION_PIPE'?' | sed 's/FORMAT/'$FORMAT'/' | sed 's/PROCESSING_LEVEL/'$PROCESSING_LEVEL'/' | sed 's/MEASUREMENT_TYPE_000/'$MEASUREMENT_TYPE_000'/' | sed 's/|/ /g' &> $JSON_000_FILE_NAME

   fi

   if [ $MEASUREMENT_TYPE_LIST_NUM -eq 2 ]; then

      MEASUREMENT_TYPE_000=`grep ^'\ \ \ \ \ \ <MeasurementType>.*</MeasurementType>'$ $XML_FILE_NAME | head -1 | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

      MEASUREMENT_TYPE_001=`grep ^'\ \ \ \ \ \ <MeasurementType>.*</MeasurementType>'$ $XML_FILE_NAME | head -2 | tail -1 | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

      sed 's?SPASE_RESOURCE_ID?'$SPASE_RESOURCE_ID'?' $DOI_DIRECTORY/datacite_draft_doi_barrel_template_001_subject_002.json | sed 's/DOI/'$DOI'/' | sed 's/PUBLICATION_YEAR/'$PUBLICATION_YEAR'/' | sed 's/PUBLISHED_BY/'$PUBLISHED_BY_PIPE'/' | sed 's?RESOURCE_NAME?'$RESOURCE_NAME_PIPE'?' | sed 's?DESCRIPTION?'$DESCRIPTION_PIPE'?' | sed 's/FORMAT/'$FORMAT'/' | sed 's/PROCESSING_LEVEL/'$PROCESSING_LEVEL'/' | sed 's/MEASUREMENT_TYPE_000/'$MEASUREMENT_TYPE_000'/' | sed 's/MEASUREMENT_TYPE_001/'$MEASUREMENT_TYPE_001'/' | sed 's/|/ /g' &> $JSON_000_FILE_NAME

   fi

   if [ $MEASUREMENT_TYPE_LIST_NUM -eq 3 ]; then

      MEASUREMENT_TYPE_000=`grep ^'\ \ \ \ \ \ <MeasurementType>.*</MeasurementType>'$ $XML_FILE_NAME | head -1 | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

      MEASUREMENT_TYPE_001=`grep ^'\ \ \ \ \ \ <MeasurementType>.*</MeasurementType>'$ $XML_FILE_NAME | head -2 | tail -1 | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

      MEASUREMENT_TYPE_002=`grep ^'\ \ \ \ \ \ <MeasurementType>.*</MeasurementType>'$ $XML_FILE_NAME | head -3 | tail -1 | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

      sed 's?SPASE_RESOURCE_ID?'$SPASE_RESOURCE_ID'?' $DOI_DIRECTORY/datacite_draft_doi_barrel_template_001_subject_003.json | sed 's/DOI/'$DOI'/' | sed 's/PUBLICATION_YEAR/'$PUBLICATION_YEAR'/' | sed 's/PUBLISHED_BY/'$PUBLISHED_BY_PIPE'/' | sed 's?RESOURCE_NAME?'$RESOURCE_NAME_PIPE'?' | sed 's?DESCRIPTION?'$DESCRIPTION_PIPE'?' | sed 's/FORMAT/'$FORMAT'/' | sed 's/PROCESSING_LEVEL/'$PROCESSING_LEVEL'/' | sed 's/MEASUREMENT_TYPE_000/'$MEASUREMENT_TYPE_000'/' | sed 's/MEASUREMENT_TYPE_001/'$MEASUREMENT_TYPE_001'/' | sed 's/MEASUREMENT_TYPE_002/'$MEASUREMENT_TYPE_002'/' | sed 's/|/ /g' &> $JSON_000_FILE_NAME

   fi

   echo curl -sSX POST -H \"Content-Type: application/vnd.api+json\" -H \'Authorization: Basic dGVzdG9yZy5oZWxpb3BoeTo2eWFyZCRUQUNLMjc\' -d @$JSON_000_FILE_NAME https://api.test.datacite.org/dois >> $DOI_DIRECTORY/datacite_draft_doi_barrel_all.com

   chmod +x $DOI_DIRECTORY/datacite_draft_doi_barrel_all.com

   curl -sSX POST -H "Content-Type: application/vnd.api+json" -H 'Authorization: Basic dGVzdG9yZy5oZWxpb3BoeTo2eWFyZCRUQUNLMjc' -d @$JSON_000_FILE_NAME https://api.test.datacite.org/dois >& $JSON_001_FILE_NAME

   PREFIX_TEST=10.82168

   DOI=`awk '{ print $0 }' RS='"' $JSON_001_FILE_NAME | grep ^$PREFIX_TEST'/[a-z0-9][a-z0-9][a-z0-9][a-z0-9]-[a-z0-9][a-z0-9][a-z0-9][a-z0-9]'$ | uniq`

   echo $DATA_PRODUCT_ID'	'$SPASE_RESOURCE_ID'	'$DOI'	'$PUBLICATION_DATE'	'$PUBLISHED_BY'	'$AUTHORS'	'$RESOURCE_NAME'	'$CITATION'	'$DESCRIPTION'	'$FORMAT'	'$MEASUREMENT_TYPE_LIST'	'$PROCESSING_LEVEL

   XML_COLLATION_FILE_NAME=$DOI_DIRECTORY/$SPASE_RESOURCE_ID.xml

   XML_COLLATION_DIRECTORY=`dirname $XML_COLLATION_FILE_NAME`

   if [ ! -d $XML_COLLATION_DIRECTORY ]; then mkdir -p $XML_COLLATION_DIRECTORY; fi

   sed 's?<DOI>XXX</DOI>?<DOI>https://doi.org/'$DOI'</DOI>?' $XML_FILE_NAME | sed 's/^\ \ \ \ \ \ \ \ \ \ \ \ <PublicationDate>.*<\/PublicationDate>$/\ \ \ \ \ \ \ \ \ \ \ \ <PublicationDate>'$PUBLICATION_DATE'<\/PublicationDate>/' >& $XML_COLLATION_FILE_NAME

   VERSION=`grep ^'\ \ \ <Version>' $XML_COLLATION_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/\./_/g'`

   echo /Users/astropooch/bin/vxo_validation_check.com $VERSION $XML_COLLATION_FILE_NAME >> $DOI_DIRECTORY/vxo_validation_check_barrel_all.com

   chmod +x $DOI_DIRECTORY/vxo_validation_check_barrel_all.com

else

   echo $DATA_PRODUCT_ID'								'

fi

