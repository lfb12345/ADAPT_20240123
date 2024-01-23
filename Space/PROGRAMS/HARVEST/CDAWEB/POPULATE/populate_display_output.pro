
function populate_display_output,spase_ontology,station_info,verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date

display_output=spase_model_create(spase_ontology,'display_output',verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date)

;
;-------------------------------------------------------------------------------
;
;  DISPLAY_OUTPUT List Num:                        12
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

display_output.resource_id=''

display_output.resource_header.resource_name=''

display_output.resource_header.alternate_name=''

display_output.resource_header.doi=''

display_output.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    display_output.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    display_output.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

display_output.resource_header.expiration_date=''

display_output.resource_header.description=''

display_output.resource_header.acknowledgement=''

display_output.resource_header.publication_info.title=''

display_output.resource_header.publication_info.authors=''

display_output.resource_header.publication_info.publication_date=''

display_output.resource_header.publication_info.published_by=''

display_output.resource_header.publication_info.landing_page_url=''

display_output.resource_header.funding.agency=''

display_output.resource_header.funding.project=''

display_output.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    display_output.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do display_output.resource_header.contact(contact_loop).role(role_loop)=''

    display_output.resource_header.contact(contact_loop).start_date=''

    display_output.resource_header.contact(contact_loop).stop_date=''

    display_output.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    display_output.resource_header.information_url(information_url_loop).name=''

    display_output.resource_header.information_url(information_url_loop).url=''

    display_output.resource_header.information_url(information_url_loop).description=''

    display_output.resource_header.information_url(information_url_loop).language=''

endfor

display_output.resource_header.association.association_id=''

display_output.resource_header.association.association_type=''

display_output.resource_header.association.note=''

for prior_id_loop=0,8 do display_output.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    display_output.access_information(access_information_loop).repository_id=''

    display_output.access_information(access_information_loop).availability=''

    display_output.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        display_output.access_information(access_information_loop).access_url(access_url_loop).name=''

        display_output.access_information(access_information_loop).access_url(access_url_loop).url=''

        display_output.access_information(access_information_loop).access_url(access_url_loop).style=''

        display_output.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        display_output.access_information(access_information_loop).access_url(access_url_loop).description=''

        display_output.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    display_output.access_information(access_information_loop).format=''

    display_output.access_information(access_information_loop).encoding=''

    display_output.access_information(access_information_loop).access_directory_template=''

    display_output.access_information(access_information_loop).access_filename_template=''

    display_output.access_information(access_information_loop).data_extent.quantity=''

    display_output.access_information(access_information_loop).data_extent.units=''

    display_output.access_information(access_information_loop).data_extent.per=''

    display_output.access_information(access_information_loop).acknowledgement=''

endfor

display_output.processing_level=''

display_output.provider_resource_name=''

display_output.provider_processing_level=''

display_output.provider_version=''

display_output.modeled_instrument_id=''

for measurement_type_loop=0,4 do display_output.measurement_type(measurement_type_loop)=''

display_output.temporal_description.time_span.start_date=''

if keyword_set(keyword_stop_date) then display_output.temporal_description.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then display_output.temporal_description.time_span.relative_stop_date=''

display_output.temporal_description.time_span.note=''

display_output.temporal_description.cadence=''

display_output.temporal_description.cadence_min=''

display_output.temporal_description.cadence_max=''

display_output.temporal_description.exposure=''

display_output.temporal_description.exposure_min=''

display_output.temporal_description.exposure_max=''

display_output.spatial_description.dimension=''

display_output.spatial_description.coordinate_system.coordinate_representation=''

display_output.spatial_description.coordinate_system.coordinate_system_name=''

display_output.spatial_description.units=''

display_output.spatial_description.units_conversion=''

display_output.spatial_description.coordinates_label=''

if keyword_set(keyword_cuts_description) then display_output.spatial_description.cuts_description=''

if keyword_set(keyword_cubes_description) then display_output.spatial_description.cubes_description=''

if keyword_set(keyword_plane_normal_vector) then display_output.spatial_description.plane_normal_vector=''

if keyword_set(keyword_plane_point) then display_output.spatial_description.plane_point=''

if keyword_set(keyword_region_begin) then display_output.spatial_description.region_begin=''

if keyword_set(keyword_region_end) then display_output.spatial_description.region_end=''

display_output.spatial_description.step=''

display_output.spectral_range=''

display_output.display_cadence=''

display_output.modeled_region=''

display_output.caveats=''

for keyword_loop=0,98 do display_output.keyword(keyword_loop)=''

display_output.input_resource_id=''

