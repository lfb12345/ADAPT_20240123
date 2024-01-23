
function populate_display_data,spase_ontology,station_info,verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date

display_data=spase_model_create(spase_ontology,'display_data',verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date)

;
;-------------------------------------------------------------------------------
;
;  DISPLAY_DATA List Num:                          11
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

display_data.resource_id=''

display_data.resource_header.resource_name=''

display_data.resource_header.alternate_name=''

display_data.resource_header.doi=''

display_data.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    display_data.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    display_data.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

display_data.resource_header.expiration_date=''

display_data.resource_header.description=''

display_data.resource_header.acknowledgement=''

display_data.resource_header.publication_info.title=''

display_data.resource_header.publication_info.authors=''

display_data.resource_header.publication_info.publication_date=''

display_data.resource_header.publication_info.published_by=''

display_data.resource_header.publication_info.landing_page_url=''

display_data.resource_header.funding.agency=''

display_data.resource_header.funding.project=''

display_data.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    display_data.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do display_data.resource_header.contact(contact_loop).role(role_loop)=''

    display_data.resource_header.contact(contact_loop).start_date=''

    display_data.resource_header.contact(contact_loop).stop_date=''

    display_data.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    display_data.resource_header.information_url(information_url_loop).name=''

    display_data.resource_header.information_url(information_url_loop).url=''

    display_data.resource_header.information_url(information_url_loop).description=''

    display_data.resource_header.information_url(information_url_loop).language=''

endfor

display_data.resource_header.association.association_id=''

display_data.resource_header.association.association_type=''

display_data.resource_header.association.note=''

for prior_id_loop=0,8 do display_data.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    display_data.access_information(access_information_loop).repository_id=''

    display_data.access_information(access_information_loop).availability=''

    display_data.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        display_data.access_information(access_information_loop).access_url(access_url_loop).name=''

        display_data.access_information(access_information_loop).access_url(access_url_loop).url=''

        display_data.access_information(access_information_loop).access_url(access_url_loop).style=''

        display_data.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        display_data.access_information(access_information_loop).access_url(access_url_loop).description=''

        display_data.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    display_data.access_information(access_information_loop).format=''

    display_data.access_information(access_information_loop).encoding=''

    display_data.access_information(access_information_loop).access_directory_template=''

    display_data.access_information(access_information_loop).access_filename_template=''

    display_data.access_information(access_information_loop).data_extent.quantity=''

    display_data.access_information(access_information_loop).data_extent.units=''

    display_data.access_information(access_information_loop).data_extent.per=''

    display_data.access_information(access_information_loop).acknowledgement=''

endfor

display_data.processing_level=''

display_data.provider_name=''

display_data.provider_resource_name=''

display_data.provider_processing_level=''

display_data.provider_version=''

for instrument_id_loop=0,98 do display_data.instrument_id(instrument_id_loop)=''

for measurement_type_loop=0,4 do display_data.measurement_type(measurement_type_loop)=''

display_data.temporal_description.time_span.start_date=''

if keyword_set(keyword_stop_date) then display_data.temporal_description.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then display_data.temporal_description.time_span.relative_stop_date=''

display_data.temporal_description.time_span.note=''

display_data.temporal_description.cadence=''

display_data.temporal_description.cadence_min=''

display_data.temporal_description.cadence_max=''

display_data.temporal_description.exposure=''

display_data.temporal_description.exposure_min=''

display_data.temporal_description.exposure_max=''

display_data.spectral_range=''

display_data.display_cadence=''

for observed_region_loop=0,14 do display_data.observed_region(observed_region_loop)=''

display_data.spatial_coverage.coordinate_system.coordinate_representation=''

display_data.spatial_coverage.coordinate_system.coordinate_system_name=''

display_data.spatial_coverage.center_latitude=''

display_data.spatial_coverage.northernmost_latitude=''

display_data.spatial_coverage.southernmost_latitude=''

display_data.spatial_coverage.center_longitude=''

display_data.spatial_coverage.easternmost_longitude=''

display_data.spatial_coverage.westernmost_longitude=''

display_data.spatial_coverage.center_elevation=''

display_data.spatial_coverage.minimum_elevation=''

display_data.spatial_coverage.maximum_elevation=''

display_data.spatial_coverage.acknowledgement=''

display_data.spatial_coverage.description=''

display_data.caveats=''

