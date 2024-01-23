
function populate_numerical_data,spase_ontology,station_info,verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date

numerical_data=spase_model_create(spase_ontology,'numerical_data',verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date)

;
;-------------------------------------------------------------------------------
;
;  NUMERICAL_DATA List Num:                        11
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

numerical_data.resource_id=''

numerical_data.resource_header.resource_name=''

numerical_data.resource_header.alternate_name=''

numerical_data.resource_header.doi=''

numerical_data.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    numerical_data.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    numerical_data.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

numerical_data.resource_header.expiration_date=''

numerical_data.resource_header.description=''

numerical_data.resource_header.acknowledgement=''

numerical_data.resource_header.publication_info.title=''

numerical_data.resource_header.publication_info.authors=''

numerical_data.resource_header.publication_info.publication_date=''

numerical_data.resource_header.publication_info.published_by=''

numerical_data.resource_header.publication_info.landing_page_url=''

numerical_data.resource_header.funding.agency=''

numerical_data.resource_header.funding.project=''

numerical_data.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    numerical_data.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do numerical_data.resource_header.contact(contact_loop).role(role_loop)=''

    numerical_data.resource_header.contact(contact_loop).start_date=''

    numerical_data.resource_header.contact(contact_loop).stop_date=''

    numerical_data.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    numerical_data.resource_header.information_url(information_url_loop).name=''

    numerical_data.resource_header.information_url(information_url_loop).url=''

    numerical_data.resource_header.information_url(information_url_loop).description=''

    numerical_data.resource_header.information_url(information_url_loop).language=''

endfor

numerical_data.resource_header.association.association_id=''

numerical_data.resource_header.association.association_type=''

numerical_data.resource_header.association.note=''

for prior_id_loop=0,8 do numerical_data.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    numerical_data.access_information(access_information_loop).repository_id=''

    numerical_data.access_information(access_information_loop).availability=''

    numerical_data.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        numerical_data.access_information(access_information_loop).access_url(access_url_loop).name=''

        numerical_data.access_information(access_information_loop).access_url(access_url_loop).url=''

        numerical_data.access_information(access_information_loop).access_url(access_url_loop).style=''

        numerical_data.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        numerical_data.access_information(access_information_loop).access_url(access_url_loop).description=''

        numerical_data.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    numerical_data.access_information(access_information_loop).format=''

    numerical_data.access_information(access_information_loop).encoding=''

    numerical_data.access_information(access_information_loop).access_directory_template=''

    numerical_data.access_information(access_information_loop).access_filename_template=''

    numerical_data.access_information(access_information_loop).data_extent.quantity=''

    numerical_data.access_information(access_information_loop).data_extent.units=''

    numerical_data.access_information(access_information_loop).data_extent.per=''

    numerical_data.access_information(access_information_loop).acknowledgement=''

endfor

numerical_data.processing_level=''

numerical_data.provider_name=''

numerical_data.provider_resource_name=''

numerical_data.provider_processing_level=''

numerical_data.provider_version=''

for instrument_id_loop=0,98 do numerical_data.instrument_id(instrument_id_loop)=''

for measurement_type_loop=0,4 do numerical_data.measurement_type(measurement_type_loop)=''

numerical_data.temporal_description.time_span.start_date=''

if keyword_set(keyword_stop_date) then numerical_data.temporal_description.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then numerical_data.temporal_description.time_span.relative_stop_date=''

numerical_data.temporal_description.time_span.note=''

numerical_data.temporal_description.cadence=''

numerical_data.temporal_description.cadence_min=''

numerical_data.temporal_description.cadence_max=''

numerical_data.temporal_description.exposure=''

numerical_data.temporal_description.exposure_min=''

numerical_data.temporal_description.exposure_max=''

numerical_data.spectral_range=''

for observed_region_loop=0,14 do numerical_data.observed_region(observed_region_loop)=''

numerical_data.spatial_coverage.coordinate_system.coordinate_representation=''

numerical_data.spatial_coverage.coordinate_system.coordinate_system_name=''

numerical_data.spatial_coverage.center_latitude=''

numerical_data.spatial_coverage.northernmost_latitude=''

numerical_data.spatial_coverage.southernmost_latitude=''

numerical_data.spatial_coverage.center_longitude=''

numerical_data.spatial_coverage.easternmost_longitude=''

numerical_data.spatial_coverage.westernmost_longitude=''

numerical_data.spatial_coverage.center_elevation=''

numerical_data.spatial_coverage.minimum_elevation=''

numerical_data.spatial_coverage.maximum_elevation=''

numerical_data.spatial_coverage.acknowledgement=''

numerical_data.spatial_coverage.description=''

numerical_data.caveats=''

