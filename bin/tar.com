
OPTION=$1

TAR_FILE_NAME=$2

TAR_BALL_CONTENT=$3

DATE=$4

if [ ! $DATE ]; then DATE=`date "+%Y%m%d"`; fi

TAR_FILE_NAME=$TAR_FILE_NAME"_"$DATE.tar

TAR_FILE_NAME_TEST=`echo $TAR_FILE_NAME | sed 's/\.gz$//'`

if [ $TAR_FILE_NAME == $TAR_FILE_NAME_TEST ]; then

   if [ -e $TAR_FILE_NAME.gz ]; then rm $TAR_FILE_NAME.gz; fi

   if [ $OPTION == xvf ]; then

      TAR_FILE_NAME=$TAR_FILE_NAME.gz

      gzip $TAR_FILE_NAME

   fi

fi

TAR_FILE_LIST_NAME=`echo $TAR_FILE_NAME | sed 's/\.gz$//' | sed 's/\.tar$/_tar_file_list.txt/'`

if [ -e $TAR_FILE_LIST_NAME ]; then rm $TAR_FILE_LIST_NAME; fi

if [ -e $TAR_FILE_LIST_NAME.gz ]; then rm $TAR_FILE_LIST_NAME.gz; fi

tar --exclude '\._*' -$OPTION $TAR_FILE_NAME $TAR_BALL_CONTENT 2> tar_$$.txt

sed 's/^[ax]\ //' tar_$$.txt | sort > $TAR_FILE_LIST_NAME

if [ $OPTION == cvf ]; then

   gzip $TAR_FILE_NAME

   TAR_FILE_NAME=$TAR_FILE_NAME.gz

fi

gzip $TAR_FILE_LIST_NAME

echo

ls -laF $TAR_FILE_NAME $TAR_FILE_LIST_NAME.gz

echo

rm tar_$$.txt

