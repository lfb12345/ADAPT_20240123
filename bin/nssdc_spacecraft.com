
SPACECRAFT_NSSDC_ID=$1

#

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

#

curl -sS https://nssdc.gsfc.nasa.gov/nmc/spacecraft/display.action?id=$SPACECRAFT_NSSDC_ID | sed $'s/></>\\\n</g' | sed 's/ / /g' >& nssdc_spacecraft_$$.txt

NSSDC_LINE_NUM=`wc -l nssdc_spacecraft_$$.txt | awk '{ print $1 }'`
 
SPACECRAFT_NAME=`grep '<h1>' nssdc_spacecraft_$$.txt | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/\ (.*$//'`

#

INFORMATION_KEY_LIST='Description Alternate Facts Funding Discipline Personnel Other.Sources'

for INFORMATION_KEY in $INFORMATION_KEY_LIST

do

    INFORMATION_KEY_NUM=`grep -c ^'<h2>'$INFORMATION_KEY'.*</h2>'$ nssdc_spacecraft_$$.txt`

    if [ $INFORMATION_KEY_NUM -gt 0 ]; then

       LINE_NUM=`grep -n ^'<h2>'$INFORMATION_KEY'.*</h2>'$ nssdc_spacecraft_$$.txt | sed 's/:.*$//'`

       TAIL_NUM=$((NSSDC_LINE_NUM-LINE_NUM))

       HEADER_TWO_LINE_NUM=`tail -$TAIL_NUM nssdc_spacecraft_$$.txt | grep -n '<h2>' | head -1 | sed 's/:.*$//'`

       HEAD_NUM=$((LINE_NUM+HEADER_TWO_LINE_NUM))

       TAIL_NUM=$((HEADER_TWO_LINE_NUM+1))

       if [ $INFORMATION_KEY == 'Description' ]; then

          TEXT=`head -$HEAD_NUM nssdc_spacecraft_$$.txt | tail -$TAIL_NUM | grep -v '<h2>' | grep -v '<div class="urtwo">' | sed 's/^\ *<p>\ *//' | sed 's/<\/[A-z]*>\ *$//' | grep -v ^'\ *<p>\ *'$ | grep -v ^$ | sed 's/<a href=".*>//' | awk '{ printf("%s ",$0) }' | awk '{ print $0"." }' | sed 's/\ \ \ */ /g' | sed 's/\.\.*$/./' | sed 's/\ \.$/./' | sed 's/\.\././g'`

       else

          if [ $INFORMATION_KEY == 'Facts' ]; then

             TEXT=`head -$HEAD_NUM nssdc_spacecraft_$$.txt | tail -$TAIL_NUM | grep ^'\ *<strong>' | awk 'BEGIN { FS="[<>]" } ; { print $3$5 }' | sed 's/^\ \ *//' | sed 's/\ \ *$//' | sed 's/\ \ */\ /g' | awk '{ printf("%s|",$0) }' | awk '{ print $0 }' | sed 's/|$//'`

          else

             if [ $INFORMATION_KEY == 'Personnel' ]; then

                head -$HEAD_NUM nssdc_spacecraft_$$.txt | tail -$TAIL_NUM >& nssdc_spacecraft_personnel_$$.txt

                THEAD_ONE_LINE_NUM=`grep -n '<thead>' nssdc_spacecraft_personnel_$$.txt | sed 's/:.*$//'`

                THEAD_TWO_LINE_NUM=`grep -n '</thead>' nssdc_spacecraft_personnel_$$.txt | sed 's/:.*$//'`

                HEAD_NUM=$((THEAD_TWO_LINE_NUM-1))

                TAIL_NUM=$((THEAD_TWO_LINE_NUM-THEAD_ONE_LINE_NUM-1))

                HEADER_LIST=(`head -$HEAD_NUM nssdc_spacecraft_personnel_$$.txt | tail -$TAIL_NUM | grep '<th>' | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/\ /_/g' | sed 's/^\ \ *//' | sed 's/\ \ *$//' | sed 's/\ \ */\ /g'`)

                HEADER_LIST_NUM=`head -$HEAD_NUM nssdc_spacecraft_personnel_$$.txt | tail -$TAIL_NUM | grep -c '<th>'`

                TBODY_ONE_LINE_NUM=`grep -n '<tbody>' nssdc_spacecraft_personnel_$$.txt | sed 's/:.*$//'`

                TBODY_TWO_LINE_NUM=`grep -n '</tbody>' nssdc_spacecraft_personnel_$$.txt | sed 's/:.*$//'`

                HEAD_NUM=$((TBODY_TWO_LINE_NUM-1))

                TAIL_NUM=$((TBODY_TWO_LINE_NUM-TBODY_ONE_LINE_NUM-1))

                TR_LIST_NUM=`head -$HEAD_NUM nssdc_spacecraft_personnel_$$.txt | grep -c '</tr>'`

                TAIL_NUM=$((TR_LIST_NUM-1))

                HEAD_NUM_LIST=`head -$HEAD_NUM nssdc_spacecraft_personnel_$$.txt | grep -n '</tr>' | sed 's/:.*$//' | tail -$TAIL_NUM`

                TEXT=''

                for HEAD_NUM in $HEAD_NUM_LIST

                do

                    HEAD_NUM=$((HEAD_NUM-1))

                    TR_LINE_NUM=`head -$HEAD_NUM nssdc_spacecraft_personnel_$$.txt | grep -n '<tr>' | tail -1 | sed 's/:.*$//'`

                    TAIL_NUM=$((HEAD_NUM-TR_LINE_NUM))

                    head -$HEAD_NUM nssdc_spacecraft_personnel_$$.txt | tail -$TAIL_NUM | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/\ /|/g' >& nssdc_spacecraft_person_info_$$.txt

                    HEAD_NUM=0

                    for i in "${!HEADER_LIST[@]}"

                    do

                        HEAD_NUM=$((HEAD_NUM+1))

                        INFO=`head -$HEAD_NUM nssdc_spacecraft_person_info_$$.txt | tail -1`

                        TEXT=$TEXT`printf '%s:%s' "${HEADER_LIST[i]}" $INFO | sed 's/|/ /g'`'|'

                    done

                    TEXT=`echo $TEXT | sed 's/|$/||/'`

                    rm nssdc_spacecraft_person_info_$$.txt

                done

                TEXT=`echo $TEXT | sed 's/||$//'`

                rm nssdc_spacecraft_personnel_$$.txt

             else

                TEXT=`head -$HEAD_NUM nssdc_spacecraft_$$.txt | tail -$TAIL_NUM | grep '<li>' | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | sed 's/^\ \ *//' | sed 's/\ \ *$//' | sed 's/\ \ */\ /g' | awk '{ printf("%s|",$0) }' | awk '{ print $0 }' | sed 's/|$//'`

             fi

          fi

       fi

    else

       TEXT=''

    fi

    case $INFORMATION_KEY in

         Description) DESCRIPTION=$TEXT;;

         Alternate) ALTERNATIVE_NAME_LIST=$TEXT;;

         Facts) FACTS_LIST=$TEXT;;

         Funding) FUNDING_AGENCY_LIST=$TEXT;;

         Discipline) DISCIPLINE_LIST=$TEXT;;

         Personnel) PERSONNEL_LIST=$TEXT;;

    esac

done

#

printf "%s\n\n" $HASHES

echo $SPACECRAFT_NSSDC_ID"	"$SPACECRAFT_NAME"	"$DESCRIPTION"	"$ALTERNATIVE_NAME_LIST"	"$FACTS_LIST"	"$FUNDING_AGENCY_LIST"	"$DISCIPLINE_LIST"	"$PERSONNEL_LIST

printf "\n%s" $HASHES

#

curl -sS https://nssdc.gsfc.nasa.gov/nmc/spacecraft/displayExperiment.action?spacecraftId=$SPACECRAFT_NSSDC_ID | sed $'s/></>\\\n</g' | sed 's/ / /g' >& nssdc_spacecraft_experiment_$$.txt

INSTRUMENT_NSSDC_ID_LIST=`grep '/nmc/experiment/display.action?id=' nssdc_spacecraft_experiment_$$.txt | awk 'BEGIN { FS="\"" } ; { print $2 }' | sed 's/^.*=//' | sort`

for INSTRUMENT_NSSDC_ID in $INSTRUMENT_NSSDC_ID_LIST

do

    nssdc_instrument.com $INSTRUMENT_NSSDC_ID

done

#

rm nssdc_spacecraft_$$.txt nssdc_spacecraft_experiment_$$.txt

