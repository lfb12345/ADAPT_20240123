
XML_FILE_NAME_000=$1

XML_FILE_NAME_111=$2

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

STARS='+'$(printf "%0.s*" $(seq 1 273))'+'

printf "\n%s\n\n%s\n\nXML File Name 000:          %s\n\nXML File Name 111:          %s\n\n%s\n\n" $HASHES $STARS $XML_FILE_NAME_000 $XML_FILE_NAME_111 $STARS

sort $XML_FILE_NAME_000 $XML_FILE_NAME_111 | uniq -c | sed 's/\ \ *//' | sed 's/\ /	/' &> cat_sort_uniq_$$.txt

ODD_NUM_LIST=`awk '{ print $1 }' cat_sort_uniq_$$.txt | sort -n | grep '[13579]'$ | sort -n | uniq`

for ODD_NUM in $ODD_NUM_LIST

do

   ODD_NUM_MATCH_NUM=`grep -c ^$ODD_NUM'	' cat_sort_uniq_$$.txt`

   printf "%s\n\nOdd Number:               %5s\n\nOdd Number Match Count:   %5s\n\n%s\n\n" $DASHES $ODD_NUM $ODD_NUM_MATCH_NUM $DASHES

   MATCH_COUNT=`grep -c ^$ODD_NUM'	[A-Z<\*]' cat_sort_uniq_$$.txt`

   if [ $MATCH_COUNT -gt 0 ]; then

      INDENT_COUNT=0

      printf "Match Count:              %5s\n\nIndent Count:             %5s\n\n%s\n\n" $MATCH_COUNT $INDENT_COUNT $DASHES

      grep ^$ODD_NUM'	[A-Z<\*]' cat_sort_uniq_$$.txt | awk 'BEGIN { FS="	" } ; { print $1"	|"$2 }' | grep ^'|<'

      grep ^$ODD_NUM'	[A-Z<\*]' cat_sort_uniq_$$.txt | awk 'BEGIN { FS="	" } ; { print $1"	|"$2 }' | grep -v ^'|<'

      printf "\n%s\n\n" $DASHES

   fi

   SPACES=''

   for LOOP in `seq 1 6`

   do

      SPACES=$SPACES'...'

      INDENT_COUNT=$((3*LOOP))

      MATCH_COUNT=`grep -c ^$ODD_NUM'	'$SPACES'<' cat_sort_uniq_$$.txt`

      if [ $MATCH_COUNT -gt 0 ]; then

         printf "Match Count:              %5s\n\nIndent Count:             %5s\n\n%s\n\n" $MATCH_COUNT $INDENT_COUNT $DASHES

         sort $XML_FILE_NAME_000 $XML_FILE_NAME_111 | uniq -c | sed 's/\ \ *//' | sed 's/\ /	/' | grep ^$ODD_NUM'	' | grep -v ^$ODD_NUM'	[A-Z<\*]' | grep ^$ODD_NUM'	'$SPACES'<' | awk 'BEGIN { FS="	" } ; { print $1"	|"$2 }'

         printf "\n%s\n\n" $DASHES

      fi

   done

   printf "%s\n\n" $STARS

done

EVEN_NUM_LIST=`awk '{ print $1 }' cat_sort_uniq_$$.txt | sort -n | grep '[02468]'$ | sort -n | uniq`

for EVEN_NUM in $EVEN_NUM_LIST

do

   EVEN_NUM_MATCH_NUM=`grep -c ^$EVEN_NUM'	' cat_sort_uniq_$$.txt`

   printf "%s\n\nEven Number:              %5s\n\nEven Number Match Count:  %5s\n\n%s\n\n" $DASHES $EVEN_NUM $EVEN_NUM_MATCH_NUM $DASHES

   MATCH_COUNT=`grep -c ^$EVEN_NUM'	[A-Z<\*]' cat_sort_uniq_$$.txt`

   if [ $MATCH_COUNT -gt 0 ]; then

      INDENT_COUNT=0

      printf "Match Count:              %5s\n\nIndent Count:             %5s\n\n" $MATCH_COUNT $INDENT_COUNT

      grep ^$EVEN_NUM'	[A-Z<\*]' cat_sort_uniq_$$.txt | awk 'BEGIN { FS="	" } ; { print $1"	|"$2 }' | grep ^'<'

      grep ^$EVEN_NUM'	[A-Z<\*]' cat_sort_uniq_$$.txt | awk 'BEGIN { FS="	" } ; { print $1"	|"$2 }' | grep -v ^'<'

      printf "\n%s\n\n" $DASHES

   fi

   SPACES=''

   for LOOP in `seq 1 6`

   do

      SPACES=$SPACES'...'

      INDENT_COUNT=$((3*LOOP))

      MATCH_COUNT=`grep -c ^$EVEN_NUM'	'$SPACES'<' cat_sort_uniq_$$.txt`

      if [ $MATCH_COUNT -gt 0 ]; then

         printf "Match Count:              %5s\n\nIndent Count:             %5s\n\n" $MATCH_COUNT $INDENT_COUNT

         sort $XML_FILE_NAME_000 $XML_FILE_NAME_111 | uniq -c | sed 's/\ \ *//' | sed 's/\ /	/' | grep ^$EVEN_NUM'	' | grep -v ^$EVEN_NUM'	[A-Z<\*]' | grep ^$EVEN_NUM'	'$SPACES'<' | awk 'BEGIN { FS="	" } ; { print $1"	|"$2 }'

         printf "\n%s\n\n" $DASHES

      fi

   done

   printf "%s\n\n" $STARS

done

printf "%s\n\n" $HASHES

rm cat_sort_uniq_$$.txt

