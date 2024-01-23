
DATA_PRODUCT_ID=$1

DIRECTORY=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/XML_20210810_BARREL_20210815_001

XML_FILENAME=$DIRECTORY/cdaweb_$DATA_PRODUCT_ID'_yyyymmdd.xml'

grep ^'         <ResourceName>.*</ResourceName>'$ $XML_FILENAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'

