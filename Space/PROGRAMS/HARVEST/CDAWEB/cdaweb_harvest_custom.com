
!EXCEPT=2

start_process=systime(1)

stars=strjoin(replicate('*',275))

dashes='+'+strjoin(replicate('-',273))+'+'

project='CDAWEB'

project_lower=strlowcase(project)

project_upper=strupcase(project)

print,stars,format='(/a/)'

print,'Metadata Project:  '+project,format='(a/)'

print,stars,format='(a/)'

print,'Processing Start:  '+systime(),format='(a/)'

print,stars,format='(a/)'

;
;   Directory Definitions
;

print,'Hello World !!!',format='(a/)'

spawn,'echo $BASE_DIR',base_dir

spawn,'echo $HOME_DIR',home_dir

data_dir=home_dir+'/Space/DATA/'

program_dir=base_dir+'/'+project_upper+'/'

log_dir=program_dir+'LOG/'

spase_dir=base_dir+'/'+'SPASE/SCHEMA/'

print,home_dir,format='(a/)'

print,data_dir,format='(a/)'

print,base_dir,format='(a/)'

print,program_dir,format='(a/)'

print,log_dir,format='(a/)'

print,spase_dir,format='(a/)'

;
;   Expand the path for compiling IDL code
;

expand_path=':'+base_dir+'/'+['','SPASE/',project_upper+'/'+['','CREATE/','WRITE/','POPULATE/']]

!PATH=!PATH+strjoin(expand_path)

;
;   Compile IDL Canned Routines
;

.run caldat
.run julday
.run strsplit
.run timestamp
.run uniq

print,''

;
;   Compile UCLA General Usage Programs
;

.run $BASE_DIR/SPASE/spase_model_write_suffix
.run $BASE_DIR/SPASE/spase_model_blank_check

.run $BASE_DIR/GENERAL/cdf_date_to_spase_date
.run $BASE_DIR/GENERAL/fix_invalid_xml_characters
.run $BASE_DIR/GENERAL/trim_trailing_zeroes
.run $BASE_DIR/GENERAL/date_time_string
.run $BASE_DIR/GENERAL/format_float
.run $BASE_DIR/GENERAL/format_integer
.run $BASE_DIR/GENERAL/string_position
.run $BASE_DIR/GENERAL/string_condition
.run $BASE_DIR/GENERAL/read_ascii
.run $BASE_DIR/GENERAL/variable_attribute_superset
.run $BASE_DIR/GENERAL/read_cdf_metadata
.run $BASE_DIR/GENERAL/read_ls
.run $BASE_DIR/GENERAL/read_md5
.run $BASE_DIR/GENERAL/read_tab_table
.run $BASE_DIR/GENERAL/write_tab_table

print,''

;
;   Compile SPASE Schema Specific Programs
;

.run $BASE_DIR/SPASE/spase_model_reformat
.run $BASE_DIR/SPASE/spase_model_tree
.run $BASE_DIR/SPASE/spase_model_ontology_decode
.run $BASE_DIR/SPASE/spase_model_ontology
.run $BASE_DIR/SPASE/spase_model_keyword
.run $BASE_DIR/SPASE/spase_model_enumerate
.run $BASE_DIR/SPASE/spase_model_structure
.run $BASE_DIR/SPASE/spase_model_populate
.run $BASE_DIR/SPASE/spase_model_write
.run $BASE_DIR/SPASE/spase_model_uniqueness
.run $BASE_DIR/SPASE/spase_xml_tag_open
.run $BASE_DIR/SPASE/xml_tag_open
.run $BASE_DIR/SPASE/xml_tag_close
.run $BASE_DIR/SPASE/xml_element_write
.run $BASE_DIR/SPASE/xml_mirror
.run $BASE_DIR/SPASE/xml_structure_write
.run $BASE_DIR/SPASE/line_margin
.run $BASE_DIR/SPASE/read_spase_xml
.run $BASE_DIR/SPASE/register_resource
.run $BASE_DIR/SPASE/read_ack
.run $BASE_DIR/SPASE/ontology_tree
.run $BASE_DIR/SPASE/read_ontology
.run $BASE_DIR/SPASE/enumeration_tree
.run $BASE_DIR/SPASE/read_enumeration
.run $BASE_DIR/SPASE/spase_model_populate_new

print,''

;
;   Compile UCLA Specific SPASE Populate Program
;

.run $BASE_DIR/SPASE/CUSTOM/populate_registry_person_ucla

print,''

