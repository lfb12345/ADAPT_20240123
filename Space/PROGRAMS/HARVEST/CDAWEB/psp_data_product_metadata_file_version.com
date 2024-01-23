
DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

printf "%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_fld_l2_dfb_dbm_dvdc_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_fld_l2_dfb_dbm_scm_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_fld_l2_dfb_dbm_vac_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_fld_l2_dfb_dbm_vdc_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_fld_l2_dfb_wf_dvdc_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_fld_l2_dfb_wf_scm_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_fld_l2_f2_100bps_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_fld_l2_mag_vso_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_fld_l2_rfs_burst_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_fld_l3_merged_scam_wf_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-het-rates10_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-het-rates300_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-het-rates3600_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-het-rates60_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-let1-rates10_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-let1-rates300_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-let1-rates3600_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-let1-rates60_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-let2-rates10_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-let2-rates300_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-let2-rates3600_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-let2-rates60_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epihi_l2-second-rates_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epilo_l2-ic_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois-epilo_l2-pe_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_isois_l2-summary_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_swp_spa_sf0_l3_pad_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_swp_spb_sf0_l3_pad_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_swp_spe_sf0_l3_pad_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_swp_spi_sf00_l3_mom_inst_ | grep -v LOG_20210204_20210215

printf "\n%s\n\n" $DASHES

find DELIVERY/PARKER_SOLAR_PROBE/LOG_PSP_191* LOG_* | grep _psp_swp_spi_sf0a_l3_mom_inst_ | grep -v LOG_20210204_20210215

printf "\n%s\n" $DASHES