for parameter_loop=0,84 do begin

    display_output.parameter(parameter_loop).name=''

    display_output.parameter(parameter_loop).set=''

    display_output.parameter(parameter_loop).parameter_key=''

    display_output.parameter(parameter_loop).description=''

    display_output.parameter(parameter_loop).ucd=''

    display_output.parameter(parameter_loop).caveats=''

    display_output.parameter(parameter_loop).cadence=''

    display_output.parameter(parameter_loop).cadence_min=''

    display_output.parameter(parameter_loop).cadence_max=''

    display_output.parameter(parameter_loop).units=''

    display_output.parameter(parameter_loop).units_conversion=''

    display_output.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    display_output.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    display_output.parameter(parameter_loop).rendering_hints.display_type=''

    display_output.parameter(parameter_loop).rendering_hints.axis_label=''

    display_output.parameter(parameter_loop).rendering_hints.rendering_axis=''

    display_output.parameter(parameter_loop).rendering_hints.index=''

    display_output.parameter(parameter_loop).rendering_hints.value_format=''

    display_output.parameter(parameter_loop).rendering_hints.scale_min=''

    display_output.parameter(parameter_loop).rendering_hints.scale_max=''

    display_output.parameter(parameter_loop).rendering_hints.scale_type=''

    display_output.parameter(parameter_loop).structure.size=''

    display_output.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        display_output.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do display_output.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        display_output.parameter(parameter_loop).structure.element(element_loop).index=''

        display_output.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        display_output.parameter(parameter_loop).structure.element(element_loop).units=''

        display_output.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        display_output.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        display_output.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        display_output.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    display_output.parameter(parameter_loop).valid_min=''

    display_output.parameter(parameter_loop).valid_max=''

    display_output.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do display_output.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    display_output.parameter(parameter_loop).field.field_quantity=''

    display_output.parameter(parameter_loop).field.frequency_range.spectral_range=''

    display_output.parameter(parameter_loop).field.frequency_range.low=''

    display_output.parameter(parameter_loop).field.frequency_range.high=''

    display_output.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        display_output.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        display_output.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        display_output.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do display_output.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do display_output.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    display_output.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do display_output.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    display_output.parameter(parameter_loop).particle.energy_range.low=''

    display_output.parameter(parameter_loop).particle.energy_range.high=''

    display_output.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        display_output.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        display_output.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        display_output.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    display_output.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    display_output.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    display_output.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        display_output.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        display_output.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        display_output.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    display_output.parameter(parameter_loop).particle.polar_angle_range.low=''

    display_output.parameter(parameter_loop).particle.polar_angle_range.high=''

    display_output.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        display_output.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        display_output.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        display_output.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    display_output.parameter(parameter_loop).particle.mass_range.low=''

    display_output.parameter(parameter_loop).particle.mass_range.high=''

    display_output.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        display_output.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        display_output.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        display_output.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    display_output.parameter(parameter_loop).particle.pitch_angle_range.low=''

    display_output.parameter(parameter_loop).particle.pitch_angle_range.high=''

    display_output.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        display_output.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        display_output.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        display_output.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    display_output.parameter(parameter_loop).particle.chemical_formula=''

    display_output.parameter(parameter_loop).particle.population=''

    display_output.parameter(parameter_loop).particle.population_mass_number=''

    display_output.parameter(parameter_loop).particle.population_charge_state=''

    display_output.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do display_output.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    display_output.parameter(parameter_loop).wave.wave_quantity=''

    display_output.parameter(parameter_loop).wave.energy_range.low=''

    display_output.parameter(parameter_loop).wave.energy_range.high=''

    display_output.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        display_output.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        display_output.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        display_output.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    display_output.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    display_output.parameter(parameter_loop).wave.frequency_range.low=''

    display_output.parameter(parameter_loop).wave.frequency_range.high=''

    display_output.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        display_output.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        display_output.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        display_output.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    display_output.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    display_output.parameter(parameter_loop).wave.wavelength_range.low=''

    display_output.parameter(parameter_loop).wave.wavelength_range.high=''

    display_output.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        display_output.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        display_output.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        display_output.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    display_output.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do display_output.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do display_output.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do display_output.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    display_output.parameter(parameter_loop).support.support_quantity=''

endfor

display_output.model_product=''

display_output.property.name=''

display_output.property.description=''

display_output.property.caveats=''

display_output.property.property_quantity=''

for qualifier_loop=0,4 do display_output.property.qualifier(qualifier_loop)=''

display_output.property.units=''

display_output.property.units_conversion=''

display_output.property.property_label=''

display_output.property.property_value=''

display_output.property.property_table_url=''

display_output.property.valid_min=''

display_output.property.valid_max=''

display_output.property.property_model=''

display_output.property.model_url=''

display_output.extension=''

return,display_output

end

