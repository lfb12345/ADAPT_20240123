
function spase_model_create,spase_ontology,request,verbose=verbose,keyword_required=keyword_required,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,keyword_input_property=keyword_input_property,keyword_output_property=keyword_output_property,keyword_cubes_description=keyword_cubes_description,keyword_cuts_description=keyword_cuts_description,keyword_plane_normal_vector=keyword_plane_normal_vector,keyword_plane_point=keyword_plane_point,keyword_region_begin=keyword_region_begin,keyword_region_end=keyword_region_end,keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter

rendering_hints=create_struct(name='RenderingHints','display_type','','axis_label','','rendering_axis','','index','','value_format','','scale_min','','scale_max','','scale_type','')

if (request eq 'rendering_hints') then requested_structure=rendering_hints

if not keyword_set(keyword_required) then bin=create_struct(name='Bin','band_name','','low','','high','')

if keyword_set(keyword_required) then bin=create_struct(name='Bin','low','','high','')

if (request eq 'bin') then requested_structure=bin

if not keyword_set(keyword_required) then element=create_struct(name='Element','name','','qualifier',make_array(spase_ontology(1433).occur_num,/string,value=''),'index','','parameter_key','','units','','units_conversion','','valid_min','','valid_max','','fill_value','','rendering_hints',rendering_hints)

if keyword_set(keyword_required) then element=create_struct(name='Element','name','','index','')

if (request eq 'element') then requested_structure=element

if not keyword_set(keyword_required) then frequency_range=create_struct(name='FrequencyRange','spectral_range','','low','','high','','units','','bin',replicate(bin,spase_ontology(1461).occur_num))

if keyword_set(keyword_required) then frequency_range=create_struct(name='FrequencyRange','low','','high','','units','')

if (request eq 'frequency_range') then requested_structure=frequency_range

if not keyword_set(keyword_required) then energy_range=create_struct(name='EnergyRange','low','','high','','units','','bin',replicate(bin,spase_ontology(1474).occur_num))

if keyword_set(keyword_required) then energy_range=create_struct(name='EnergyRange','low','','high','','units','')

if (request eq 'energy_range') then requested_structure=energy_range

if not keyword_set(keyword_required) then azimuthal_angle_range=create_struct(name='AzimuthalAngleRange','low','','high','','units','','bin',replicate(bin,spase_ontology(1482).occur_num))

if keyword_set(keyword_required) then azimuthal_angle_range=create_struct(name='AzimuthalAngleRange','low','','high','','units','')

if (request eq 'azimuthal_angle_range') then requested_structure=azimuthal_angle_range

if not keyword_set(keyword_required) then polar_angle_range=create_struct(name='PolarAngleRange','low','','high','','units','','bin',replicate(bin,spase_ontology(1490).occur_num))

if keyword_set(keyword_required) then polar_angle_range=create_struct(name='PolarAngleRange','low','','high','','units','')

if (request eq 'polar_angle_range') then requested_structure=polar_angle_range

if not keyword_set(keyword_required) then mass_range=create_struct(name='MassRange','low','','high','','units','','bin',replicate(bin,spase_ontology(1498).occur_num))

if keyword_set(keyword_required) then mass_range=create_struct(name='MassRange','low','','high','','units','')

if (request eq 'mass_range') then requested_structure=mass_range

if not keyword_set(keyword_required) then pitch_angle_range=create_struct(name='PitchAngleRange','low','','high','','units','','bin',replicate(bin,spase_ontology(1506).occur_num))

if keyword_set(keyword_required) then pitch_angle_range=create_struct(name='PitchAngleRange','low','','high','','units','')

if (request eq 'pitch_angle_range') then requested_structure=pitch_angle_range

if not keyword_set(keyword_required) then wavelength_range=create_struct(name='WavelengthRange','spectral_range','','low','','high','','units','','bin',replicate(bin,spase_ontology(1540).occur_num))

if keyword_set(keyword_required) then wavelength_range=create_struct(name='WavelengthRange','low','','high','','units','')

if (request eq 'wavelength_range') then requested_structure=wavelength_range

revision_event=create_struct(name='RevisionEvent','release_date','','note','')

if (request eq 'revision_event') then requested_structure=revision_event

coordinate_system=create_struct(name='CoordinateSystem','coordinate_representation','','coordinate_system_name','')

if (request eq 'coordinate_system') then requested_structure=coordinate_system

if not keyword_set(keyword_required) then structure=create_struct(name='Structure','size','','description','','element',replicate(element,spase_ontology(1431).occur_num))

if keyword_set(keyword_required) then structure=create_struct(name='Structure','size','')

if (request eq 'structure') then requested_structure=structure

if not keyword_set(keyword_required) then field=create_struct(name='Field','qualifier',make_array(spase_ontology(1454).occur_num,/string,value=''),'field_quantity','','frequency_range',frequency_range)

if keyword_set(keyword_required) then field=create_struct(name='Field','field_quantity','')

if (request eq 'field') then requested_structure=field

if not keyword_set(keyword_required) then particle=create_struct(name='Particle','particle_type',make_array(spase_ontology(1466).occur_num,/string,value=''),'qualifier',make_array(spase_ontology(1467).occur_num,/string,value=''),'particle_quantity','','atomic_number',make_array(spase_ontology(1469).occur_num,/string,value=''),'energy_range',energy_range,'azimuthal_angle_range',azimuthal_angle_range,'polar_angle_range',polar_angle_range,'mass_range',mass_range,'pitch_angle_range',pitch_angle_range,'chemical_formula','','population','','population_mass_number','','population_charge_state','')

