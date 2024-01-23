
DATA_PRODUCT_ID=$1

DATA_PRODUCT_ID_LOWER=`echo $DATA_PRODUCT_ID | tr 'A-Z' 'a-z'`

DATA_PRODUCT_ID_UPPER=`echo $DATA_PRODUCT_ID | tr 'a-z' 'A-Z'`

PROCESSING_LEVEL=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $2 }'`

HI_LO=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $4 }' | sed 's/^HI$/Hi/' | sed 's/^LO$/Lo/'`

HI_LO_VERBOSE=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $4 }' | sed 's/^HI$/High\ Energy\ Neutral\ Atom\ Imager/' | sed 's/^LO$/Low\ Energy\ Neutral\ Atom\ Imager/'`

RELEASE_NUM=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $5 }' | sed 's/^R/Release\ /' | sed 's/$/,\ /'`

CG_NOCG=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $6 }' | sed 's/^CG$/Compton-Getting\ corrected,\ /' | sed 's/^NOCG$/not\ Compton-Getting\ corrected,\ /'`

SP_NOSP=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $7 }' | sed 's/^SP$/Survival\ Probability\ corrected,\ /' | sed 's/^NOSP$/not\ Survival\ Probability\ corrected,\ /'`

DIRECTION=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $8 }' | sed 's/^ANTIRAM$/Antiram\ direction/' | sed 's/^OMNI$/Omnidirectional/' | sed 's/^RAM$/Ram\ direction/'`

CADENCE=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $9 }' | sed 's/^6MO$/6\ month/' | sed 's/^1YR$/1\ year/' | sed 's/^2YR$/2\ year/' | sed 's/^3YR$/3\ year/' | sed 's/^11YR$/11\ year/'`

printf "<20240118>\t%-53s\t%-105s\t%-25s\t%-185s\t%-51s\t%s%s%s%s, West Longitude Ecliptic Maps\tLevel %-12s\t(%s)              \t%-31s                  \t\t-     \t%-103s\t%-228s\t</20240118>\n" $DATA_PRODUCT_ID_UPPER "Interstellar Boundary Explorer" IBEX "$HI_LO_VERBOSE" $HI_LO "$RELEASE_NUM" "$CG_NOCG" "$SP_NOSP" "$DIRECTION" $PROCESSING_LEVEL $PROCESSING_LEVEL "$CADENCE" "D.J. McComas" "(Princeton University, Princeton Plasma Physics Laboratory, PPPL)"

RELEASE_NUM=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $5 }' | sed 's/^R/Release/'`

CG_NOCG=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $6 }'`

SP_NOSP=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $7 }'`

DIRECTION=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $8 }' | sed 's/^ANTIRAM$/Antiram/' | sed 's/^OMNI$/Omni/' | sed 's/^RAM$/Ram/'`

CADENCE=`echo $DATA_PRODUCT_ID_UPPER | awk 'BEGIN { FS="_" } ; { print $9 }' | sed 's/^6MO$/P6M/' | sed 's/^1YR$/P1Y/' | sed 's/^2YR$/P2Y/' | sed 's/^3YR$/P3Y/' | sed 's/^11YR$/P11Y/'`

PATTERN_UPPER=`grep '	'$DATA_PRODUCT_ID_LOWER'	' spdf_data_product_all_20231219.tab | awk 'BEGIN { FS="	" } ; { print $4 }' | tr 'a-z' 'A-Z'`

PATTERN_LOWER=`grep '	'$DATA_PRODUCT_ID_LOWER'	' spdf_data_product_all_20231219.tab | awk 'BEGIN { FS="	" } ; { print $4 }' | tr 'A-Z' 'a-z'`

ACCESS_URL=`grep '	'$DATA_PRODUCT_ID_LOWER'	' spdf_data_product_all_20231219.tab | awk 'BEGIN { FS="	" } ; { print $5 }'`

printf "%s\t%s\tIBEX/%s/%s/%s/%s/%s/%s/%s\n" $DATA_PRODUCT_ID_LOWER $PATTERN_LOWER $HI_LO $PROCESSING_LEVEL $RELEASE_NUM $CG_NOCG $SP_NOSP $DIRECTION $CADENCE

printf "%s\t%s\tNASA/Granule/IBEX/%s/%s/%s/%s/%s/%s/%s\n" $DATA_PRODUCT_ID_LOWER $PATTERN_LOWER $HI_LO $PROCESSING_LEVEL $RELEASE_NUM $CG_NOCG $SP_NOSP $DIRECTION $CADENCE

printf "%s\t%s\tpub/data/%s/\n" $DATA_PRODUCT_ID_LOWER $PATTERN_LOWER $ACCESS_URL

# cdaweb_resource_id_final.tab:ibex_h3_ena_lo_r10_nocg_nosp_omni_6mo      yyyymmdd_ibex_map       IBEX/Lo/H3/Release10/NOCG/NOSP/Omni/P6M

# vcdawebo.tab:ibex_h3_ena_lo_r10_nocg_nosp_omni_6mo      yyyymmdd_ibex_map       NASA/Granule/IBEX/Lo/H3/Release10/NOCG/NOSP/Omni/P6M

# data_product_access_url_map_all.tab:ibex_h3_ena_lo_r10_nocg_nosp_omni_6mo       yyyymmdd_ibex_map       pub/data/ibex/cdf/h3/release10/ena_lo_nocg_nosp_omni_6mo/

# 12      11YR
# 30      1YR
# 1       2YR
# 4       3YR
# 18      6MO

# Data Release 10,     Compton-Getting corrected,     Survival Probability corrected, Antiram direction, West Longitude Ecliptic Maps
# Data Release 10,     Compton-Getting corrected,     Survival Probability corrected, Omnidirectional,   West Longitude Ecliptic Maps
# Data Release 10,     Compton-Getting corrected,     Survival Probability corrected, Ram direction,     West Longitude Ecliptic Maps
# Data Release 10,     Compton-Getting corrected, not Survival Probability corrected, Antiram direction, West Longitude Ecliptic Maps
# Data Release 04,     Compton-Getting corrected, not Survival Probability corrected, Omnidirectional,   West Longitude Ecliptic Maps
# Data Release 10,     Compton-Getting corrected, not Survival Probability corrected, Omnidirectional,   West Longitude Ecliptic Maps
# Data Release 10,     Compton-Getting corrected, not Survival Probability corrected, Ram direction,     West Longitude Ecliptic Maps
# Data Release 13,     Compton-Getting corrected, not Survival Probability corrected, Ram direction,     West Longitude Ecliptic Maps
# Data Release 10, not Compton-Getting corrected,     Survival Probability corrected, Antiram direction, West Longitude Ecliptic Maps
# Data Release 10, not Compton-Getting corrected,     Survival Probability corrected, Omnidirectional,   West Longitude Ecliptic Maps
# Data Release 10, not Compton-Getting corrected,     Survival Probability corrected, Ram direction,     West Longitude Ecliptic Maps
# Data Release 10, not Compton-Getting corrected, not Survival Probability corrected, Antiram direction, West Longitude Ecliptic Maps
# Data Release 10, not Compton-Getting corrected, not Survival Probability corrected, Omnidirectional,   West Longitude Ecliptic Maps
# Data Release 10, not Compton-Getting corrected, not Survival Probability corrected, Ram direction,     West Longitude Ecliptic Maps

