
function spase_model_create,spase_ontology,request,verbose=verbose,keyword_required=keyword_required,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date

rendering_hints=create_struct(name='RenderingHints','display_type','','axis_label','','rendering_axis','','index','','value_format','','scale_min','','scale_max','','scale_type','')

if (request eq 'rendering_hints') then requested_structure=rendering_hints

if not keyword_set(keyword_required) then bin=create_struct(name='Bin','band_name','','low','','high','')

if keyword_set(keyword_required) then bin=create_struct(name='Bin','low','','high','')

if (request eq 'bin') then requested_structure=bin

revision_event=create_struct(name='RevisionEvent','release_date','','note','')

if (request eq 'revision_event') then requested_structure=revision_event

if not keyword_set(keyword_required) then element=create_struct(name='Element','name','','qualifier',make_array(spase_ontology(100).occur_num,/string,value=''),'index','','parameter_key','','units','','units_conversion','','valid_min','','valid_max','','fill_value','','rendering_hints',rendering_hints)

if keyword_set(keyword_required) then element=create_struct(name='Element','name','','index','')

if (request eq 'element') then requested_structure=element

if not keyword_set(keyword_required) then frequency_range=create_struct(name='FrequencyRange','spectral_range','','low','','high','','units','','bin',replicate(bin,spase_ontology(128).occur_num))

if keyword_set(keyword_required) then frequency_range=create_struct(name='FrequencyRange','low','','high','','units','')

if (request eq 'frequency_range') then requested_structure=frequency_range

if not keyword_set(keyword_required) then energy_range=create_struct(name='EnergyRange','low','','high','','units','','bin',replicate(bin,spase_ontology(141).occur_num))

if keyword_set(keyword_required) then energy_range=create_struct(name='EnergyRange','low','','high','','units','')

if (request eq 'energy_range') then requested_structure=energy_range

if not keyword_set(keyword_required) then azimuthal_angle_range=create_struct(name='AzimuthalAngleRange','low','','high','','units','','bin',replicate(bin,spase_ontology(149).occur_num))

if keyword_set(keyword_required) then azimuthal_angle_range=create_struct(name='AzimuthalAngleRange','low','','high','','units','')

if (request eq 'azimuthal_angle_range') then requested_structure=azimuthal_angle_range

if not keyword_set(keyword_required) then polar_angle_range=create_struct(name='PolarAngleRange','low','','high','','units','','bin',replicate(bin,spase_ontology(157).occur_num))

if keyword_set(keyword_required) then polar_angle_range=create_struct(name='PolarAngleRange','low','','high','','units','')

if (request eq 'polar_angle_range') then requested_structure=polar_angle_range

if not keyword_set(keyword_required) then mass_range=create_struct(name='MassRange','low','','high','','units','','bin',replicate(bin,spase_ontology(165).occur_num))

if keyword_set(keyword_required) then mass_range=create_struct(name='MassRange','low','','high','','units','')

if (request eq 'mass_range') then requested_structure=mass_range

if not keyword_set(keyword_required) then pitch_angle_range=create_struct(name='PitchAngleRange','low','','high','','units','','bin',replicate(bin,spase_ontology(173).occur_num))

if keyword_set(keyword_required) then pitch_angle_range=create_struct(name='PitchAngleRange','low','','high','','units','')

if (request eq 'pitch_angle_range') then requested_structure=pitch_angle_range

if not keyword_set(keyword_required) then wavelength_range=create_struct(name='WavelengthRange','spectral_range','','low','','high','','units','','bin',replicate(bin,spase_ontology(203).occur_num))

if keyword_set(keyword_required) then wavelength_range=create_struct(name='WavelengthRange','low','','high','','units','')

if (request eq 'wavelength_range') then requested_structure=wavelength_range

revision_history=create_struct(name='RevisionHistory','revision_event',replicate(revision_event,spase_ontology(10).occur_num))

if (request eq 'revision_history') then requested_structure=revision_history

