
DATA_PRODUCT_ID=$1

DATE=$2

if [ ! $DATE ]; then DATE=`date "+%Y%m%d"`; fi

DIRECTORY=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_$DATE

DATA_PRODUCT_ID_LOWER=`echo $DATA_PRODUCT_ID | tr 'A-Z' 'a-z'`

DATA_PRODUCT_ID_UPPER=`echo $DATA_PRODUCT_ID | tr 'a-z' 'A-Z'`

CDF_FILE_NAME=$DATA_PRODUCT_ID_LOWER'_00000000_v01.cdf'

if [ $DATA_PRODUCT_ID_LOWER == voyager1_48sec_magneticfield_nearterminationshock ]; then CDF_FILE_NAME=$DATA_PRODUCT_ID_LOWER'_v01.cdf'; fi

if [ $DATA_PRODUCT_ID_LOWER == voyager2_48sec_magneticfield_nearterminationshock ]; then CDF_FILE_NAME=$DATA_PRODUCT_ID_LOWER'_v01.cdf'; fi

if [ -e $DIRECTORY/MASTER_FILES/$CDF_FILE_NAME ]; then MASTER_FILES_HASH=`openssl dgst -sha1 $DIRECTORY/MASTER_FILES/$CDF_FILE_NAME | awk '{ print $2 }'`; fi

if [ -e $DIRECTORY/MASTER_TAR/$CDF_FILE_NAME ]; then MASTER_TAR_HASH=`openssl dgst -sha1 $DIRECTORY/MASTER_TAR/$CDF_FILE_NAME | awk '{ print $2 }'`; fi

if [[ -e $DIRECTORY/MASTER_FILES/$CDF_FILE_NAME && -e $DIRECTORY/MASTER_TAR/$CDF_FILE_NAME ]]; then

   if [ $MASTER_FILES_HASH == $MASTER_TAR_HASH ]; then

      HASH_MATCH_STATUS=OOO

   else

      HASH_MATCH_STATUS=XXX

   fi

else

   HASH_MATCH_STATUS='---'

fi

echo $DATA_PRODUCT_ID"	"$HASH_MATCH_STATUS

