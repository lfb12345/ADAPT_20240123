
DATE=`date "+%y%m%d"`

DATE_STAMP=`date +"%Y-%m-%dT%H:%M:%S"`

PROGRAM_DIRECTORY=/Users/astropooch/bin

REPORT_DIRECTORY=/Users/astropooch/Space/MIGRATION/CDAWEB_TO_SPASE/REPORT

OUTPUT_FILE_NAME=$REPORT_DIRECTORY/cdaweb_to_spase_report_$DATE.tab

REPORT_FILE_NAME=$REPORT_DIRECTORY/cdaweb_to_spase_report_$DATE.txt

DASHES='+'$(printf "%0.s-" $(seq 1 130))'+'

curl -sS https://heliophysicsdata.gsfc.nasa.gov/queries/CDAWeb_SPASE.xql | sed -e $'s/<a href="https:\/\/cdaweb.gsfc.nasa.gov/\\\n&/g' | sed 's/^//' | grep ^'<a href="https://cdaweb.gsfc.nasa.gov/misc/Notes[A-Z].html' | awk 'BEGIN { FS="[<>]" } ; { print $3"	"$11"	"$17 }' &> $OUTPUT_FILE_NAME

PARAMETER_OOO_NUM=`grep '	yes'$ $OUTPUT_FILE_NAME | wc -l | awk '{ print $1 }'`

PARAMETER_XXX_NUM=`grep '	no'$ $OUTPUT_FILE_NAME | wc -l | awk '{ print $1 }'`

DESCRIPTION_XXX_NUM=`grep '		'$ $OUTPUT_FILE_NAME | wc -l | awk '{ print $1 }'`

DESCRIPTION_ALL_NUM=`wc -l $OUTPUT_FILE_NAME | awk '{ print $1 }'`

printf "\n%s\n" $DASHES &> $REPORT_FILE_NAME

printf "\n%41s%91s\n" 'CDAWeb to SPASE Description Status Report' $DATE_STAMP >> $REPORT_FILE_NAME

printf "\n%s\n" $DASHES >> $REPORT_FILE_NAME

printf "\n%-55s%4s\n" 'Number of Data Products with complete SPASE Metadata:' $PARAMETER_OOO_NUM >> $REPORT_FILE_NAME

printf "\n%-55s%4s\n" 'Number of Data Products without SPASE Metadata:' $DESCRIPTION_XXX_NUM >> $REPORT_FILE_NAME

printf "\n%-55s%4s\n" 'Number of Data Products without Parameter Metadata:' $PARAMETER_XXX_NUM >> $REPORT_FILE_NAME

printf "\n%-55s%4s\n" 'Total Number of Data Products:' $DESCRIPTION_ALL_NUM >> $REPORT_FILE_NAME

printf "\n%s\n" $DASHES >> $REPORT_FILE_NAME

printf "\n%s\n" 'Summary by Mission for Data Products without SPASE Metadata' >> $REPORT_FILE_NAME

printf "\n%s\n" $DASHES >> $REPORT_FILE_NAME

printf "\n%s\t%s\t%s\n\n" Count 'Mission Data Product Acronym' 'Mission Group/Name' >> $REPORT_FILE_NAME

grep '		'$ $OUTPUT_FILE_NAME | sed '/_HELIO1DAY_POSITION		/s/^.*$/HELIO1DAY/' | sed 's/_.*$//' | sed -f $PROGRAM_DIRECTORY/cdaweb_to_spase_report.sed | sort | uniq -c | sed 's/^\ \ *//' | sed 's/ /	/' >> $REPORT_FILE_NAME

printf "\n%s\t%s\n" $DESCRIPTION_XXX_NUM Total >> $REPORT_FILE_NAME

printf "\n%s\n" $DASHES >> $REPORT_FILE_NAME

printf "\n%s\n" 'Summary by Mission for Data Products without Parameter Metadata' >> $REPORT_FILE_NAME

printf "\n%s\n" $DASHES >> $REPORT_FILE_NAME

printf "\n%s\t%s\t%s\n\n" Count 'Mission Data Product Acronym' 'Mission Group/Name' >> $REPORT_FILE_NAME

grep '	no'$ $OUTPUT_FILE_NAME | sed 's/_.*$//' | sed -f $PROGRAM_DIRECTORY/cdaweb_to_spase_report.sed | sort | uniq -c | sed 's/^\ \ *//' | sed 's/ /	/' >> $REPORT_FILE_NAME

printf "\n%s\t%s\n" $PARAMETER_XXX_NUM Total >> $REPORT_FILE_NAME

printf "\n%s\n\n" $DASHES >> $REPORT_FILE_NAME

