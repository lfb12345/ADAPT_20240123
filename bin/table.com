
TABLE_FILE_NAME=$1

ROW_NUM=`wc -l $TABLE_FILE_NAME | awk '{ print $1 }'`

COLUMN_NUM=`awk 'BEGIN { FS="	" } ; { print NF }' $TABLE_FILE_NAME | sort | uniq -c | awk '{ print $2 }'`

DASHES_NUM=-1

FORMAT=''

PRINTF_LIST=''

SEPARATOR_TEXT='+'

for ((COLUMN_LOOP=1;COLUMN_LOOP<=$COLUMN_NUM;COLUMN_LOOP++)); do

    for ((ROW_LOOP=1;ROW_LOOP<=$ROW_NUM;ROW_LOOP++)); do

        awk -v COLUMN_LOOP=$COLUMN_LOOP 'BEGIN { FS="	" } ; { print $COLUMN_LOOP }' $TABLE_FILE_NAME | head -$ROW_LOOP | tail -1 | wc -c >> table_$$.txt

    done

    CHAR_NUM=`sort -n table_$$.txt | tail -1`

    CHAR_NUM=$((CHAR_NUM-1))

    FORMAT=$FORMAT"| %-"$CHAR_NUM"s "

    SEPARATOR_TEXT_NUM=$((CHAR_NUM+2))

    SEPARATOR_TEXT=$SEPARATOR_TEXT$(printf "%0.s-" $(seq 1 $SEPARATOR_TEXT_NUM))'+'

    DASHES_NUM=$(($DASHES_NUM+CHAR_NUM+3))

    PRINTF_LIST=$PRINTF_LIST",$"$COLUMN_LOOP

    rm table_$$.txt

done

FORMAT='"'$FORMAT'|\n"'

DASHES='+'$(printf "%0.s-" $(seq 1 $DASHES_NUM))'+'

TAIL_NUM=$((ROW_NUM-1))

echo echo $DASHES > table_$$.com

echo "head -1 "$TABLE_FILE_NAME" | awk 'BEGIN { FS=\"	\" } ; { printf "$FORMAT$PRINTF_LIST" }'" >> table_$$.com

echo echo $SEPARATOR_TEXT | sed 's/+/\\\|/g' >> table_$$.com

echo "cat "$TABLE_FILE_NAME" | tail -"$TAIL_NUM" | awk 'BEGIN { FS=\"	\" } ; { printf "$FORMAT$PRINTF_LIST" }'" >> table_$$.com

echo echo $DASHES >> table_$$.com

chmod +x table_$$.com

table_$$.com

rm table_$$.com

