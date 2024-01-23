
MASTERS_DIRECTORY=$1

CDAWEB_ID_LIST=`find MASTERS_20230915/*_00000000_v01.metadata | sort | sed 's/^.*\///' | sed 's/_00000000_v01.metadata$//' | awk '{ print $1 }'`

for CDAWEB_ID in $CDAWEB_ID_LIST

do

    CDAWEB_ID_UPPER=`echo $CDAWEB_ID | tr 'a-z' 'A-Z'`

    CDAWEB_ID_LOWER=`echo $CDAWEB_ID | tr 'A-Z' 'a-z'`

    METADATA_FILE_NAME=$CDAWEB_ID_LOWER'_00000000_v01.metadata'

    MISSION_CODE=`echo $CDAWEB_ID_LOWER | awk 'BEGIN { FS="[_-]" } ; { print $1 }'`

    MISSION_NAME=`grep ^$MISSION_CODE'	' cdaweb_sc_list.tab | awk 'BEGIN { FS="	" } ; { print $2 }' | awk '{ print $1 }'`

    if [ ! $MISSION_NAME ]; then

       MISSION_NAME=`grep ^$CDAWEB_ID_LOWER'	' cdaweb_sc_list.tab | awk 'BEGIN { FS="	" } ; { print $2 }' | awk '{ print $1 }'`

       if [ ! $MISSION_NAME ]; then MISSION_NAME=XXX; fi

    fi

    GLOBAL_ATTRIBUTE_LIST=`grep ^'[A-z0-9].*\ \ *([0-9][0-9]*\ entr' $MASTERS_DIRECTORY/$CDAWEB_ID_LOWER'_00000000_v01.metadata' | sed 's/\ \ *([0-9]*\ entr.*):.*$//' | sed 's/\ /_/g' | tr 'a-z' 'A-Z'`

    for GLOBAL_ATTRIBUTE in $GLOBAL_ATTRIBUTE_LIST

    do

        echo $MISSION_CODE'	'$MISSION_NAME'	'$CDAWEB_ID'	'$GLOBAL_ATTRIBUTE

    done

done

