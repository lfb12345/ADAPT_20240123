
MASTER_FILE_NAME_PATTERN=$1

MASTER_FILE_NAME_LIST=`find $MASTER_FILE_NAME_PATTERN | sort`

MASTER_FILE_NAME_LIST_NUM=`find $MASTER_FILE_NAME_PATTERN | sort | wc -l | awk '{ print $1 }'`

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

HASHES=$(printf "%0.s#" $(seq 1 275))

for MASTER_FILE_NAME in $MASTER_FILE_NAME_LIST

do

    global_attribute_list.com $MASTER_FILE_NAME >> global_attribute_assay_$$.txt

done

GLOBAL_ATTRIBUTE_LIST=`sort global_attribute_assay_$$.txt | uniq `

GLOBAL_ATTRIBUTE_LIST_NUM=`echo $GLOBAL_ATTRIBUTE_LIST | wc -c | awk '{ print $1 }'`

rm global_attribute_assay_$$.txt

for GLOBAL_ATTRIBUTE in $GLOBAL_ATTRIBUTE_LIST

do

    for MASTER_FILE_NAME in $MASTER_FILE_NAME_LIST

    do

        GLOBAL_ATTRIBUTE_NUM=`grep ^$GLOBAL_ATTRIBUTE'\ ' $MASTER_FILE_NAME | awk '{ print $2 }' | sed 's/^(//'`

        if [ ! $GLOBAL_ATTRIBUTE_NUM ]; then GLOBAL_ATTRIBUTE_NUM=0; fi

        LINE_NUM_LIST=`seq $GLOBAL_ATTRIBUTE_NUM`

        if [ $GLOBAL_ATTRIBUTE_NUM == 0 ]; then LINE_NUM_LIST=0; fi

        for LINE_NUM in $LINE_NUM_LIST

        do

            if [ $LINE_NUM != 0 ]; then

               TEXT=`grep -A$GLOBAL_ATTRIBUTE_NUM ^$GLOBAL_ATTRIBUTE'\ ' $MASTER_FILE_NAME | grep CDF_CHAR | head -$LINE_NUM | tail -1`

               NUM=`echo $TEXT | awk '{ print $1 }'`

               CDF_CHAR_NUM=`echo $TEXT | awk '{ print $2 }' | sed 's/^(CDF_CHAR\///' | sed 's/):$//'`

               METADATA=`echo $TEXT | awk 'BEGIN { FS="\"" } ; { print $2 }'`

               METADATA_CHECK=`echo $METADATA | sed 's/\ //g'`

               if [ ! $METADATA_CHECK ]; then METADATA='Warning: Blank Metadata ASTRO '$MASTER_FILE_NAME; fi

            else

               NUM=0

               CDF_CHAR_NUM=0

               METADATA='Warning: No Metadata ASTRO '$MASTER_FILE_NAME

            fi

            echo $GLOBAL_ATTRIBUTE"	"$NUM"	"$CDF_CHAR_NUM"	"$METADATA >> global_attribute_assay_$$.txt

        done

    done

    printf "%s\n\n" $HASHES

    sed 's/Warning:\ .*\ Metadata\ ASTRO\ .*$//' global_attribute_assay_$$.txt | sort -nk2 | uniq -c | sed 's/^\ \ *//' | sed 's/\ /	/'

    GLOBAL_ATTRIBUTE_UNIQ_NUM=`sed 's/Warning:\ .*\ Metadata\ ASTRO\ .*$//' global_attribute_assay_$$.txt | sort -nk2 | uniq | wc -l | awk '{ print $1 }'`

    if [ $GLOBAL_ATTRIBUTE_UNIQ_NUM -gt 1 ]; then

       printf "\n%s\n\n" $DASHES

       sed 's/^/	/' global_attribute_assay_$$.txt | sed 's/\ ASTRO\ /	/'

    fi

    printf "\n%s\n" $HASHES

    rm global_attribute_assay_$$.txt

done

