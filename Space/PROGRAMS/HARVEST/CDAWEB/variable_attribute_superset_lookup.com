
#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/*_helio1day_position_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/erg_mgf_*_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/erg_orb_*_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/erg_pwe_*_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/erg_*_00000000_v01.txt | grep -v erg_mgf | grep -v erg_orb | grep -v erg_pwe | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/ibex_h3_ena_*_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/i1_av2_*_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/image_*_euv_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/mms[1-4]_hpca_*_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/omni_hro2_*_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/*_coho1hr_merged_mag_plasma_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/psp_fld_l2_dfb_*_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/sta_l3_pla_*_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/sta_*_mag*_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/thg_l2_mag_*_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

#  VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/twins_*_ena_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

VARIABLE_ATTRIBUTE_LIST=`grep -h ^'Variable Attribute List:  ' MASTERS_200320/voyager[12]_crs_*_00000000_v01.txt | sed 's/^Variable\ Attribute\ List:\ \ //' | sort | uniq | tr 'A-Z' 'a-z'`

echo

printf "     variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type',"

for VARIABLE_ATTRIBUTE in $VARIABLE_ATTRIBUTE_LIST

do

    MATCH_NUM=`grep -c ^$VARIABLE_ATTRIBUTE$ variable_attribute_superset_lookup.txt`

    if [ $MATCH_NUM == 0 ]; then printf "'%s'," $VARIABLE_ATTRIBUTE; fi

done

printf "]\n"

echo

printf "     variable_attribute_superset_list_record=create_struct('fieldnam','','catdesc','','var_notes','','units','','scalemin','','scalemax','','validmin','','validmax','','fillval','','depend_0','','format','','lablaxis','','var_type','','display_type','',"

for VARIABLE_ATTRIBUTE in $VARIABLE_ATTRIBUTE_LIST

do

    MATCH_NUM=`grep -c ^$VARIABLE_ATTRIBUTE$ variable_attribute_superset_lookup.txt`

    if [ $MATCH_NUM == 0 ]; then printf "'%s',''," $VARIABLE_ATTRIBUTE; fi

done

printf ")\n"

echo