publication_info=create_struct(name='PublicationInfo','authors','','publication_date','','published_by','')

if (request eq 'publication_info') then requested_structure=publication_info

if not keyword_set(keyword_required) then funding=create_struct(name='Funding','agency','','project','','award_number','')

if keyword_set(keyword_required) then funding=create_struct(name='Funding','agency','','project','')

if (request eq 'funding') then requested_structure=funding

if not keyword_set(keyword_required) then contact=create_struct(name='Contact','person_id','','role',make_array(spase_ontology(26).occur_num,/string,value=''),'start_date','','stop_date','','note','')

if keyword_set(keyword_required) then contact=create_struct(name='Contact','person_id','','role',make_array(spase_ontology(26).occur_num,/string,value=''))

if (request eq 'contact') then requested_structure=contact

if not keyword_set(keyword_required) then information_url=create_struct(name='InformationURL','name','','url','','description','','language','')

if keyword_set(keyword_required) then information_url=create_struct(name='InformationURL','url','')

if (request eq 'information_url') then requested_structure=information_url

if not keyword_set(keyword_required) then association=create_struct(name='Association','association_id','','association_type','','note','')

if keyword_set(keyword_required) then association=create_struct(name='Association','association_id','','association_type','')

if (request eq 'association') then requested_structure=association

if not keyword_set(keyword_required) then access_url=create_struct(name='AccessURL','name','','url','','style','','product_key',make_array(spase_ontology(48).occur_num,/string,value=''),'description','','language','')

if keyword_set(keyword_required) then access_url=create_struct(name='AccessURL','url','')

if (request eq 'access_url') then requested_structure=access_url

if not keyword_set(keyword_required) then data_extent=create_struct(name='DataExtent','quantity','','units','','per','')

if keyword_set(keyword_required) then data_extent=create_struct(name='DataExtent','quantity','')

if (request eq 'data_extent') then requested_structure=data_extent

coordinate_system=create_struct(name='CoordinateSystem','coordinate_representation','','coordinate_system_name','')

if (request eq 'coordinate_system') then requested_structure=coordinate_system

if not keyword_set(keyword_required) then structure=create_struct(name='Structure','size','','description','','element',replicate(element,spase_ontology(98).occur_num))

if keyword_set(keyword_required) then structure=create_struct(name='Structure','size','')

if (request eq 'structure') then requested_structure=structure

if not keyword_set(keyword_required) then field=create_struct(name='Field','qualifier',make_array(spase_ontology(121).occur_num,/string,value=''),'field_quantity','','frequency_range',frequency_range)

if keyword_set(keyword_required) then field=create_struct(name='Field','field_quantity','')

if (request eq 'field') then requested_structure=field

if not keyword_set(keyword_required) then particle=create_struct(name='Particle','particle_type',make_array(spase_ontology(133).occur_num,/string,value=''),'qualifier',make_array(spase_ontology(134).occur_num,/string,value=''),'particle_quantity','','atomic_number',make_array(spase_ontology(136).occur_num,/string,value=''),'energy_range',energy_range,'azimuthal_angle_range',azimuthal_angle_range,'polar_angle_range',polar_angle_range,'mass_range',mass_range,'pitch_angle_range',pitch_angle_range)

if keyword_set(keyword_required) then particle=create_struct(name='Particle','particle_quantity','')

if (request eq 'particle') then requested_structure=particle

if not keyword_set(keyword_required) then wave=create_struct(name='Wave','wave_type','','qualifier',make_array(spase_ontology(179).occur_num,/string,value=''),'wave_quantity','','energy_range',energy_range,'frequency_range',frequency_range,'wavelength_range',wavelength_range)

if keyword_set(keyword_required) then wave=create_struct(name='Wave','wave_quantity','')

if (request eq 'wave') then requested_structure=wave

if not keyword_set(keyword_required) then mixed=create_struct(name='Mixed','mixed_quantity','','particle_type',make_array(spase_ontology(209).occur_num,/string,value=''),'qualifier',make_array(spase_ontology(210).occur_num,/string,value=''))

