
MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_OLD=$1

MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_NEW=$2

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

VARIABLE_METADATA_UNIQ_NUM=`grep -h ^'Variable\ ([1-9][0-9]*\ variables)'$ $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_OLD $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_NEW | uniq | wc -l | awk '{ print $1 }'`

if [ $VARIABLE_METADATA_UNIQ_NUM == 2 ]; then

   printf "%s\n\nVariable Metadata List Number Updated:\n\n" $DASHES

   grep -h ^'Variable\ ([1-9][0-9]*\ variables*)'$ $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_OLD | sed 's/^/OLD:   /'

   grep -h ^'Variable\ ([1-9][0-9]*\ variables*)'$ $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_NEW | sed 's/^/NEW:   /'

   printf "\n%s\n" $DASHES

fi

grep ^'[A-z]' $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_OLD | grep -v ^'Variable\ ([1-9][0-9]*\ variables)'$ | grep -v ^'Attribute Entries:' | awk '{ print $1 } ' | sort &> masters_cdf_metadata_file_update_check_variable_metadata_list_old_$$.txt

MASTERS_CDF_METADATA_FILE_UPDATE_CHECK_VARIABLE_METADATA_LIST_OLD_NUM=`wc -l masters_cdf_metadata_file_update_check_variable_metadata_list_old_$$.txt | awk '{ print $1 }'`

HASH_OLD=`openssl dgst -sha1 masters_cdf_metadata_file_update_check_variable_metadata_list_old_$$.txt | awk '{ print $2 }'`

grep ^'[A-z]' $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_NEW | grep -v ^'Variable\ ([1-9][0-9]*\ variables)'$ | grep -v ^'Attribute Entries:' | awk '{ print $1 } ' | sort &> masters_cdf_metadata_file_update_check_variable_metadata_list_new_$$.txt

MASTERS_CDF_METADATA_FILE_UPDATE_CHECK_VARIABLE_METADATA_LIST_NEW_NUM=`wc -l masters_cdf_metadata_file_update_check_variable_metadata_list_new_$$.txt | awk '{ print $1 }'`

HASH_NEW=`openssl dgst -sha1 masters_cdf_metadata_file_update_check_variable_metadata_list_new_$$.txt | awk '{ print $2 }'`

VARIABLE_COMMON_LIST=`sort masters_cdf_metadata_file_update_check_variable_metadata_list_[no][el][dw]_$$.txt | uniq -c | awk '{ if ($1==2) print $2 }'`

VARIABLE_COMMON_LIST_NUM=`echo $VARIABLE_COMMON_LIST | awk '{ print NF }'`

for VARIABLE_COMMON in $VARIABLE_COMMON_LIST

do

    VARIABLE_LIST_ORDER_OLD_NUM=`grep ^$VARIABLE_COMMON'\ ' $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_OLD | awk 'BEGIN { FS="[ ()]" } ; { print $4 }'`

    VARIABLE_LIST_ORDER_NEW_NUM=`grep ^$VARIABLE_COMMON'\ ' $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_NEW | awk 'BEGIN { FS="[ ()]" } ; { print $4 }'`

    if [ $VARIABLE_LIST_ORDER_OLD_NUM == $VARIABLE_LIST_ORDER_NEW_NUM ]; then

       STATUS='Variable List Number Matched'

    else

       STATUS='Variable List Number Updated'

    fi

    echo $STATUS'	'$VARIABLE_LIST_ORDER_OLD_NUM'	'$VARIABLE_LIST_ORDER_NEW_NUM'	'$VARIABLE_COMMON >> masters_cdf_metadata_file_update_check_variable_metadata_common_$$.txt

done

VARIABLE_COMMON_SORT_LIST=`sort -nk3 masters_cdf_metadata_file_update_check_variable_metadata_common_$$.txt | awk 'BEGIN { FS="	" } ; { print $NF }'`

for VARIABLE_COMMON_SORT in $VARIABLE_COMMON_SORT_LIST