for keyword_loop=0,98 do display_data.keyword(keyword_loop)=''

display_data.input_resource_id=''

for parameter_loop=0,84 do begin

    display_data.parameter(parameter_loop).name=''

    display_data.parameter(parameter_loop).set=''

    display_data.parameter(parameter_loop).parameter_key=''

    display_data.parameter(parameter_loop).description=''

    display_data.parameter(parameter_loop).ucd=''

    display_data.parameter(parameter_loop).caveats=''

    display_data.parameter(parameter_loop).cadence=''

    display_data.parameter(parameter_loop).cadence_min=''

    display_data.parameter(parameter_loop).cadence_max=''

    display_data.parameter(parameter_loop).units=''

    display_data.parameter(parameter_loop).units_conversion=''

    display_data.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    display_data.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    display_data.parameter(parameter_loop).rendering_hints.display_type=''

    display_data.parameter(parameter_loop).rendering_hints.axis_label=''

    display_data.parameter(parameter_loop).rendering_hints.rendering_axis=''

    display_data.parameter(parameter_loop).rendering_hints.index=''

    display_data.parameter(parameter_loop).rendering_hints.value_format=''

    display_data.parameter(parameter_loop).rendering_hints.scale_min=''

    display_data.parameter(parameter_loop).rendering_hints.scale_max=''

    display_data.parameter(parameter_loop).rendering_hints.scale_type=''

    display_data.parameter(parameter_loop).structure.size=''

    display_data.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        display_data.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do display_data.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        display_data.parameter(parameter_loop).structure.element(element_loop).index=''

        display_data.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        display_data.parameter(parameter_loop).structure.element(element_loop).units=''

        display_data.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        display_data.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        display_data.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        display_data.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    display_data.parameter(parameter_loop).valid_min=''

    display_data.parameter(parameter_loop).valid_max=''

    display_data.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do display_data.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    display_data.parameter(parameter_loop).field.field_quantity=''

    display_data.parameter(parameter_loop).field.frequency_range.spectral_range=''

    display_data.parameter(parameter_loop).field.frequency_range.low=''

    display_data.parameter(parameter_loop).field.frequency_range.high=''

    display_data.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        display_data.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        display_data.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        display_data.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do display_data.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do display_data.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    display_data.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do display_data.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    display_data.parameter(parameter_loop).particle.energy_range.low=''

    display_data.parameter(parameter_loop).particle.energy_range.high=''

    display_data.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        display_data.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        display_data.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        display_data.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    display_data.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    display_data.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    display_data.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        display_data.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        display_data.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        display_data.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    display_data.parameter(parameter_loop).particle.polar_angle_range.low=''

    display_data.parameter(parameter_loop).particle.polar_angle_range.high=''

    display_data.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        display_data.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        display_data.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        display_data.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    display_data.parameter(parameter_loop).particle.mass_range.low=''

    display_data.parameter(parameter_loop).particle.mass_range.high=''

    display_data.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        display_data.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        display_data.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        display_data.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    display_data.parameter(parameter_loop).particle.pitch_angle_range.low=''

    display_data.parameter(parameter_loop).particle.pitch_angle_range.high=''

    display_data.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        display_data.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        display_data.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        display_data.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    display_data.parameter(parameter_loop).particle.chemical_formula=''

    display_data.parameter(parameter_loop).particle.population=''

    display_data.parameter(parameter_loop).particle.population_mass_number=''

    display_data.parameter(parameter_loop).particle.population_charge_state=''

    display_data.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do display_data.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    display_data.parameter(parameter_loop).wave.wave_quantity=''

    display_data.parameter(parameter_loop).wave.energy_range.low=''

    display_data.parameter(parameter_loop).wave.energy_range.high=''

    display_data.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        display_data.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        display_data.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        display_data.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    display_data.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    display_data.parameter(parameter_loop).wave.frequency_range.low=''

    display_data.parameter(parameter_loop).wave.frequency_range.high=''

    display_data.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        display_data.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        display_data.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        display_data.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    display_data.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    display_data.parameter(parameter_loop).wave.wavelength_range.low=''

    display_data.parameter(parameter_loop).wave.wavelength_range.high=''

    display_data.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        display_data.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        display_data.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        display_data.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    display_data.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do display_data.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do display_data.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do display_data.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    display_data.parameter(parameter_loop).support.support_quantity=''

endfor

display_data.extension=''

return,display_data

end

