
MASTER_CDF_METADATA_DIRECTORY=$1

DATA_PRODUCT_ID=$2

MASTER_CDF_METADATA_FILE_NAME=$MASTER_CDF_METADATA_DIRECTORY/$DATA_PRODUCT_ID'_00000000_v01.metadata'

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

FILE_LINE_NUM=`wc -l $MASTER_CDF_METADATA_FILE_NAME | awk '{ print $1 }'`

MASTER_CDF_METADATA_FILE_OUTPUT_DIRECTORY=`dirname $MASTER_CDF_METADATA_FILE_NAME`/NEW

mkdir -p $MASTER_CDF_METADATA_FILE_OUTPUT_DIRECTORY

MASTER_CDF_METADATA_FILE_BASENAME_ROOT=`basename $MASTER_CDF_METADATA_FILE_NAME | sed 's/\.metadata$//'`

MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME=$MASTER_CDF_METADATA_FILE_OUTPUT_DIRECTORY/$MASTER_CDF_METADATA_FILE_BASENAME_ROOT.metadata

GLOBAL_ATTRIBUTE_LINE_NUM=`grep -n ^'Global\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_CDF_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

VARIABLE_ATTRIBUTE_LINE_NUM=`grep -n ^'Variable\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_CDF_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

VARIABLE_INFORMATION_LINE_NUM=`grep -n ^'Variable\ Information\ ([0-9][0-9]*\\ rVariable,\ [0-9][0-9]* zVariables)'$ $MASTER_CDF_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

VARIABLE_LINE_NUM=`grep -n ^'Variable\ ([1-9][0-9]*\ variables)'$ $MASTER_CDF_METADATA_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

HEAD_NUM=$((GLOBAL_ATTRIBUTE_LINE_NUM-1))

head -$HEAD_NUM $MASTER_CDF_METADATA_FILE_NAME | sed 's/\ \ *$//' &> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

HEAD_NUM=$((VARIABLE_ATTRIBUTE_LINE_NUM-2))

TAIL_NUM=$((HEAD_NUM-GLOBAL_ATTRIBUTE_LINE_NUM-1))

head -$HEAD_NUM $MASTER_CDF_METADATA_FILE_NAME | tail -$TAIL_NUM | sed 's/\ \ *$//' | sed '/" "/!s/\ "\ \ */\ "/' | sed '/" "/!s/"\ \ *"$/" "/' &> masters_cdf_metadata_file_reformat_$$.metadata

GLOBAL_ATTRIBUTE_LIST=`grep '\ ([0-9][0-9]*\ entr[iy]e*s*):'$ masters_cdf_metadata_file_reformat_$$.metadata | awk '{ print $1 }'`

GLOBAL_ATTRIBUTE_LIST_NUM=`grep -c '\ ([0-9][0-9]*\ entr[iy]e*s*):'$ masters_cdf_metadata_file_reformat_$$.metadata`

printf "Global Attributes (%s attributes)\n=========================================\n" $GLOBAL_ATTRIBUTE_LIST_NUM >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

GLOBAL_ATTRIBUTE_FILE_LINE_NUM=`wc -l masters_cdf_metadata_file_reformat_$$.metadata | awk '{ print $1 }'`

LOOP_NUM=0

for GLOBAL_ATTRIBUTE in $GLOBAL_ATTRIBUTE_LIST

