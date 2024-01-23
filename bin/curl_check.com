
URL=$1

PROTOCOL=`echo $URL | tr 'a-z' 'A-Z' | sed 's/S*:.*$//'`

curl -kIsS "$URL" &> /Users/astropooch/bin/WORK/curl_check_$$.txt 2> /Users/astropooch/bin/WORK/curl_check_error_$$.txt

ERROR=`head -1 /Users/astropooch/bin/WORK/curl_check_error_$$.txt | sed 's///' | awk 'BEGIN { FS="[()]" } ; { print "CURL Error: "$2 }'`

if [ $PROTOCOL == HTTP ]; then

   if [ ! "$ERROR" ]; then

      CURL_STATUS=`head -1 /Users/astropooch/bin/WORK/curl_check_$$.txt | sed 's///' | sed '/^HTTP\/1.1 200 200$/s/200$/OK/'`

      if [ "$CURL_STATUS" == 'HTTP/1.1 200 OK' ]; then

         STATUS=OOO

      else

         URL_ROOT=`echo $URL | awk 'BEGIN { FS="/" } ; { print $3 }'`

         if [ $URL_ROOT == doi.org ] && [ "$CURL_STATUS" == "HTTP/1.1 302 Found" ]; then

            STATUS=DOI

         else

            STATUS=XXX

         fi

      fi

   else

      CURL_STATUS="$ERROR"

      STATUS=BAD

   fi

else

   CURL_STATUS='FTP Server not verified'

   STATUS=FTP

fi

rm /Users/astropooch/bin/WORK/curl_check_$$.txt /Users/astropooch/bin/WORK/curl_check_error_$$.txt

printf "%s\t%s\t%s\n" $STATUS "$CURL_STATUS" $URL

