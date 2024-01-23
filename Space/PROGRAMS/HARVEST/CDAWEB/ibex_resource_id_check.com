
CDAWEB_ID_LIST=`grep ^ibex_ vcdawebo.tab | awk 'BEGIN { FS="	" } ; { print $1 }'`

for CDAWEB_ID in $CDAWEB_ID_LIST

do

    SPACECRAFT=`echo $CDAWEB_ID | awk 'BEGIN { FS="_" } ; { print toupper($1) }'`

    LEVEL=`echo $CDAWEB_ID | awk 'BEGIN { FS="_" } ; { print $4 }' | awk -vFS="" -vOFS="" '{$1=toupper($1);print $0}'`

    ENA_HI_LO=`echo $CDAWEB_ID | awk 'BEGIN { FS="_" } ; { print toupper($2) }'`

    RELEASE_NUMBER=`echo $CDAWEB_ID | awk 'BEGIN { FS="_" } ; { print toupper($5) }' | sed 's/^R/Release/'`

    COMPTON_GATHERING_YES_NO=`echo $CDAWEB_ID | awk 'BEGIN { FS="_" } ; { print toupper($6) }'`

    SURVIVAL_PROBABILITY_YES_NO=`echo $CDAWEB_ID | awk 'BEGIN { FS="_" } ; { print toupper($7) }'`

    DIRECTION=`echo $CDAWEB_ID | awk 'BEGIN { FS="_" } ; { print $8 }' | awk -vFS="" -vOFS="" '{$1=toupper($1);print $0}'`

    DURATION=`echo $CDAWEB_ID | awk 'BEGIN { FS="_" } ; { print "P"toupper($9) }' | sed 's/YR$/Y/' | sed 's/MO$/M/'`

    SPASE_RESOURCE_ID=$SPACECRAFT/$LEVEL/$ENA_HI_LO/$RELEASE_NUMBER/$COMPTON_GATHERING_YES_NO/$SURVIVAL_PROBABILITY_YES_NO/$DIRECTION/$DURATION

    DATE_STYLE=`grep $CDAWEB_ID'	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print $2 }'`

    SHA1_CHECK_OLD=`grep $CDAWEB_ID'	' cdaweb_resource_id_final.tab | openssl dgst -sha1 | awk '{print $2 }'`

    SHA1_CHECK_NEW=`echo $CDAWEB_ID'	'$DATE_STYLE'	'$SPASE_RESOURCE_ID | openssl dgst -sha1 | awk '{print $2 }'`

    if [ $SHA1_CHECK_OLD == $SHA1_CHECK_NEW ]; then

       SHA1_CHECK_STATUS=OOO

    else

       SHA1_CHECK_STATUS=XXX

    fi

    CDAWEB_ID_TEXT_FIELD_NUM=`echo $CDAWEB_ID | awk 'BEGIN { FS="_" } ; { print NF }'`

    echo $SHA1_CHECK_STATUS'	'$CDAWEB_ID_TEXT_FIELD_NUM'	'$CDAWEB_ID'	'$DATE_STYLE'	'$SPASE_RESOURCE_ID

    echo $SHA1_CHECK_STATUS'	'$CDAWEB_ID_TEXT_FIELD_NUM'	'`grep $CDAWEB_ID'	' cdaweb_resource_id_final.tab` | sed 's/\ /	/g'

done

