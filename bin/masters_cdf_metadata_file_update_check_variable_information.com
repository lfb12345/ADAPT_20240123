
MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_OLD=$1

MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_NEW=$2

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

VARIABLE_INFORMATION_UNIQ_NUM=`grep -h ^'Variable\ Information\ ([0-9][0-9]*\ rVariables*,\ [0-9][0-9]*\ zVariables*)'$ $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_OLD $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_NEW | uniq | wc -l | awk '{ print $1 }'`

if [ $VARIABLE_INFORMATION_UNIQ_NUM == 2 ]; then

   printf "%s\n\nVariable Information Member List Number Updated:\n\n" $DASHES

   grep -h ^'Variable\ Information\ ([0-9][0-9]*\ rVariables*,\ [0-9][0-9]*\ zVariables*)'$ $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_OLD | sed 's/^/OLD:   /'

   grep -h ^'Variable\ Information\ ([0-9][0-9]*\ rVariables*,\ [0-9][0-9]*\ zVariables*)'$ $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_NEW | sed 's/^/NEW:   /'

fi

VARIABLE_INFORMATION_UNIQ_NUM=`grep -h ^'Variable\ Information\ ([0-9][0-9]*\ rVariables*,\ [0-9][0-9]*\ zVariables*)'$ $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_OLD $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_NEW | uniq | wc -l | awk '{ print $1 }'`

grep ^'[A-z]' $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_OLD | grep -v ^'Variable\ Information\ ([1-9][0-9]*\ rVariables*,\ [0-9][0-9]*\ zVariables*)'$ | awk '{ print $1 }' | sort &> masters_cdf_metadata_file_update_check_variable_information_list_old_$$.txt

grep ^'[A-z]' $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_NEW | grep -v ^'Variable\ Information\ ([1-9][0-9]*\ rVariables*,\ [0-9][0-9]*\ zVariables*)'$ | awk '{ print $1 }' | sort &> masters_cdf_metadata_file_update_check_variable_information_list_new_$$.txt

HASH_OLD=`openssl dgst -sha1 masters_cdf_metadata_file_update_check_variable_information_list_old_$$.txt | awk '{ print $2 }'`

HASH_NEW=`openssl dgst -sha1 masters_cdf_metadata_file_update_check_variable_information_list_new_$$.txt | awk '{ print $2 }'`

if [ $VARIABLE_INFORMATION_UNIQ_NUM != 2 ] || [ $HASH_OLD == $HASH_NEW ]; then

   printf "%s\n\nVariable Information Member List Unchanged\n\n%s\n" $DASHES $DASHES

else

   CHECK_NUM_TOTAL_OLD=0

   VARIABLE_INFORMATION_OLD_LIST=`cat masters_cdf_metadata_file_update_check_variable_information_list_old_$$.txt`

   for VARIABLE_INFORMATION_OLD in $VARIABLE_INFORMATION_OLD_LIST

   do

       CHECK_NUM=`grep -c ^$VARIABLE_INFORMATION_OLD$ masters_cdf_metadata_file_update_check_variable_information_list_new_$$.txt`

       CHECK_NUM_TOTAL_OLD=$((CHECK_NUM_TOTAL_OLD+CHECK_NUM))

   done

   CHECK_NUM_TOTAL_NEW=0

   VARIABLE_INFORMATION_NEW_LIST=`cat masters_cdf_metadata_file_update_check_variable_information_list_new_$$.txt`

   for VARIABLE_INFORMATION_NEW in $VARIABLE_INFORMATION_NEW_LIST

   do

       CHECK_NUM=`grep -c ^$VARIABLE_INFORMATION_NEW$ masters_cdf_metadata_file_update_check_variable_information_list_new_$$.txt`

       CHECK_NUM_TOTAL_NEW=$((CHECK_NUM_TOTAL_NEW+CHECK_NUM))

   done

   CHECK_NUM_TOTAL=$((CHECK_NUM_TOTAL_OLD+CHECK_NUM_TOTAL_NEW))

   if [ $CHECK_NUM_TOTAL -gt 0 ]; then

      printf "\nVariable Information Member List Updated\n%s\n"

      VARIABLE_INFORMATION_OLD_LIST=`cat masters_cdf_metadata_file_update_check_variable_information_list_old_$$.txt`

      for VARIABLE_INFORMATION_OLD in $VARIABLE_INFORMATION_OLD_LIST

      do

          CHECK_NUM=`grep -c ^$VARIABLE_INFORMATION_OLD$ masters_cdf_metadata_file_update_check_variable_information_list_new_$$.txt`

          VARIABLE_INFORMATION_TEXT_OLD=`grep ^$VARIABLE_INFORMATION_OLD'\ ' $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_OLD | sed 's/\ /|/g' | sed 's/	/XXX/g'`

          if [ $CHECK_NUM -eq 0 ]; then printf "Old Variable Information List Member Deleted: %s\n" $VARIABLE_INFORMATION_TEXT_OLD | sed 's/|/ /g' | sed 's/XXX/	/g'; fi

      done

      VARIABLE_INFORMATION_NEW_LIST=`cat masters_cdf_metadata_file_update_check_variable_information_list_new_$$.txt`

      for VARIABLE_INFORMATION_NEW in $VARIABLE_INFORMATION_NEW_LIST

      do

          CHECK_NUM=`grep -c ^$VARIABLE_INFORMATION_NEW$ masters_cdf_metadata_file_update_check_variable_information_list_old_$$.txt`

          VARIABLE_INFORMATION_TEXT_NEW=`grep ^$VARIABLE_INFORMATION_NEW'\ ' $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_NEW | sed 's/\ /|/g' | sed 's/	/XXX/g'`

          if [ $CHECK_NUM -eq 0 ]; then printf "New Variable Information List Member Added:   %s\n" $VARIABLE_INFORMATION_TEXT_NEW | sed 's/|/ /g' | sed 's/XXX/	/g'; fi

      done

      printf "\n%s\n" $DASHES

   fi

