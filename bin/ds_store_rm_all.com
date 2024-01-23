
DIRECTORY=$1

if [ ! $DIRECTORY ]; then DIRECTORY=$PWD; fi

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

DATE=`date "+%Y%m%d"`

DS_DTORE_REMOVE_COMMAND_FILE_NAME=/Users/astropooch/ZASSAN_ZATSUBUTSU/DS_STORE/ds_store_rm_all_$DATE.com

DS_DTORE_REMOVE_OUTPUT_FILE_NAME=/Users/astropooch/ZASSAN_ZATSUBUTSU/DS_STORE/ds_store_rm_all_$DATE.txt

printf "\n%s\n\n%s\n\n" $DASHES 'Compiling!!!' >& /Users/astropooch/ZASSAN_ZATSUBUTSU/DS_STORE/ds_store_rm_all_$DATE.txt

find $DIRECTORY | sort | grep "\.DS_Store"$ | sed 's/\ /\\\ /g' | awk '{ print "rm "$0"" }' > $DS_DTORE_REMOVE_COMMAND_FILE_NAME

chmod +x $DS_DTORE_REMOVE_COMMAND_FILE_NAME

printf "%s\n\n" $DASHES >> /Users/astropooch/ZASSAN_ZATSUBUTSU/DS_STORE/ds_store_rm_all_$DATE.txt

cat $DS_DTORE_REMOVE_COMMAND_FILE_NAME >> /Users/astropooch/ZASSAN_ZATSUBUTSU/DS_STORE/ds_store_rm_all_$DATE.txt

printf "\n%s\n\n" $DASHES >> /Users/astropooch/ZASSAN_ZATSUBUTSU/DS_STORE/ds_store_rm_all_$DATE.txt

$DS_DTORE_REMOVE_COMMAND_FILE_NAME >> /Users/astropooch/ZASSAN_ZATSUBUTSU/DS_STORE/ds_store_rm_all_$DATE.txt

printf "\n%s\n\n" $DASHES >> /Users/astropooch/ZASSAN_ZATSUBUTSU/DS_STORE/ds_store_rm_all_$DATE.txt

gzip $DS_DTORE_REMOVE_COMMAND_FILE_NAME

gzip $DS_DTORE_REMOVE_OUTPUT_FILE_NAME