do

    LOOP_NUM=$((LOOP_NUM+1))

    GLOBAL_ATTRIBUTE_LOOP_NUM=$((LOOP_NUM+1))

    GLOBAL_ATTRIBUTE_LINE_NUM_000=`grep -n ^$GLOBAL_ATTRIBUTE'\ ' masters_cdf_metadata_file_reformat_$$.metadata | awk 'BEGIN { FS=":" } ; { print $1 }'`

    GLOBAL_ATTRIBUTE_LINE_NUM_111=`grep -n '\ ([0-9][0-9]*\ entr[iy]e*s*):'$ masters_cdf_metadata_file_reformat_$$.metadata | head -$GLOBAL_ATTRIBUTE_LOOP_NUM | tail -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

    if [ $LOOP_NUM -lt $GLOBAL_ATTRIBUTE_LIST_NUM ]; then

       HEAD_NUM=$((GLOBAL_ATTRIBUTE_LINE_NUM_111-1))

       TAIL_NUM=$((GLOBAL_ATTRIBUTE_LINE_NUM_111-GLOBAL_ATTRIBUTE_LINE_NUM_000))

       head -$HEAD_NUM masters_cdf_metadata_file_reformat_$$.metadata | tail -$TAIL_NUM &> temp_$$.metadata

    else

       TAIL_NUM=$((GLOBAL_ATTRIBUTE_FILE_LINE_NUM-GLOBAL_ATTRIBUTE_LINE_NUM_000+1))

       tail -$TAIL_NUM masters_cdf_metadata_file_reformat_$$.metadata &> temp_$$.metadata &> temp_$$.metadata

    fi

    while IFS="" read -r TEXT || [ -n "$TEXT" ]

    do

          MATCH_NUM=`echo "$TEXT" | grep -c ^'	[0-9][0-9]*\ (CDF_[BC][HY][AT][ER]/[0-9][0-9]*):\ 	'`

          if [ $MATCH_NUM -eq 0 ]; then

             GLOBAL_ATTRIBUTE=`printf '%s\n' "$TEXT" | sed 's/\ ([0-9][0-9]*\ entr[iy]e*s*):$//'`

             if [ $TAIL_NUM -lt 3 ]; then

                ENTRY_TEXT='entry'

             else

                ENTRY_TEXT='entries'

             fi

             ENTRY_LINE_COUNT=$((TAIL_NUM-1))

             printf '%s (%s %s):\n' $GLOBAL_ATTRIBUTE $ENTRY_LINE_COUNT $ENTRY_TEXT >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

          else

             CDF_TYPE=`printf '%s\n' "$TEXT" | awk 'BEGIN { FS="[(/]" } ; { print $2 }'`

             if [ $CDF_TYPE == 'CDF_CHAR' ]; then

                TEXT_STRING_LINE_NUM=`printf "%s\\n" "$TEXT" | sed 's/^	//' | sed 's/\ (CDF_CHAR\/[0-9][0-9]*): 	".*"$//'`

                TEXT_STRING=`printf "%s\n" "$TEXT" | sed 's/^	[0-9][0-9]*\ (CDF_CHAR\/[0-9][0-9]*): 	"//' | sed 's/"$//' | sed 's/"//g'`

                TEXT_STRING_CHAR_NUM=`printf "%s\n" "$TEXT_STRING" | awk '{ print length($0) }'`

                printf "%s\n" '	'$TEXT_STRING_LINE_NUM' (CDF_CHAR/'$TEXT_STRING_CHAR_NUM'): 	"'"$TEXT_STRING"'"' >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

             else

                printf "%s\n" "$TEXT" >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

             fi

          fi

    done < temp_$$.metadata

    rm temp_$$.metadata

done

printf '\n' >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

HEAD_NUM=$((VARIABLE_INFORMATION_LINE_NUM-2))

TAIL_NUM=$((HEAD_NUM-VARIABLE_ATTRIBUTE_LINE_NUM-1))

head -$HEAD_NUM $MASTER_CDF_METADATA_FILE_NAME | tail -$TAIL_NUM | sed 's/\ \ *$//' >> masters_cdf_metadata_file_reformat_$$.metadata

# PSP ISOIS VARIABLE_ATTRIBUTE_REORDERED_LIST=`cat /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/masters_cdf_metadata_file_reformat_variable_attribute_list_psp_isois.txt`

VARIABLE_ATTRIBUTE_REORDERED_LIST=`cat /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210802/CURL/BARREL_ALL/masters_cdf_metadata_file_reformat_variable_attribute_list_barrel.txt`

for VARIABLE_ATTRIBUTE_REORDERED in $VARIABLE_ATTRIBUTE_REORDERED_LIST

do

    grep ^$VARIABLE_ATTRIBUTE_REORDERED$ masters_cdf_metadata_file_reformat_$$.metadata >> temp_$$.metadata

done

VARIABLE_ATTRIBUTE_NUM=`wc -l temp_$$.metadata | awk '{ print $1 }'`

printf "Variable Attributes (%s attributes)\n=========================================\n" $VARIABLE_ATTRIBUTE_NUM >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

cat temp_$$.metadata >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

rm temp_$$.metadata

grep -A1 -B1 ^'Variable\ Information\ ' $MASTER_CDF_METADATA_FILE_NAME >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

MISSION_INSTRUMENT=`echo $DATA_PRODUCT_ID | awk 'BEGIN { FS="[_-]" } ; { print $1"_"$2 }'`

# PSP ISOIS VARIABLE_NAME_REVISED_LIST_FILE_NAME=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/masters_cdf_metadata_file_reformat_parameter_list_$MISSION_INSTRUMENT'_order_original.tab'

# PSP ISOIS VARIABLE_NAME_REVISED_LIST_FILE_NAME=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/masters_cdf_metadata_file_reformat_parameter_list_$MISSION_INSTRUMENT'_order_revised_new_parameter.tab'

# PSP ISOIS VARIABLE_NAME_REVISED_LIST_FILE_NAME=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/masters_cdf_metadata_file_reformat_parameter_list_$MISSION_INSTRUMENT'_all_unsorted.tab'

# PSP ISOIS VARIABLE_NAME_REVISED_LIST_FILE_NAME=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/masters_cdf_metadata_file_reformat_parameter_list_$MISSION_INSTRUMENT'_order_revised.tab'

VARIABLE_NAME_REVISED_LIST_FILE_NAME=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210802/CURL/BARREL_ALL/masters_cdf_metadata_file_reformat_parameter_list_barrel_all.tab

VARIABLE_NAME_REVISED_LIST=`grep ^$DATA_PRODUCT_ID'	' $VARIABLE_NAME_REVISED_LIST_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $2 }'`

