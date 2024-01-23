
ENUMERATION_LIST_NAME=$1

ENUMERATION_LIST_MEMBER=$2

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

printf "\n+\n%s\n+\n" $DASHES

if [ ! $ENUMERATION_LIST_MEMBER ]; then

   grep $ENUMERATION_LIST_NAME'_list' populate_numerical_data.pro | sed 's/^\ \ *//' | sort | uniq -c | sed 's/\ \ *//' | sed 's/\ /	/' | sed 's/^/+\ \ \ /'

else

   ENUMERATION_LIST_SPASE_NAME=`echo $ENUMERATION_LIST_NAME | sed 's/_//g'`

   if [ "$ENUMERATION_LIST_MEMBER" -eq "$ENUMERATION_LIST_MEMBER" ] 2>/dev/null; then

      grep -i '	'$ENUMERATION_LIST_SPASE_NAME'	' spase_232_240.tab | grep '	'$ENUMERATION_LIST_MEMBER'	[A-Z]' | sed 's/^/+\ \ \ /'

   else

      grep -i '	'$ENUMERATION_LIST_SPASE_NAME'	' spase_232_240.tab | grep '	'$ENUMERATION_LIST_MEMBER$ | sed 's/^/+\ \ \ /'

      MATCH=`grep '	'$ENUMERATION_LIST_NAME'	' spase_232_240.tab | grep '	'$ENUMERATION_LIST_MEMBER$ | awk 'BEGIN { FS="	" } ; { print $1 }'`

      NUM_NEW=`grep '   '$ENUMERATION_LIST_NAME'        ' spase_232_240.tab | grep '	'$ENUMERATION_LIST_MEMBER$ | awk 'BEGIN { FS="   " } ; { print $3 }'`

      NUM_OLD=`grep '   '$ENUMERATION_LIST_NAME'        ' spase_232_240.tab | grep '	'$ENUMERATION_LIST_MEMBER$ | awk 'BEGIN { FS="   " } ; { print $4 }'`

      MEMBER_NAME_NEW=`grep '   '$ENUMERATION_LIST_NAME'        ' spase_232_240.tab | grep '	'$ENUMERATION_LIST_MEMBER$ | awk 'BEGIN { FS="   " } ; { print $5 }'`

      MEMBER_NAME_OLD=`grep '   '$ENUMERATION_LIST_NAME'        ' spase_232_240.tab | grep '	'$ENUMERATION_LIST_MEMBER$ | awk 'BEGIN { FS="   " } ; { print $6 }'`

   fi

fi

printf "+\n%s\n+\n\n" $DASHES

