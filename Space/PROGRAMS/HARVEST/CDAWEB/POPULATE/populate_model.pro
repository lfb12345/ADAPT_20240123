
function populate_model,spase_ontology,station_info,verbose=verbose,keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter,keyword_cubes_description=keyword_cubes_description,keyword_cuts_description=keyword_cuts_description,keyword_plane_normal_vector=keyword_plane_normal_vector,keyword_plane_point=keyword_plane_point,keyword_region_begin=keyword_region_begin,keyword_region_end=keyword_region_end

model=spase_model_create(spase_ontology,'model',verbose=verbose,keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter,keyword_cubes_description=keyword_cubes_description,keyword_cuts_description=keyword_cuts_description,keyword_plane_normal_vector=keyword_plane_normal_vector,keyword_plane_point=keyword_plane_point,keyword_region_begin=keyword_region_begin,keyword_region_end=keyword_region_end)

;
;-------------------------------------------------------------------------------
;
;  MODEL List Num:                                 12
;
;-------------------------------------------------------------------------------
;

availability_list=['','Offline','Online']

encoding_list= $
   ['','ASCII','Base64','BZIP2','GZIP','None','S3_BUCKET','TAR','Unicode','ZIP']

format_list= $
   ['','AVI','Binary','CDF','CEF','CEF1','CEF2','CSV','Excel','FITS','GIF', $
    'Hardcopy','Hardcopy.Film','Hardcopy.Microfiche','Hardcopy.Microfilm', $
    'Hardcopy.Photograph','Hardcopy.PhotographicPlate','Hardcopy.Print','HDF', $
    'HDF4','HDF5','HTML','IDFS','IDL','JPEG','JSON','MATLAB_4','MATLAB_6', $
    'MATLAB_7','MPEG','NCAR','NetCDF','PDF','PDS4','PDS3','PNG','Postscript', $
    'QuickTime','RINEX2','RINEX3','Text','Text.ASCII','Text.Unicode','TFCat', $
    'TIFF','UDF','VOTable','XML']

qualifier_list= $
   ['','Incident','Anisotropy','Array','AutoSpectrum','Average', $
    'Characteristic','Circular','Coherence','Column','Component', $
    'Component.I','Component.J','Component.K','Confidence','Core', $
    'CrossSpectrum','Deviation','Differential','Direction','Directional', $
    'DirectionAngle','DirectionAngle.AzimuthAngle', $
    'DirectionAngle.ElevationAngle','DirectionAngle.PolarAngle', $
    'DirectionCosine','DirectionCosine.I','DirectionCosine.J', $
    'DirectionCosine.K','EncodedParameter','FieldAligned','Fit','Group', $
    'Halo','ImaginaryPart','Integral','Integral.Area','Integral.Bandwidth', $
    'Integral.SolidAngle','Linear','LineOfSight','Magnitude','Maximum', $
    'Median','Minimum','Moment','Parallel','Peak','Perpendicular', $
    'Perturbation','Phase','PhaseAngle','PowerSpectralDensity','Projection', $
    'Projection.IJ','Projection.IK','Projection.JK','Pseudo','Ratio', $
    'RealPart','Scalar','Spectral','StandardDeviation','StokesParameters', $
    'Strahl','Superhalo','Symmetric','Tensor','Total','Trace','Uncertainty', $
    'Variance','Vector']

role_list= $
   ['','Author','ArchiveSpecialist','CoInvestigator','CoPI','Contributor', $
    'DataProducer','DeputyPI','Developer','FormerPI','GeneralContact', $
    'HostContact','InstrumentLead','InstrumentScientist','MetadataContact', $
    'MissionManager','MissionPrincipalInvestigator','PrincipalInvestigator', $
    'ProgramManager','ProgramScientist','ProjectEngineer','ProjectManager', $
    'ProjectScientist','Publisher','Scientist','TeamLeader','TeamMember', $
    'TechnicalContact','User']

style_list= $
   ['','EPNTAP','File','Git','HAPI','Listing','Search','TAP','Template', $
    'Overview','WebService']

model.resource_id=''

model.resource_header.resource_name=''

model.resource_header.alternate_name=''

model.resource_header.doi=''

model.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    model.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    model.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

model.resource_header.expiration_date=''

model.resource_header.description=''

