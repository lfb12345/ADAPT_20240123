
MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD=$1

MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW=$2

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

grep ^'[A-z]' $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_OLD | grep -v ^'Global\ Attributes\ ([1-9][0-9]*\ attributes)'$ | awk '{ print $1 }' | sort &> masters_cdf_metadata_file_update_check_global_attribute_list_old_$$.txt

grep ^'[A-z]' $MASTER_CDF_METADATA_GLOBAL_ATTRIBUTE_FILE_NAME_NEW | grep -v ^'Global\ Attributes\ ([1-9][0-9]*\ attributes)'$ | awk '{ print $1 }' | sort &> masters_cdf_metadata_file_update_check_global_attribute_list_new_$$.txt

HASH_OLD=`openssl dgst -sha1 masters_cdf_metadata_file_update_check_global_attribute_list_old_$$.txt | awk '{ print $2 }'`

HASH_NEW=`openssl dgst -sha1 masters_cdf_metadata_file_update_check_global_attribute_list_new_$$.txt | awk '{ print $2 }'`

if [ $HASH_OLD == $HASH_NEW ]; then

   printf "%s\n\nGlobal Attribute List Unchanged\n\n%s\n" $DASHES $DASHES

else

   CHECK_NUM_TOTAL_OLD=0

   GLOBAL_PARAMETER_OLD_LIST=`cat masters_cdf_metadata_file_update_check_global_attribute_list_old_$$.txt`

   for GLOBAL_PARAMETER_OLD in $GLOBAL_PARAMETER_OLD_LIST

   do

       CHECK_NUM=`grep -c ^$GLOBAL_PARAMETER_OLD$ masters_cdf_metadata_file_update_check_global_attribute_list_new_$$.txt`

       CHECK_NUM_TOTAL_OLD=$((CHECK_NUM_TOTAL_OLD+CHECK_NUM))

   done

   CHECK_NUM_TOTAL_NEW=0

   GLOBAL_PARAMETER_NEW_LIST=`cat masters_cdf_metadata_file_update_check_global_attribute_list_new_$$.txt`

   for GLOBAL_PARAMETER_NEW in $GLOBAL_PARAMETER_NEW_LIST

   do

       CHECK_NUM=`grep -c ^$GLOBAL_PARAMETER_NEW$ masters_cdf_metadata_file_update_check_global_attribute_list_new_$$.txt`

       CHECK_NUM_TOTAL_NEW=$((CHECK_NUM_TOTAL_NEW+CHECK_NUM))

   done

   CHECK_NUM_TOTAL=$((CHECK_NUM_TOTAL_OLD+CHECK_NUM_TOTAL_NEW))

   if [ $CHECK_NUM_TOTAL -gt 0 ]; then

      printf "%s\n\nGlobal Attribute List Updated\n%s\n" $DASHES

      GLOBAL_PARAMETER_OLD_LIST=`cat masters_cdf_metadata_file_update_check_global_attribute_list_old_$$.txt`

      for GLOBAL_PARAMETER_OLD in $GLOBAL_PARAMETER_OLD_LIST

      do

          CHECK_NUM=`grep -c ^$GLOBAL_PARAMETER_OLD$ masters_cdf_metadata_file_update_check_global_attribute_list_new_$$.txt`

          if [ $CHECK_NUM -eq 0 ]; then printf "Global Attribute Deleted:   %s\n" $GLOBAL_PARAMETER_OLD; fi

      done

      GLOBAL_PARAMETER_NEW_LIST=`cat masters_cdf_metadata_file_update_check_global_attribute_list_new_$$.txt`

      for GLOBAL_PARAMETER_NEW in $GLOBAL_PARAMETER_NEW_LIST

      do

          CHECK_NUM=`grep -c ^$GLOBAL_PARAMETER_NEW$ masters_cdf_metadata_file_update_check_global_attribute_list_old_$$.txt`

          if [ $CHECK_NUM -eq 0 ]; then printf "Global Attribute Added:     %s\n" $GLOBAL_PARAMETER_NEW; fi

      done

      printf "\n%s\n" $DASHES

   fi

fi

rm masters_cdf_metadata_file_update_check_global_attribute_list_[no][el][dw]_$$.txt