;
;   Compile CDAWEB Specific Metadata Harvesting Programs
;

.run $BASE_DIR/CDAWEB/cdaweb_spase_model_custom
.run $BASE_DIR/CDAWEB/cdaweb_spase
.run $BASE_DIR/CDAWEB/cdaweb_harvest_data_product
.run $BASE_DIR/CDAWEB/cdaweb_harvest_all
.run $BASE_DIR/CDAWEB/cdaweb_station_info
.run $BASE_DIR/CDAWEB/cdaweb_rule_set
.run $BASE_DIR/CDAWEB/cdaweb_granulate
.run $BASE_DIR/CDAWEB/cdaweb_granule_date_time
.run $BASE_DIR/CDAWEB/cdaweb_date_time
.run $BASE_DIR/CDAWEB/cdaweb_spase_map_measurement_type
.run $BASE_DIR/CDAWEB/cdaweb_spase_map_cadence
.run $BASE_DIR/CDAWEB/cdaweb_instrument_id_list

print,''

;
;   Compile MMS Custom Resource Description Programs
;

.run $BASE_DIR/CDAWEB/mms_aspoc_description
.run $BASE_DIR/CDAWEB/mms_dsp_description
.run $BASE_DIR/CDAWEB/mms_edi_description
.run $BASE_DIR/CDAWEB/mms_edp_description
.run $BASE_DIR/CDAWEB/mms_epd_eis_description
.run $BASE_DIR/CDAWEB/mms_feeps_description
.run $BASE_DIR/CDAWEB/mms_fgm_description
.run $BASE_DIR/CDAWEB/mms_fpi_description
.run $BASE_DIR/CDAWEB/mms_hpca_description
.run $BASE_DIR/CDAWEB/mms_mec_description
.run $BASE_DIR/CDAWEB/mms_scm_description

print,''

;
;   Compile Voyager Custom PLS Energy Channel Program
;

.run $BASE_DIR/CDAWEB/voyager_pls_energy_channel

print,''

;
;   Compile Project Specific SPASE Populate Programs
;

.run $BASE_DIR/CDAWEB/populate_registry
.run $BASE_DIR/CDAWEB/populate_person
.run $BASE_DIR/CDAWEB/populate_repository
.run $BASE_DIR/CDAWEB/populate_observatory
.run $BASE_DIR/CDAWEB/populate_observatory_logical
.run $BASE_DIR/CDAWEB/populate_instrument
.run $BASE_DIR/CDAWEB/populate_numerical_data
.run $BASE_DIR/CDAWEB/populate_granule

print,''

;
;   Compile CDAWEB Specific SPASE Write Programs
;

;run $BASE_DIR/CDAWEB/write_physical_parameter_custom
;run $BASE_DIR/CDAWEB/write_physical_parameter_time
.run $BASE_DIR/CDAWEB/write_numerical_data_custom

print,''

iso_8601_date=timestamp()

process_yymmdd=strmid(iso_8601_date,2,2)+strmid(iso_8601_date,5,2)+strmid(iso_8601_date,8,2)

create_harvest_log_file_name=log_dir+project_lower+'_harvest_'+process_yymmdd+'.log'

version_num=['1_2_2','2_0_0','2_0_1','2_1_0','2_2_0','2_2_2','2_2_9','2_3_0','2_3_1','2_3_2','2_4_0','2_6_0']

spase_versions=replicate(create_struct('version_num','','version_date','','xml_version_num','1.0'),n_elements(version_num))

spase_versions.version_num=version_num

spase_versions.version_date=['080320','090431','090431','090319','100917','110915','170921','180531','190613','201015','210902','230802']

spase_version=spase_versions(11)

openw,20,create_harvest_log_file_name

printf,20,stars,format='(/a/)'

printf,20,'BASH Script:       CDAWEB_HARVEST_CUSTOM',format='(a/)'

printf,20,'Processing Start:  ',systime(),format='(2a/)'

printf,20,stars,format='(a/)'

spase_ontology=cdaweb_spase_model(spase_version,spase_dir,program_dir,data_product_name,date_style)

help,data_product_name,date_style

;
;  Compile Custom SPASE Create Program
;

.run $BASE_DIR/CDAWEB/spase_model_create

print,'ZZZZZ',format='(/a)'

print,''

;
;  Compile Generic SPASE 1.2.2 Legacy Write Programs
;