model.resource_header.acknowledgement=''

model.resource_header.publication_info.title=''

model.resource_header.publication_info.authors=''

model.resource_header.publication_info.publication_date=''

model.resource_header.publication_info.published_by=''

model.resource_header.publication_info.landing_page_url=''

model.resource_header.funding.agency=''

model.resource_header.funding.project=''

model.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    model.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do model.resource_header.contact(contact_loop).role(role_loop)=''

    model.resource_header.contact(contact_loop).start_date=''

    model.resource_header.contact(contact_loop).stop_date=''

    model.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    model.resource_header.information_url(information_url_loop).name=''

    model.resource_header.information_url(information_url_loop).url=''

    model.resource_header.information_url(information_url_loop).description=''

    model.resource_header.information_url(information_url_loop).language=''

endfor

model.resource_header.association.association_id=''

model.resource_header.association.association_type=''

model.resource_header.association.note=''

for prior_id_loop=0,8 do model.resource_header.prior_id(prior_id_loop)=''

model.access_information_optional.repository_id=''

model.access_information_optional.availability=''

model.access_information_optional.access_rights=''

for access_url_loop=0,4 do begin

    model.access_information_optional.access_url(access_url_loop).name=''

    model.access_information_optional.access_url(access_url_loop).url=''

    model.access_information_optional.access_url(access_url_loop).style=''

    model.access_information_optional.access_url(access_url_loop).product_key=''

    model.access_information_optional.access_url(access_url_loop).description=''

    model.access_information_optional.access_url(access_url_loop).language=''

endfor

model.access_information_optional.format=''

model.access_information_optional.encoding=''

model.access_information_optional.access_directory_template=''

model.access_information_optional.access_filename_template=''

model.access_information_optional.data_extent.quantity=''

model.access_information_optional.data_extent.units=''

model.access_information_optional.data_extent.per=''

model.access_information_optional.acknowledgement=''

model.versions.model_version.version_tag=''

model.versions.model_version.release_date=''

model.versions.model_version.description=''

model.versions.model_version.caveats=''

model.model_type=''

model.code_language=''

model.temporal_dependence=''

model.spatial_description.dimension=''

model.spatial_description.coordinate_system.coordinate_representation=''

model.spatial_description.coordinate_system.coordinate_system_name=''

model.spatial_description.units=''

model.spatial_description.units_conversion=''

model.spatial_description.coordinates_label=''

if keyword_set(keyword_cuts_description) then model.spatial_description.cuts_description=''

if keyword_set(keyword_cubes_description) then model.spatial_description.cubes_description=''

if keyword_set(keyword_plane_normal_vector) then model.spatial_description.plane_normal_vector=''

if keyword_set(keyword_plane_point) then model.spatial_description.plane_point=''

if keyword_set(keyword_region_begin) then model.spatial_description.region_begin=''

if keyword_set(keyword_region_end) then model.spatial_description.region_end=''

model.spatial_description.step=''

model.modeled_region=''

model.input_properties.property.name=''

model.input_properties.property.description=''

model.input_properties.property.caveats=''

model.input_properties.property.property_quantity=''

for qualifier_loop=0,4 do model.input_properties.property.qualifier(qualifier_loop)=''

model.input_properties.property.units=''

model.input_properties.property.units_conversion=''

model.input_properties.property.property_label=''

model.input_properties.property.property_value=''

model.input_properties.property.property_table_url=''

model.input_properties.property.valid_min=''

model.input_properties.property.valid_max=''

model.input_properties.property.property_model=''

model.input_properties.property.model_url=''

