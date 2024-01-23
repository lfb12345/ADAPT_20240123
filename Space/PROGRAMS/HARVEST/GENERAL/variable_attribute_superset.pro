
function variable_attribute_superset,data_product_id,variable_attribute_list

data_product_id_split=strsplit(data_product_id,'_',/extract)

data_product_id_split_num=n_elements(data_product_id_split)

search_key='unknown'

if (strmid(data_product_id,0,8) eq 'erg_mgf_') then search_key='erg_mgf'

if (strmid(data_product_id,0,8) eq 'erg_orb_') then search_key='erg_orb'

if (strmid(data_product_id,0,8) eq 'erg_pwe_') then search_key='erg_pwe'

if (strmid(data_product_id,0,4) eq 'erg_' and isa(search_key) eq 0B) then search_key='erg_particle'

helio1day_position=data_product_id_split(1)+'_'+data_product_id_split(2)

if (helio1day_position eq 'helio1day_position') then search_key='helio1day_position'

if (strmid(data_product_id,0,7) eq 'i1_av2_') then search_key='isis_av2'

if (strmid(data_product_id,0,12) eq 'ibex_h3_ena_') then search_key='ibex_h3_ena'

image_euv=data_product_id_split(0)+'_'+data_product_id_split(2)

if (image_euv eq 'image_euv') then search_key='image_euv'

if (strmatch(strmid(data_product_id,0,11),'mms[1-4]_aspoc_') eq 1) then search_key='mms_aspoc'

if (strmatch(strmid(data_product_id,0,10),'mms[1-4]_hpca_') eq 1) then search_key='mms_hpca'

if (strmatch(data_product_id,'omni_hro2_[15]min') eq 1) then search_key='omni_hro2_min'

if (data_product_id_split_num eq 5) then begin

   coho1hr_merged_mag_plasma=strjoin(data_product_id_split(1:4),'_')

   if (coho1hr_merged_mag_plasma eq 'coho1hr_merged_mag_plasma') then search_key='coho1hr_merged_mag_plasma'

endif

if (strmid(data_product_id,0,8) eq 'psp_fld_') then search_key='psp_fld'

if (strmatch(strmid(data_product_id,0,10),'psp_isois[_-]') eq 1) then search_key='psp_isois'

if (strmid(data_product_id,0,8) eq 'psp_swp_') then search_key='psp_swp'

if (strmid(data_product_id,0,11) eq 'sta_l3_pla_') then search_key='sta_l3_pla'

sta_mag=data_product_id_split(0)+'_'+data_product_id_split(2)

if (sta_mag eq 'sta_mag') then search_key='sta_mag'

twins_ena=data_product_id_split(0)+'_'+data_product_id_split(2)

if (twins_ena eq 'twins_ena') then search_key='twins_ena'

if (strmid(data_product_id,0,11) eq 'thg_l2_mag_') then search_key='thg_l2_mag'

if (strmatch(strmid(data_product_id,0,13),'voyager[12]_crs_') eq 1) then search_key='voyager_crs'

if (strmid(data_product_id,0,7) eq 'tss-1r_') then search_key='tss_1r'

if (data_product_id eq 'messenger_mag_rtn') then search_key='masters_200430'

if (data_product_id eq 'sta_coho1hr_merged_mag_plasma') then search_key='masters_200430'

if (data_product_id eq 'sta_l1_magb_rtn') then search_key='masters_200430'

if (data_product_id eq 'sta_l1_magb_sc') then search_key='masters_200430'

if (data_product_id eq 'sta_l1_swea_disb') then search_key='masters_200430'

if (data_product_id eq 'sta_l1_swea_dist') then search_key='masters_200430'

if (data_product_id eq 'sta_l3_pla_heplus_24hr') then search_key='masters_200430'

if (data_product_id eq 'stb_coho1hr_merged_mag_plasma') then search_key='masters_200430'

if (data_product_id eq 'stb_l1_magb_rtn') then search_key='masters_200430'

if (data_product_id eq 'stb_l1_magb_sc') then search_key='masters_200430'

if (data_product_id eq 'stb_l1_swea_disb') then search_key='masters_200430'

if (data_product_id eq 'stb_l1_swea_dist') then search_key='masters_200430'

if (data_product_id eq 'timed_windvectorsncar_tidi') then search_key='masters_200430'

if (data_product_id eq 'twins1_at_def') then search_key='masters_200430'

if (data_product_id eq 'twins2_at_def') then search_key='masters_200430'

if (data_product_id eq 'wi_elsp_3dp') then search_key='masters_200430'

if (data_product_id eq 'wi_h0_wav') then search_key='masters_200430'

if (data_product_id eq 'wi_k0_mfi') then search_key='masters_200430'

