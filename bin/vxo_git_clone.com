
DIRECTORY=$1

DATE=$2

if [ ! $DATE ]; then DATE=`date "+%y%m%d"`; fi

mkdir $DIRECTORY/$DATE

cd $DIRECTORY/$DATE

VXO_GIT_NAME_LIST='ASWS CCMC CNES CSSDP ESA GBO ISWI JAXA NASA NOAA NSF SMWG VSPO'

for VXO_GIT_NAME in $VXO_GIT_NAME_LIST

do

    git clone https://github.com/hpde/$VXO_GIT_NAME.git

done

