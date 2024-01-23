
FILE_NAME=$1

PROGRAM_DIR=/Users/astropooch/bin

sed -f $PROGRAM_DIR/fix.sed $FILE_NAME | sed -f $PROGRAM_DIR/word_list_all.sed  | uniq &> fix_$$.xml

mv fix_$$.xml $FILE_NAME

