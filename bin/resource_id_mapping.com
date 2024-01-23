
DIRECTORY_OLD=$1

DIRECTORY_NEW=$2

DATA_PRODUCT_ID=$3

DATA_PRODUCT_ID_UPPER=`echo $DATA_PRODUCT_ID | tr 'a-z' 'A-Z'`

ROOT_OLD=`dirname $DIRECTORY_OLD`

RESOURCE_ID_OLD=`grep -r '<ProductKey>'$DATA_PRODUCT_ID_UPPER'</ProductKey>' $DIRECTORY_OLD | sed 's/\.xml:.*$//' | sed 's?^'$ROOT_OLD'/??'`

RESOURCE_ID_NEW=`grep -r '<ProductKey>'$DATA_PRODUCT_ID_UPPER'</ProductKey>' $DIRECTORY_NEW | sed 's/\.xml:.*$//'`

echo $DATA_PRODUCT_ID'	'$RESOURCE_ID_OLD'	'$RESOURCE_ID_NEW

