
DIRECTORY=$1

RESOURCE_ID_LIST=`find $DIRECTORY | sort | grep '\.xml'$ | sed 's/\.xml$//' | sort`

CHAR_NUM=`grep -hr '<ProductKey>' $DIRECTORY | awk 'BEGIN { FS="[<>]" } ; { print length($3) }' | sort -n | tail -1`

CHAR_NUM=$((CHAR_NUM+3))

for RESOURCE_ID in $RESOURCE_ID_LIST

do

    PRODUCT_KEY=`grep '<ProductKey>' $RESOURCE_ID.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

    printf "%-"$CHAR_NUM"s%s\n" $PRODUCT_KEY $RESOURCE_ID >> data_product_id_resource_id_list_$$.txt

done

sort data_product_id_resource_id_list_$$.txt

rm data_product_id_resource_id_list_$$.txt

