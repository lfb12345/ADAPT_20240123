
DATE=$1

DATA_PRODUCT_ID=$2

MASTERS_DIRECTORY=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_$DATE

MASTERS_TABLE_NAME=masters_curl_table_$DATE.txt

MASTER_MATCH_NUM=`grep -ic ^$DATA_PRODUCT_ID'_00000000_v01.cdf	' $MASTERS_TABLE_NAME`

if [ $MASTER_MATCH_NUM == 1 ]; then

   CURL_CDF_FILE_NAME=`grep -i ^$DATA_PRODUCT_ID'_00000000_v01.cdf	' $MASTERS_TABLE_NAME | awk 'BEGIN { FS="	" } ; { print $1 }'`

   MASTER_CDF_FILE_NAME=`echo $CURL_CDF_FILE_NAME | tr 'A-Z' 'a-z'`

   MASTER_METADATA_FILE_NAME=`echo $MASTER_CDF_FILE_NAME | sed 's/\.cdf$/.metadata/'`

   if [ ! -d $MASTERS_DIRECTORY ]; then mkdir $MASTERS_DIRECTORY; fi

   curl -sS https://spdf.gsfc.nasa.gov/pub/software/cdawlib/0MASTERS/$CURL_CDF_FILE_NAME >& $MASTERS_DIRECTORY/$MASTER_CDF_FILE_NAME

   /Applications/cdf/cdf37_0-dist/bin/cdfdump -dump metadata $MASTERS_DIRECTORY/$MASTER_CDF_FILE_NAME >& $MASTERS_DIRECTORY/$MASTER_METADATA_FILE_NAME

   STATUS=OOO

else

   STATUS=XXX

fi

echo $STATUS"	"$DATA_PRODUCT_ID

