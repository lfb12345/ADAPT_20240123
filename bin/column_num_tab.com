
FILE_NAME=$1

awk 'BEGIN { FS="	" } ; { print NF }' $FILE_NAME | sort | uniq -c | sed 's/^\ \ *//' | sed 's/\ /	/'

