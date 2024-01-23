
FILENAME=$1

CONTENT=`grep -v ^$ $FILENAME | grep -v "\ \.*/"$ | sed 's/^\.\///' | awk '{ print $NF }'`

for LS_LINE in $CONTENT

do

    DIR_NUM=`echo $LS_LINE | grep -c :$`

    if [ $DIR_NUM == 1 ]; then

       DIRECTORY=`echo $LS_LINE | sed 's/:$//'`

       printf "\nDirectory: %s\n\n" $DIRECTORY

    else

       echo $DIRECTORY/$LS_LINE | sed 's/^\///'

    fi

done

