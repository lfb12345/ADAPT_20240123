
MASTER_CDF_METADATA_VARIABLE_ATTRIBUTE_FILE_NAME_OLD=$1

MASTER_CDF_METADATA_VARIABLE_ATTRIBUTE_FILE_NAME_NEW=$2

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

VARIABLE_ATTRIBUTE_UNIQ_NUM=`grep -h ^'Variable\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_CDF_METADATA_VARIABLE_ATTRIBUTE_FILE_NAME_OLD $MASTER_CDF_METADATA_VARIABLE_ATTRIBUTE_FILE_NAME_NEW | uniq | wc -l | awk '{ print $1 }'`

if [ $VARIABLE_ATTRIBUTE_UNIQ_NUM == 2 ]; then

   printf "%s\n\nVariable Attribute List Number Updated:\n\n" $DASHES

   grep -h ^'Variable\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_CDF_METADATA_VARIABLE_ATTRIBUTE_FILE_NAME_OLD | sed 's/^/OLD:   /'

   grep -h ^'Variable\ Attributes\ ([1-9][0-9]*\ attributes)'$ $MASTER_CDF_METADATA_VARIABLE_ATTRIBUTE_FILE_NAME_NEW | sed 's/^/NEW:   /'

fi

grep ^'[A-z]' $MASTER_CDF_METADATA_VARIABLE_ATTRIBUTE_FILE_NAME_OLD | grep -v ^'Variable\ Attributes\ ([1-9][0-9]*\ attributes)'$ | awk '{ print $1 }' | sort &> masters_cdf_metadata_file_update_check_variable_attribute_list_old_$$.txt

grep ^'[A-z]' $MASTER_CDF_METADATA_VARIABLE_ATTRIBUTE_FILE_NAME_NEW | grep -v ^'Variable\ Attributes\ ([1-9][0-9]*\ attributes)'$ | awk '{ print $1 }' | sort &> masters_cdf_metadata_file_update_check_variable_attribute_list_new_$$.txt

HASH_OLD=`openssl dgst -sha1 masters_cdf_metadata_file_update_check_variable_attribute_list_old_$$.txt | awk '{ print $2 }'`

HASH_NEW=`openssl dgst -sha1 masters_cdf_metadata_file_update_check_variable_attribute_list_new_$$.txt | awk '{ print $2 }'`

if [ $VARIABLE_ATTRIBUTE_UNIQ_NUM != 2 ] || [ $HASH_OLD == $HASH_NEW ]; then

   printf "%s\n\nVariable Attribute List Unchanged\n\n%s\n" $DASHES $DASHES

else

   CHECK_NUM_TOTAL_OLD=0

   VARIABLE_ATTRIBUTE_OLD_LIST=`cat masters_cdf_metadata_file_update_check_variable_attribute_list_old_$$.txt`

   for VARIABLE_ATTRIBUTE_OLD in $VARIABLE_ATTRIBUTE_OLD_LIST

   do

       CHECK_NUM=`grep -c ^$VARIABLE_ATTRIBUTE_OLD$ masters_cdf_metadata_file_update_check_variable_attribute_list_new_$$.txt`

       CHECK_NUM_TOTAL_OLD=$((CHECK_NUM_TOTAL_OLD+CHECK_NUM))

   done

   CHECK_NUM_TOTAL_NEW=0

   VARIABLE_ATTRIBUTE_NEW_LIST=`cat masters_cdf_metadata_file_update_check_variable_attribute_list_new_$$.txt`

   for VARIABLE_ATTRIBUTE_NEW in $VARIABLE_ATTRIBUTE_NEW_LIST

   do

       CHECK_NUM=`grep -c ^$VARIABLE_ATTRIBUTE_NEW$ masters_cdf_metadata_file_update_check_variable_attribute_list_new_$$.txt`

       CHECK_NUM_TOTAL_NEW=$((CHECK_NUM_TOTAL_NEW+CHECK_NUM))

   done

   CHECK_NUM_TOTAL=$((CHECK_NUM_TOTAL_OLD+CHECK_NUM_TOTAL_NEW))

   if [ $CHECK_NUM_TOTAL -gt 0 ]; then

      printf "\nVariable Attribute List Updated:\n%s\n"

      VARIABLE_ATTRIBUTE_OLD_LIST=`cat masters_cdf_metadata_file_update_check_variable_attribute_list_old_$$.txt`

      for VARIABLE_ATTRIBUTE_OLD in $VARIABLE_ATTRIBUTE_OLD_LIST

      do

          CHECK_NUM=`grep -c ^$VARIABLE_ATTRIBUTE_OLD$ masters_cdf_metadata_file_update_check_variable_attribute_list_new_$$.txt`

          if [ $CHECK_NUM -eq 0 ]; then printf "Old Variable Attribute Deleted: %s\n" $VARIABLE_ATTRIBUTE_OLD; fi

      done

      VARIABLE_ATTRIBUTE_NEW_LIST=`cat masters_cdf_metadata_file_update_check_variable_attribute_list_new_$$.txt`

      for VARIABLE_ATTRIBUTE_NEW in $VARIABLE_ATTRIBUTE_NEW_LIST

      do

          CHECK_NUM=`grep -c ^$VARIABLE_ATTRIBUTE_NEW$ masters_cdf_metadata_file_update_check_variable_attribute_list_old_$$.txt`

          if [ $CHECK_NUM -eq 0 ]; then printf "New Variable Attribute Added:   %s\n" $VARIABLE_ATTRIBUTE_NEW; fi

      done

      printf "\n%s\n" $DASHES

   fi

fi

rm masters_cdf_metadata_file_update_check_variable_attribute_list_[no][el][dw]_$$.txt

