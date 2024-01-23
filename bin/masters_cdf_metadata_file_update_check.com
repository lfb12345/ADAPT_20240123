
MASTER_CDF_METADATA_DIRECTORY_NEW=$1

MASTER_CDF_METADATA_PARTITION_FILE_NAME_OLD=$2

MASTER_CDF_METADATA_PARTITION_FILE_NAME_NEW=$3

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

DATA_PRODUCT_ID=`basename $MASTER_CDF_METADATA_PARTITION_FILE_NAME_NEW | sed 's/_00000000_v01\.metadata$//'`

DATA_PRODUCT_ID_LOWER=`echo $DATA_PRODUCT_ID | tr 'A-Z' 'a-z'`

DATA_PRODUCT_ID_UPPER=`echo $DATA_PRODUCT_ID | tr 'a-z' 'A-Z'`

MASTER_CDF_METADATA_FILE_HEADER_FILE_NAME_ROOT=$MASTER_CDF_METADATA_DIRECTORY_NEW/PARTITION

printf "%s\n%s\n\nNew Master CDF Metadata Directory:   %s\nNew Master CDF Metadata File Name:   %s\nOld Master CDF Metadata Data File:   %s\n\n%s\n" $HASHES $DASHES $MASTER_CDF_METADATA_DIRECTORY_NEW $MASTER_CDF_METADATA_PARTITION_FILE_NAME_NEW $MASTER_CDF_METADATA_PARTITION_FILE_NAME_OLD $DASHES

LINE_NUM_TOTAL=0

for PARTITION in FILE_HEADER GLOBAL_ATTRIBUTE VARIABLE_ATTRIBUTE VARIABLE_INFORMATION VARIABLE_METADATA

do

    echo

    for VERSION_OLD_NEW in OLD NEW

    do

        if [ $VERSION_OLD_NEW == "OLD" ]; then

           MASTER_CDF_METADATA_PARTITION_FILE_NAME=$MASTER_CDF_METADATA_PARTITION_FILE_NAME_OLD

        else

           MASTER_CDF_METADATA_PARTITION_FILE_NAME=$MASTER_CDF_METADATA_PARTITION_FILE_NAME_NEW

        fi

        masters_cdf_metadata_file_partition.com $MASTER_CDF_METADATA_DIRECTORY_NEW $PARTITION $VERSION_OLD_NEW $MASTER_CDF_METADATA_PARTITION_FILE_NAME

    done

done

printf "\n%s\n" $DASHES

for PARTITION in FILE_HEADER GLOBAL_ATTRIBUTE VARIABLE_ATTRIBUTE VARIABLE_INFORMATION VARIABLE_METADATA

do

    PARTITION_LOWER=`echo $PARTITION | tr 'A-Z' 'a-z'`

    PARTITION_UPPER=`echo $PARTITION | tr 'a-z' 'A-Z'`

    diff $MASTER_CDF_METADATA_DIRECTORY_NEW/PARTITION/[NO][EL][DW]/$DATA_PRODUCT_ID_LOWER'_00000000_v01_'$PARTITION_LOWER'.txt' | grep -v ^'---'$ | sed '/^[1-9]/{x;p;x;}' &> masters_cdf_metadata_file_update_check_$$.txt

    LINE_NUM=`wc -l masters_cdf_metadata_file_update_check_$$.txt | awk '{ print $1 }'`

    LINE_NUM_TOTAL=$((LINE_NUM_TOTAL+LINE_NUM))

    PARTITION_TEXT=`echo $PARTITION_LOWER | sed 's/_/\ /g' | awk '{ for (j=1;j<=NF;j++) { $j=toupper(substr($j,1,1)) substr($j,2) } } 1'`

    if [ $LINE_NUM -gt 0 ] || [ $PARTITION == VARIABLE_ATTRIBUTE ]; then

       case $PARTITION in

            FILE_HEADER)          printf "\nMaster CDF %s %s Differences:\n" $PARTITION_TEXT

                                  cat masters_cdf_metadata_file_update_check_$$.txt

                                  printf "\n%s" $DASHES;;

            GLOBAL_ATTRIBUTE)     masters_cdf_metadata_file_update_check_global_attribute.com $MASTER_CDF_METADATA_DIRECTORY_NEW/PARTITION/OLD/$DATA_PRODUCT_ID_LOWER'_00000000_v01_'$PARTITION_LOWER'.txt' $MASTER_CDF_METADATA_DIRECTORY_NEW/PARTITION/NEW/$DATA_PRODUCT_ID_LOWER'_00000000_v01_'$PARTITION_LOWER'.txt';;

            VARIABLE_ATTRIBUTE)   masters_cdf_metadata_file_update_check_variable_attribute_list.com $MASTER_CDF_METADATA_DIRECTORY_NEW/PARTITION/OLD/$DATA_PRODUCT_ID_LOWER'_00000000_v01_'$PARTITION_LOWER'.txt' $MASTER_CDF_METADATA_DIRECTORY_NEW/PARTITION/NEW/$DATA_PRODUCT_ID_LOWER'_00000000_v01_'$PARTITION_LOWER'.txt';;

            VARIABLE_INFORMATION) masters_cdf_metadata_file_update_check_variable_information.com $MASTER_CDF_METADATA_DIRECTORY_NEW/PARTITION/OLD/$DATA_PRODUCT_ID_LOWER'_00000000_v01_'$PARTITION_LOWER'.txt' $MASTER_CDF_METADATA_DIRECTORY_NEW/PARTITION/NEW/$DATA_PRODUCT_ID_LOWER'_00000000_v01_'$PARTITION_LOWER'.txt';;

            VARIABLE_METADATA)    masters_cdf_metadata_file_update_check_variable_metadata.com $MASTER_CDF_METADATA_DIRECTORY_NEW/PARTITION/OLD/$DATA_PRODUCT_ID_LOWER'_00000000_v01_'$PARTITION_LOWER'.txt' $MASTER_CDF_METADATA_DIRECTORY_NEW/PARTITION/NEW/$DATA_PRODUCT_ID_LOWER'_00000000_v01_'$PARTITION_LOWER'.txt';;

       esac

    fi

    rm masters_cdf_metadata_file_update_check_$$.txt

done

printf "%s\n" $HASHES

