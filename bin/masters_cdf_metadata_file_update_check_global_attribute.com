
MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD=$1

MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW=$2

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

GLOBAL_ATTRIBUTE_UNIQ_NUM=`grep -h ^'Global\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW | uniq | wc -l | awk '{ print $1 }'`

if [ $GLOBAL_ATTRIBUTE_UNIQ_NUM == 2 ]; then

   printf "%s\n\nGlobal Attribute Number Updated:\n\n" $DASHES

   grep -h ^'Global\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD | sed 's/^/OLD:   /'

   grep -h ^'Global\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW | sed 's/^/NEW:   /'

   printf "\n%s\n" $DASHES

   masters_cdf_metadata_file_update_check_global_attribute_list.com $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW

fi

GLOBAL_ATTRIBUTE_LIST=`grep -h ^'[A-z]' $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW | grep -v ^'Global\ Attributes\ ([1-9][0-9]*\ attributes)'$ | awk '{ print $1 }' | sort | uniq`

for GLOBAL_ATTRIBUTE in $GLOBAL_ATTRIBUTE_LIST

do

    GLOBAL_ATTRIBUTE_NUM_OLD=`grep -c ^$GLOBAL_ATTRIBUTE'\ ([1-9][0-9]* entr[iy]e*s*):\ *'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD`

    GLOBAL_ATTRIBUTE_NUM_NEW=`grep -c ^$GLOBAL_ATTRIBUTE'\ ([1-9][0-9]* entr[iy]e*s*):\ *'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW`

    if [ $GLOBAL_ATTRIBUTE_NUM_OLD -ne 0 ] && [ $GLOBAL_ATTRIBUTE_NUM_NEW -ne 0 ]; then

       if [ $GLOBAL_ATTRIBUTE_NUM_OLD -eq 1 ] && [ $GLOBAL_ATTRIBUTE_NUM_NEW -eq 1 ]; then

          GLOBAL_ATTRIBUTE_LINE_NUM_OLD=`grep -n ^$GLOBAL_ATTRIBUTE'\ ([1-9][0-9]* entr[iy]e*s*):\ *'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD | awk 'BEGIN { FS=":" } ; { print $1 }'`

          GLOBAL_ATTRIBUTE_LINE_NUM_NEW=`grep -n ^$GLOBAL_ATTRIBUTE'\ ([1-9][0-9]* entr[iy]e*s*):\ *'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW | awk 'BEGIN { FS=":" } ; { print $1 }'`

          GLOBAL_ATTRIBUTE_METADATA_LINE_NUM_OLD=`grep ^$GLOBAL_ATTRIBUTE'\ ([1-9][0-9]* entr[iy]e*s*):\ *'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD | awk 'BEGIN { FS="[( ]" } ; { print $3 }'`

          GLOBAL_ATTRIBUTE_METADATA_LINE_NUM_NEW=`grep ^$GLOBAL_ATTRIBUTE'\ ([1-9][0-9]* entr[iy]e*s*):\ *'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW | awk 'BEGIN { FS="[( ]" } ; { print $3 }'`

          HEAD_NUM_OLD=$((GLOBAL_ATTRIBUTE_LINE_NUM_OLD+GLOBAL_ATTRIBUTE_METADATA_LINE_NUM_OLD))

          TAIL_NUM_OLD=$((GLOBAL_ATTRIBUTE_METADATA_LINE_NUM_OLD+1))

          head -$HEAD_NUM_OLD $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD | tail -$TAIL_NUM_OLD &> masters_cdf_metadata_file_update_check_global_attribute_old_$$.txt

          HEAD_NUM_NEW=$((GLOBAL_ATTRIBUTE_LINE_NUM_NEW+GLOBAL_ATTRIBUTE_METADATA_LINE_NUM_NEW))

          TAIL_NUM_NEW=$((GLOBAL_ATTRIBUTE_METADATA_LINE_NUM_NEW+1))

          head -$HEAD_NUM_NEW $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW | tail -$TAIL_NUM_NEW &> masters_cdf_metadata_file_update_check_global_attribute_new_$$.txt

          HASH_OLD=`openssl dgst -sha1 masters_cdf_metadata_file_update_check_global_attribute_old_$$.txt | awk '{ print $2 }'`

          HASH_NEW=`openssl dgst -sha1 masters_cdf_metadata_file_update_check_global_attribute_new_$$.txt | awk '{ print $2 }'`

          if [ $HASH_OLD != $HASH_NEW ]; then

             printf "%s\n\n" $DASHES

             sed 's/^	/        /' masters_cdf_metadata_file_update_check_global_attribute_old_$$.txt | sed 's/^/OLD:   /'

             echo

             sed 's/^	/        /' masters_cdf_metadata_file_update_check_global_attribute_new_$$.txt | sed 's/^/NEW:   /'

             diff masters_cdf_metadata_file_update_check_global_attribute_old_$$.txt masters_cdf_metadata_file_update_check_global_attribute_new_$$.txt | grep -v ^'---'$ | sed 's/	/       /' | sed 's/^</OLD:   /' | sed 's/^>/NEW:   /' | sed '/^[1-9]/{x;p;x;}'

             printf "\n%s\n" $DASHES

          fi

          rm masters_cdf_metadata_file_update_check_global_attribute_[no][el][dw]_$$.txt

       else

          printf "%s\n\n" $DASHES

          if [ $GLOBAL_ATTRIBUTE_NUM_OLD -eq 1 ]; then

             GLOBAL_ATTRIBUTE_LINE_NUM_OLD=`grep -n ^$GLOBAL_ATTRIBUTE'\ ([1-9][0-9]* entr[iy]e*s*):\ *'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD | awk 'BEGIN { FS=":" } ; { print $1 }'`

             GLOBAL_ATTRIBUTE_METADATA_LINE_NUM_OLD=`grep ^$GLOBAL_ATTRIBUTE'\ ([1-9][0-9]* entr[iy]e*s*):\ *'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD | awk 'BEGIN { FS="[( ]" } ; { print $3 }'`

             HEAD_NUM_OLD=$((GLOBAL_ATTRIBUTE_LINE_NUM_OLD+GLOBAL_ATTRIBUTE_METADATA_LINE_NUM_OLD))

             TAIL_NUM_OLD=$((GLOBAL_ATTRIBUTE_METADATA_LINE_NUM_OLD+1))

             head -$HEAD_NUM_OLD $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD | tail -$TAIL_NUM_OLD | sed 's/^	/        /' | sed 's/^/OLD:   /'

          else

             GLOBAL_ATTRIBUTE_LINE_NUM_NEW=`grep -n ^$GLOBAL_ATTRIBUTE'\ ([1-9][0-9]* entr[iy]e*s*):\ *'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW | awk 'BEGIN { FS=":" } ; { print $1 }'`

             GLOBAL_ATTRIBUTE_METADATA_LINE_NUM_NEW=`grep ^$GLOBAL_ATTRIBUTE'\ ([1-9][0-9]* entr[iy]e*s*):\ *'$ $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW | awk 'BEGIN { FS="[( ]" } ; { print $3 }'`

             HEAD_NUM_NEW=$((GLOBAL_ATTRIBUTE_LINE_NUM_NEW+GLOBAL_ATTRIBUTE_METADATA_LINE_NUM_NEW))

             TAIL_NUM_NEW=$((GLOBAL_ATTRIBUTE_METADATA_LINE_NUM_NEW+1))

             head -$HEAD_NUM_NEW $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW | tail -$TAIL_NUM_NEW | sed 's/^	/        /' | sed 's/^/NEW:   /'

          fi

          printf "\n%s\n" $DASHES

       fi

    fi

done