HEAD_NUM=$((VARIABLE_LINE_NUM-3))

TAIL_NUM=$((HEAD_NUM-VARIABLE_INFORMATION_LINE_NUM-1))

head -$HEAD_NUM $MASTER_CDF_METADATA_FILE_NAME | tail -$TAIL_NUM | sed 's/\ \ *$//' &> masters_cdf_metadata_file_reformat_$$.metadata

for VARIABLE_NAME_REVISED in $VARIABLE_NAME_REVISED_LIST

do

#   echo $VARIABLE_NAME_REVISED

    grep ^$VARIABLE_NAME_REVISED'\ ' masters_cdf_metadata_file_reformat_$$.metadata >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

done

TAIL_NUM=$((FILE_LINE_NUM-VARIABLE_LINE_NUM+3))

tail -$TAIL_NUM $MASTER_CDF_METADATA_FILE_NAME | head -5 >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

TAIL_NUM=$((FILE_LINE_NUM-VARIABLE_LINE_NUM-1))

tail -$TAIL_NUM $MASTER_CDF_METADATA_FILE_NAME | grep -v ^$ | sed 's/\ \ *$//' | sed '/" "/!s/\ \ *"$/"/' &> masters_cdf_metadata_file_reformat_$$.metadata

FILE_TEMP_LINE_NUM=`wc -l masters_cdf_metadata_file_reformat_$$.metadata | awk '{ print $1 }'`

VARIABLE_NUM=0

#rintf "\n"

NUMERICAL_DATA_PARAMETER_ALL_FILE_NAME=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/numerical_data_parameter_all.tab

for VARIABLE_NAME_REVISED in $VARIABLE_NAME_REVISED_LIST