for parameter_loop=0,84 do begin

    model.output_parameters.parameter(parameter_loop).name=''

    model.output_parameters.parameter(parameter_loop).set=''

    model.output_parameters.parameter(parameter_loop).parameter_key=''

    model.output_parameters.parameter(parameter_loop).description=''

    model.output_parameters.parameter(parameter_loop).ucd=''

    model.output_parameters.parameter(parameter_loop).caveats=''

    model.output_parameters.parameter(parameter_loop).cadence=''

    model.output_parameters.parameter(parameter_loop).cadence_min=''

    model.output_parameters.parameter(parameter_loop).cadence_max=''

    model.output_parameters.parameter(parameter_loop).units=''

    model.output_parameters.parameter(parameter_loop).units_conversion=''

    model.output_parameters.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    model.output_parameters.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    model.output_parameters.parameter(parameter_loop).rendering_hints.display_type=''

    model.output_parameters.parameter(parameter_loop).rendering_hints.axis_label=''

    model.output_parameters.parameter(parameter_loop).rendering_hints.rendering_axis=''

    model.output_parameters.parameter(parameter_loop).rendering_hints.index=''

    model.output_parameters.parameter(parameter_loop).rendering_hints.value_format=''

    model.output_parameters.parameter(parameter_loop).rendering_hints.scale_min=''

    model.output_parameters.parameter(parameter_loop).rendering_hints.scale_max=''

    model.output_parameters.parameter(parameter_loop).rendering_hints.scale_type=''

    model.output_parameters.parameter(parameter_loop).structure.size=''

    model.output_parameters.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do model.output_parameters.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).index=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).units=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    model.output_parameters.parameter(parameter_loop).valid_min=''

    model.output_parameters.parameter(parameter_loop).valid_max=''

    model.output_parameters.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do model.output_parameters.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    model.output_parameters.parameter(parameter_loop).field.field_quantity=''

    model.output_parameters.parameter(parameter_loop).field.frequency_range.spectral_range=''

    model.output_parameters.parameter(parameter_loop).field.frequency_range.low=''

    model.output_parameters.parameter(parameter_loop).field.frequency_range.high=''

    model.output_parameters.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        model.output_parameters.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        model.output_parameters.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        model.output_parameters.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do model.output_parameters.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do model.output_parameters.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    model.output_parameters.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do model.output_parameters.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    model.output_parameters.parameter(parameter_loop).particle.energy_range.low=''

    model.output_parameters.parameter(parameter_loop).particle.energy_range.high=''

    model.output_parameters.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        model.output_parameters.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        model.output_parameters.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        model.output_parameters.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    model.output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    model.output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    model.output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        model.output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        model.output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        model.output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    model.output_parameters.parameter(parameter_loop).particle.polar_angle_range.low=''

    model.output_parameters.parameter(parameter_loop).particle.polar_angle_range.high=''

    model.output_parameters.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        model.output_parameters.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        model.output_parameters.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        model.output_parameters.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    model.output_parameters.parameter(parameter_loop).particle.mass_range.low=''

    model.output_parameters.parameter(parameter_loop).particle.mass_range.high=''

    model.output_parameters.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        model.output_parameters.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        model.output_parameters.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        model.output_parameters.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    model.output_parameters.parameter(parameter_loop).particle.pitch_angle_range.low=''

    model.output_parameters.parameter(parameter_loop).particle.pitch_angle_range.high=''

    model.output_parameters.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        model.output_parameters.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        model.output_parameters.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        model.output_parameters.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    model.output_parameters.parameter(parameter_loop).particle.chemical_formula=''

    model.output_parameters.parameter(parameter_loop).particle.population=''

    model.output_parameters.parameter(parameter_loop).particle.population_mass_number=''

    model.output_parameters.parameter(parameter_loop).particle.population_charge_state=''

    model.output_parameters.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do model.output_parameters.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    model.output_parameters.parameter(parameter_loop).wave.wave_quantity=''

    model.output_parameters.parameter(parameter_loop).wave.energy_range.low=''

    model.output_parameters.parameter(parameter_loop).wave.energy_range.high=''

    model.output_parameters.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        model.output_parameters.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        model.output_parameters.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        model.output_parameters.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    model.output_parameters.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    model.output_parameters.parameter(parameter_loop).wave.frequency_range.low=''

    model.output_parameters.parameter(parameter_loop).wave.frequency_range.high=''

    model.output_parameters.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        model.output_parameters.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        model.output_parameters.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        model.output_parameters.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    model.output_parameters.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    model.output_parameters.parameter(parameter_loop).wave.wavelength_range.low=''

    model.output_parameters.parameter(parameter_loop).wave.wavelength_range.high=''

    model.output_parameters.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        model.output_parameters.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        model.output_parameters.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        model.output_parameters.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    model.output_parameters.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do model.output_parameters.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do model.output_parameters.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do model.output_parameters.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    model.output_parameters.parameter(parameter_loop).support.support_quantity=''

endfor

model.model_url=''

return,model

end