if keyword_set(keyword_required) then particle=create_struct(name='Particle','particle_type',make_array(spase_ontology(1466).occur_num,/string,value=''),'particle_quantity','')

if (request eq 'particle') then requested_structure=particle

if not keyword_set(keyword_required) then wave=create_struct(name='Wave','wave_type','','qualifier',make_array(spase_ontology(1516).occur_num,/string,value=''),'wave_quantity','','energy_range',energy_range,'frequency_range',frequency_range,'wavelength_range',wavelength_range)

if keyword_set(keyword_required) then wave=create_struct(name='Wave','wave_quantity','')

if (request eq 'wave') then requested_structure=wave

if not keyword_set(keyword_required) then mixed=create_struct(name='Mixed','mixed_quantity','','particle_type',make_array(spase_ontology(1546).occur_num,/string,value=''),'qualifier',make_array(spase_ontology(1547).occur_num,/string,value=''))

if keyword_set(keyword_required) then mixed=create_struct(name='Mixed','mixed_quantity','')

if (request eq 'mixed') then requested_structure=mixed

if not keyword_set(keyword_required) then support=create_struct(name='Support','qualifier',make_array(spase_ontology(1549).occur_num,/string,value=''),'support_quantity','')

if keyword_set(keyword_required) then support=create_struct(name='Support','support_quantity','')

if (request eq 'support') then requested_structure=support

revision_history=create_struct(name='RevisionHistory','revision_event',replicate(revision_event,spase_ontology(10).occur_num))

if (request eq 'revision_history') then requested_structure=revision_history

if not keyword_set(keyword_required) then publication_info=create_struct(name='PublicationInfo','title','','authors','','publication_date','','published_by','','landing_page_url','')

if keyword_set(keyword_required) then publication_info=create_struct(name='PublicationInfo','authors','','publication_date','','published_by','')

if (request eq 'publication_info') then requested_structure=publication_info

if not keyword_set(keyword_required) then funding=create_struct(name='Funding','agency','','project','','award_number','')

if keyword_set(keyword_required) then funding=create_struct(name='Funding','agency','','project','')

if (request eq 'funding') then requested_structure=funding

if not keyword_set(keyword_required) then contact=create_struct(name='Contact','person_id','','role',make_array(spase_ontology(28).occur_num,/string,value=''),'start_date','','stop_date','','note','')

if keyword_set(keyword_required) then contact=create_struct(name='Contact','person_id','','role',make_array(spase_ontology(28).occur_num,/string,value=''))

if (request eq 'contact') then requested_structure=contact

if not keyword_set(keyword_required) then information_url=create_struct(name='InformationURL','name','','url','','description','','language','')

if keyword_set(keyword_required) then information_url=create_struct(name='InformationURL','url','')

if (request eq 'information_url') then requested_structure=information_url

if not keyword_set(keyword_required) then association=create_struct(name='Association','association_id','','association_type','','note','')

if keyword_set(keyword_required) then association=create_struct(name='Association','association_id','','association_type','')

if (request eq 'association') then requested_structure=association

if not keyword_set(keyword_required) then access_url=create_struct(name='AccessURL','name','','url','','style','','product_key',make_array(spase_ontology(50).occur_num,/string,value=''),'description','','language','')

if keyword_set(keyword_required) then access_url=create_struct(name='AccessURL','url','')

if (request eq 'access_url') then requested_structure=access_url

if not keyword_set(keyword_required) then data_extent=create_struct(name='DataExtent','quantity','','units','','per','')

if keyword_set(keyword_required) then data_extent=create_struct(name='DataExtent','quantity','')

if (request eq 'data_extent') then requested_structure=data_extent

if keyword_set(keyword_stop_date) and not keyword_set(keyword_required) then time_span=create_struct(name='TimeSpan','start_date','','stop_date','','note',make_array(spase_ontology(295).occur_num,/string,value=''))

if keyword_set(keyword_stop_date) and keyword_set(keyword_required) then time_span=create_struct(name='TimeSpan','start_date','','stop_date','')

if keyword_set(keyword_relative_stop_date) and not keyword_set(keyword_required) then time_span=create_struct(name='TimeSpan','start_date','','relative_stop_date','','note',make_array(spase_ontology(295).occur_num,/string,value=''))

if keyword_set(keyword_relative_stop_date) and keyword_set(keyword_required) then time_span=create_struct(name='TimeSpan','start_date','','relative_stop_date','')

if (request eq 'time_span') then requested_structure=time_span

checksum=create_struct(name='Checksum','hash_value','','hash_function','')

if (request eq 'checksum') then requested_structure=checksum

if not keyword_set(keyword_required) then installer=create_struct(name='Installer','availability','','access_rights','','acknowledgement','','url','')

if keyword_set(keyword_required) then installer=create_struct(name='Installer','url','')

if (request eq 'installer') then requested_structure=installer

if not keyword_set(keyword_required) then spatial_coverage=create_struct(name='SpatialCoverage','coordinate_system',coordinate_system,'center_latitude','','northernmost_latitude','','southernmost_latitude','','center_longitude','','easternmost_longitude','','westernmost_longitude','','center_elevation','','minimum_elevation','','maximum_elevation','','acknowledgement','','description','')

if keyword_set(keyword_required) then spatial_coverage=create_struct(name='SpatialCoverage','coordinate_system',coordinate_system)

if (request eq 'spatial_coverage') then requested_structure=spatial_coverage

if not keyword_set(keyword_required) then model_version=create_struct(name='ModelVersion','version_tag','','release_date','','description','','caveats','')

if keyword_set(keyword_required) then model_version=create_struct(name='ModelVersion','release_date','')

if (request eq 'model_version') then requested_structure=model_version

