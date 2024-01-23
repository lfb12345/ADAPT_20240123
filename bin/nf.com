
TAB_FILE_NAME=$1

awk 'BEGIN { FS="	" } ; { print NF }' $TAB_FILE_NAME | sort | uniq -c

