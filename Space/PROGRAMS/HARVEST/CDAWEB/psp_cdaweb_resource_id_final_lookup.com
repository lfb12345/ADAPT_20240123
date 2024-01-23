grep ^'psp_swp_spa_sf0_l2_16ax8dx32e	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_swp_spa_sf1_l2_32e	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_swp_spi_sf00_l2_8dx32ex8a	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_swp_spi_sf0a_l3_mom_inst	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_swp_spa_sf0_l3_pad	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_swp_spi_sf00_l3_mom_inst	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_swp_spb_sf0_l2_16ax8dx32e	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_swp_spb_sf1_l2_32e	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_swp_spb_sf0_l3_pad	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_swp_spe_sf0_l3_pad	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_swp_spc_l2i	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_swp_spc_l3i	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_bpf_dv12hg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_bpf_dv34hg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_bpf_scmumfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_bpf_scmulfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dbm_dvac	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dbm_scm	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_xspec_dv12hg_dv34hg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_xspec_scmdlfhg_scmelfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_xspec_scmdlfhg_scmflfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_xspec_scmelfhg_scmflfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_spec_dv12hg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_spec_dv34hg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_spec_scmdlfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_spec_scmelfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_spec_scmflfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_spec_scmulflg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_spec_scmvlfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_spec_scmmf	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_ac_spec_v5hg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_bpf_dv12hg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_bpf_dv34hg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_bpf_scmulfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_bpf_scmvlfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_xspec_scmdlfhg_scmelfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_xspec_scmdlfhg_scmflfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_xspec_scmelfhg_scmflfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_xspec_scmvlfhg_scmwlfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_spec_dv12hg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_spec_scmdlfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_spec_scmelfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_spec_scmflfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_spec_scmulfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_spec_scmvlfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dc_spec_scmwlfhg	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_wf_dvdc	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_wf_vdc	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_wf_scm	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_f2_100bps	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_mag_rtn_4_sa_per_cyc	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_mag_rtn	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_mag_rtn_1min	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_mag_sc_4_sa_per_cyc	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_mag_sc	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_mag_sc_1min	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_rfs_hfr	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_rfs_lfr	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dbm_dvdc	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dbm_vac	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_dfb_dbm_vdc	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_mag_vso	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
grep ^'psp_fld_l2_rfs_burst	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'
echo
grep ^'psp_fld_l3_merged_scam_wf	' cdaweb_resource_id_final.tab | awk 'BEGIN { FS="	" } ; { print "NASA/NumericalData/"$3 }'