if not keyword_set(keyword_required) then property=create_struct(name='Property','name','','description','','caveats','','property_quantity','','qualifier',make_array(spase_ontology(1393).occur_num,/string,value=''),'units','','units_conversion','','property_label','','property_value','','property_table_url','','valid_min','','valid_max','','property_model','','model_url','')

if keyword_set(keyword_required) then property=create_struct(name='Property','property_quantity','')

if (request eq 'property') then requested_structure=property

if not keyword_set(keyword_required) then parameter=create_struct(name='Parameter','name','','set',make_array(spase_ontology(1406).occur_num,/string,value=''),'parameter_key','','description','','ucd','','caveats','','cadence','','cadence_min','','cadence_max','','units','','units_conversion','','coordinate_system',coordinate_system,'rendering_hints',replicate(rendering_hints,spase_ontology(1419).occur_num),'structure',structure,'valid_min','','valid_max','','fill_value','','field',field,'particle',particle,'wave',wave,'mixed',mixed,'support',support)

if keyword_set(keyword_required) then parameter=create_struct(name='Parameter','name','','field',field,'particle',particle,'wave',wave,'mixed',mixed,'support',support)

if (request eq 'parameter') then requested_structure=parameter

if not keyword_set(keyword_required) then diagnosis_time_step=create_struct(name='DiagnosisTimeStep','time_start','','duration','','saved_quantity',make_array(spase_ontology(1634).occur_num,/string,value=''))

if keyword_set(keyword_required) then diagnosis_time_step=create_struct(name='DiagnosisTimeStep','time_start','','duration','')

if (request eq 'diagnosis_time_step') then requested_structure=diagnosis_time_step

boundary_conditions=create_struct(name='BoundaryConditions','particle_boundary','','field_boundary','')

if (request eq 'boundary_conditions') then requested_structure=boundary_conditions

if not keyword_set(keyword_required) then resource_header=create_struct(name='ResourceHeader','resource_name','','alternate_name',make_array(spase_ontology(6).occur_num,/string,value=''),'doi','','release_date','','revision_history',revision_history,'expiration_date','','description','','acknowledgement','','publication_info',publication_info,'funding',replicate(funding,spase_ontology(22).occur_num),'contact',replicate(contact,spase_ontology(26).occur_num),'information_url',replicate(information_url,spase_ontology(32).occur_num),'association',replicate(association,spase_ontology(37).occur_num),'prior_id',make_array(spase_ontology(41).occur_num,/string,value=''))

if keyword_set(keyword_required) then resource_header=create_struct(name='ResourceHeader','resource_name','','release_date','','description','','contact',replicate(contact,spase_ontology(26).occur_num))

if (request eq 'resource_header') then requested_structure=resource_header

if not keyword_set(keyword_required) then access_information=create_struct(name='AccessInformation','repository_id','','availability','','access_rights','','access_url',replicate(access_url,spase_ontology(46).occur_num),'format',make_array(spase_ontology(53).occur_num,/string,value=''),'encoding','','access_directory_template','','access_filename_template','','data_extent',data_extent,'acknowledgement','')

if keyword_set(keyword_required) then access_information=create_struct(name='AccessInformation','repository_id','','access_url',replicate(access_url,spase_ontology(46).occur_num),'format',make_array(spase_ontology(53).occur_num,/string,value=''))

if (request eq 'access_information') then requested_structure=access_information

if not keyword_set(keyword_required) then temporal_description=create_struct(name='TemporalDescription','time_span',time_span,'cadence','','cadence_min','','cadence_max','','exposure','','exposure_min','','exposure_max','')

if keyword_set(keyword_required) then temporal_description=create_struct(name='TemporalDescription','time_span',time_span)

if (request eq 'temporal_description') then requested_structure=temporal_description

if not keyword_set(keyword_required) then source=create_struct(name='Source','source_type','','url','','mirror_url',make_array(spase_ontology(744).occur_num,/string,value=''),'checksum',checksum,'data_extent',data_extent)

if keyword_set(keyword_required) then source=create_struct(name='Source','source_type','','url','')

if (request eq 'source') then requested_structure=source

if not keyword_set(keyword_required) then operating_span=create_struct(name='OperatingSpan','start_date','','stop_date','','note',make_array(spase_ontology(800).occur_num,/string,value=''))

if keyword_set(keyword_required) then operating_span=create_struct(name='OperatingSpan','start_date','')

if (request eq 'operating_span') then requested_structure=operating_span

if not keyword_set(keyword_required) then location=create_struct(name='Location','observatory_region',make_array(spase_ontology(846).occur_num,/string,value=''),'coordinate_system_name','','latitude','','longitude','','elevation','')

if keyword_set(keyword_required) then location=create_struct(name='Location','observatory_region',make_array(spase_ontology(846).occur_num,/string,value=''))

if (request eq 'location') then requested_structure=location

if not keyword_set(keyword_required) then observation_extent=create_struct(name='ObservationExtent','observed_region','','start_location','','stop_location','','note',make_array(spase_ontology(1066).occur_num,/string,value=''))

if keyword_set(keyword_required) then observation_extent=create_struct(name='ObservationExtent','start_location','','stop_location','')

if (request eq 'observation_extent') then requested_structure=observation_extent

if not keyword_set(keyword_required) then execution_environment=create_struct(name='ExecutionEnvironment','operating_system','','installer',installer,'cores','','storage','','memory','')

if keyword_set(keyword_required) then execution_environment=create_struct(name='ExecutionEnvironment','operating_system','','installer',installer)

if (request eq 'execution_environment') then requested_structure=execution_environment

if not keyword_set(keyword_required) then input_property=create_struct(name='InputProperty','name','','description','','caveats','','units','','valid_min','','valid_max','')