fi

VARIABLE_INFORMATION_OLD_NEW_NUM=`grep -h ^'[A-z]' $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_OLD $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_NEW | grep -v ^'Variable\ Information\ ([0-9][0-9]*\ rVariables*,\ [0-9][0-9]*\ zVariables*)'$ | awk '{ print $1 }' | sort | uniq -c | grep ^'\ \ \ 2\ ' | awk '{ print $2 }' | wc -l | awk '{ print $1 }'`

if [ $VARIABLE_INFORMATION_OLD_NEW_NUM -gt 0 ]; then

   VARIABLE_INFORMATION_OLD_NEW_LIST=`grep -h ^'[A-z]' $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_OLD $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_NEW | grep -v ^'Variable\ Information\ ([0-9][0-9]*\ rVariables*,\ [0-9][0-9]*\ zVariables*)'$ | awk '{ print $1 }' | sort | uniq -c | grep ^'\ \ \ 2\ ' | awk '{ print $2 }'`

   VARIABLE_INFORMATION_OLD_NEW_UPDATE_NUM=0

   for VARIABLE_INFORMATION_OLD_NEW in $VARIABLE_INFORMATION_OLD_NEW_LIST

   do

       HASH_OLD=`grep ^$VARIABLE_INFORMATION_OLD_NEW'\ ' $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_OLD | openssl dgst -sha1 | awk '{ print $2 }'`

       HASH_NEW=`grep ^$VARIABLE_INFORMATION_OLD_NEW'\ ' $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_NEW | openssl dgst -sha1 | awk '{ print $2 }'`

       if [ $HASH_OLD != $HASH_NEW ]; then VARIABLE_INFORMATION_OLD_NEW_UPDATE_NUM=$((VARIABLE_INFORMATION_OLD_NEW_UPDATE_NUM+1)); fi

   done

   if [ $VARIABLE_INFORMATION_OLD_NEW_UPDATE_NUM -gt 0 ]; then

      printf "\nUpdated Variable Information List Member Specifications:\n\n"

      for VARIABLE_INFORMATION_OLD_NEW in $VARIABLE_INFORMATION_OLD_NEW_LIST

      do

          HASH_OLD=`grep ^$VARIABLE_INFORMATION_OLD_NEW'\ ' $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_OLD | openssl dgst -sha1 | awk '{ print $2 }'`

          HASH_NEW=`grep ^$VARIABLE_INFORMATION_OLD_NEW'\ ' $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_NEW | openssl dgst -sha1 | awk '{ print $2 }'`

          if [ $HASH_OLD != $HASH_NEW ]; then

             grep ^$VARIABLE_INFORMATION_OLD_NEW'\ ' $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_OLD | sed 's/^/OLD:   /'

             grep ^$VARIABLE_INFORMATION_OLD_NEW'\ ' $MASTER_CDF_METADATA_VARIABLE_INFORMATION_FILE_NAME_NEW | sed 's/^/NEW:   /'

             echo

          fi

      done

      printf "%s\n" $DASHES

   fi

fi

rm masters_cdf_metadata_file_update_check_variable_information_list_[no][el][dw]_$$.txt

