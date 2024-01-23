
DATA_PRODUCT_ID=$1

CDF_FILE_NUM=`grep -c '/'$DATA_PRODUCT_ID'_20[12][0-9][01][0-9][0-3][0-9]_v[0-9][0-9]\.cdf'$ /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210802/CURL/filelist_barrel_20210802.txt | awk '{ print $NF }'`

CDF_FILE_NAME=`grep '/'$DATA_PRODUCT_ID'_20[12][0-9][01][0-9][0-3][0-9]_v[0-9][0-9]\.cdf'$ /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210802/CURL/filelist_barrel_20210802.txt | awk '{ print $NF }' | tail -1`

echo $CDF_FILE_NUM'	'$DATA_PRODUCT_ID'	'$CDF_FILE_NAME

curl -sS https://spdf.gsfc.nasa.gov/$CDF_FILE_NAME &> $DATA_PRODUCT_ID'_00000000_v01.cdf'

cdfdump -dump metadata $DATA_PRODUCT_ID'_00000000_v01.cdf' &> $DATA_PRODUCT_ID'_00000000_v01.metadata'