if keyword_set(keyword_required) then input_property=create_struct(name='InputProperty','name','','description','')

if (request eq 'input_property') then requested_structure=input_property

if not keyword_set(keyword_required) then output_property=create_struct(name='OutputProperty','name','','description','','caveats','','units','','valid_min','','valid_max','')

if keyword_set(keyword_required) then output_property=create_struct(name='OutputProperty','name','','description','')

if (request eq 'output_property') then requested_structure=output_property

if not keyword_set(keyword_required) then member=create_struct(name='Member','resource_name',make_array(spase_ontology(1281).occur_num,/string,value=''),'description','','member_id','','start_date','','stop_date','','spatial_coverage',spatial_coverage)

if keyword_set(keyword_required) then member=create_struct(name='Member','resource_name',make_array(spase_ontology(1281).occur_num,/string,value=''))

if (request eq 'member') then requested_structure=member

if not keyword_set(keyword_required) then access_information_optional=create_struct(name='AccessInformationOptional','availability','','access_rights','','access_url',replicate(access_url,spase_ontology(1346).occur_num),'format',make_array(spase_ontology(1353).occur_num,/string,value=''),'encoding','','access_directory_template','','access_filename_template','','data_extent',data_extent,'acknowledgement','')

if keyword_set(keyword_required) then access_information_optional=create_struct(name='AccessInformationOptional','access_url',replicate(access_url,spase_ontology(1346).occur_num),'format',make_array(spase_ontology(1353).occur_num,/string,value=''))

if (request eq 'access_information_optional') then requested_structure=access_information_optional

versions=create_struct(name='Versions','model_version',replicate(model_version,spase_ontology(1363).occur_num))

if (request eq 'versions') then requested_structure=versions

if keyword_set(keyword_cuts_description) and not keyword_set(keyword_required) then spatial_description=create_struct(name='SpatialDescription','dimension','','coordinate_system',coordinate_system,'units','','units_conversion','','coordinates_label','','cuts_description','','step','')

if keyword_set(keyword_cuts_description) and keyword_set(keyword_required) then spatial_description=create_struct(name='SpatialDescription','dimension','','coordinate_system',coordinate_system,'units','','cuts_description','')

if keyword_set(keyword_cubes_description) and not keyword_set(keyword_required) then spatial_description=create_struct(name='SpatialDescription','dimension','','coordinate_system',coordinate_system,'units','','units_conversion','','coordinates_label','','cubes_description','','step','')

if keyword_set(keyword_cubes_description) and keyword_set(keyword_required) then spatial_description=create_struct(name='SpatialDescription','dimension','','coordinate_system',coordinate_system,'units','','cubes_description','')

if keyword_set(keyword_plane_normal_vector) and not keyword_set(keyword_required) then spatial_description=create_struct(name='SpatialDescription','dimension','','coordinate_system',coordinate_system,'units','','units_conversion','','coordinates_label','','plane_normal_vector','','step','')

if keyword_set(keyword_plane_normal_vector) and keyword_set(keyword_required) then spatial_description=create_struct(name='SpatialDescription','dimension','','coordinate_system',coordinate_system,'units','','plane_normal_vector','')

if keyword_set(keyword_plane_point) and not keyword_set(keyword_required) then spatial_description=create_struct(name='SpatialDescription','dimension','','coordinate_system',coordinate_system,'units','','units_conversion','','coordinates_label','','plane_point','','step','')

if keyword_set(keyword_plane_point) and keyword_set(keyword_required) then spatial_description=create_struct(name='SpatialDescription','dimension','','coordinate_system',coordinate_system,'units','','plane_point','')

if keyword_set(keyword_region_begin) and not keyword_set(keyword_required) then spatial_description=create_struct(name='SpatialDescription','dimension','','coordinate_system',coordinate_system,'units','','units_conversion','','coordinates_label','','region_begin','','step','')

if keyword_set(keyword_region_begin) and keyword_set(keyword_required) then spatial_description=create_struct(name='SpatialDescription','dimension','','coordinate_system',coordinate_system,'units','','region_begin','')

if keyword_set(keyword_region_end) and not keyword_set(keyword_required) then spatial_description=create_struct(name='SpatialDescription','dimension','','coordinate_system',coordinate_system,'units','','units_conversion','','coordinates_label','','region_end','','step','')

if keyword_set(keyword_region_end) and keyword_set(keyword_required) then spatial_description=create_struct(name='SpatialDescription','dimension','','coordinate_system',coordinate_system,'units','','region_end','')

if (request eq 'spatial_description') then requested_structure=spatial_description

input_properties=create_struct(name='InputProperties','property',replicate(property,spase_ontology(1388).occur_num))

if (request eq 'input_properties') then requested_structure=input_properties

output_parameters=create_struct(name='OutputParameters','parameter',replicate(parameter,spase_ontology(1404).occur_num))

if (request eq 'output_parameters') then requested_structure=output_parameters

model_specification=create_struct(name='ModelSpecification','model_id','','version_tag','')

if (request eq 'model_specification') then requested_structure=model_specification

model_time=create_struct(name='ModelTime','description','','caveats','','duration','','time_start','','time_stop','','time_step','','diagnosis_time_step',diagnosis_time_step)

if (request eq 'model_time') then requested_structure=model_time

if not keyword_set(keyword_required) then model_domain=create_struct(name='ModelDomain','coordinate_system',coordinate_system,'description','','caveats','','spatial_dimension','','velocity_dimension','','field_dimension','','units','','units_conversion','','coordinates_label','','valid_min','','valid_max','','grid_structure','','grid_cell_size','','symmetry','','boundary_conditions',boundary_conditions)

