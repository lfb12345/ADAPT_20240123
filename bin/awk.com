
FIELD_NUM=$1

awk 'BEGIN { FS=" " } ; { print '"$FIELD_NUM"' }'