if keyword_set(keyword_required) then mixed=create_struct(name='Mixed','mixed_quantity','')

if (request eq 'mixed') then requested_structure=mixed

if not keyword_set(keyword_required) then support=create_struct(name='Support','qualifier',make_array(spase_ontology(212).occur_num,/string,value=''),'support_quantity','')

if keyword_set(keyword_required) then support=create_struct(name='Support','support_quantity','')

if (request eq 'support') then requested_structure=support

if keyword_set(keyword_stop_date) and not keyword_set(keyword_required) then time_span=create_struct(name='TimeSpan','start_date','','stop_date','','note',make_array(spase_ontology(283).occur_num,/string,value=''))

if keyword_set(keyword_stop_date) and keyword_set(keyword_required) then time_span=create_struct(name='TimeSpan','start_date','','stop_date','')

if keyword_set(keyword_relative_stop_date) and not keyword_set(keyword_required) then time_span=create_struct(name='TimeSpan','start_date','','relative_stop_date','','note',make_array(spase_ontology(283).occur_num,/string,value=''))

if keyword_set(keyword_relative_stop_date) and keyword_set(keyword_required) then time_span=create_struct(name='TimeSpan','start_date','','relative_stop_date','')

if (request eq 'time_span') then requested_structure=time_span

checksum=create_struct(name='Checksum','hash_value','','hash_function','')

if (request eq 'checksum') then requested_structure=checksum

if not keyword_set(keyword_required) then resource_header=create_struct(name='ResourceHeader','resource_name','','alternate_name',make_array(spase_ontology(6).occur_num,/string,value=''),'doi','','release_date','','revision_history',revision_history,'expiration_date','','description','','acknowledgement','','publication_info',publication_info,'funding',replicate(funding,spase_ontology(20).occur_num),'contact',replicate(contact,spase_ontology(24).occur_num),'information_url',replicate(information_url,spase_ontology(30).occur_num),'association',replicate(association,spase_ontology(35).occur_num),'prior_id',make_array(spase_ontology(39).occur_num,/string,value=''))

if keyword_set(keyword_required) then resource_header=create_struct(name='ResourceHeader','resource_name','','release_date','','description','','contact',replicate(contact,spase_ontology(24).occur_num))

if (request eq 'resource_header') then requested_structure=resource_header

if not keyword_set(keyword_required) then access_information=create_struct(name='AccessInformation','repository_id','','availability','','access_rights','','access_url',replicate(access_url,spase_ontology(44).occur_num),'format','','encoding','','data_extent',data_extent,'acknowledgement','')

if keyword_set(keyword_required) then access_information=create_struct(name='AccessInformation','repository_id','','access_url',replicate(access_url,spase_ontology(44).occur_num),'format','')

if (request eq 'access_information') then requested_structure=access_information

if not keyword_set(keyword_required) then parameter=create_struct(name='Parameter','name','','set',make_array(spase_ontology(73).occur_num,/string,value=''),'parameter_key','','description','','ucd','','caveats','','cadence','','cadence_min','','cadence_max','','units','','units_conversion','','coordinate_system',coordinate_system,'rendering_hints',replicate(rendering_hints,spase_ontology(86).occur_num),'structure',structure,'valid_min','','valid_max','','fill_value','','field',field,'particle',particle,'wave',wave,'mixed',mixed,'support',support)

if keyword_set(keyword_required) then parameter=create_struct(name='Parameter','name','','field',field,'particle',particle,'wave',wave,'mixed',mixed,'support',support)

if (request eq 'parameter') then requested_structure=parameter

if not keyword_set(keyword_required) then temporal_description=create_struct(name='TemporalDescription','time_span',time_span,'cadence','','cadence_min','','cadence_max','','exposure','','exposure_min','','exposure_max','')

if keyword_set(keyword_required) then temporal_description=create_struct(name='TemporalDescription','time_span',time_span)

if (request eq 'temporal_description') then requested_structure=temporal_description

