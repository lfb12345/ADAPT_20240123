
DATE=$1

if [ ! $DATE ]; then DATE=`date "+%Y%m%d"`; fi

DIRECTORY=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_$DATE

if [ ! -d $DIRECTORY ]; then mkdir -p $DIRECTORY; fi

if [ ! -d $DIRECTORY/MASTER_TAR ]; then mkdir -p $DIRECTORY/MASTER_TAR; fi

if [ ! -d $DIRECTORY/MASTER_FILES ]; then mkdir -p $DIRECTORY/MASTER_FILES; fi

cdaweb_to_spase.com $DATE

curl -ksS https://spdf.gsfc.nasa.gov/pub/software/cdawlib/0MASTERS/master.tar &> $DIRECTORY/MASTER_TAR/master_$DATE.tar

tar -xvf $DIRECTORY/MASTER_TAR/master_$DATE.tar -C $DIRECTORY/MASTER_TAR &> $DIRECTORY/MASTER_TAR/master_tar_file_list_$DATE.txt

gzip $DIRECTORY/MASTER_TAR/master_$DATE.tar

sed 's/^x\ //' $DIRECTORY/MASTER_TAR/master_tar_file_list_$DATE.txt | sort &> spdf_master_survey_$$.txt

mv spdf_master_survey_$$.txt $DIRECTORY/MASTER_TAR/master_tar_file_list_$DATE.txt

curl -ksS https://spdf.gsfc.nasa.gov/pub/software/cdawlib/0MASTERS/ &> $DIRECTORY/software_cdawlib_masters_$DATE.html

grep ^'<tr><td><a href="[a-z]' $DIRECTORY/software_cdawlib_masters_$DATE.html | awk 'BEGIN { FS="[<>]" } ; { print $7"	"$13"	"$17 }' | sed 's/\ /T/' | sed 's/\ //g' >& $DIRECTORY/software_cdawlib_masters_$DATE.tab

awk 'BEGIN { FS="	" } ; { print $1 }' $DIRECTORY/software_cdawlib_masters_$DATE.tab | grep '_v01\.cdf$' | grep -iv '_000000_v01\.cdf'$ | tr 'A-Z' 'a-z' | sed 's/_00000000//' | sed 's/_v01\.cdf$//' | tr 'a-z' 'A-Z' &> $DIRECTORY/spdf_master_survey_$DATE'_000.txt'

cat $DIRECTORY/MASTER_TAR/master_tar_file_list_$DATE.txt | tr 'A-Z' 'a-z' | sed 's/_00000000_v01.cdf$//' | tr 'a-z' 'A-Z' &> $DIRECTORY/spdf_master_survey_$DATE'_111.txt'

DATA_PRODUCT_ID_UPPER_LIST=`cat $DIRECTORY/spdf_master_survey_$DATE'_000.txt'`

for DATA_PRODUCT_ID_UPPER in $DATA_PRODUCT_ID_UPPER_LIST

do

    DATA_PRODUCT_ID_LOWER=`echo $DATA_PRODUCT_ID_UPPER | tr 'A-Z' 'a-z'`

    CDF_FILE_NAME=$DATA_PRODUCT_ID_LOWER'_00000000_v01.cdf'

    if [ $DATA_PRODUCT_ID_LOWER == voyager1_48sec_magneticfield_nearterminationshock ]; then CDF_FILE_NAME=$DATA_PRODUCT_ID_LOWER'_v01.cdf'; fi

    if [ $DATA_PRODUCT_ID_LOWER == voyager2_48sec_magneticfield_nearterminationshock ]; then CDF_FILE_NAME=$DATA_PRODUCT_ID_LOWER'_v01.cdf'; fi

    curl -ksS https://spdf.gsfc.nasa.gov/pub/software/cdawlib/0MASTERS/$CDF_FILE_NAME &> $DIRECTORY/MASTER_FILES/$CDF_FILE_NAME

    METADATA_FILE_NAME=`echo $CDF_FILE_NAME | sed 's/\.cdf$/.metadata/'`

    cdfdump -dump metadata $DIRECTORY/MASTER_FILES/$CDF_FILE_NAME &> $DIRECTORY/MASTER_FILES/$METADATA_FILE_NAME

done

DATA_PRODUCT_ID_UPPER_LIST=`cat $DIRECTORY/spdf_master_survey_$DATE'_111.txt'`

for DATA_PRODUCT_ID_UPPER in $DATA_PRODUCT_ID_UPPER_LIST

do

    DATA_PRODUCT_ID_LOWER=`echo $DATA_PRODUCT_ID_UPPER | tr 'A-Z' 'a-z'`

    CDF_FILE_NAME=$DATA_PRODUCT_ID_LOWER'_00000000_v01.cdf'

    if [ $DATA_PRODUCT_ID_LOWER == voyager1_48sec_magneticfield_nearterminationshock ]; then CDF_FILE_NAME=$DATA_PRODUCT_ID_LOWER'_v01.cdf'; fi

    if [ $DATA_PRODUCT_ID_LOWER == voyager2_48sec_magneticfield_nearterminationshock ]; then CDF_FILE_NAME=$DATA_PRODUCT_ID_LOWER'_v01.cdf'; fi

    METADATA_FILE_NAME=`echo $CDF_FILE_NAME | sed 's/\.cdf$/.metadata/'`

    cdfdump -dump metadata $DIRECTORY/MASTER_TAR/$CDF_FILE_NAME &> $DIRECTORY/MASTER_TAR/$METADATA_FILE_NAME

done

DATA_PRODUCT_ID_UPPER_LIST=`sort $DIRECTORY/spdf_master_survey_$DATE'_'[01][01][01].txt | uniq`

if [ -e $DIRECTORY/data_product_id_list_$DATE.tab ]; then rm $DIRECTORY/data_product_id_list_$DATE.tab; fi

