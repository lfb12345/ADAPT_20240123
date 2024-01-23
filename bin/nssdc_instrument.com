
INSTRUMENT_NSSDC_ID=$1

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

curl -sS https://nssdc.gsfc.nasa.gov/nmc/experiment/display.action?id=$INSTRUMENT_NSSDC_ID | sed $'s/></>\\\n</g' | sed 's/ / /' >& nssdc_instrument_$$.txt

#

NSSDC_LINE_NUM=`wc -l nssdc_instrument_$$.txt | awk '{ print $1 }'`

#

INSTRUMENT_NAME=`grep '<h1>' nssdc_instrument_$$.txt | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/\ (.*$//'`

INSTRUMENT_ACRONYM=`grep '<h1>' nssdc_instrument_$$.txt | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/^.*\ (//' | sed 's/).*$//'`

INSTRUMENT_NSSDC_ID=`grep '<strong>NSSDCA ID:</strong>' nssdc_instrument_$$.txt | awk 'BEGIN { FS="[<>]" } ; { print $5 }' | sed 's/^\ \ *//' | sed 's/\ \ *$//' | sed 's/\ \ */\ /g'`

MISSION_NAME=`grep '<strong>Mission Name:</strong>' nssdc_instrument_$$.txt | awk 'BEGIN { FS="[<>]" } ; { print $5 }' | sed 's/^\ \ *//' | sed 's/\ \ *$//' | sed 's/\ \ */\ /g'`

PI_NAME=`grep '<strong>Principal Investigator:</strong>' nssdc_instrument_$$.txt | awk 'BEGIN { FS="[<>]" } ; { print $5 }' | sed 's/^\ \ *//' | sed 's/\ \ *$//' | sed 's/\ \ */\ /g' | sed 's/Dr\.\ //'`

MISSION_NSSDC_ID=`grep ^'<a href="/nmc/spacecraft/display.action?id=' nssdc_instrument_$$.txt | sed 's/<a href="\/nmc\/spacecraft\/display.action?id=//' | sed 's/">'"$MISSION_NAME"'<\/a>$//'`

INFORMATION_KEY_LIST='Description Alternate Funding Discipline Personnel'

for INFORMATION_KEY in $INFORMATION_KEY_LIST

