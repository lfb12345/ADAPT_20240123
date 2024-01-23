
XML_FILE_NAME_LIST=$1

if [ -e collate_simple_all.com ]; then rm collate_simple_all.com; fi

for XML_FILE_NAME in $XML_FILE_NAME_LIST

do

    echo "collate_simple.com "$XML_FILE_NAME >> collate_simple_all.com

done

chmod +x collate_simple_all.com

collate_simple_all.com >& collate_simple_all.txt

DIRECTORY_LIST=`sed 's/\/.*$//' collate_simple_all.txt | sort | uniq`

data_product_id_resource_id_list.com "$DIRECTORY_LIST"