if keyword_set(keyword_required) then model_domain=create_struct(name='ModelDomain','coordinate_system',coordinate_system,'spatial_dimension','','units','')

if (request eq 'model_domain') then requested_structure=model_domain

region_parameter=create_struct(name='RegionParameter','modeled_region','','description','','caveats','','radius','','sub_longitude','','period','','object_mass','','input_table_url','','property',replicate(property,spase_ontology(1664).occur_num))

if (request eq 'region_parameter') then requested_structure=region_parameter

if not keyword_set(keyword_required) then input_parameter=create_struct(name='InputParameter','name','','description','','caveats','','modeled_region',make_array(spase_ontology(1683).occur_num,/string,value=''),'qualifier',make_array(spase_ontology(1684).occur_num,/string,value=''),'input_table_url',make_array(spase_ontology(1685).occur_num,/string,value=''),'parameter_quantity','','property',replicate(property,spase_ontology(1687).occur_num))

if keyword_set(keyword_required) then input_parameter=create_struct(name='InputParameter','name','','property',replicate(property,spase_ontology(1687).occur_num))

if (request eq 'input_parameter') then requested_structure=input_parameter

if not keyword_set(keyword_required) then input_population=create_struct(name='InputPopulation','name','','set',make_array(spase_ontology(1704).occur_num,/string,value=''),'parameter_key','','description','','caveats','','modeled_region',make_array(spase_ontology(1708).occur_num,/string,value=''),'qualifier',make_array(spase_ontology(1709).occur_num,/string,value=''),'particle_type','','chemical_formula','','atomic_number','','population_mass_number','','population_charge_state','','population_density','','population_temperature','','population_flow_speed','','distribution','','production_rate','','total_production_rate','','input_table_url','','density_profile','','model_url','')

if keyword_set(keyword_required) then input_population=create_struct(name='InputPopulation','name','')

if (request eq 'input_population') then requested_structure=input_population

if not keyword_set(keyword_required) then input_field=create_struct(name='InputField','name','','set',make_array(spase_ontology(1726).occur_num,/string,value=''),'parameter_key','','description','','caveats','','modeled_region',make_array(spase_ontology(1730).occur_num,/string,value=''),'coordinate_system',coordinate_system,'qualifier',make_array(spase_ontology(1734).occur_num,/string,value=''),'field_quantity','','units','','units_conversion','','input_label','','field_value','','input_table_url','','valid_min','','valid_max','','field_model','','model_url','')

if keyword_set(keyword_required) then input_field=create_struct(name='InputField','name','','field_quantity','')

if (request eq 'input_field') then requested_structure=input_field

if not keyword_set(keyword_required) then input_process=create_struct(name='InputProcess','name','','set',make_array(spase_ontology(1747).occur_num,/string,value=''),'parameter_key','','description','','caveats','','modeled_region',make_array(spase_ontology(1751).occur_num,/string,value=''),'process_type','','units','','units_conversion','','process_coefficient','','process_coeff_type','','process_model','','model_url','')

if keyword_set(keyword_required) then input_process=create_struct(name='InputProcess','name','','process_type','')

if (request eq 'input_process') then requested_structure=input_process