for DATA_PRODUCT_ID_UPPER in $DATA_PRODUCT_ID_UPPER_LIST

do

    NUM_000=`grep -c ^$DATA_PRODUCT_ID_UPPER$ $DIRECTORY/spdf_master_survey_$DATE'_000.txt'`

    NUM_111=`grep -c ^$DATA_PRODUCT_ID_UPPER$ $DIRECTORY/spdf_master_survey_$DATE'_111.txt'`

    NUM_TOT=$((NUM_000+NUM_111))

    printf "%s\t%s\t%s\t%s\n" $NUM_TOT $NUM_000 $NUM_111 $DATA_PRODUCT_ID_UPPER >> $DIRECTORY/data_product_id_list_$DATE.tab

done

for DATA_PRODUCT_ID_UPPER in $DATA_PRODUCT_ID_UPPER_LIST

do

    DATA_PRODUCT_ID_LOWER=`echo $DATA_PRODUCT_ID_UPPER | tr 'A-Z' 'a-z'`

    MASTER_FILE_NAME=''

    MASTER_FILE_NUM=`grep -ci ^$DATA_PRODUCT_ID_LOWER'_00000000_v01.cdf	' $DIRECTORY/software_cdawlib_masters_$DATE.tab`

    if [ $MASTER_FILE_NUM -gt 0 ]; then MASTER_FILE_NAME=`grep -i ^$DATA_PRODUCT_ID_LOWER'_00000000_v01.cdf	' $DIRECTORY/software_cdawlib_masters_$DATE.tab | awk 'BEGIN { FS="	" } ; { print $1 }'`; fi

    if [ $DATA_PRODUCT_ID_UPPER == VOYAGER1_48SEC_MAGNETICFIELD_NEARTERMINATIONSHOCK ]; then MASTER_FILE_NAME=`grep -i ^$DATA_PRODUCT_ID_LOWER'_v01.cdf	' $DIRECTORY/software_cdawlib_masters_$DATE.tab | awk 'BEGIN { FS="	" } ; { print $1 }'`; fi

    if [ $DATA_PRODUCT_ID_UPPER == VOYAGER2_48SEC_MAGNETICFIELD_NEARTERMINATIONSHOCK ]; then MASTER_FILE_NAME=`grep -i ^$DATA_PRODUCT_ID_LOWER'_v01.cdf	' $DIRECTORY/software_cdawlib_masters_$DATE.tab | awk 'BEGIN { FS="	" } ; { print $1 }'`; fi

    NUM_FILES=`grep '	'$DATA_PRODUCT_ID_UPPER$ $DIRECTORY/data_product_id_list_$DATE.tab | awk 'BEGIN { FS="	" } ; { print $2 }'`

    NUM_TAR=`grep '	'$DATA_PRODUCT_ID_UPPER$ $DIRECTORY/data_product_id_list_$DATE.tab | awk 'BEGIN { FS="	" } ; { print $3 }'`

    if [ $NUM_FILES -eq 1 ]; then

       MODIFICATION_DATE=`grep -i ^$MASTER_FILE_NAME'	' $DIRECTORY/software_cdawlib_masters_$DATE.tab | awk 'BEGIN { FS="	" } ; { print $2 }'`

    else

       MODIFICATION_DATE=''

    fi

    if [ $NUM_FILES -eq 1 ]; then

       MASTER_FILE_SIZE_FILES=`ls -laF $DIRECTORY/MASTER_FILES/$MASTER_FILE_NAME | awk 'BEGIN { FS=" " } ; { print $5 }'`

    else

       MASTER_FILE_SIZE_FILES=''

    fi

    if [ $NUM_TAR -eq 1 ]; then

       MASTER_FILE_SIZE_TAR=`ls -laF $DIRECTORY/MASTER_TAR/$MASTER_FILE_NAME | awk 'BEGIN { FS=" " } ; { print $5 }'`

    else

       MASTER_FILE_SIZE_TAR='0'

    fi

    CDAWEB_TO_SPASE_NUM=`grep -ci '	'$DATA_PRODUCT_ID_UPPER'	' $DIRECTORY/cdaweb_to_spase_$DATE.tab`

    if [ $CDAWEB_TO_SPASE_NUM -gt 0 ]; then

       SPASE_RESOURCE_ID=`grep -i '	'$DATA_PRODUCT_ID_UPPER'	' $DIRECTORY/cdaweb_to_spase_$DATE.tab | awk 'BEGIN { FS="	" } ; { print $6 }'`

       PARAMETER_YES_NO=`grep -i '	'$DATA_PRODUCT_ID_UPPER'	' $DIRECTORY/cdaweb_to_spase_$DATE.tab | awk 'BEGIN { FS="	" } ; { print $7 }'`

       DOI=`grep -i '	'$DATA_PRODUCT_ID_UPPER'	' $DIRECTORY/cdaweb_to_spase_$DATE.tab | awk 'BEGIN { FS="	" } ; { print $8 }'`

    else

       SPASE_RESOURCE_ID=''

       PARAMETER_YES_NO=''

       DOI=''

    fi

    HASH_STATUS=`masters_cdf_hash_value_status.com $DATA_PRODUCT_ID_UPPER $DATE | awk 'BEGIN { FS="	" } ; { print $2 }'`

    echo $NUM_FILES"	"$NUM_TAR"	"$DATA_PRODUCT_ID_UPPER"	"$MASTER_FILE_NAME"	"$MODIFICATION_DATE"	"$MASTER_FILE_SIZE_FILES"	"$MASTER_FILE_SIZE_TAR"	"$SPASE_RESOURCE_ID"	"$PARAMETER_YES_NO"	"$DOI"	"$HASH_STATUS

done

