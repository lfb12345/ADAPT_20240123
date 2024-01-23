
DATA_PRODUCT_ID_LIST_FILE_NAME=$1

HASHES=$(printf "%0.s#" $(seq 1 275))

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

DATE=`date "+%Y%m%d"`

MASTERS_DIRECTORY=/Volumes/ポンカン/MASTERS/MASTERS_$DATE

MASTERS_DIRECTORY_CURL=$MASTERS_DIRECTORY/CURL

MASTERS_CURL_TABLE_FILE_NAME=$MASTERS_DIRECTORY_CURL/masters_curl_table_$DATE.tab

MASTERS_DIRECTORY_OLD=$MASTERS_DIRECTORY/OLD_000

printf "%s\n\n" $HASHES

printf "%-35s%s\n\n" 'Date:' $DATE 'Masters Data Product ID List:' $DATA_PRODUCT_ID_LIST_FILE_NAME 'Masters Directory:' $MASTERS_DIRECTORY 'Masters Directory Curl:' $MASTERS_DIRECTORY_CURL 'Masters Directory Curl File Name:' $MASTERS_CURL_TABLE_FILE_NAME 'Masters Directory Old File Name:' $MASTERS_DIRECTORY_OLD

printf "%s\n\n" $HASHES $DASHES

if [ ! -d $MASTERS_DIRECTORY_CURL ]; then mkdir -p $MASTERS_DIRECTORY_CURL; fi

if [ ! -d $MASTERS_DIRECTORY_OLD ]; then mkdir -p $MASTERS_DIRECTORY_OLD; fi

curl -sS https://spdf.gsfc.nasa.gov/pub/software/cdawlib/0MASTERS/ | grep '\.cdf' | sed 's/>\ />/' | awk 'BEGIN { FS="[<>\" ]" } ; { print $8"	"$10"	"$19"	"$20"	"$29 }' >& $MASTERS_CURL_TABLE_FILE_NAME

DATA_PRODUCT_ID_LIST=`cat $DATA_PRODUCT_ID_LIST_FILE_NAME`

for DATA_PRODUCT_ID in $DATA_PRODUCT_ID_LIST

do

    MASTER_MATCH_NUM=`grep -ic ^$DATA_PRODUCT_ID'_00000000_v01.cdf	' $MASTERS_CURL_TABLE_FILE_NAME`

    if [ $MASTER_MATCH_NUM == 1 ]; then

       CURL_CDF_FILE_NAME=`grep -i ^$DATA_PRODUCT_ID'_00000000_v01.cdf	' $MASTERS_CURL_TABLE_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $1 }'`

       MASTER_CDF_FILE_NAME=`echo $CURL_CDF_FILE_NAME | tr 'A-Z' 'a-z'`

       MASTER_METADATA_FILE_NAME=`echo $MASTER_CDF_FILE_NAME | sed 's/\.cdf$/.metadata/'`

       curl -sS https://spdf.gsfc.nasa.gov/pub/software/cdawlib/0MASTERS/$CURL_CDF_FILE_NAME >& $MASTERS_DIRECTORY/$MASTER_CDF_FILE_NAME

       /Applications/cdf/cdf37_0-dist/bin/cdfdump -dump metadata $MASTERS_DIRECTORY/$MASTER_CDF_FILE_NAME >& $MASTERS_DIRECTORY/$MASTER_METADATA_FILE_NAME

       STATUS=OOO

    else

       STATUS=XXX

    fi

    printf "%s\t%s\n\n" $STATUS	$DATA_PRODUCT_ID

    SC_ACRONYM=`echo $DATA_PRODUCT_ID | awk 'BEGIN { FS="_" } ; { print $1 }'`

    variable_attribute_list.com $MASTERS_DIRECTORY/$MASTER_METADATA_FILE_NAME | sed 's/^/AAA	/'

    echo

    echo '<'$DATE'>  	'`echo $DATA_PRODUCT_ID | tr 'a-z' 'A-Z'`'	'`grep $SC_ACRONYM'	' /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/cdaweb_sc_name_lookup.tab | awk 'BEGIN {FS="	"} ; { print $3 }'`'	'`grep $SC_ACRONYM'	' /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/cdaweb_sc_name_lookup.tab | awk 'BEGIN {FS="	"} ; { print $2 }'`'			'`grep -A1 ^Descriptor' ' $MASTERS_DIRECTORY/$MASTER_METADATA_FILE_NAME | awk 'BEGIN { FS="[\">]" } ; { print $3 }'`'					-	'`grep -A1 ^PI_name' ' $MASTERS_DIRECTORY/$MASTER_METADATA_FILE_NAME | awk 'BEGIN { FS="\"" } ; { print $2 }'`'	('`grep -A1 ^PI_affiliation' ' $MASTERS_DIRECTORY/$MASTER_METADATA_FILE_NAME | awk 'BEGIN { FS="\"" } ; { print $2 }'`')	</'$DATE'>  ' | sed 's/	\ /	/g' | sed 's/	(\ /	(/g'

done

cp -p $MASTERS_DIRECTORY/*.metadata $MASTERS_DIRECTORY_OLD

printf "\n%s\n" $DASHES

printf "\n%s" $HASHES

echo

