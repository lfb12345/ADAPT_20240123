
PRODUCT_KEY_LOWER=$1

DATE_STYLE=$2

XML_FILE_NAME=$3

PRODUCT_KEY_LOWER_TEST=`grep '<ProductKey>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | tr 'A-Z' 'a-z'`

XML_DIRECTORY=`dirname $XML_FILE_NAME`

CURL_TEXT_OUTPUT_FILE_NAME=$XML_DIRECTORY/curl_test_$PRODUCT_KEY_LOWER'_'$DATE_STYLE.txt

URL_LIST=`grep '<URL>' $XML_FILE_NAME | grep -v ftps:// | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/&amp;/\&/g'`

for URL in $URL_LIST

do

    CURL_STATUS=`curl -sSI "$URL" | sed 's///' | head -1`

    printf "CURL_TEST\t%s\t%s\t%s\t%s\n" "$CURL_STATUS" $PRODUCT_KEY_LOWER $DATE_STYLE "$URL"

done

