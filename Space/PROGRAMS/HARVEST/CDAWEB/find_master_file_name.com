
#
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#

DATA_PRODUCT_ID=$1

DATE_STYLE=$2

MASTER_DIRECTORY=$3

#
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#

DATE_STYLE_UPPER=`echo $DATE_STYLE | tr 'a-z' 'A-Z'`

case $DATE_STYLE_UPPER in

     YYYYMMDD ) PATTERN=$DATA_PRODUCT_ID"_[0-2][09][0-9][0-9][01][0-9][0-3][0-9]_v[0-9.-]*";;

     YYYYMMDD_NO_VERSION ) PATTERN=$DATA_PRODUCT_ID"_[0-2]0[01][0-9][01][0-9][0-3][0-9]";;

     YYYYMMDD_RBSP ) PATTERN=$DATA_PRODUCT_ID"_[0-2]0[01][0-9][01][0-9][0-3][0-9]_v[0-9]*\.*[0-9]*\.*[0-9]*-*[0-9]*";;

     YYYYMMDD_ULYSSES ) PATTERN="[0-2][09][09][0-9][01][0-9][0-3][0-9]";;

     YYYYMMDDHH ) PATTERN=$DATA_PRODUCT_ID"_[0-2][09][0-9][0-9][01][0-9][0-3][0-9][0-2][0-9]_v[0-9][0-9]";;

     YYYYMMDDHH_RBSP ) PATTERN=$DATA_PRODUCT_ID"_[0-2][09][0-9][0-9][01][0-9][0-3][0-9]t[0-2][0-9]_v[1-9]*\.*[0-9]*\.*[0-9]*-*[0-9]*";;

     YYYYMMDDHHMM ) PATTERN=$DATA_PRODUCT_ID"_[0-2][09][0-9][0-9][01][0-9][0-3][0-9][0-2][0-9][0-5][0-9]_v[0-9][0-9]";;

     YYYYMMDDHHMMSS ) PATTERN=$DATA_PRODUCT_ID"_[0-2][09][0-9][0-9][01][0-9][0-3][0-9][0-2][0-9][0-5][0-9][0-5][0-9]_v[0-9][0-9]";;

     YYYYMMDDHHMMSS_FAST ) PATTERN=$DATA_PRODUCT_ID"_[12][09][0-9][0-9][01][0-9][0-3][0-9][0-2][0-9][0-5][0-9][0-5][0-9]_[0-9][0-9][0-9][0-9][0-9]_v[0-9][0-9]";;

     YYYYMMDDHHMMSS_MMS ) PATTERN=$DATA_PRODUCT_ID"_[0-2][09][0-9][0-9][01][0-9][0-3][0-9][0-2][0-9][0-5][0-9][0-5][0-9]_v[0-9.-]*";;

     YYDOY ) PATTERN="[089][0-9][0-3][0-9][0-9]_"$DATA_PRODUCT_ID"_v[0-9][0-9]";;

     YYYYDOY ) PATTERN="[01][09][89][0-9][0-3][0-9][0-9]_"$DATA_PRODUCT_ID;;

     YYYYDOY_HAWKEYE ) PATTERN=$DATA_PRODUCT_ID"_[0-2][09][0-9][0-9][0-3][0-9][0-9]_v[0-9.-]*";;

     YYYYDOYHHMMSS ) PATTERN=$DATA_PRODUCT_ID"_[0-2][09][0-9][0-9][0-3][0-9][0-9][0-2][0-9][0-5][0-9][0-5][0-9]_v[0-9][0-9]";;

     *) PATTERN=UNKNOWN;;

esac

MASTER_FILE_NAME=`find $MASTER_DIRECTORY/*.metadata -maxdepth 1 | grep -i "\/"$PATTERN.metadata$ | sed 's/^$/UNKNOWN/' | sort`

if [ ! $MASTER_FILE_NAME ]; then MASTER_FILE_NAME=`find $MASTER_DIRECTORY/*.metadata -maxdepth 1 | grep -i "\/"$DATA_PRODUCT_ID"_[0-2][09][0-9][0-9][01][0-9][0-3][0-9]_v[0-9.-]*.*.metadata"$ | sort | head -1`; fi

echo $MASTER_FILE_NAME

#
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#