if not keyword_set(keyword_required) then platform=create_struct(name='Platform','operating_system','','installer','','cores','','storage','','memory','')

if keyword_set(keyword_required) then platform=create_struct(name='Platform','operating_system','','installer','')

if (request eq 'platform') then requested_structure=platform

if not keyword_set(keyword_required) then input_property=create_struct(name='InputProperty','name','','description','','caveats','','units','','valid_min','','valid_max','')

if keyword_set(keyword_required) then input_property=create_struct(name='InputProperty','name','','description','')

if (request eq 'input_property') then requested_structure=input_property

if not keyword_set(keyword_required) then output_property=create_struct(name='OutputProperty','name','','description','','caveats','','units','','valid_min','','valid_max','')

if keyword_set(keyword_required) then output_property=create_struct(name='OutputProperty','name','','description','')

if (request eq 'output_property') then requested_structure=output_property

if not keyword_set(keyword_required) then source=create_struct(name='Source','source_type','','url','','mirror_url',make_array(spase_ontology(797).occur_num,/string,value=''),'checksum',checksum,'data_extent',data_extent)

if keyword_set(keyword_required) then source=create_struct(name='Source','source_type','','url','')

if (request eq 'source') then requested_structure=source

if not keyword_set(keyword_required) then operating_span=create_struct(name='OperatingSpan','start_date','','stop_date','','note',make_array(spase_ontology(849).occur_num,/string,value=''))

if keyword_set(keyword_required) then operating_span=create_struct(name='OperatingSpan','start_date','')

if (request eq 'operating_span') then requested_structure=operating_span

if not keyword_set(keyword_required) then location=create_struct(name='Location','observatory_region',make_array(spase_ontology(893).occur_num,/string,value=''),'coordinate_system_name','','latitude','','longitude','','elevation','')

if keyword_set(keyword_required) then location=create_struct(name='Location','observatory_region',make_array(spase_ontology(893).occur_num,/string,value=''))

if (request eq 'location') then requested_structure=location

if not keyword_set(keyword_required) then observation_extent=create_struct(name='ObservationExtent','observed_region','','start_location','','stop_location','','note',make_array(spase_ontology(1105).occur_num,/string,value=''))

if keyword_set(keyword_required) then observation_extent=create_struct(name='ObservationExtent','start_location','','stop_location','')

if (request eq 'observation_extent') then requested_structure=observation_extent