.run $BASE_DIR/CDAWEB/WRITE/write_spase
.run $BASE_DIR/CDAWEB/WRITE/write_catalog
.run $BASE_DIR/CDAWEB/WRITE/write_resource_header
.run $BASE_DIR/CDAWEB/WRITE/write_publication_info
.run $BASE_DIR/CDAWEB/WRITE/write_funding
.run $BASE_DIR/CDAWEB/WRITE/write_contact
.run $BASE_DIR/CDAWEB/WRITE/write_information_url
.run $BASE_DIR/CDAWEB/WRITE/write_access_information
.run $BASE_DIR/CDAWEB/WRITE/write_access_url
.run $BASE_DIR/CDAWEB/WRITE/write_data_extent
.run $BASE_DIR/CDAWEB/WRITE/write_time_span
.run $BASE_DIR/CDAWEB/WRITE/write_display_data
.run $BASE_DIR/CDAWEB/WRITE/write_temporal_description
.run $BASE_DIR/CDAWEB/WRITE/write_numerical_data
.run $BASE_DIR/CDAWEB/WRITE/write_coordinate_system
.run $BASE_DIR/CDAWEB/WRITE/write_structure
.run $BASE_DIR/CDAWEB/WRITE/write_element
.run $BASE_DIR/CDAWEB/WRITE/write_field
.run $BASE_DIR/CDAWEB/WRITE/write_frequency_range
.run $BASE_DIR/CDAWEB/WRITE/write_wavelength_range
.run $BASE_DIR/CDAWEB/WRITE/write_particle
.run $BASE_DIR/CDAWEB/WRITE/write_energy_range
.run $BASE_DIR/CDAWEB/WRITE/write_azimuthal_angle_range
.run $BASE_DIR/CDAWEB/WRITE/write_polar_angle_range
.run $BASE_DIR/CDAWEB/WRITE/write_mass_range
.run $BASE_DIR/CDAWEB/WRITE/write_pitch_angle_range
.run $BASE_DIR/CDAWEB/WRITE/write_wave
.run $BASE_DIR/CDAWEB/WRITE/write_mixed
.run $BASE_DIR/CDAWEB/WRITE/write_support
.run $BASE_DIR/CDAWEB/WRITE/write_bin
;run $BASE_DIR/CDAWEB/WRITE/write_granule
.run $BASE_DIR/CDAWEB/WRITE/write_checksum
.run $BASE_DIR/CDAWEB/WRITE/write_instrument
.run $BASE_DIR/CDAWEB/WRITE/write_observatory
.run $BASE_DIR/CDAWEB/WRITE/write_location
.run $BASE_DIR/CDAWEB/WRITE/write_person
.run $BASE_DIR/CDAWEB/WRITE/write_registry
.run $BASE_DIR/CDAWEB/WRITE/write_repository
.run $BASE_DIR/CDAWEB/WRITE/write_service

;
;    Compile New WRITE routines added in transition from SPASE 1.2.2 to SPASE 2.0.0
;

.run $BASE_DIR/CDAWEB/WRITE/write_association
.run $BASE_DIR/CDAWEB/WRITE/write_parameter
.run $BASE_DIR/CDAWEB/WRITE/write_rendering_hints
.run $BASE_DIR/CDAWEB/WRITE/write_document
.run $BASE_DIR/CDAWEB/WRITE/write_source
.run $BASE_DIR/CDAWEB/WRITE/write_annotation
.run $BASE_DIR/CDAWEB/WRITE/write_observation_extent

;
;    Compile New WRITE routines added in transition from SPASE 2.0.0 to SPASE 2.1.0
;

.run $BASE_DIR/CDAWEB/WRITE/write_operating_span

print,''