if (data_product_id eq 'wi_k0_spha') then search_key='masters_200430'

if (data_product_id eq 'wi_k0_swe') then search_key='masters_200430'

if (data_product_id eq 'wi_k0_wav') then search_key='masters_200430'

if (data_product_id eq 'wi_sw-ion-dist_swe-faraday') then search_key='masters_200430'

if (data_product_id eq 'fast_teams_l2') then search_key='masters_200519'

if (strmid(data_product_id,0,3) eq 'ge_') then search_key='geotail_200519'

if (strmid(data_product_id,0,4) eq 'de2_') then search_key='de2_200519'

if (data_product_id eq 'pioneervenus_merged_solar-wind_10m') then search_key='pvo_200519'

if (strmid(data_product_id,0,5) eq 'soho_') then search_key='soho'

if (strmid(data_product_id,0,5) eq 'solo_') then search_key='solo'

if (strmid(data_product_id,0,4) eq 'bar_') then search_key='barrel'

if (strmid(data_product_id,0,4) eq 'mvn_') then search_key='maven'

case search_key of

     'erg_mgf': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','avg_type','labl_ptr_1','monoton','scaletyp','time_base','unit_ptr']

     'erg_orb': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','avg_type','labl_ptr_1','monoton','scaletyp','time_base','unit_ptr']

     'erg_pwe': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','arr_dim','arr_index','avg_type','component_0','depend_1','depend_2','funct','labl_ptr_1','labl_ptr_2','monoton','scaletyp','time_base','unit_ptr','virtual']

     'erg_particle': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','allow_bin','arr_dim','arr_index','avg_type','component_0','component_1','depend_1','depend_2','depend_3','form_ptr','funct','labl_ptr_1','labl_ptr_2','monoton','scaletyp','scal_ptr','time_base','unit_ptr','virtual']

     'helio1day_position': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','avg_type','component_0','delta_minus_var','delta_plus_var','depend_1','dict_key','form_ptr','funcxion','labl_ptr_1','labl_ptr_2','monoton','scaletyp','scal_ptr','unit_ptr','virtual']

     'isis_av2': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','avg_type','component_0','depend_1','dict_key','form_ptr','funcxion','labl_ptr_1','monoton','scaletyp','unit_ptr','virtual']

     'ibex_h3_ena': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','absolute_error','allow_bin','bin_location','component_0','depend_1','depend_2','depend_3','dict_key','form_ptr','funct','labl_ptr_1','labl_ptr_2','labl_ptr_3','leap_seconds_included','monoton','reference_position','relative_error','resolution','scaletyp','scal_ptr','time_base','time_scale','unit_ptr','virtual']

     'image_euv': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','component_0','depend_1','depend_2','funct','scaletyp','time_base','virtual']

     'mms_aspoc': $
        variable_attribute_superset_list=['fieldnam','lablaxis','units','catdesc','delta_plus_var','delta_minus_var','validmin','validmax','scalemin','scalemax','format','fillval','var_type','scaletyp','monoton','depend_0','display_type','dict_key','fRAME','si_conversion','sIG_DIGITS','sc_ID','var_notes','form_ptr','unit_ptr','scal_ptr','depend_1','labl_ptr_1','time_base']

     'mms_hpca': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','component_0','coordinate_system','delta_minus_var','delta_plus_var','depend_1','depend_2','funct','labl_ptr_1','labl_ptr_2','monoton','scaletyp','si_conversion','time_base','virtual']

     'omni_hro2_min': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','dict_key','form_ptr','scaletyp','scal_ptr','unit_ptr']

     'coho1hr_merged_mag_plasma': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','avg_type','delta_minus_var','delta_plus_var','depend_1','dict_key','form_ptr','labl_ptr_1','labl_ptr_2','monoton','scaletyp','scal_ptr','unit_ptr']

     'psp_fld': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','coordinate_system','depend_1','labl_ptr_1','monoton','scaletyp']

     'psp_swp': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','coordinate_system','depend_1','labl_ptr_1','monoton','scaletyp','component_0','depend_2','dict_key','funct','labl_ptr_2','virtual']

     'psp_isois': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','coordinate_system','depend_1','labl_ptr_1','monoton','scaletyp','component_0','dict_key','depend_2','funct','labl_ptr_2','virtual','arr_dim','arr_index','chan_name','delta_minus_var','delta_plus_var','flux_ptr','mnemonic','si_conversion','species','time_base','time_scale','variable_purpose','v_parent']

     'sta_l3_pla': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','component_0','depend_1','dict_key','form_ptr','funct','labl_ptr_1','labl_ptr_2','labl_ptr_3','monoton','resolution','scaletyp','scal_ptr','unit_ptr','virtual']

     'sta_mag': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','component_0','depend_1','depend_2','depend_3','dict_key','form_ptr','funct','labl_ptr_1','labl_ptr_2','labl_ptr_3','scaletyp','scal_ptr','unit_ptr','virtual']

     'thg_l2_mag': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','component_0','component_1','depend_1','depend_epoch0','depend_time','dict_key','funct','labl_ptr_1','scaletyp','station_latitude','station_longitude','unit_ptr','virtual']

     'twins_ena': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','component_0','depend_1','depend_2','funct','time_base','virtual']

     'voyager_crs': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','units','scalemin','scalemax','validmin','validmax','fillval','depend_0','format','lablaxis','var_type','display_type','delta_minus_var','delta_plus_var','scaletyp']

     'tss_1r': $
        variable_attribute_superset_list=['avg_type','catdesc','calib_input','calib_software','delta_minus_var','delta_plus_var','depend_0','depend_1','depend_2','dict_key','display_type','fieldnam','fillval','format','frame','lablaxis','labl_ptr_1','labl_ptr_2','monoton','scalemax','scalemin','scaletyp','sc_id','si_conversion','sig_digits','time_base','units','validmax','validmin','var_type']

     'masters_200430': $
        variable_attribute_superset_list=['absolute_error','allow_bin','avg_type','bin_location','catdesc','component_0','component_1','component_2','component_3','delta_minus_var','delta_plus_var','depend_0','depend_1','depend_2','depend_3','dict_key','display_type','fieldnam','fillval','format','form_ptr','funct','funxtion','internal_variable','lablaxis','labl_ptr_1','labl_ptr_2','labl_ptr_3','leap_seconds_included','monoton','reference_position','relative_error','resolution','scalemax','scalemin','scaletyp','scal_ptr','time_base','time_res','time_scale','units','unit_ptr','validmax','validmin','var_notes','var_type','virtual']

     'masters_200519': $
        variable_attribute_superset_list=['fieldnam','time_scale','scalemax','var_type','validmin','monoton','time_base','catdesc','units','si_conversion','dict_key','fillval','lablaxis','scaletyp','scalemin','validmax','mnemonic','display_type','depend_0','format','var_notes','delta_plus_var','delta_minus_var','depend_1','depend_2','labl_ptr_1','labl_ptr_2','scaletype']

     'geotail_200519': $
        variable_attribute_superset_list=['fieldnam','catdesc','depend_0','depend_1','depend_2','depend_3','dict_key','display_type','fillval','format','lablaxis','labl_ptr_1','labl_ptr_2','labl_ptr_3','units','unit_ptr','validmin','validmax','var_type','scaletyp','scal_ptr','var_notes','form_ptr']

     'de2_200519': $
        variable_attribute_superset_list=['avg_type','catdesc','delta_minus_var','delta_plus_var','depend_0','depend_1','depend_2','dict_key','display_type','fieldnam','fillval','format','form_ptr','lablaxis','labl_ptr_1','labl_ptr_2','monoton','scalemax','scalemin','scaletyp','units','unit_ptr','validmax','validmin','var_notes','var_type']

     'pvo_200519': $
        variable_attribute_superset_list=['fieldnam','catdesc','depend_0','depend_1','depend_2','depend_3','dict_key','display_type','fillval','format','lablaxis','labl_ptr_1','labl_ptr_2','labl_ptr_3','units','unit_ptr','validmin','validmax','var_type','scaletyp','scal_ptr','var_notes','form_ptr']

     'soho': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_type','units','depend_0','depend_1','display_type','component_0','format','funct','lablaxis','labl_ptr_1','time_base','fillval','scaletyp','validmax','validmin','virtual','delta_minus_var','delta_plus_var','monoton']

     'solo': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','var_type','ucd','units','unit_ptr','detector','si_conversion','cadence','resolution','acc_time','time_base','time_scale','integration_time','depend_0','depend_1','depend_2','depend_3','dict_key','display_type','component_0','format','form_ptr','funxtion','lablaxis','labl_ptr_1','labl_ptr_2','labl_ptr_3','label','leap_seconds_included','coordinate_system','frame_origin','frame_velocity','reference_position','representation_1','representation_2','tensor_order','fillval','scalemax','scalemin','scaletyp','scaletype','scal_ptr','validmax','validmin','virtual','bin_location','delta_minus_var','delta_plus_var','monoton']

     'barrel': $
        variable_attribute_superset_list=['fieldnam','catdesc','var_notes','var_type','units','fillval','validmax','validmin','format','display_type','scaletyp','depend_0','depend_1','lablaxis','delta_minus_var','delta_plus_var','time_base','time_scale','monoton','reference_position']

     else: $
        variable_attribute_superset_list=variable_attribute_list

endcase

return,variable_attribute_superset_list

end