do

    HASH_OLD=`masters_cdf_metadata_file_update_check_variable_metadata_content.com $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_OLD $VARIABLE_COMMON_SORT | openssl dgst -sha1 | awk '{ print $2 }'`

    HASH_NEW=`masters_cdf_metadata_file_update_check_variable_metadata_content.com $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_NEW $VARIABLE_COMMON_SORT | openssl dgst -sha1 | awk '{ print $2 }'`

    if [ $HASH_OLD != $HASH_NEW ]; then

       printf "%s\n\n" $DASHES

       grep '	'$VARIABLE_COMMON_SORT$ masters_cdf_metadata_file_update_check_variable_metadata_common_$$.txt

       masters_cdf_metadata_file_update_check_variable_metadata_content.com $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_OLD $VARIABLE_COMMON_SORT &> masters_cdf_metadata_file_update_check_variable_metadata_content_old_$$.txt

       masters_cdf_metadata_file_update_check_variable_metadata_content.com $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_NEW $VARIABLE_COMMON_SORT &> masters_cdf_metadata_file_update_check_variable_metadata_content_new_$$.txt

       diff masters_cdf_metadata_file_update_check_variable_metadata_content_[no][el][dw]_$$.txt | grep -v ^'---'$ | sed 's/	/       /' | sed 's/^</OLD:   /' | sed 's/^>/NEW:   /' | sed '/^[1-9]/{x;p;x;}'

       printf "\n%s\n" $DASHES

       rm masters_cdf_metadata_file_update_check_variable_metadata_content_[no][el][dw]_$$.txt

    fi

done

VARIABLE_DIFF_LIST=`sort masters_cdf_metadata_file_update_check_variable_metadata_list_[no][el][dw]_$$.txt | uniq -c | awk '{ if ($1==1) print $2 }'`

VARIABLE_DIFF_LIST_NUM=`echo $VARIABLE_DIFF_LIST | awk '{ print NF }'`

if [ $VARIABLE_DIFF_LIST_NUM -gt 0 ]; then

   printf "\nVariable Diff List Num:   %s\n\n" $VARIABLE_DIFF_LIST_NUM

   for VARIABLE_DIFF in $VARIABLE_DIFF_LIST

   do

       VARIABLE_LIST_ORDER_OLD_NUM=`grep ^$VARIABLE_DIFF'\ ' $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_OLD | awk 'BEGIN { FS="[ ()]" } ; { print $4 }'`

       if [ ! $VARIABLE_LIST_ORDER_OLD_NUM ]; then VARIABLE_LIST_ORDER_OLD_NUM='XXX'; fi

       VARIABLE_LIST_ORDER_NEW_NUM=`grep ^$VARIABLE_DIFF'\ ' $MASTER_CDF_METADATA_VARIABLE_METADATA_FILE_NAME_NEW | awk 'BEGIN { FS="[ ()]" } ; { print $4 }'`

       if [ ! $VARIABLE_LIST_ORDER_NEW_NUM ]; then VARIABLE_LIST_ORDER_NEW_NUM='XXX'; fi

       STATUS=ASTRO

       echo $STATUS'	'$VARIABLE_LIST_ORDER_OLD_NUM'	'$VARIABLE_LIST_ORDER_NEW_NUM'	'$VARIABLE_DIFF >> masters_cdf_metadata_file_update_check_variable_metadata_diff_$$.txt

   done

   VARIABLE_OLD_NUM=`awk 'BEGIN { FS="	" } ; { if ($2!="XXX") print $0 }' masters_cdf_metadata_file_update_check_variable_metadata_diff_$$.txt | wc -l | awk '{ print $1 }'`

   if [ $VARIABLE_OLD_NUM -gt 0 ]; then

      printf "%s\n\nOld Variable List, Deleted Num:   %s\n\n" $DASHES $VARIABLE_OLD_NUM

      awk 'BEGIN { FS="	" } ; { if ($2!="XXX") print $0 }' masters_cdf_metadata_file_update_check_variable_metadata_diff_$$.txt | sort -nk2

   fi

   VARIABLE_NEW_NUM=`awk 'BEGIN { FS="	" } ; { if ($3!="XXX") print $0 }' masters_cdf_metadata_file_update_check_variable_metadata_diff_$$.txt | wc -l | awk '{ print $1 }'`

   if [ $VARIABLE_NEW_NUM -gt 0 ]; then

      printf "%s\n\nNew Variable List, Added Num:     %s\n\n" $DASHES $VARIABLE_NEW_NUM

      awk 'BEGIN { FS="	" } ; { if ($3!="XXX") print $0 }' masters_cdf_metadata_file_update_check_variable_metadata_diff_$$.txt | sort -nk3

   fi

   printf "\n%s\n" $DASHES

   rm masters_cdf_metadata_file_update_check_variable_metadata_diff_$$.txt

fi

rm masters_cdf_metadata_file_update_check_variable_metadata_list_[no][el][dw]_$$.txt masters_cdf_metadata_file_update_check_variable_metadata_common_$$.txt

#
#  (No: 4) (Recs: 0) (Compression: GZIP.6)
#

