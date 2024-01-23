
DATA_PRODUCT_ID=$1

DATA_PRODUCT_ID_LOWER=`echo $DATA_PRODUCT_ID | tr 'A-Z' 'a-z'`

DATA_PRODUCT_ID_UPPER=`echo $DATA_PRODUCT_ID | tr 'a-z' 'A-Z'`

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

printf "%s\n\nData Product ID:   %s\n\n%s\n\n" $HASHES $DATA_PRODUCT_ID $DASHES

grep -h ^'[A-z]' MASTERS_20210204/PARTITION/[ON][EL][DW]/$DATA_PRODUCT_ID_LOWER'_00000000_v01_variable_metadata.txt' | grep -v ^'Variable\ ([1-9][0-9]*\ variables)'$ | grep -v ^'Attribute\ Entries:'$ | sed 's/\ (Compression:\ GZIP.6)$//' | sed 's/ (Recs: [0-9][0-9]*)$/ (Recs: 0)/' | sed 's/ (No: [0-9][0-9]*)/ (No: XXX)/' | sort | uniq -c | sed 's/^\ \ *//' | sed 's/\ \ */	/'

printf "\n%s\n" $HASHES