if not keyword_set(keyword_required) then catalog=create_struct(name='Catalog','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(42).occur_num),'provider_name','','provider_resource_name','','provider_version','','instrument_id',make_array(spase_ontology(65).occur_num,/string,value=''),'phenomenon_type',make_array(spase_ontology(66).occur_num,/string,value=''),'time_span',time_span,'caveats','','keyword',make_array(spase_ontology(73).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(74).occur_num,/string,value=''),'parameter',replicate(parameter,spase_ontology(75).occur_num),'extension',make_array(spase_ontology(222).occur_num,/string,value=''))

if keyword_set(keyword_required) then catalog=create_struct(name='Catalog','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(42).occur_num),'phenomenon_type',make_array(spase_ontology(66).occur_num,/string,value=''))

if (request eq 'catalog') then requested_structure=catalog

if not keyword_set(keyword_required) then display_data=create_struct(name='DisplayData','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(263).occur_num),'processing_level','','provider_name','','provider_resource_name','','provider_processing_level','','provider_version','','instrument_id',make_array(spase_ontology(288).occur_num,/string,value=''),'measurement_type',make_array(spase_ontology(289).occur_num,/string,value=''),'temporal_description',temporal_description,'spectral_range',make_array(spase_ontology(302).occur_num,/string,value=''),'display_cadence','','observed_region',make_array(spase_ontology(304).occur_num,/string,value=''),'spatial_coverage',replicate(spatial_coverage,spase_ontology(305).occur_num),'caveats','','keyword',make_array(spase_ontology(321).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(322).occur_num,/string,value=''),'parameter',replicate(parameter,spase_ontology(323).occur_num),'extension',make_array(spase_ontology(470).occur_num,/string,value=''))

if keyword_set(keyword_required) then display_data=create_struct(name='DisplayData','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(263).occur_num),'measurement_type',make_array(spase_ontology(289).occur_num,/string,value=''),'spatial_coverage',replicate(spatial_coverage,spase_ontology(305).occur_num))

if (request eq 'display_data') then requested_structure=display_data

if not keyword_set(keyword_required) then numerical_data=create_struct(name='NumericalData','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(511).occur_num),'processing_level','','provider_name','','provider_resource_name','','provider_processing_level','','provider_version','','instrument_id',make_array(spase_ontology(536).occur_num,/string,value=''),'measurement_type',make_array(spase_ontology(537).occur_num,/string,value=''),'temporal_description',temporal_description,'spectral_range',make_array(spase_ontology(550).occur_num,/string,value=''),'observed_region',make_array(spase_ontology(551).occur_num,/string,value=''),'spatial_coverage',replicate(spatial_coverage,spase_ontology(552).occur_num),'caveats','','keyword',make_array(spase_ontology(568).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(569).occur_num,/string,value=''),'parameter',replicate(parameter,spase_ontology(570).occur_num),'extension',make_array(spase_ontology(717).occur_num,/string,value=''))

if keyword_set(keyword_required) then numerical_data=create_struct(name='NumericalData','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(511).occur_num),'measurement_type',make_array(spase_ontology(537).occur_num,/string,value=''))

if (request eq 'numerical_data') then requested_structure=numerical_data

if not keyword_set(keyword_required) then granule=create_struct(name='Granule','resource_id','','release_date','','expiration_date','','parent_id','','prior_id',make_array(spase_ontology(723).occur_num,/string,value=''),'start_date','','stop_date','','spatial_coverage',replicate(spatial_coverage,spase_ontology(726).occur_num),'source',replicate(source,spase_ontology(741).occur_num),'region_begin','','region_end','')

if keyword_set(keyword_required) then granule=create_struct(name='Granule','resource_id','','release_date','','parent_id','','start_date','','stop_date','','spatial_coverage',replicate(spatial_coverage,spase_ontology(726).occur_num),'source',replicate(source,spase_ontology(741).occur_num),'region_begin','','region_end','')

if (request eq 'granule') then requested_structure=granule

if not keyword_set(keyword_required) then instrument=create_struct(name='Instrument','resource_id','','resource_header',resource_header,'instrument_type',make_array(spase_ontology(794).occur_num,/string,value=''),'instrument_group_id','','investigation_name',make_array(spase_ontology(796).occur_num,/string,value=''),'operating_span',operating_span,'observatory_id','','caveats','','extension',make_array(spase_ontology(803).occur_num,/string,value=''))

if keyword_set(keyword_required) then instrument=create_struct(name='Instrument','resource_id','','resource_header',resource_header,'instrument_type',make_array(spase_ontology(794).occur_num,/string,value=''),'investigation_name',make_array(spase_ontology(796).occur_num,/string,value=''),'observatory_id','')

if (request eq 'instrument') then requested_structure=instrument

if not keyword_set(keyword_required) then observatory=create_struct(name='Observatory','resource_id','','resource_header',resource_header,'observatory_group_id',make_array(spase_ontology(844).occur_num,/string,value=''),'location',replicate(location,spase_ontology(845).occur_num),'operating_span',replicate(operating_span,spase_ontology(851).occur_num),'extension',make_array(spase_ontology(855).occur_num,/string,value=''))

if keyword_set(keyword_required) then observatory=create_struct(name='Observatory','resource_id','','resource_header',resource_header,'location',replicate(location,spase_ontology(845).occur_num),'operating_span',replicate(operating_span,spase_ontology(851).occur_num))

if (request eq 'observatory') then requested_structure=observatory

if not keyword_set(keyword_required) then person=create_struct(name='Person','resource_id','','release_date','','person_name','','organization_name','','address','','email',make_array(spase_ontology(862).occur_num,/string,value=''),'phone_number',make_array(spase_ontology(863).occur_num,/string,value=''),'fax_number','','orcidentifier','','note','','extension',make_array(spase_ontology(867).occur_num,/string,value=''))

if keyword_set(keyword_required) then person=create_struct(name='Person','resource_id','','organization_name','')

if (request eq 'person') then requested_structure=person

if not keyword_set(keyword_required) then registry=create_struct(name='Registry','resource_id','','resource_header',resource_header,'access_url',access_url,'extension',make_array(spase_ontology(915).occur_num,/string,value=''))

if keyword_set(keyword_required) then registry=create_struct(name='Registry','resource_id','','resource_header',resource_header,'access_url',access_url)

if (request eq 'registry') then requested_structure=registry

if not keyword_set(keyword_required) then repository=create_struct(name='Repository','resource_id','','resource_header',resource_header,'access_url',access_url,'extension',make_array(spase_ontology(963).occur_num,/string,value=''))

if keyword_set(keyword_required) then repository=create_struct(name='Repository','resource_id','','resource_header',resource_header,'access_url',access_url)

if (request eq 'repository') then requested_structure=repository

if not keyword_set(keyword_required) then service=create_struct(name='Service','resource_id','','resource_header',resource_header,'access_url',access_url,'extension',make_array(spase_ontology(1011).occur_num,/string,value=''))

if keyword_set(keyword_required) then service=create_struct(name='Service','resource_id','','resource_header',resource_header,'access_url',access_url)

if (request eq 'service') then requested_structure=service

if not keyword_set(keyword_required) then annotation=create_struct(name='Annotation','resource_id','','resource_header',resource_header,'image_url','','annotation_type','','phenomenon_type',make_array(spase_ontology(1054).occur_num,/string,value=''),'classification_method','','confidence_rating','','time_span',replicate(time_span,spase_ontology(1057).occur_num),'observation_extent',replicate(observation_extent,spase_ontology(1062).occur_num),'extension',make_array(spase_ontology(1067).occur_num,/string,value=''))

if keyword_set(keyword_required) then annotation=create_struct(name='Annotation','resource_id','','resource_header',resource_header,'annotation_type','')

if (request eq 'annotation') then requested_structure=annotation

if not keyword_set(keyword_required) then document=create_struct(name='Document','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1108).occur_num),'keyword',make_array(spase_ontology(1128).occur_num,/string,value=''),'document_type','','mimetype','','input_resource_id',make_array(spase_ontology(1131).occur_num,/string,value=''))

if keyword_set(keyword_required) then document=create_struct(name='Document','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1108).occur_num),'document_type','','mimetype','')

if (request eq 'document') then requested_structure=document

if keyword_set(keyword_input_property) and not keyword_set(keyword_required) then software=create_struct(name='Software','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1172).occur_num),'software_version','','application_interface',make_array(spase_ontology(1193).occur_num,/string,value=''),'code_language','','prerequisites',make_array(spase_ontology(1195).occur_num,/string,value=''),'execution_environment',replicate(execution_environment,spase_ontology(1196).occur_num),'input_property',replicate(input_property,spase_ontology(1206).occur_num))

if keyword_set(keyword_input_property) and keyword_set(keyword_required) then software=create_struct(name='Software','resource_id','','resource_header',resource_header,'prerequisites',make_array(spase_ontology(1195).occur_num,/string,value=''),'execution_environment',replicate(execution_environment,spase_ontology(1196).occur_num))

if keyword_set(keyword_output_property) and not keyword_set(keyword_required) then software=create_struct(name='Software','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1172).occur_num),'software_version','','application_interface',make_array(spase_ontology(1193).occur_num,/string,value=''),'code_language','','prerequisites',make_array(spase_ontology(1195).occur_num,/string,value=''),'execution_environment',replicate(execution_environment,spase_ontology(1196).occur_num),'output_property',replicate(output_property,spase_ontology(1213).occur_num))

if keyword_set(keyword_output_property) and keyword_set(keyword_required) then software=create_struct(name='Software','resource_id','','resource_header',resource_header,'prerequisites',make_array(spase_ontology(1195).occur_num,/string,value=''),'execution_environment',replicate(execution_environment,spase_ontology(1196).occur_num))

if (request eq 'software') then requested_structure=software

if not keyword_set(keyword_required) then collection=create_struct(name='Collection','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1260).occur_num),'member',replicate(member,spase_ontology(1280).occur_num),'extension',make_array(spase_ontology(1301).occur_num,/string,value=''))

if keyword_set(keyword_required) then collection=create_struct(name='Collection','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1260).occur_num),'member',replicate(member,spase_ontology(1280).occur_num))

if (request eq 'collection') then requested_structure=collection

if not keyword_set(keyword_required) then model=create_struct(name='Model','resource_id','','resource_header',resource_header,'access_information_optional',replicate(access_information_optional,spase_ontology(1342).occur_num),'versions',versions,'model_type','','code_language','','temporal_dependence','','spatial_description',spatial_description,'modeled_region',make_array(spase_ontology(1386).occur_num,/string,value=''),'input_properties',input_properties,'output_parameters',output_parameters,'model_url','')

if keyword_set(keyword_required) then model=create_struct(name='Model','resource_id','','resource_header',resource_header,'model_type','')

if (request eq 'model') then requested_structure=model

if keyword_set(keyword_region_parameter) and not keyword_set(keyword_required) then model_run=create_struct(name='ModelRun','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1592).occur_num),'provider_resource_name','','provider_processing_level','','provider_version','','model_specification',model_specification,'temporal_dependence','','modeled_region',make_array(spase_ontology(1619).occur_num,/string,value=''),'likelihood_rating','','caveats','','keyword',make_array(spase_ontology(1622).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(1623).occur_num,/string,value=''),'model_time',model_time,'model_domain',model_domain,'region_parameter',replicate(region_parameter,spase_ontology(1655).occur_num),'extension',make_array(spase_ontology(1759).occur_num,/string,value=''))

if keyword_set(keyword_region_parameter) and keyword_set(keyword_required) then model_run=create_struct(name='ModelRun','resource_id','','resource_header',resource_header,'modeled_region',make_array(spase_ontology(1619).occur_num,/string,value=''),'region_parameter',replicate(region_parameter,spase_ontology(1655).occur_num))

if keyword_set(keyword_input_parameter) and not keyword_set(keyword_required) then model_run=create_struct(name='ModelRun','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1592).occur_num),'provider_resource_name','','provider_processing_level','','provider_version','','model_specification',model_specification,'temporal_dependence','','modeled_region',make_array(spase_ontology(1619).occur_num,/string,value=''),'likelihood_rating','','caveats','','keyword',make_array(spase_ontology(1622).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(1623).occur_num,/string,value=''),'model_time',model_time,'model_domain',model_domain,'input_parameter',replicate(input_parameter,spase_ontology(1679).occur_num),'extension',make_array(spase_ontology(1759).occur_num,/string,value=''))

if keyword_set(keyword_input_parameter) and keyword_set(keyword_required) then model_run=create_struct(name='ModelRun','resource_id','','resource_header',resource_header,'modeled_region',make_array(spase_ontology(1619).occur_num,/string,value=''),'input_parameter',replicate(input_parameter,spase_ontology(1679).occur_num))

if keyword_set(keyword_input_population) and not keyword_set(keyword_required) then model_run=create_struct(name='ModelRun','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1592).occur_num),'provider_resource_name','','provider_processing_level','','provider_version','','model_specification',model_specification,'temporal_dependence','','modeled_region',make_array(spase_ontology(1619).occur_num,/string,value=''),'likelihood_rating','','caveats','','keyword',make_array(spase_ontology(1622).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(1623).occur_num,/string,value=''),'model_time',model_time,'model_domain',model_domain,'input_population',replicate(input_population,spase_ontology(1702).occur_num),'extension',make_array(spase_ontology(1759).occur_num,/string,value=''))

if keyword_set(keyword_input_population) and keyword_set(keyword_required) then model_run=create_struct(name='ModelRun','resource_id','','resource_header',resource_header,'modeled_region',make_array(spase_ontology(1619).occur_num,/string,value=''),'input_population',replicate(input_population,spase_ontology(1702).occur_num))

if keyword_set(keyword_input_field) and not keyword_set(keyword_required) then model_run=create_struct(name='ModelRun','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1592).occur_num),'provider_resource_name','','provider_processing_level','','provider_version','','model_specification',model_specification,'temporal_dependence','','modeled_region',make_array(spase_ontology(1619).occur_num,/string,value=''),'likelihood_rating','','caveats','','keyword',make_array(spase_ontology(1622).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(1623).occur_num,/string,value=''),'model_time',model_time,'model_domain',model_domain,'input_field',replicate(input_field,spase_ontology(1724).occur_num),'extension',make_array(spase_ontology(1759).occur_num,/string,value=''))

if keyword_set(keyword_input_field) and keyword_set(keyword_required) then model_run=create_struct(name='ModelRun','resource_id','','resource_header',resource_header,'modeled_region',make_array(spase_ontology(1619).occur_num,/string,value=''),'input_field',replicate(input_field,spase_ontology(1724).occur_num))

if keyword_set(keyword_input_process) and not keyword_set(keyword_required) then model_run=create_struct(name='ModelRun','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1592).occur_num),'provider_resource_name','','provider_processing_level','','provider_version','','model_specification',model_specification,'temporal_dependence','','modeled_region',make_array(spase_ontology(1619).occur_num,/string,value=''),'likelihood_rating','','caveats','','keyword',make_array(spase_ontology(1622).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(1623).occur_num,/string,value=''),'model_time',model_time,'model_domain',model_domain,'input_process',replicate(input_process,spase_ontology(1745).occur_num),'extension',make_array(spase_ontology(1759).occur_num,/string,value=''))

if keyword_set(keyword_input_process) and keyword_set(keyword_required) then model_run=create_struct(name='ModelRun','resource_id','','resource_header',resource_header,'modeled_region',make_array(spase_ontology(1619).occur_num,/string,value=''),'input_process',replicate(input_process,spase_ontology(1745).occur_num))

if (request eq 'model_run') then requested_structure=model_run

if not keyword_set(keyword_required) then display_output=create_struct(name='DisplayOutput','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1800).occur_num),'processing_level','','provider_resource_name','','provider_processing_level','','provider_version','','modeled_instrument_id',make_array(spase_ontology(1824).occur_num,/string,value=''),'measurement_type',make_array(spase_ontology(1825).occur_num,/string,value=''),'temporal_description',temporal_description,'spatial_description',spatial_description,'spectral_range',make_array(spase_ontology(1853).occur_num,/string,value=''),'display_cadence','','modeled_region',make_array(spase_ontology(1855).occur_num,/string,value=''),'caveats','','keyword',make_array(spase_ontology(1857).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(1858).occur_num,/string,value=''),'parameter',replicate(parameter,spase_ontology(1859).occur_num),'model_product','','property',replicate(property,spase_ontology(2007).occur_num),'extension','')

if keyword_set(keyword_required) then display_output=create_struct(name='DisplayOutput','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(1800).occur_num),'measurement_type',make_array(spase_ontology(1825).occur_num,/string,value=''))

if (request eq 'display_output') then requested_structure=display_output

if not keyword_set(keyword_required) then numerical_output=create_struct(name='NumericalOutput','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(2063).occur_num),'processing_level','','provider_resource_name','','provider_processing_level','','provider_version','','modeled_instrument_id',make_array(spase_ontology(2087).occur_num,/string,value=''),'measurement_type',make_array(spase_ontology(2088).occur_num,/string,value=''),'temporal_description',temporal_description,'spatial_description',spatial_description,'spectral_range',make_array(spase_ontology(2116).occur_num,/string,value=''),'modeled_region',make_array(spase_ontology(2117).occur_num,/string,value=''),'caveats','','keyword',make_array(spase_ontology(2119).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(2120).occur_num,/string,value=''),'parameter',replicate(parameter,spase_ontology(2121).occur_num),'model_product','','property',replicate(property,spase_ontology(2269).occur_num),'extension','')

if keyword_set(keyword_required) then numerical_output=create_struct(name='NumericalOutput','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(2063).occur_num),'measurement_type',make_array(spase_ontology(2088).occur_num,/string,value=''))

if (request eq 'numerical_output') then requested_structure=numerical_output

spase=create_struct(name='Spase','version','','catalog',replicate(catalog,spase_ontology(2).occur_num),'display_data',replicate(display_data,spase_ontology(223).occur_num),'numerical_data',replicate(numerical_data,spase_ontology(471).occur_num),'granule',replicate(granule,spase_ontology(718).occur_num),'instrument',replicate(instrument,spase_ontology(754).occur_num),'observatory',replicate(observatory,spase_ontology(804).occur_num),'person',replicate(person,spase_ontology(856).occur_num),'registry',replicate(registry,spase_ontology(868).occur_num),'repository',replicate(repository,spase_ontology(916).occur_num),'service',replicate(service,spase_ontology(964).occur_num),'annotation',replicate(annotation,spase_ontology(1012).occur_num),'document',replicate(document,spase_ontology(1068).occur_num),'software',replicate(software,spase_ontology(1132).occur_num),'collection',replicate(collection,spase_ontology(1220).occur_num),'model',replicate(model,spase_ontology(1302).occur_num),'model_run',replicate(model_run,spase_ontology(1552).occur_num),'display_output',replicate(display_output,spase_ontology(1760).occur_num),'numerical_output',replicate(numerical_output,spase_ontology(2023).occur_num))

if (request eq 'spase') then requested_structure=spase

return,requested_structure

end

