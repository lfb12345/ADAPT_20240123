
DATA_PRODUCT_ID=$1

DATE_STYLE=$2

OUTPUT_DIRECTORY=$3

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

printf "%s\n\n%-19s%s\n\n%-19s%s\n\n%-19s%s\n\n%s\n\n" $HASHES 'Data Product ID:' $DATA_PRODUCT_ID 'Date Style:' $DATE_STYLE 'Output Directory:' $OUTPUT_DIRECTORY $DASHES

DIRECTORY=`grep ^$DATA_PRODUCT_ID'	'$DATE_STYLE'	' /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/data_product_access_url_map_all.tab | awk '{ FS="	" } ; { print $3 }'`

YEAR_DIRECTORY=`curl -sS https://spdf.gsfc.nasa.gov/$DIRECTORY | grep '[12][09[01][0-9]' | awk '{ FS="\"" } ; { print $2 }' | sort -n | tail -1`

if [ $DATA_PRODUCT_ID != "timed_windvectorsncar_tidi" ]; then

   MONTH_DIRECTORY=''

else

   MONTH_DIRECTORY=`curl -sS https://spdf.gsfc.nasa.gov/$DIRECTORY$YEAR_DIRECTORY | grep '[12][09[01][0-9]' | awk '{ FS="\"" } ; { print $2 }' | sort -n | tail -1`

fi

CDF_FILE_NAME=`curl -sS https://spdf.gsfc.nasa.gov/$DIRECTORY/$YEAR_DIRECTORY$MONTH_DIRECTORY | sort | tail -1 | awk 'BEGIN { FS="\"" } ; { print $2 }'`

curl -sS https://spdf.gsfc.nasa.gov/$DIRECTORY$YEAR_DIRECTORY$MONTH_DIRECTORY$CDF_FILE_NAME >& $OUTPUT_DIRECTORY/$DATA_PRODUCT_ID'_00000000_v01.cdf'

cd $OUTPUT_DIRECTORY

cdfdump -dump metadata $DATA_PRODUCT_ID'_00000000_v01.cdf' | sed 's/^Dumping\ cdf\ from\ "/Dumping cdf from "\/Users\/astropooch\/Space\/PROGRAMS\/HARVEST\/CDAWEB\/MASTERS_200430\//' | sed 's/\ \ *sRecords.PREV$//' | sed 's/(Recs:\ [1-9][0-9]*).*$/(Recs: 0)/' | sed 's/\ \ *$//' >& $DATA_PRODUCT_ID'_00000000_v01.metadata'

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_200430/OLD_001/$DATA_PRODUCT_ID'_00000000_v01.metadata' $DATA_PRODUCT_ID'_00000000_v01.metadata' | wc | awk '{ printf("%-19s%s\n\n%-19s%s\n\n%-19s%s\n\n","Lines:",$1,"Words:",$2,"Chars:",$3) }'

printf "%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_200430/OLD_001/$DATA_PRODUCT_ID'_00000000_v01.metadata' $DATA_PRODUCT_ID'_00000000_v01.metadata'

printf "\n%s\n" $HASHES

