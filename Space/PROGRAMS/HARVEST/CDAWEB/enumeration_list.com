
ENUMERATION_LIST_FILE_NAME=$1

ENUMERATION_NAME_LIST=`grep ^'.*_list=' $ENUMERATION_LIST_FILE_NAME | sed 's/_list=.*$//'`

ENUMERATION_NAME=qualifier

printf "\t\t\n\t\t\n\t\t\n\t\t\n\t\t\n"

for ENUMERATION_NAME in $ENUMERATION_NAME_LIST

do

    ENUMERATION_TERM_LIST=`grep ^$ENUMERATION_NAME'_list=' $ENUMERATION_LIST_FILE_NAME | awk 'BEGIN { FS="=" } ; { print $2 }' | sed "s/'//g" | sed "s/^\[,//" | sed 's/\]$//' | sed 's/,/\ /g'`

    NUM=0

    for ENUMERATION_TERM in $ENUMERATION_TERM_LIST

    do

        printf "%03d\t%s\t%s\n" $NUM $ENUMERATION_NAME $ENUMERATION_TERM

        NUM=$((NUM+1))

    done

    printf "\t\t\n\t\t\n\t\t\n\t\t\n\t\t\n"

done