do

    UNITS_SPASE=`grep ^$DATA_PRODUCT_ID'	'$VARIABLE_NAME_REVISED'	' $NUMERICAL_DATA_PARAMETER_ALL_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $3 }'`

    PARAMETER_KEYWORD=`grep ^$DATA_PRODUCT_ID'	'$VARIABLE_NAME_REVISED'	' $NUMERICAL_DATA_PARAMETER_ALL_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $8 }'`

    TYPE=`grep ^$DATA_PRODUCT_ID'	'$VARIABLE_NAME_REVISED'	' $NUMERICAL_DATA_PARAMETER_ALL_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $9 }'`

    QUANTITY=`grep ^$DATA_PRODUCT_ID'	'$VARIABLE_NAME_REVISED'	' $NUMERICAL_DATA_PARAMETER_ALL_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $10 }'`

    QUALIFIER=`grep ^$DATA_PRODUCT_ID'	'$VARIABLE_NAME_REVISED'	' $NUMERICAL_DATA_PARAMETER_ALL_FILE_NAME | awk 'BEGIN { FS="	" } ; { print $11 }'`

    VARIABLE_NAME_MATCH_NUM=`grep -c ^$VARIABLE_NAME_REVISED' (No: [0-9][0-9]*) (Recs: [0-9][0-9]*)' masters_cdf_metadata_file_reformat_$$.metadata`

    if [ $VARIABLE_NAME_MATCH_NUM -eq 1 ]; then

       VARIABLE_NAME_LINE_NUM=`grep -n ^$VARIABLE_NAME_REVISED' (No: [0-9][0-9]*) (Recs: [0-9][0-9]*)' masters_cdf_metadata_file_reformat_$$.metadata | awk 'BEGIN { FS=":" } ; { print $1 }'`

       TAIL_NUM=$((FILE_TEMP_LINE_NUM-VARIABLE_NAME_LINE_NUM))

       VARIABLE_NEXT_LINE_NUM=`tail -$TAIL_NUM masters_cdf_metadata_file_reformat_$$.metadata | grep -n ' (No: [0-9][0-9]*) (Recs: [0-9][0-9]*)' | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

#      echo $VARIABLE_NAME_REVISED'	'$FILE_TEMP_LINE_NUM'	'$VARIABLE_NAME_LINE_NUM'	'$TAIL_NUM'	'$VARIABLE_NEXT_LINE_NUM

       if [ $VARIABLE_NEXT_LINE_NUM ]; then

          TAIL_NUM=$((FILE_TEMP_LINE_NUM-VARIABLE_NAME_LINE_NUM+1))

          HEAD_NUM=$VARIABLE_NEXT_LINE_NUM

#         echo $TAIL_NUM'	'$HEAD_NUM

          tail -$TAIL_NUM masters_cdf_metadata_file_reformat_$$.metadata | head -$HEAD_NUM | sed '/\ (No: [0-9][0-9]*)\ (Recs: [0-9][0-9]*)/s/[0-9][0-9]*)/'$VARIABLE_NUM')/' &> temp_$$.metadata

#         tail -$TAIL_NUM masters_cdf_metadata_file_reformat_$$.metadata | head -$HEAD_NUM | sed '/\ (No: [0-9][0-9]*)\ (Recs: [0-9][0-9]*)/s/[0-9][0-9]*)/'$VARIABLE_NUM')/'

       else

          TAIL_NUM=$((TAIL_NUM+1))

          tail -$TAIL_NUM masters_cdf_metadata_file_reformat_$$.metadata | sed '/\ (No: [0-9][0-9]*)\ (Recs: [0-9][0-9]*)/s/[0-9][0-9]*)/'$VARIABLE_NUM')/' &> temp_$$.metadata

#         tail -$TAIL_NUM masters_cdf_metadata_file_reformat_$$.metadata | sed '/\ (No: [0-9][0-9]*)\ (Recs: [0-9][0-9]*)/s/[0-9][0-9]*)/'$VARIABLE_NUM')/'

       fi

       grep -A2 ' (No: [0-9][0-9]*) (Recs: [0-9][0-9]*)' temp_$$.metadata >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

       VAR_TYPE=`grep ^'\ \ \ \ \ VAR_TYPE\ ' temp_$$.metadata | awk 'BEGIN { FS="\"" } ; { print $2 }'`

       DICT_KEY=`grep ^'\ \ \ \ \ DICT_KEY\ ' temp_$$.metadata | awk 'BEGIN { FS="\"" } ; { print $2 }'`

       LABLAXIS=`grep ^'\ \ \ \ \ LABLAXIS\ ' temp_$$.metadata | awk 'BEGIN { FS="\"" } ; { print $2 }'`

       DISPLAY_TYPE=`grep ^'\ \ \ \ \ DISPLAY_TYPE\ ' temp_$$.metadata | awk 'BEGIN { FS="\"" } ; { print $2 }'`

       UNITS_MASTER=`grep ^'\ \ \ \ \ UNITS\ ' temp_$$.metadata | awk 'BEGIN { FS="\"" } ; { print $2 }'`

       UNITS_MASTER_CHAR_NUM=`echo $UNITS_MASTER | awk '{ print length($0) }'`

       UNITS_SPASE_CHAR_NUM=`echo $UNITS_SPASE | awk '{ print length($0) }'`

       UNITS_MASTER_TEST=`echo $UNITS_MASTER | sed 's/\ /|/g'`

       UNITS_SPASE_TEST=`echo $UNITS_SPASE | sed 's/\ /|/g'`

       if [ $UNITS_MASTER_CHAR_NUM -gt 0 ] && [ $UNITS_SPASE_CHAR_NUM -gt 0 ]; then

          if [ $UNITS_MASTER_TEST == $UNITS_SPASE_TEST ]; then

             UNITS_STATUS=OOO

          else

             UNITS_STATUS=XXX

          fi

       else

          if [ $UNITS_MASTER_CHAR_NUM -eq 0 ] && [ $UNITS_SPASE_CHAR_NUM -eq 0 ]; then

             UNITS_STATUS=OOO

          else

             UNITS_STATUS=XXX

          fi

       fi

       echo $DATA_PRODUCT_ID'	'$VARIABLE_NAME_REVISED'	'$VAR_TYPE'	'$DICT_KEY'	'$LABLAXIS'	'$DISPLAY_TYPE'	'$UNITS_STATUS'	'$UNITS_MASTER'	'$UNITS_SPASE'	'$PARAMETER_KEYWORD'	'$TYPE'	'$QUANTITY'	'$QUALIFIER

       for VARIABLE_ATTRIBUTE_REORDERED in $VARIABLE_ATTRIBUTE_REORDERED_LIST

       do

           MATCH_NUM=`grep -c ^'\ \ \ \ \ '$VARIABLE_ATTRIBUTE_REORDERED'\ ' temp_$$.metadata`

           if [ $MATCH_NUM -gt 0 ]; then

              QUOTE_PARSE_NUM=`grep ^'\ \ \ \ \ '$VARIABLE_ATTRIBUTE_REORDERED'\ ' temp_$$.metadata | awk 'BEGIN { FS="\"" } ; { print NF }'`

              if [ $QUOTE_PARSE_NUM -eq 3 ]; then

                 TEXT_STRING=`grep ^'\ \ \ \ \ '$VARIABLE_ATTRIBUTE_REORDERED'\ ' temp_$$.metadata | awk 'BEGIN { FS="\"" } ; { print $2 }' | sed 's/\ \ \ */ /g'`

                 TEXT_STRING_CHAR_NUM=`echo $TEXT_STRING | awk '{ print length($0) }'`

                 TEXT_ROOT=`grep ^'\ \ \ \ \ '$VARIABLE_ATTRIBUTE_REORDERED'\ ' temp_$$.metadata | sed 's/[0-9][0-9]*):/'$TEXT_STRING_CHAR_NUM'):/' | sed 's/".*"//'`

                 echo "$TEXT_ROOT"'"'$TEXT_STRING'"' >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

              else

                 grep ^'\ \ \ \ \ '$VARIABLE_ATTRIBUTE_REORDERED'\ ' temp_$$.metadata >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

              fi

           fi

       done

       printf "\n" >> $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

       VARIABLE_NUM=$((VARIABLE_NUM+1))

       rm temp_$$.metadata

    fi

done

ATTRIBUTE_NUM=$((GLOBAL_ATTRIBUTE_LIST_NUM+VARIABLE_ATTRIBUTE_NUM))

sed '/^NumAttrs:\ \ *[1-9][0-9]* ([1-9][0-9]* global, [1-9][0-9]* variable)$/s/[1-9][0-9]*/'$ATTRIBUTE_NUM'/' $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME | sed '/^NumAttrs:\ \ *[1-9][0-9]* ([1-9][0-9]* global, [1-9][0-9]* variable)$/s/([1-9][0-9]*\ /('$GLOBAL_ATTRIBUTE_LIST_NUM' /' | sed '/^NumAttrs:\ \ *[1-9][0-9]* ([1-9][0-9]* global, [1-9][0-9]* variable)$/s/,\ [1-9][0-9]*\ /, '$VARIABLE_ATTRIBUTE_NUM' /' | sed '/^Global Attributes ([1-9][0-9]* attributes)$/s/[1-9][0-9]*/'$GLOBAL_ATTRIBUTE_LIST_NUM'/' | sed '/(Recs:\ [0-9][0-9]*)/s//(Recs: 0)/' &> masters_cdf_metadata_file_reformat_$$.metadata

mv masters_cdf_metadata_file_reformat_$$.metadata $MASTER_CDF_METADATA_FILE_OUTPUT_FILE_NAME

