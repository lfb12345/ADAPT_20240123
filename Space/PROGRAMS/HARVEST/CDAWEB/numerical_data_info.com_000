
PROJECT_PROGRAM_DIR=$1

DATA_PRODUCT_ID=$2

FILE_NAME_CONVENTION=$3

INFO_TAG=$4

DATA_PRODUCT_ID_LOWER=`echo $DATA_PRODUCT_ID | tr 'A-Z' 'a-z'`

DATA_PRODUCT_ID_UPPER=`echo $DATA_PRODUCT_ID | tr 'a-z' 'A-Z'`

FILE_NAME_CONVENTION_LOWER=`echo $FILE_NAME_CONVENTION | tr 'A-Z' 'a-z'`

FILE_NAME_CONVENTION_UPPER=`echo $FILE_NAME_CONVENTION | tr 'a-z' 'A-Z'`

INFO_TAG_LOWER=`echo $INFO_TAG | tr 'A-Z' 'a-z'`

INFO_TAG_UPPER=`echo $INFO_TAG | tr 'a-z' 'A-Z'`

#RANULE_HOME='/Users/admin/VXO/150812_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/150820_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/150904_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/151213_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/160301_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/160305_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/160319_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/160329_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/160330_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/160331_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/160401_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/160421_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/160428_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/160516_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/160711_CDAWEB'

#RANULE_HOME='/Users/admin/VXO/170113_SPDF'

#RANULE_HOME='/Users/admin/VXO/170130_SPDF'

#RANULE_HOME='/Users/admin/VXO/170605_SPDF'

GRANULE_HOME='/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/VXO'

DATA_TYPE=`echo $DATA_PRODUCT_ID_LOWER | awk 'BEGIN { FS="_" } ; { print $5 }' | sed 's/^$/XXXXX/'`

if [ $DATA_TYPE == dce2d ]; then GRANULE_HOME='/Users/admin/VXO/160305_CDAWEB'; fi

GRANULE_DIRECTORY_NUM=`grep -c ^$DATA_PRODUCT_ID_LOWER"	"$FILE_NAME_CONVENTION_LOWER"	" $PROJECT_PROGRAM_DIR/vcdawebo.tab`

if [ $GRANULE_DIRECTORY_NUM -gt 0 ]; then 

   GRANULE_DIRECTORY=`grep ^$DATA_PRODUCT_ID_LOWER"	"$FILE_NAME_CONVENTION_LOWER"	" $PROJECT_PROGRAM_DIR/vcdawebo.tab | awk '{ print $3 }'`

   if [ $INFO_TAG_UPPER == START_DATE ]; then

      GRANULE_FILE_NAME_NUM=`find $GRANULE_HOME/$GRANULE_DIRECTORY | sort | grep "\.xml"$ | head -1 | wc -l | awk '{ print $1 }'`

      if [ $GRANULE_FILE_NAME_NUM == 1 ]; then

         GRANULE_FILE_NAME=`find $GRANULE_HOME/$GRANULE_DIRECTORY | sort | grep "\.xml"$ | head -1`

         grep "<StartDate>" $GRANULE_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'

      else

         echo 9999-01-01T00:00:00.000

      fi

   fi

   if [ $INFO_TAG_UPPER == STOP_DATE ]; then

      GRANULE_FILE_NAME_NUM=`find $GRANULE_HOME/$GRANULE_DIRECTORY | sort | grep "\.xml"$ | tail -1 | wc -l | awk '{ print $1 }'`

      if [ $GRANULE_FILE_NAME_NUM == 1 ]; then

         GRANULE_FILE_NAME=`find $GRANULE_HOME/$GRANULE_DIRECTORY | sort | grep "\.xml"$ | tail -1`

         grep "<StopDate>" $GRANULE_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'

      else

         echo 9999-12-31T23:59:59.999

      fi

   fi

   if [ $INFO_TAG_UPPER == RESOURCE_ID ]; then

      FINAL_ID_NUM=`grep -c ^$DATA_PRODUCT_ID_LOWER"	"$FILE_NAME_CONVENTION_LOWER"	" $PROJECT_PROGRAM_DIR/cdaweb_resource_id_final.tab`

      if [ $FINAL_ID_NUM == 1 ]; then

         RESOURCE_ID_STEM=`grep ^$DATA_PRODUCT_ID_LOWER"	"$FILE_NAME_CONVENTION_LOWER"	" $PROJECT_PROGRAM_DIR/cdaweb_resource_id_final.tab | awk 'BEGIN { FS="\t" } ; { print $3 }'`

         echo 'spase://NASA/NumericalData/'$RESOURCE_ID_STEM

      else

         GRANULE_FILE_NAME_NUM=`find $GRANULE_HOME/$GRANULE_DIRECTORY | sort | grep "\.xml"$ | head -1 | wc -l | awk '{ print $1 }'`

         if [ $GRANULE_FILE_NAME_NUM == 1 ]; then

            GRANULE_FILE_NAME=`find $GRANULE_HOME/$GRANULE_DIRECTORY | sort | grep "\.xml"$ | head -1`

            grep "<ParentID>" $GRANULE_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'

         else

            echo 'spase://NASA/Granule/UNKNOWN/'$DATA_PRODUCT_ID_LOWER'/'$FILE_NAME_CONVENTION_LOWER

         fi

      fi

   fi

   if [ $INFO_TAG_UPPER == ACCESS_URL ]; then echo $GRANULE_DIRECTORY; fi

else

   if [ $INFO_TAG_UPPER == START_DATE ]; then echo '9999-01-01T00:00:00.000'; fi

   if [ $INFO_TAG_UPPER == STOP_DATE ]; then echo '9999-01-01T23:59:59.999'; fi

   if [ $INFO_TAG_UPPER == RESOURCE_ID ]; then echo 'spase://NASA/NumericalData/UNKNOWN/'$DATA_PRODUCT_ID_LOWER'/'$FILE_NAME_CONVENTION_LOWER; fi

   if [ $INFO_TAG_UPPER == ACCESS_URL ]; then echo 'NASA/Granule/UNKNOWN/'$DATA_PRODUCT_ID_LOWER'/'$FILE_NAME_CONVENTION_LOWER; fi

fi

