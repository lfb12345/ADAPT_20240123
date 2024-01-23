
PERSON_XML_FILE_NAME=$1

VERSION=`grep '<Version>' $PERSON_XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

RESOURCE_ID=`grep '<ResourceID>' $PERSON_XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

RELEASE_DATE=`grep '<ReleaseDate>' $PERSON_XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

PERSON_NAME=`grep '<PersonName>' $PERSON_XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

ORGANIZATION_NAME=`grep '<OrganizationName>' $PERSON_XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

ADDRESS=`grep '<Address>' $PERSON_XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

EMAIL=`grep '<Email>' $PERSON_XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

PHONE_NUMBER=`grep '<PhoneNumber>' $PERSON_XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

FAX_NUMBER=`grep '<PaxNumber>' $PERSON_XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

echo 'PERSON_XML_FILE_NAME	VERSION	RESOURCE_ID	RELEASE_DATE	PERSON_NAME	ORGANIZATION_NAME	ADDRESS	EMAIL	PHONE_NUMBER	FAX_NUMBER'

echo $PERSON_XML_FILE_NAME'	'$VERSION'	'$RESOURCE_ID'	'$RELEASE_DATE'	'$PERSON_NAME'	'$ORGANIZATION_NAME'	'$ADDRESS'	'$EMAIL'	'$PHONE_NUMBER'	'$FAX_NUMBER