for keyword_loop=0,98 do numerical_data.keyword(keyword_loop)=''

numerical_data.input_resource_id=''

for parameter_loop=0,84 do begin

    numerical_data.parameter(parameter_loop).name=''

    numerical_data.parameter(parameter_loop).set=''

    numerical_data.parameter(parameter_loop).parameter_key=''

    numerical_data.parameter(parameter_loop).description=''

    numerical_data.parameter(parameter_loop).ucd=''

    numerical_data.parameter(parameter_loop).caveats=''

    numerical_data.parameter(parameter_loop).cadence=''

    numerical_data.parameter(parameter_loop).cadence_min=''

    numerical_data.parameter(parameter_loop).cadence_max=''

    numerical_data.parameter(parameter_loop).units=''

    numerical_data.parameter(parameter_loop).units_conversion=''

    numerical_data.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    numerical_data.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    numerical_data.parameter(parameter_loop).rendering_hints.display_type=''

    numerical_data.parameter(parameter_loop).rendering_hints.axis_label=''

    numerical_data.parameter(parameter_loop).rendering_hints.rendering_axis=''

    numerical_data.parameter(parameter_loop).rendering_hints.index=''

    numerical_data.parameter(parameter_loop).rendering_hints.value_format=''

    numerical_data.parameter(parameter_loop).rendering_hints.scale_min=''

    numerical_data.parameter(parameter_loop).rendering_hints.scale_max=''

    numerical_data.parameter(parameter_loop).rendering_hints.scale_type=''

    numerical_data.parameter(parameter_loop).structure.size=''

    numerical_data.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        numerical_data.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do numerical_data.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).index=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).units=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    numerical_data.parameter(parameter_loop).valid_min=''

    numerical_data.parameter(parameter_loop).valid_max=''

    numerical_data.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do numerical_data.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    numerical_data.parameter(parameter_loop).field.field_quantity=''

    numerical_data.parameter(parameter_loop).field.frequency_range.spectral_range=''

    numerical_data.parameter(parameter_loop).field.frequency_range.low=''

    numerical_data.parameter(parameter_loop).field.frequency_range.high=''

    numerical_data.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        numerical_data.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        numerical_data.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        numerical_data.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do numerical_data.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do numerical_data.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    numerical_data.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do numerical_data.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    numerical_data.parameter(parameter_loop).particle.energy_range.low=''

    numerical_data.parameter(parameter_loop).particle.energy_range.high=''

    numerical_data.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        numerical_data.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        numerical_data.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        numerical_data.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    numerical_data.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    numerical_data.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    numerical_data.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        numerical_data.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        numerical_data.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        numerical_data.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    numerical_data.parameter(parameter_loop).particle.polar_angle_range.low=''

    numerical_data.parameter(parameter_loop).particle.polar_angle_range.high=''

    numerical_data.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        numerical_data.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        numerical_data.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        numerical_data.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    numerical_data.parameter(parameter_loop).particle.mass_range.low=''

    numerical_data.parameter(parameter_loop).particle.mass_range.high=''

    numerical_data.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        numerical_data.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        numerical_data.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        numerical_data.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    numerical_data.parameter(parameter_loop).particle.pitch_angle_range.low=''

    numerical_data.parameter(parameter_loop).particle.pitch_angle_range.high=''

    numerical_data.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        numerical_data.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        numerical_data.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        numerical_data.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    numerical_data.parameter(parameter_loop).particle.chemical_formula=''

    numerical_data.parameter(parameter_loop).particle.population=''

    numerical_data.parameter(parameter_loop).particle.population_mass_number=''

    numerical_data.parameter(parameter_loop).particle.population_charge_state=''

    numerical_data.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do numerical_data.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    numerical_data.parameter(parameter_loop).wave.wave_quantity=''

    numerical_data.parameter(parameter_loop).wave.energy_range.low=''

    numerical_data.parameter(parameter_loop).wave.energy_range.high=''

    numerical_data.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        numerical_data.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        numerical_data.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        numerical_data.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    numerical_data.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    numerical_data.parameter(parameter_loop).wave.frequency_range.low=''

    numerical_data.parameter(parameter_loop).wave.frequency_range.high=''

    numerical_data.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        numerical_data.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        numerical_data.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        numerical_data.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    numerical_data.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    numerical_data.parameter(parameter_loop).wave.wavelength_range.low=''

    numerical_data.parameter(parameter_loop).wave.wavelength_range.high=''

    numerical_data.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        numerical_data.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        numerical_data.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        numerical_data.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    numerical_data.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do numerical_data.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do numerical_data.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do numerical_data.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    numerical_data.parameter(parameter_loop).support.support_quantity=''

endfor

numerical_data.extension=''

return,numerical_data

end

