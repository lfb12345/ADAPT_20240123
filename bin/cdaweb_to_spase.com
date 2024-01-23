
DATE=$1

if [ ! $DATE ]; then DATE=`date "+%Y%m%d"`; fi

DIRECTORY=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_$DATE

if [ ! -d $DIRECTORY ]; then mkdir -p $DIRECTORY; fi

HTML_FILE_NAME=$DIRECTORY/cdaweb_to_spase_$DATE.html

curl -ksS https://heliophysicsdata.gsfc.nasa.gov/queries/CDAWeb_SPASE.xql &> $HTML_FILE_NAME

TEMP_FILE_NAME=$DIRECTORY/cdaweb_to_spase_$DATE'_$$.html'

spase_xml_tab.com $HTML_FILE_NAME &> $TEMP_FILE_NAME

TAB_FILE_NAME=$DIRECTORY/cdaweb_to_spase_$DATE.tab

if [ -e $TAB_FILE_NAME ]; then rm $TAB_FILE_NAME; fi

TR_NUM=`grep -c ^'</tr>'$ $TEMP_FILE_NAME`

for ((NUM=2; NUM<=$TR_NUM; NUM++))

do

    HEAD_NUM=`grep -n ^'</tr>'$ $TEMP_FILE_NAME | head -$NUM | tail -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

    LINE_NUM=`head -$HEAD_NUM $TEMP_FILE_NAME | grep -n ^'<tr>'$ | tail -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

    TAIL_NUM=$((HEAD_NUM-LINE_NUM+1))

    head -$HEAD_NUM $TEMP_FILE_NAME | tail -$TAIL_NUM &> $DIRECTORY/cdaweb_to_spase_$$.html

    NOTES_LETTER=`grep ^'      <a href="https://cdaweb.sci.gsfc.nasa.gov/misc/Notes[A-Z].html#' $DIRECTORY/cdaweb_to_spase_$$.html | awk 'BEGIN { FS="[/.]" } ; { print substr($9,6,1) }'`

    DATA_PRODUCT_ID_000=`grep ^'      <a href="https://cdaweb.sci.gsfc.nasa.gov/misc/Notes[A-Z].html#' $DIRECTORY/cdaweb_to_spase_$$.html | awk 'BEGIN { FS="[#\"]" } ; { print $3 }'`

    DATA_PRODUCT_ID_111=`grep ^'      <a href="https://cdaweb.sci.gsfc.nasa.gov/misc/Notes[A-Z].html#' $DIRECTORY/cdaweb_to_spase_$$.html | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

    DATA_PRODUCT_ID_111_LETTER=`echo $DATA_PRODUCT_ID_111 | awk '{ print substr($0,1,1) }'`

    if [ $NOTES_LETTER == $DATA_PRODUCT_ID_111_LETTER ]; then

       LETTER_STATUS=OOO

    else

       LETTER_STATUS=XXX

    fi

    if [ $DATA_PRODUCT_ID_000 == $DATA_PRODUCT_ID_111 ]; then

       DATA_PRODUCT_ID_STATUS=OOO

    else

       DATA_PRODUCT_ID_STATUS=XXX

    fi

#   echo $LETTER_STATUS"	"$DATA_PRODUCT_ID_STATUS"	"$NOTES_LETTER"	"$DATA_PRODUCT_ID_111_LETTER"	"$DATA_PRODUCT_ID_000"	"$DATA_PRODUCT_ID_111

    HPDE_IO_URL=`grep ^'      <a href="https://hpde.io//' $DIRECTORY/cdaweb_to_spase_$$.html | awk 'BEGIN { FS="\"" } ; { print $2 }'`

    SPASE_RESOURCE_ID=`grep ^'      <a href="https://hpde.io//' $DIRECTORY/cdaweb_to_spase_$$.html | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

    SPASE_RESOURCE_ID_HPDE=`echo $HPDE_IO_URL | sed 's/https:\/\/hpde.io/spase:/'`

    if [ $SPASE_RESOURCE_ID == $SPASE_RESOURCE_ID_HPDE ]; then

       SPASE_RESOURCE_ID_STATUS=OOO

    else

       SPASE_RESOURCE_ID_STATUS=XXX

    fi

#   echo $SPASE_RESOURCE_ID_STATUS"	"$SPASE_RESOURCE_ID"	"$SPASE_RESOURCE_ID_HPDE"	"$HPDE_IO_URL

    PARAMETER_YES_NO=`grep ^'   <td align="center" style="color:' $DIRECTORY/cdaweb_to_spase_$$.html | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

    DOI_000=`grep ^'      <a href="https://doi.org/' $DIRECTORY/cdaweb_to_spase_$$.html | awk 'BEGIN { FS="\"" } ; { print $2 }'`

    DOI_111=`grep ^'      <a href="https://doi.org/' $DIRECTORY/cdaweb_to_spase_$$.html | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

    rm $DIRECTORY/cdaweb_to_spase_$$.html

    if [ $DOI_000 == $DOI_111 ]; then

       DOI_STATUS=OOO

    else

       DOI_STATUS=XXX

    fi

#   echo $PARAMETER_YES_NO"	"$DOI_STATUS"     "$DOI_000"    "$DOI_111

    echo $LETTER_STATUS"	"$DATA_PRODUCT_ID_STATUS"	"$SPASE_RESOURCE_ID_STATUS"	"$DOI_STATUS"	"$DATA_PRODUCT_ID_111"	"$SPASE_RESOURCE_ID"	"$PARAMETER_YES_NO"	"$DOI_111 >> $TAB_FILE_NAME

done

gzip $HTML_FILE_NAME

rm $TEMP_FILE_NAME

#
#   <tr>
#      <td class="Spase.URL.ProductID">
#         <a href="https://cdaweb.sci.gsfc.nasa.gov/misc/NotesW.html#WI_SW-ION-DIST_SWE-FARADAY" target="_blank">WI_SW-ION-DIST_SWE-FARADAY</a>
#      </td>
#      <td class="Spase.ResourceId">
#         <a href="https://hpde.io//NASA/NumericalData/Wind/SWE/FaradayCup/IonDistribution/PT92S" target="_blank">spase://NASA/NumericalData/Wind/SWE/FaradayCup/IonDistribution/PT92S</a>
#      </td>
#      <td align="center" style="color:black">yes</td>
#      <td class="Spase.DOI">
#         <a href="https://doi.org/10.48322/6vrg-6n41" target="_blank">https://doi.org/10.48322/6vrg-6n41</a>
#      </td>
#   </tr>
#

