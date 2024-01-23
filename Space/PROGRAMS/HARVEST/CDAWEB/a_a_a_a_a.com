

CDAWEB_ID_LIST=`cat MASTERS_20230720/CURL/masters_cdf_file_list_20230720.txt`

for CDAWEB_ID in $CDAWEB_ID_LIST

do

   CDAWEB_ID_LOWER=`echo $CDAWEB_ID | tr 'A-Z' 'a-z'`

   CDAWEB_ID_UPPER=`echo $CDAWEB_ID | tr 'a-z' 'A-Z'`

   CDAWEB_ID_NUM=`grep -c '	'$CDAWEB_ID_UPPER'\ *' cdaweb_master_clean.tab`

   if [ $CDAWEB_ID_NUM -eq 1 ]; then

      grep '	'$CDAWEB_ID_LOWER'	' spdf_data_product_20221207.tab | awk 'BEGIN { FS="	" } ; { print "1	cdaweb_harvest_wrapper.com "$3" "tolower($4)" /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20230720" }'

   else

      echo $CDAWEB_ID_NUM'	cdaweb_harvest_wrapper.com '$CDAWEB_ID_LOWER' XXXXXXXX /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20230720'

   fi

done