do

    INFORMATION_KEY_NUM=`grep -c ^'<h2>'$INFORMATION_KEY'.*</h2>'$ nssdc_instrument_$$.txt`

    if [ $INFORMATION_KEY_NUM -gt 0 ]; then

       LINE_NUM=`grep -n ^'<h2>'$INFORMATION_KEY'.*</h2>'$ nssdc_instrument_$$.txt | sed 's/:.*$//'`

       TAIL_NUM=$((NSSDC_LINE_NUM-LINE_NUM))

       HEADER_TWO_LINE_NUM=`tail -$TAIL_NUM nssdc_instrument_$$.txt | grep -n '<h2>' | head -1 | sed 's/:.*$//'`

       HEAD_NUM=$((LINE_NUM+HEADER_TWO_LINE_NUM))

       TAIL_NUM=$((HEADER_TWO_LINE_NUM+1))

       if [ $INFORMATION_KEY == 'Description' ]; then

          TEXT=`head -$HEAD_NUM nssdc_instrument_$$.txt | tail -$TAIL_NUM | grep -v '<h2>' | grep -v '<div class="urtwo">' | sed 's/^\ *<p>\ *//' | sed 's/<\/[A-z]*>\ *$//' | grep -v ^'\ *<p>\ *'$ | grep -v ^$ | sed 's/<a href=".*>//' | awk '{ printf("%s ",$0) }' | awk '{ print $0"." }' | sed 's/\ \ \ */ /g' | sed 's/\.\.*$/./' | sed 's/\ \.$/./' | sed 's/\.\././g'`

       else

          if [ $INFORMATION_KEY == 'Personnel' ]; then

             head -$HEAD_NUM nssdc_instrument_$$.txt | tail -$TAIL_NUM >& nssdc_instrument_personnel_$$.txt

             THEAD_ONE_LINE_NUM=`grep -n '<thead>' nssdc_instrument_personnel_$$.txt | sed 's/:.*$//'`

             THEAD_TWO_LINE_NUM=`grep -n '</thead>' nssdc_instrument_personnel_$$.txt | sed 's/:.*$//'`

             HEAD_NUM=$((THEAD_TWO_LINE_NUM-1))

             TAIL_NUM=$((THEAD_TWO_LINE_NUM-THEAD_ONE_LINE_NUM-1))

             HEADER_LIST=(`head -$HEAD_NUM nssdc_instrument_personnel_$$.txt | tail -$TAIL_NUM | grep '<th>' | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/\ /_/g' | sed 's/^\ \ *//' | sed 's/\ \ *$//' | sed 's/\ \ */\ /g'`)

             HEADER_LIST_NUM=`head -$HEAD_NUM nssdc_instrument_personnel_$$.txt | tail -$TAIL_NUM | grep -c '<th>'`

             TBODY_ONE_LINE_NUM=`grep -n '<tbody>' nssdc_instrument_personnel_$$.txt | sed 's/:.*$//'`

             TBODY_TWO_LINE_NUM=`grep -n '</tbody>' nssdc_instrument_personnel_$$.txt | sed 's/:.*$//'`

             HEAD_NUM=$((TBODY_TWO_LINE_NUM-1))

             TAIL_NUM=$((TBODY_TWO_LINE_NUM-TBODY_ONE_LINE_NUM-1))

             TR_LIST_NUM=`head -$HEAD_NUM nssdc_instrument_personnel_$$.txt | grep -c '</tr>'`

             TAIL_NUM=$((TR_LIST_NUM-1))

             HEAD_NUM_LIST=`head -$HEAD_NUM nssdc_instrument_personnel_$$.txt | grep -n '</tr>' | sed 's/:.*$//' | tail -$TAIL_NUM`

             TEXT=''

             for HEAD_NUM in $HEAD_NUM_LIST

             do

                 HEAD_NUM=$((HEAD_NUM-1))

                 TR_LINE_NUM=`head -$HEAD_NUM nssdc_instrument_personnel_$$.txt | grep -n '<tr>' | tail -1 | sed 's/:.*$//'`

                 TAIL_NUM=$((HEAD_NUM-TR_LINE_NUM))

                 head -$HEAD_NUM nssdc_instrument_personnel_$$.txt | tail -$TAIL_NUM | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/\ /|/g' >& nssdc_instrument_person_info_$$.txt

                 HEAD_NUM=0

                 for i in "${!HEADER_LIST[@]}"

                 do

                     HEAD_NUM=$((HEAD_NUM+1))

                     INFO=`head -$HEAD_NUM nssdc_instrument_person_info_$$.txt | tail -1`

                     TEXT=$TEXT`printf '%s:%s' "${HEADER_LIST[i]}" $INFO | sed 's/|/ /g'`'|'

                 done

                 TEXT=`echo $TEXT | sed 's/|$/||/'`

                 rm nssdc_instrument_person_info_$$.txt

             done

             TEXT=`echo $TEXT | sed 's/||$//'`

             rm nssdc_instrument_personnel_$$.txt

          else

             TEXT=`head -$HEAD_NUM nssdc_instrument_$$.txt | tail -$TAIL_NUM | grep '<li>' | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/^\ \ *//' | sed 's/\ \ *$//' | sed 's/\ \ */\ /g' | awk '{ printf("%s|",$0) }' | awk '{ print $0 }' | sed 's/|$//'`

          fi

       fi

    else

       TEXT=''

    fi

    case $INFORMATION_KEY in

         Description) DESCRIPTION=$TEXT;;

         Alternate) ALTERNATIVE_NAME_LIST=$TEXT;;

         Funding) FUNDING_AGENCY_LIST=$TEXT;;

         Discipline) DISCIPLINE_LIST=$TEXT;;

         Personnel) PERSONNEL_LIST=$TEXT;;

    esac

done

LINK_TITLE=`echo 'NSSDC Master Catalog, '$MISSION_NAME', '$INSTRUMENT_ACRONYM' instrument' | sed 's/) /, /g'`

LINK_TEXT=`echo 'General information concerning the '$MISSION_NAME', '$INSTRUMENT_NAME', '$INSTRUMENT_ACRONYM', instrument' | sed 's/) /, /g'`

HTTP_LINK='https://nssdc.gsfc.nasa.gov/nmc/experiment/display.action?id='$INSTRUMENT_NSSDC_ID

LINK_TITLE_CHAR_NUM=`echo $LINK_TITLE | wc -c | awk '{ print $1 }'`

LINK_TEXT_CHAR_NUM=`echo $LINK_TEXT | wc -c | awk '{ print $1 }'`

HTTP_LINK_CHAR_NUM=`echo $HTTP_LINK | wc -c | awk '{ print $1 }'`

#

printf "%s\n\n" $HASHES

echo $MISSION_NSSDC_ID"	"$INSTRUMENT_NSSDC_ID"	"$MISSION_NAME"	"$PI_NAME"	"$INSTRUMENT_NAME"	"$INSTRUMENT_ACRONYM"	"$ALTERNATIVE_NAME_LIST"	"$FUNDING_AGENCY_LIST"	"$DISCIPLINE_LIST"	"$DESCRIPTION"	"$PERSONNEL_LIST

printf "\n%s\n\n" $DASHES

echo 'LINK_TITLE (1 entry):'

echo '	0 (CDF_CHAR/'$LINK_TITLE_CHAR_NUM'): 	"'$LINK_TITLE'"'

echo 'LINK_TEXT (1 entry):'

echo '	0 (CDF_CHAR/'$LINK_TEXT_CHAR_NUM'): 	"'$LINK_TEXT'"'

echo 'HTTP_LINK (1 entry):'

echo '	0 (CDF_CHAR/'$HTTP_LINK_CHAR_NUM'): 	"'$HTTP_LINK'"'

printf "\n%s\n" $HASHES

rm nssdc_instrument_$$.txt

