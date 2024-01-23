
pro variable_attribute_superset_lookup_test

data_product_list=['bepicolombo_helio1day_position','erg_hep_l2_omniflux','erg_lepe_l2_omniflux','erg_lepi_l2_omniflux','erg_mepe_l2_3dflux','erg_mepe_l2_omniflux','erg_mepi_l2_3dflux','erg_mepi_l2_omniflux','erg_mgf_l2_8sec','erg_orb_l2','erg_orb_l3','erg_orb_l3_t89', $
                   'erg_orb_lpre_l2','erg_orb_mpre_l2','erg_orb_pre_l2','erg_orb_spre_l2','erg_pwe_efd_l2_e_spin','erg_pwe_efd_l2_pot','erg_pwe_hfa_l2_spec_high','erg_pwe_hfa_l2_spec_low','erg_pwe_hfa_l2_spec_monit','erg_pwe_ofa_l2_spec','erg_xep_l2_omniflux','i1_av2_qui', $
                   'i1_av2_ula','ibex_h3_ena_hi_r10_cg_nosp_antiram_7yr','ibex_h3_ena_hi_r10_cg_nosp_omni_7yr','ibex_h3_ena_hi_r10_cg_nosp_ram_7yr','ibex_h3_ena_hi_r10_cg_sp_antiram_7yr','ibex_h3_ena_hi_r10_cg_sp_omni_7yr','ibex_h3_ena_hi_r10_cg_sp_ram_7yr', $
                   'ibex_h3_ena_hi_r10_nocg_nosp_antiram_7yr','ibex_h3_ena_hi_r10_nocg_nosp_omni_7yr','ibex_h3_ena_hi_r10_nocg_sp_antiram_7yr','ibex_h3_ena_hi_r10_nocg_sp_omni_7yr','ibex_h3_ena_hi_r13_cg_nosp_ram_1yr','ibex_h3_ena_lo_r10_nocg_nosp_omni_7yr', $
                   'ibex_h3_ena_lo_r10_nocg_sp_omni_7yr','image_m2_euv','mms1_hpca_srvy_l2_tof-counts','mms2_hpca_srvy_l2_tof-counts','mms3_hpca_srvy_l2_tof-counts','mms4_hpca_srvy_l2_tof-counts','omni_hro2_1min','omni_hro2_5min','psp_coho1hr_merged_mag_plasma', $
                   'psp_fld_l2_dfb_ac_bpf_dv12hg','psp_fld_l2_dfb_ac_bpf_dv34hg','psp_fld_l2_dfb_ac_spec_scmulflg','psp_fld_l2_dfb_ac_spec_scmvlfhg','psp_fld_l2_dfb_ac_spec_v5hg','psp_fld_l2_dfb_ac_xspec_dv12hg_dv34hg','psp_fld_l2_dfb_ac_xspec_scmdlfhg_scmelfhg', $
                   'psp_fld_l2_dfb_ac_xspec_scmdlfhg_scmflfhg','psp_fld_l2_dfb_ac_xspec_scmelfhg_scmflfhg','psp_fld_l2_dfb_dbm_dvac','psp_fld_l2_dfb_dbm_scm','psp_fld_l2_dfb_dc_bpf_dv12hg','psp_fld_l2_dfb_dc_bpf_dv34hg','psp_fld_l2_dfb_dc_bpf_scmvlfhg', $
                   'psp_fld_l2_dfb_dc_spec_scmulfhg','psp_fld_l2_dfb_dc_spec_scmvlfhg','psp_fld_l2_dfb_dc_spec_scmwlfhg','psp_fld_l2_dfb_dc_xspec_scmdlfhg_scmelfhg','psp_fld_l2_dfb_dc_xspec_scmdlfhg_scmflfhg','psp_fld_l2_dfb_dc_xspec_scmelfhg_scmflfhg', $
                   'solar-orbiter_helio1day_position','sta_l3_pla_he2pl_f_vsw_01hr','sta_l3_pla_heplus_f_vsw_10min','sta_l3_pla_heplus_sw_velctdist_5min','sta_lb_mag_rtn','thg_l2_mag_chbr','twins_m2_ena','voyager1_crs_daily_flux']

data_product_list_num=n_elements(data_product_list)

print,''

for loop=0,data_product_list_num-1 do print,data_product_list(loop)+string(9B)+strjoin(variable_attribute_superset(data_product_list(loop),'Hello World !!!'),string(9B))

print,''

end

