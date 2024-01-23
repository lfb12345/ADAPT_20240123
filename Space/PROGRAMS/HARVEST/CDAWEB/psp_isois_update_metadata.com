
METADATA_FILE_NAME=$1

METADATA_FILE_NAME_BASENAME=`basename $METADATA_FILE_NAME`

cat $METADATA_FILE_NAME | sed 's/\ \ *$//' | sed 's/^	0 (CDF_CHAR\/56): 	"See http:\/\/spp-isois.sr.unh.edu\/ISOIS_Terms_of_Use.html."$/	0 (CDF_CHAR\/57): 	"See https:\/\/spp-isois.sr.unh.edu\/ISOIS_Terms_of_Use.html."/' | sed 's/^	1 (CDF_CHAR\/126): 	"Cite as, "McComas et al. (2016)" and contact the ISOIS instrument team before publication. Please do not distribute this file."$/	1 (CDF_CHAR\/124): 	"Cite as, McComas et al. (2016) and contact the ISOIS instrument team before publication. Please do not distribute this file."/' | sed 's/^     CATDESC         (CDF_CHAR\/35): "Minus values for Energy Bins for  "/CATDESC         (CDF_CHAR\/34): "Minus values for Energy Bins for "/' | sed 's/^     CATDESC         (CDF_CHAR\/34): "Plus values for Energy Bins for  "/CATDESC         (CDF_CHAR\/33): "Plus values for Energy Bins for "/' &> psp_isois_update_metadata_$$.metadata

TEXT_LINE_NUM=`grep -n ^'TEXT ([25] entries):'$ psp_isois_update_metadata_$$.metadata | awk 'BEGIN { FS=":" } ; { print $1 }'`

INSTRUMENT_TYPE_LINE_NUM=`grep -n ^'Instrument_type (2 entries):'$ psp_isois_update_metadata_$$.metadata | awk 'BEGIN { FS=":" } ; { print $1 }'`

SKELETON_VERSION_LINE_NUM=`grep -n ^'Skeleton_version (1 entry):'$ psp_isois_update_metadata_$$.metadata | awk 'BEGIN { FS=":" } ; { print $1 }'`

TIME_RESOLUTION_LINE_NUM=`grep -n ^'Time_resolution (1 entry):'$ psp_isois_update_metadata_$$.metadata | awk 'BEGIN { FS=":" } ; { print $1 }'`

SPASE_DATASET_RESOURCE_ID_LINE_NUM=`grep -n ^'spase_DatasetResourceID (1 entry):'$ psp_isois_update_metadata_$$.metadata | awk 'BEGIN { FS=":" } ; { print $1 }'`

MISSION_GROUP_LINE_NUM=`grep -n ^'Mission_group (1 entry):'$ psp_isois_update_metadata_$$.metadata | awk 'BEGIN { FS=":" } ; { print $1 }'`

METADATA_FILE_LINE_NUM=`wc -l $METADATA_FILE_NAME | awk '{ print $1 }'`

HEAD_NUM=$((TEXT_LINE_NUM-1))

#  echo $HEAD_NUM

head -$HEAD_NUM psp_isois_update_metadata_$$.metadata &> temp_$$.metadata

PSP_ISOIS_UPDATE_METADATA_PIECE_FILE_NAME=`grep ^$METADATA_FILE_NAME_BASENAME'	' psp_isois_update_metadata.tab | awk 'BEGIN { FS="	" } ; { print $2 }'`

cat $PSP_ISOIS_UPDATE_METADATA_PIECE_FILE_NAME >> temp_$$.metadata

HEAD_NUM=$((SKELETON_VERSION_LINE_NUM+1))

TAIL_NUM=$((SKELETON_VERSION_LINE_NUM-INSTRUMENT_TYPE_LINE_NUM+2)) >> temp_$$.metadata

#  echo $HEAD_NUM'	'$TAIL_NUM

head -$HEAD_NUM psp_isois_update_metadata_$$.metadata | tail -$TAIL_NUM >> temp_$$.metadata

HEAD_NUM=$((SPASE_DATASET_RESOURCE_ID_LINE_NUM+1)) >> temp_$$.metadata

TAIL_NUM=$((SPASE_DATASET_RESOURCE_ID_LINE_NUM-TIME_RESOLUTION_LINE_NUM+2)) >> temp_$$.metadata

#  echo $HEAD_NUM'	'$TAIL_NUM

head -$HEAD_NUM psp_isois_update_metadata_$$.metadata | tail -$TAIL_NUM >> temp_$$.metadata

TAIL_NUM=$((METADATA_FILE_LINE_NUM-MISSION_GROUP_LINE_NUM+1)) >> temp_$$.metadata

#  echo $TAIL_NUM

tail -$TAIL_NUM psp_isois_update_metadata_$$.metadata >> temp_$$.metadata

mv temp_$$.metadata $METADATA_FILE_NAME

rm psp_isois_update_metadata_$$.metadata

echo $METADATA_FILE_NAME'	'$PSP_ISOIS_UPDATE_METADATA_PIECE_FILE_NAME

