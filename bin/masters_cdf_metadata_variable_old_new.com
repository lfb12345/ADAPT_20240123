
METADATA_FILE_NAME_OLD=$1

METADATA_FILE_NAME_NEW=$2

PRODUCT_KEY_OLD=`basename $METADATA_FILE_NAME_OLD | sed 's/_00000000_v01.metadata$//'`

PRODUCT_KEY_NEW=`basename $METADATA_FILE_NAME_NEW | sed 's/_00000000_v01.metadata$//'`

if [ $PRODUCT_KEY_OLD == $PRODUCT_KEY_NEW ]; then

   masters_cdf_metadata_file_unit.com $METADATA_FILE_NAME_OLD VARIABLE_INFORMATION | grep '\ CDF_' | awk '{ print $1 }' | sed 's/^/OOO	'$PRODUCT_KEY_OLD'	/'

   masters_cdf_metadata_file_unit.com $METADATA_FILE_NAME_OLD VARIABLE_INFORMATION | grep '\ CDF_' | awk '{ print $1 }' &> aaa_old_$$.txt

   masters_cdf_metadata_file_unit.com $METADATA_FILE_NAME_NEW VARIABLE_INFORMATION | grep '\ CDF_' | awk '{ print $1 }' &> aaa_new_$$.txt

   VARIABLE_DIFF_LIST=`sort aaa_old_$$.txt aaa_new_$$.txt | uniq -c | sort -n | sed 's/\ \ *//' | sed 's/\ /	/' | grep ^'1	' | awk 'BEGIN { FS="	" } ; { print $2 }'`

   VARIABLE_COMMON_LIST=`sort aaa_old_$$.txt aaa_new_$$.txt | uniq -c | sort -n | sed 's/\ \ *//' | sed 's/\ /	/' | grep ^'2	' | awk 'BEGIN { FS="	" } ; { print $2 }'`

#  for VARIABLE_COMMON in $VARIABLE_COMMON_LIST

#  do

#      echo OOO'	'$PRODUCT_KEY_OLD'	'$VARIABLE_COMMON

#  done

   for VARIABLE_DIFF in $VARIABLE_DIFF_LIST

   do

       MATCH_OLD_NEW=`grep -c ^$VARIABLE_DIFF$ aaa_old_$$.txt`

       if [ $MATCH_OLD_NEW -eq 1 ]; then

          VARIABLE_OLD_NEW=OLD

       else

          VARIABLE_OLD_NEW=NEW

       fi

       echo $VARIABLE_OLD_NEW'	'$PRODUCT_KEY_OLD'	'$VARIABLE_DIFF

   done

   rm aaa_old_$$.txt

   rm aaa_new_$$.txt

fi

