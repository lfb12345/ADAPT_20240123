
HOME_DIRECTORY=$1

COLLATION_DIRECTORY=$2

PERSON_TEMPLATE_TAB_FILE_NAME=$3

VERSION=$4

PERSON_ID=$5

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

VERSION_DASH=`echo $VERSION | sed 's/\./-/g'`

VERSION_UNDERSCORE=`echo $VERSION | sed 's/\./_/g'`

RELEASE_DATE=`date "+%Y-%m-%d"`'T12:34:56.789'

PERSON_NAME=`grep ^$PERSON_ID'	' $HOME_DIRECTORY/$PERSON_TEMPLATE_TAB_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $2 }'`

ORGANIZATION_NAME=`grep ^$PERSON_ID'	' $HOME_DIRECTORY/$PERSON_TEMPLATE_TAB_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $3 }'`

ADDRESS=`grep ^$PERSON_ID'	' $HOME_DIRECTORY/$PERSON_TEMPLATE_TAB_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $4 }'`

EMAIL=`grep ^$PERSON_ID'	' $HOME_DIRECTORY/$PERSON_TEMPLATE_TAB_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $5 }'`

PHONE_NUMBER=`grep ^$PERSON_ID'	' $HOME_DIRECTORY/$PERSON_TEMPLATE_TAB_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $6 }'`

FAX_NUMBER=`grep ^$PERSON_ID'	' $HOME_DIRECTORY/$PERSON_TEMPLATE_TAB_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $7 }'`

ORC_IDENTIFIER=`grep ^$PERSON_ID'	' $HOME_DIRECTORY/$PERSON_TEMPLATE_TAB_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $8 }'`

NOTE=`grep ^$PERSON_ID'	' $HOME_DIRECTORY/$PERSON_TEMPLATE_TAB_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $9 }'`

EXTENSION=`grep ^$PERSON_ID'	' $HOME_DIRECTORY/$PERSON_TEMPLATE_TAB_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $10 }'`

cat /Users/astropooch/bin/person_template.xml | sed "s/VERSION_DASH/""$VERSION_DASH""/" | sed "s/VERSION/""$VERSION""/" | sed "s/PERSON_ID/""$PERSON_ID""/" | sed "s/RELEASE_DATE/""$RELEASE_DATE""/" | sed "s/PERSON_NAME/""$PERSON_NAME""/" | sed "s/ORGANIZATION_NAME/""$ORGANIZATION_NAME""/" | sed "s/ADDRESS/""$ADDRESS""/" | sed "s/EMAIL/""$EMAIL""/" | sed "s/PHONE_NUMBER/""$PHONE_NUMBER""/" | sed "s/FAX_NUMBER/""$FAX_NUMBER""/" | sed "s/ORC_IDENTIFIER/""$ORC_IDENTIFIER""/" | sed "s/NOTE/""$NOTE""/" | sed "s/EXTENSION/""$EXTENSION""/" | grep -v "><" > person_template_$$.xml

XML_FILE_NAME=$HOME_DIRECTORY/$COLLATION_DIRECTORY/`grep 'ResourceID' person_template_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/^spase:\/\///'| sed 's/$/\.xml/'`

XML_DIRECTORY_NAME=`dirname $XML_FILE_NAME`

mkdir -p $XML_DIRECTORY_NAME

mv person_template_$$.xml $XML_FILE_NAME

printf "%s\n\n%s\n\n%s\n\n" $DASHES $XML_FILE_NAME $DASHES

cat $XML_FILE_NAME

echo

vxo_validation_check.com $VERSION_UNDERSCORE $XML_FILE_NAME

#
#     /Users/astropooch/bin/person_template.xml
#     -----------------------------------------
#
#     <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
#     <Spase xmlns="http://www.spase-group.org/data/schema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.spase-group.org/data/schema http://www.spase-group.org/data/schema/spase-VERSION_DASH.xsd">
#        <Version>VERSION</Version>
#        <Person>
#           <ResourceID>spase://SMWG/Person/PERSON_ID</ResourceID>
#           <ReleaseDate>RELEASE_DATE</ReleaseDate>
#           <PersonName>PERSON_NAME</PersonName>
#           <OrganizationName>ORGANIZATION_NAME</OrganizationName>
#           <Address>ADDRESS</Address>
#           <Email>EMAIL</Email>
#           <PhoneNumber>PHONE_NUMBER</PhoneNumber>
#           <FaxNumber>FAX_NUMBER</FaxNumber>
#           <ORCIdentifier>ORC_IDENTIFIER</ORCIdentifier>
#           <Note>NOTE</Note>
#           <Extension>EXTENSION</Extension>
#        </Person>
#     </Spase>
#