if not keyword_set(keyword_required) then catalog=create_struct(name='Catalog','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(40).occur_num),'provider_name','','provider_resource_name','','provider_version','','instrument_id',make_array(spase_ontology(61).occur_num,/string,value=''),'phenomenon_type',make_array(spase_ontology(62).occur_num,/string,value=''),'time_span',time_span,'caveats','','keyword',make_array(spase_ontology(69).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(70).occur_num,/string,value=''),'parameter',replicate(parameter,spase_ontology(71).occur_num),'extension',make_array(spase_ontology(214).occur_num,/string,value=''))

if keyword_set(keyword_required) then catalog=create_struct(name='Catalog','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(40).occur_num),'phenomenon_type',make_array(spase_ontology(62).occur_num,/string,value=''))

if (request eq 'catalog') then requested_structure=catalog

if not keyword_set(keyword_required) then display_data=create_struct(name='DisplayData','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(253).occur_num),'processing_level','','provider_name','','provider_resource_name','','provider_processing_level','','provider_version','','instrument_id',make_array(spase_ontology(276).occur_num,/string,value=''),'measurement_type',make_array(spase_ontology(277).occur_num,/string,value=''),'temporal_description',temporal_description,'spectral_range',make_array(spase_ontology(290).occur_num,/string,value=''),'display_cadence','','observed_region',make_array(spase_ontology(292).occur_num,/string,value=''),'caveats','','keyword',make_array(spase_ontology(294).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(295).occur_num,/string,value=''),'parameter',replicate(parameter,spase_ontology(296).occur_num),'extension',make_array(spase_ontology(439).occur_num,/string,value=''))

if keyword_set(keyword_required) then display_data=create_struct(name='DisplayData','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(253).occur_num),'measurement_type',make_array(spase_ontology(277).occur_num,/string,value=''))

if (request eq 'display_data') then requested_structure=display_data

if not keyword_set(keyword_required) then numerical_data=create_struct(name='NumericalData','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(478).occur_num),'processing_level','','provider_name','','provider_resource_name','','provider_processing_level','','provider_version','','instrument_id',make_array(spase_ontology(501).occur_num,/string,value=''),'measurement_type',make_array(spase_ontology(502).occur_num,/string,value=''),'temporal_description',temporal_description,'spectral_range',make_array(spase_ontology(515).occur_num,/string,value=''),'observed_region',make_array(spase_ontology(516).occur_num,/string,value=''),'caveats','','keyword',make_array(spase_ontology(518).occur_num,/string,value=''),'input_resource_id',make_array(spase_ontology(519).occur_num,/string,value=''),'parameter',replicate(parameter,spase_ontology(520).occur_num),'extension',make_array(spase_ontology(663).occur_num,/string,value=''))

if keyword_set(keyword_required) then numerical_data=create_struct(name='NumericalData','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(478).occur_num),'measurement_type',make_array(spase_ontology(502).occur_num,/string,value=''))

if (request eq 'numerical_data') then requested_structure=numerical_data

if not keyword_set(keyword_required) then document=create_struct(name='Document','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(702).occur_num),'keyword',make_array(spase_ontology(720).occur_num,/string,value=''),'document_type','','mime_type','','input_resource_id',make_array(spase_ontology(723).occur_num,/string,value=''))

if keyword_set(keyword_required) then document=create_struct(name='Document','resource_id','','resource_header',resource_header,'access_information',replicate(access_information,spase_ontology(702).occur_num),'document_type','','mime_type','')

if (request eq 'document') then requested_structure=document

if not keyword_set(keyword_required) then software=create_struct(name='Software','resource_id','','resource_header',resource_header,'software_version','','application_interface',make_array(spase_ontology(763).occur_num,/string,value=''),'code_language','','prerequisites',make_array(spase_ontology(765).occur_num,/string,value=''),'platform',replicate(platform,spase_ontology(766).occur_num),'input_property',replicate(input_property,spase_ontology(772).occur_num),'output_property',replicate(output_property,spase_ontology(779).occur_num))

if keyword_set(keyword_required) then software=create_struct(name='Software','resource_id','','resource_header',resource_header,'prerequisites',make_array(spase_ontology(765).occur_num,/string,value=''),'platform',replicate(platform,spase_ontology(766).occur_num))

if (request eq 'software') then requested_structure=software

if not keyword_set(keyword_required) then granule=create_struct(name='Granule','resource_id','','release_date','','expiration_date','','parent_id','','prior_id',make_array(spase_ontology(791).occur_num,/string,value=''),'start_date','','stop_date','','source',replicate(source,spase_ontology(794).occur_num))

if keyword_set(keyword_required) then granule=create_struct(name='Granule','resource_id','','release_date','','parent_id','','start_date','','stop_date','','source',replicate(source,spase_ontology(794).occur_num))

if (request eq 'granule') then requested_structure=granule

if not keyword_set(keyword_required) then instrument=create_struct(name='Instrument','resource_id','','resource_header',resource_header,'instrument_type',make_array(spase_ontology(843).occur_num,/string,value=''),'instrument_group_id','','investigation_name',make_array(spase_ontology(845).occur_num,/string,value=''),'operating_span',operating_span,'observatory_id','','extension',make_array(spase_ontology(852).occur_num,/string,value=''))

if keyword_set(keyword_required) then instrument=create_struct(name='Instrument','resource_id','','resource_header',resource_header,'instrument_type',make_array(spase_ontology(843).occur_num,/string,value=''),'investigation_name',make_array(spase_ontology(845).occur_num,/string,value=''),'observatory_id','')

if (request eq 'instrument') then requested_structure=instrument

if not keyword_set(keyword_required) then observatory=create_struct(name='Observatory','resource_id','','resource_header',resource_header,'observatory_group_id',make_array(spase_ontology(891).occur_num,/string,value=''),'location',location,'operating_span',replicate(operating_span,spase_ontology(898).occur_num),'extension',make_array(spase_ontology(902).occur_num,/string,value=''))

if keyword_set(keyword_required) then observatory=create_struct(name='Observatory','resource_id','','resource_header',resource_header,'location',location,'operating_span',replicate(operating_span,spase_ontology(898).occur_num))

if (request eq 'observatory') then requested_structure=observatory

if not keyword_set(keyword_required) then person=create_struct(name='Person','resource_id','','release_date','','person_name','','organization_name','','address','','email',make_array(spase_ontology(909).occur_num,/string,value=''),'phone_number',make_array(spase_ontology(910).occur_num,/string,value=''),'fax_number','','orc_identifier','','note','','extension',make_array(spase_ontology(914).occur_num,/string,value=''))

if keyword_set(keyword_required) then person=create_struct(name='Person','resource_id','','organization_name','')

if (request eq 'person') then requested_structure=person

if not keyword_set(keyword_required) then registry=create_struct(name='Registry','resource_id','','resource_header',resource_header,'access_url',access_url,'extension',make_array(spase_ontology(960).occur_num,/string,value=''))

if keyword_set(keyword_required) then registry=create_struct(name='Registry','resource_id','','resource_header',resource_header,'access_url',access_url)

if (request eq 'registry') then requested_structure=registry

if not keyword_set(keyword_required) then repository=create_struct(name='Repository','resource_id','','resource_header',resource_header,'access_url',access_url,'extension',make_array(spase_ontology(1006).occur_num,/string,value=''))

if keyword_set(keyword_required) then repository=create_struct(name='Repository','resource_id','','resource_header',resource_header,'access_url',access_url)

if (request eq 'repository') then requested_structure=repository

if not keyword_set(keyword_required) then service=create_struct(name='Service','resource_id','','resource_header',resource_header,'access_url',access_url,'extension',make_array(spase_ontology(1052).occur_num,/string,value=''))

if keyword_set(keyword_required) then service=create_struct(name='Service','resource_id','','resource_header',resource_header,'access_url',access_url)

if (request eq 'service') then requested_structure=service

if not keyword_set(keyword_required) then annotation=create_struct(name='Annotation','resource_id','','resource_header',resource_header,'image_url','','annotation_type','','phenomenon_type','','classification_method','','confidence_rating','','time_span',replicate(time_span,spase_ontology(1096).occur_num),'observation_extent',replicate(observation_extent,spase_ontology(1101).occur_num),'extension',make_array(spase_ontology(1106).occur_num,/string,value=''))

if keyword_set(keyword_required) then annotation=create_struct(name='Annotation','resource_id','','resource_header',resource_header,'annotation_type','')

if (request eq 'annotation') then requested_structure=annotation

spase=create_struct(name='Spase','version','','catalog',replicate(catalog,spase_ontology(2).occur_num),'display_data',replicate(display_data,spase_ontology(215).occur_num),'numerical_data',replicate(numerical_data,spase_ontology(440).occur_num),'document',replicate(document,spase_ontology(664).occur_num),'software',replicate(software,spase_ontology(724).occur_num),'granule',replicate(granule,spase_ontology(786).occur_num),'instrument',replicate(instrument,spase_ontology(805).occur_num),'observatory',replicate(observatory,spase_ontology(853).occur_num),'person',replicate(person,spase_ontology(903).occur_num),'registry',replicate(registry,spase_ontology(915).occur_num),'repository',replicate(repository,spase_ontology(961).occur_num),'service',replicate(service,spase_ontology(1007).occur_num),'annotation',replicate(annotation,spase_ontology(1053).occur_num))

if (request eq 'spase') then requested_structure=spase

return,requested_structure

end