.run $BASE_DIR/CDAWEB/POPULATE/populate_spase
.run $BASE_DIR/CDAWEB/POPULATE/populate_catalog
.run $BASE_DIR/CDAWEB/POPULATE/populate_resource_header
.run $BASE_DIR/CDAWEB/POPULATE/populate_publication_info
.run $BASE_DIR/CDAWEB/POPULATE/populate_funding
.run $BASE_DIR/CDAWEB/POPULATE/populate_contact
.run $BASE_DIR/CDAWEB/POPULATE/populate_information_url
.run $BASE_DIR/CDAWEB/POPULATE/populate_access_information
.run $BASE_DIR/CDAWEB/POPULATE/populate_access_url
.run $BASE_DIR/CDAWEB/POPULATE/populate_data_extent
.run $BASE_DIR/CDAWEB/POPULATE/populate_time_span
.run $BASE_DIR/CDAWEB/POPULATE/populate_display_data
.run $BASE_DIR/CDAWEB/POPULATE/populate_temporal_description
;run $BASE_DIR/CDAWEB/POPULATE/populate_numerical_data
.run $BASE_DIR/CDAWEB/POPULATE/populate_coordinate_system
.run $BASE_DIR/CDAWEB/POPULATE/populate_structure
.run $BASE_DIR/CDAWEB/POPULATE/populate_element
.run $BASE_DIR/CDAWEB/POPULATE/populate_field
.run $BASE_DIR/CDAWEB/POPULATE/populate_frequency_range
.run $BASE_DIR/CDAWEB/POPULATE/populate_wavelength_range
.run $BASE_DIR/CDAWEB/POPULATE/populate_particle
.run $BASE_DIR/CDAWEB/POPULATE/populate_energy_range
.run $BASE_DIR/CDAWEB/POPULATE/populate_azimuthal_angle_range
.run $BASE_DIR/CDAWEB/POPULATE/populate_polar_angle_range
.run $BASE_DIR/CDAWEB/POPULATE/populate_mass_range
.run $BASE_DIR/CDAWEB/POPULATE/populate_pitch_angle_range
.run $BASE_DIR/CDAWEB/POPULATE/populate_wave
.run $BASE_DIR/CDAWEB/POPULATE/populate_mixed
.run $BASE_DIR/CDAWEB/POPULATE/populate_support
.run $BASE_DIR/CDAWEB/POPULATE/populate_bin
.run $BASE_DIR/CDAWEB/POPULATE/populate_granule
.run $BASE_DIR/CDAWEB/POPULATE/populate_checksum
.run $BASE_DIR/CDAWEB/POPULATE/populate_instrument
.run $BASE_DIR/CDAWEB/POPULATE/populate_observatory
.run $BASE_DIR/CDAWEB/POPULATE/populate_location
.run $BASE_DIR/CDAWEB/POPULATE/populate_person
.run $BASE_DIR/CDAWEB/POPULATE/populate_registry
.run $BASE_DIR/CDAWEB/POPULATE/populate_repository
.run $BASE_DIR/CDAWEB/POPULATE/populate_service
.run $BASE_DIR/CDAWEB/POPULATE/populate_association
.run $BASE_DIR/CDAWEB/POPULATE/populate_parameter
.run $BASE_DIR/CDAWEB/POPULATE/populate_rendering_hints
.run $BASE_DIR/CDAWEB/POPULATE/populate_document
.run $BASE_DIR/CDAWEB/POPULATE/populate_source
.run $BASE_DIR/CDAWEB/POPULATE/populate_annotation
.run $BASE_DIR/CDAWEB/POPULATE/populate_observation_extent
.run $BASE_DIR/CDAWEB/POPULATE/populate_operating_span
.run $BASE_DIR/CDAWEB/POPULATE/populate_versions
.run $BASE_DIR/CDAWEB/POPULATE/populate_model_version
.run $BASE_DIR/CDAWEB/POPULATE/populate_spatial_description
.run $BASE_DIR/CDAWEB/POPULATE/populate_input_properties
.run $BASE_DIR/CDAWEB/POPULATE/populate_property
.run $BASE_DIR/CDAWEB/POPULATE/populate_output_parameters
.run $BASE_DIR/CDAWEB/POPULATE/populate_model
.run $BASE_DIR/CDAWEB/POPULATE/populate_diagnosis_time_step
.run $BASE_DIR/CDAWEB/POPULATE/populate_boundary_conditions
.run $BASE_DIR/CDAWEB/POPULATE/populate_region_parameter
.run $BASE_DIR/CDAWEB/POPULATE/populate_input_parameter
.run $BASE_DIR/CDAWEB/POPULATE/populate_input_population
.run $BASE_DIR/CDAWEB/POPULATE/populate_input_field
.run $BASE_DIR/CDAWEB/POPULATE/populate_input_process
.run $BASE_DIR/CDAWEB/POPULATE/populate_numerical_output
.run $BASE_DIR/CDAWEB/POPULATE/populate_display_output
.run $BASE_DIR/CDAWEB/POPULATE/populate_access_information_optional
.run $BASE_DIR/CDAWEB/POPULATE/populate_collection
.run $BASE_DIR/CDAWEB/POPULATE/populate_execution_environment
.run $BASE_DIR/CDAWEB/POPULATE/populate_input_property
.run $BASE_DIR/CDAWEB/POPULATE/populate_installer
.run $BASE_DIR/CDAWEB/POPULATE/populate_member
.run $BASE_DIR/CDAWEB/POPULATE/populate_model_domain
.run $BASE_DIR/CDAWEB/POPULATE/populate_model_run
.run $BASE_DIR/CDAWEB/POPULATE/populate_model_specification
.run $BASE_DIR/CDAWEB/POPULATE/populate_model_time
.run $BASE_DIR/CDAWEB/POPULATE/populate_output_property
.run $BASE_DIR/CDAWEB/POPULATE/populate_revision_event
.run $BASE_DIR/CDAWEB/POPULATE/populate_revision_history
.run $BASE_DIR/CDAWEB/POPULATE/populate_software
.run $BASE_DIR/CDAWEB/POPULATE/populate_spatial_coverage

;rint,''

;
;   Compile CDAWEB Master CDF and SPASE Utility Programs
;

.run $BASE_DIR/CDAWEB/global_attribute_grep
.run $BASE_DIR/CDAWEB/cadence_iso8601
.run $BASE_DIR/CDAWEB/keyword_populate
.run $BASE_DIR/CDAWEB/variable_attribute_grep
.run $BASE_DIR/CDAWEB/variable_attribute_metadata_grep
.run $BASE_DIR/CDAWEB/cdaweb_dimension_structure
.run $BASE_DIR/CDAWEB/cdaweb_granulate_finalize
;run $BASE_DIR/CDAWEB/cdaweb_metadata_unpack
.run $BASE_DIR/CDAWEB/date_to_scale_min_max

;
;   Compile the SPASE Extension Writing Programs
;

;run $BASE_DIR/CDAWEB/WRITE/write_versions
;run $BASE_DIR/CDAWEB/WRITE/write_model_version
;run $BASE_DIR/CDAWEB/WRITE/write_spatial_description
;run $BASE_DIR/CDAWEB/WRITE/write_input_properties
;run $BASE_DIR/CDAWEB/WRITE/write_property
;run $BASE_DIR/CDAWEB/WRITE/write_output_parameters
;run $BASE_DIR/CDAWEB/WRITE/write_model
;run $BASE_DIR/CDAWEB/WRITE/write_diagnosis_time_step
;run $BASE_DIR/CDAWEB/WRITE/write_boundary_conditions
;run $BASE_DIR/CDAWEB/WRITE/write_region_parameter
;run $BASE_DIR/CDAWEB/WRITE/write_input_parameter
;run $BASE_DIR/CDAWEB/WRITE/write_input_population
;run $BASE_DIR/CDAWEB/WRITE/write_input_field
;run $BASE_DIR/CDAWEB/WRITE/write_input_process
;run $BASE_DIR/CDAWEB/WRITE/write_numerical_output
;run $BASE_DIR/CDAWEB/WRITE/write_display_output

;
;   Compile the SPASE Extension Writing Programs
;

.run $BASE_DIR/CDAWEB/WRITE/write_access_information_optional
.run $BASE_DIR/CDAWEB/WRITE/write_collection
.run $BASE_DIR/CDAWEB/WRITE/write_execution_environment
.run $BASE_DIR/CDAWEB/WRITE/write_input_property
.run $BASE_DIR/CDAWEB/WRITE/write_installer
.run $BASE_DIR/CDAWEB/WRITE/write_member
.run $BASE_DIR/CDAWEB/WRITE/write_model_domain
.run $BASE_DIR/CDAWEB/WRITE/write_model_run
.run $BASE_DIR/CDAWEB/WRITE/write_model_specification
.run $BASE_DIR/CDAWEB/WRITE/write_model_time
.run $BASE_DIR/CDAWEB/WRITE/write_output_property
.run $BASE_DIR/CDAWEB/WRITE/write_revision_event
.run $BASE_DIR/CDAWEB/WRITE/write_revision_history
.run $BASE_DIR/CDAWEB/WRITE/write_software
.run $BASE_DIR/CDAWEB/WRITE/write_spatial_coverage

print,stars,format='(/a/)'

xml_dir=program_dir+'XML/'

file_check=file_info(xml_dir)

if (file_check.exists eq 0) then file_mkdir,xml_dir

spase_xml_template_file_name=xml_dir+'spase_model.xml'

openw,10,spase_xml_template_file_name

check_process=systime(1)

elapsed_time=check_process-start_process

printf,20,stars,format='(a/)'

printf,20,'Processing Check:  ',systime(),format='(2a/)'

printf,20,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

printf,20,stars,format='(a/)'

print,'Processing Check:  '+systime(),format='(a/)'

print,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

;pase=spase_model_create(spase_ontology,'spase',/verbose,/keyword_stop_date,/keyword_field)

;pase=spase_model_create(spase_ontology,'spase',/verbose,/keyword_stop_date)

check_process=systime(1)

elapsed_time=check_process-start_process

printf,20,stars,format='(a/)'

printf,20,'Processing Check:  ',systime(),format='(2a/)'

printf,20,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

printf,20,stars,format='(a/)'

print,'Processing Check:  '+systime(),format='(a/)'

print,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

;pase_xml=write_spase(spase,spase_ontology,spase_version,/keyword_stop_date,/keyword_field,/preview)

;pase_xml=write_spase(spase,spase_ontology,spase_version,/keyword_stop_date,/preview)

;heck_process=systime(1)

;lapsed_time=check_process-start_process

;rintf,20,stars,format='(/a/)'

;rintf,20,'Processing Check:  ',systime(),format='(2a/)'

;rintf,20,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

;rintf,20,stars,format='(a/)'

;rint,'Processing Check:  '+systime(),format='(/a/)'

;rint,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

;nique_spase_index=spase_model_uniqueness(strjoin(spase_xml))

;pase_xml=write_spase(spase,spase_ontology,spase_version,/keyword_stop_date,/keyword_field,/full)

;pase_xml=write_spase(spase,spase_ontology,spase_version,/keyword_stop_date,/full)

;elp,spase,/structure

;heck_process=systime(1)

;lapsed_time=check_process-start_process

;rintf,20,stars,format='(/a/)'

;rintf,20,'Processing Check:  ',systime(),format='(2a/)'

;rintf,20,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

;rintf,20,stars,format='(a/)'

;rint,'Processing Check:  '+systime(),format='(/a/)'

;rint,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

;umerical_data=spase_model_create(spase_ontology,'numerical_data',/verbose,/keyword_stop_date,/keyword_field)

;umerical_data=spase_model_create(spase_ontology,'numerical_data',/verbose,/keyword_stop_date)

check_process=systime(1)

elapsed_time=check_process-start_process

printf,20,stars,format='(a/)'

printf,20,'Processing Check:  ',systime(),format='(2a/)'

printf,20,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

printf,20,stars,format='(a/)'

print,'Processing Check:  '+systime(),format='(a/)'

print,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

full_index=0

;umerical_data_xml=write_numerical_data(numerical_data,spase_ontology(342:514),spase_xml,full_index,/keyword_stop_date,/keyword_field,/preview)

;umerical_data_xml=write_numerical_data(numerical_data,spase_ontology(342:514),spase_xml,full_index,/keyword_stop_date,/preview)

;elp,numerical_data,/structure

;heck_process=systime(1)

;lapsed_time=check_process-start_process

;rintf,20,stars,format='(/a/)'

;rintf,20,'Processing Check:  ',systime(),format='(2a/)'

;rintf,20,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

;rintf,20,stars,format='(a/)'

;rint,'Processing Check:  '+systime(),format='(/a/)'

;rint,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

;ull_index=0

;umerical_data_xml=write_numerical_data(numerical_data,spase_ontology(342:514),spase_xml,full_index,/keyword_stop_date,/keyword_field,/full)

;umerical_data_xml=write_numerical_data(numerical_data,spase_ontology(342:514),spase_xml,full_index,/keyword_stop_date,/full)

;elp,numerical_data,/structure

close,10

check_process=systime(1)

elapsed_time=check_process-start_process

printf,20,stars,format='(a/)'

printf,20,'Processing Check:  ',systime(),format='(2a/)'

printf,20,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

printf,20,stars,format='(a/)'

print,'Processing Check:  '+systime(),format='(a/)'

print,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

;
;   Harvest the Project Specific Data Sets
;

cdf_master_dir_name='MASTERS_20231104'

cdf_master_dir_name='MASTERS_20230915'

print,stars,'Hello World !!!',stars,format='(a//a//a/)'

cdaweb_harvest_all,spase_ontology,spase_version,cdf_master_dir_name,project,program_dir,data_dir,process_yymmdd,data_product_name,date_style

stop_process=systime(1)

elapsed_time=stop_process-start_process

printf,20,stars,format='(a/)'

printf,20,'Processing Stop:   ',systime(),format='(2a/)'

printf,20,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

printf,20,stars,format='(a/)'

print,stars,format='(a/)'

print,'Processing Stop:   ',systime(),format='(2a/)'

print,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

print,stars,format='(a/)'

close,20

exit

