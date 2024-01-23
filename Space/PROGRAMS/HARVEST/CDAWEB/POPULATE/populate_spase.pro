
function populate_spase,spase_ontology,station_info,verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date

spase=spase_model_create(spase_ontology,'spase',verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date)

;
;-------------------------------------------------------------------------------
;
;  SPASE List Num:                                105
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

symmetry_list=['','Axial','Central','None','Plane']

spase.version=''

spase.catalog.resource_id=''

spase.catalog.resource_header.resource_name=''

spase.catalog.resource_header.alternate_name=''

spase.catalog.resource_header.doi=''

spase.catalog.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.catalog.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.catalog.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.catalog.resource_header.expiration_date=''

spase.catalog.resource_header.description=''

spase.catalog.resource_header.acknowledgement=''

spase.catalog.resource_header.publication_info.title=''

spase.catalog.resource_header.publication_info.authors=''

spase.catalog.resource_header.publication_info.publication_date=''

spase.catalog.resource_header.publication_info.published_by=''

spase.catalog.resource_header.publication_info.landing_page_url=''

spase.catalog.resource_header.funding.agency=''

spase.catalog.resource_header.funding.project=''

spase.catalog.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.catalog.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.catalog.resource_header.contact(contact_loop).role(role_loop)=''

    spase.catalog.resource_header.contact(contact_loop).start_date=''

    spase.catalog.resource_header.contact(contact_loop).stop_date=''

    spase.catalog.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.catalog.resource_header.information_url(information_url_loop).name=''

    spase.catalog.resource_header.information_url(information_url_loop).url=''

    spase.catalog.resource_header.information_url(information_url_loop).description=''

    spase.catalog.resource_header.information_url(information_url_loop).language=''

endfor

spase.catalog.resource_header.association.association_id=''

spase.catalog.resource_header.association.association_type=''

spase.catalog.resource_header.association.note=''

for prior_id_loop=0,8 do spase.catalog.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    spase.catalog.access_information(access_information_loop).repository_id=''

    spase.catalog.access_information(access_information_loop).availability=''

    spase.catalog.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        spase.catalog.access_information(access_information_loop).access_url(access_url_loop).name=''

        spase.catalog.access_information(access_information_loop).access_url(access_url_loop).url=''

        spase.catalog.access_information(access_information_loop).access_url(access_url_loop).style=''

        spase.catalog.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        spase.catalog.access_information(access_information_loop).access_url(access_url_loop).description=''

        spase.catalog.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    spase.catalog.access_information(access_information_loop).format=''

    spase.catalog.access_information(access_information_loop).encoding=''

    spase.catalog.access_information(access_information_loop).access_directory_template=''

    spase.catalog.access_information(access_information_loop).access_filename_template=''

    spase.catalog.access_information(access_information_loop).data_extent.quantity=''

    spase.catalog.access_information(access_information_loop).data_extent.units=''

    spase.catalog.access_information(access_information_loop).data_extent.per=''

    spase.catalog.access_information(access_information_loop).acknowledgement=''

endfor

spase.catalog.provider_name=''

spase.catalog.provider_resource_name=''

spase.catalog.provider_version=''

for instrument_id_loop=0,98 do spase.catalog.instrument_id(instrument_id_loop)=''

for phenomenon_type_loop=0,4 do spase.catalog.phenomenon_type(phenomenon_type_loop)=''

spase.catalog.time_span.start_date=''

if keyword_set(keyword_stop_date) then spase.catalog.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then spase.catalog.time_span.relative_stop_date=''

spase.catalog.time_span.note=''

spase.catalog.caveats=''

for keyword_loop=0,98 do spase.catalog.keyword(keyword_loop)=''

spase.catalog.input_resource_id=''

for parameter_loop=0,84 do begin

    spase.catalog.parameter(parameter_loop).name=''

    spase.catalog.parameter(parameter_loop).set=''

    spase.catalog.parameter(parameter_loop).parameter_key=''

    spase.catalog.parameter(parameter_loop).description=''

    spase.catalog.parameter(parameter_loop).ucd=''

    spase.catalog.parameter(parameter_loop).caveats=''

    spase.catalog.parameter(parameter_loop).cadence=''

    spase.catalog.parameter(parameter_loop).cadence_min=''

    spase.catalog.parameter(parameter_loop).cadence_max=''

    spase.catalog.parameter(parameter_loop).units=''

    spase.catalog.parameter(parameter_loop).units_conversion=''

    spase.catalog.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    spase.catalog.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    spase.catalog.parameter(parameter_loop).rendering_hints.display_type=''

    spase.catalog.parameter(parameter_loop).rendering_hints.axis_label=''

    spase.catalog.parameter(parameter_loop).rendering_hints.rendering_axis=''

    spase.catalog.parameter(parameter_loop).rendering_hints.index=''

    spase.catalog.parameter(parameter_loop).rendering_hints.value_format=''

    spase.catalog.parameter(parameter_loop).rendering_hints.scale_min=''

    spase.catalog.parameter(parameter_loop).rendering_hints.scale_max=''

    spase.catalog.parameter(parameter_loop).rendering_hints.scale_type=''

    spase.catalog.parameter(parameter_loop).structure.size=''

    spase.catalog.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do spase.catalog.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).index=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).units=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        spase.catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    spase.catalog.parameter(parameter_loop).valid_min=''

    spase.catalog.parameter(parameter_loop).valid_max=''

    spase.catalog.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do spase.catalog.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    spase.catalog.parameter(parameter_loop).field.field_quantity=''

    spase.catalog.parameter(parameter_loop).field.frequency_range.spectral_range=''

    spase.catalog.parameter(parameter_loop).field.frequency_range.low=''

    spase.catalog.parameter(parameter_loop).field.frequency_range.high=''

    spase.catalog.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        spase.catalog.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        spase.catalog.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        spase.catalog.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do spase.catalog.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do spase.catalog.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    spase.catalog.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do spase.catalog.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    spase.catalog.parameter(parameter_loop).particle.energy_range.low=''

    spase.catalog.parameter(parameter_loop).particle.energy_range.high=''

    spase.catalog.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        spase.catalog.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        spase.catalog.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        spase.catalog.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    spase.catalog.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    spase.catalog.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    spase.catalog.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.catalog.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        spase.catalog.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        spase.catalog.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    spase.catalog.parameter(parameter_loop).particle.polar_angle_range.low=''

    spase.catalog.parameter(parameter_loop).particle.polar_angle_range.high=''

    spase.catalog.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.catalog.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        spase.catalog.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        spase.catalog.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    spase.catalog.parameter(parameter_loop).particle.mass_range.low=''

    spase.catalog.parameter(parameter_loop).particle.mass_range.high=''

    spase.catalog.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        spase.catalog.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        spase.catalog.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        spase.catalog.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    spase.catalog.parameter(parameter_loop).particle.pitch_angle_range.low=''

    spase.catalog.parameter(parameter_loop).particle.pitch_angle_range.high=''

    spase.catalog.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.catalog.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        spase.catalog.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        spase.catalog.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    spase.catalog.parameter(parameter_loop).particle.chemical_formula=''

    spase.catalog.parameter(parameter_loop).particle.population=''

    spase.catalog.parameter(parameter_loop).particle.population_mass_number=''

    spase.catalog.parameter(parameter_loop).particle.population_charge_state=''

    spase.catalog.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do spase.catalog.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    spase.catalog.parameter(parameter_loop).wave.wave_quantity=''

    spase.catalog.parameter(parameter_loop).wave.energy_range.low=''

    spase.catalog.parameter(parameter_loop).wave.energy_range.high=''

    spase.catalog.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        spase.catalog.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        spase.catalog.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        spase.catalog.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    spase.catalog.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    spase.catalog.parameter(parameter_loop).wave.frequency_range.low=''

    spase.catalog.parameter(parameter_loop).wave.frequency_range.high=''

    spase.catalog.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        spase.catalog.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        spase.catalog.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        spase.catalog.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    spase.catalog.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    spase.catalog.parameter(parameter_loop).wave.wavelength_range.low=''

    spase.catalog.parameter(parameter_loop).wave.wavelength_range.high=''

    spase.catalog.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        spase.catalog.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        spase.catalog.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        spase.catalog.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    spase.catalog.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do spase.catalog.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do spase.catalog.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do spase.catalog.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    spase.catalog.parameter(parameter_loop).support.support_quantity=''

endfor

spase.catalog.extension=''

spase.display_data.resource_id=''

spase.display_data.resource_header.resource_name=''

spase.display_data.resource_header.alternate_name=''

spase.display_data.resource_header.doi=''

spase.display_data.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.display_data.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.display_data.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.display_data.resource_header.expiration_date=''

spase.display_data.resource_header.description=''

spase.display_data.resource_header.acknowledgement=''

spase.display_data.resource_header.publication_info.title=''

spase.display_data.resource_header.publication_info.authors=''

spase.display_data.resource_header.publication_info.publication_date=''

spase.display_data.resource_header.publication_info.published_by=''

spase.display_data.resource_header.publication_info.landing_page_url=''

spase.display_data.resource_header.funding.agency=''

spase.display_data.resource_header.funding.project=''

spase.display_data.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.display_data.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.display_data.resource_header.contact(contact_loop).role(role_loop)=''

    spase.display_data.resource_header.contact(contact_loop).start_date=''

    spase.display_data.resource_header.contact(contact_loop).stop_date=''

    spase.display_data.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.display_data.resource_header.information_url(information_url_loop).name=''

    spase.display_data.resource_header.information_url(information_url_loop).url=''

    spase.display_data.resource_header.information_url(information_url_loop).description=''

    spase.display_data.resource_header.information_url(information_url_loop).language=''

endfor

spase.display_data.resource_header.association.association_id=''

spase.display_data.resource_header.association.association_type=''

spase.display_data.resource_header.association.note=''

for prior_id_loop=0,8 do spase.display_data.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    spase.display_data.access_information(access_information_loop).repository_id=''

    spase.display_data.access_information(access_information_loop).availability=''

    spase.display_data.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        spase.display_data.access_information(access_information_loop).access_url(access_url_loop).name=''

        spase.display_data.access_information(access_information_loop).access_url(access_url_loop).url=''

        spase.display_data.access_information(access_information_loop).access_url(access_url_loop).style=''

        spase.display_data.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        spase.display_data.access_information(access_information_loop).access_url(access_url_loop).description=''

        spase.display_data.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    spase.display_data.access_information(access_information_loop).format=''

    spase.display_data.access_information(access_information_loop).encoding=''

    spase.display_data.access_information(access_information_loop).access_directory_template=''

    spase.display_data.access_information(access_information_loop).access_filename_template=''

    spase.display_data.access_information(access_information_loop).data_extent.quantity=''

    spase.display_data.access_information(access_information_loop).data_extent.units=''

    spase.display_data.access_information(access_information_loop).data_extent.per=''

    spase.display_data.access_information(access_information_loop).acknowledgement=''

endfor

spase.display_data.processing_level=''

spase.display_data.provider_name=''

spase.display_data.provider_resource_name=''

spase.display_data.provider_processing_level=''

spase.display_data.provider_version=''

for instrument_id_loop=0,98 do spase.display_data.instrument_id(instrument_id_loop)=''

for measurement_type_loop=0,4 do spase.display_data.measurement_type(measurement_type_loop)=''

spase.display_data.temporal_description.time_span.start_date=''

if keyword_set(keyword_stop_date) then spase.display_data.temporal_description.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then spase.display_data.temporal_description.time_span.relative_stop_date=''

spase.display_data.temporal_description.time_span.note=''

spase.display_data.temporal_description.cadence=''

spase.display_data.temporal_description.cadence_min=''

spase.display_data.temporal_description.cadence_max=''

spase.display_data.temporal_description.exposure=''

spase.display_data.temporal_description.exposure_min=''

spase.display_data.temporal_description.exposure_max=''

spase.display_data.spectral_range=''

spase.display_data.display_cadence=''

for observed_region_loop=0,14 do spase.display_data.observed_region(observed_region_loop)=''

spase.display_data.spatial_coverage.coordinate_system.coordinate_representation=''

spase.display_data.spatial_coverage.coordinate_system.coordinate_system_name=''

spase.display_data.spatial_coverage.center_latitude=''

spase.display_data.spatial_coverage.northernmost_latitude=''

spase.display_data.spatial_coverage.southernmost_latitude=''

spase.display_data.spatial_coverage.center_longitude=''

spase.display_data.spatial_coverage.easternmost_longitude=''

spase.display_data.spatial_coverage.westernmost_longitude=''

spase.display_data.spatial_coverage.center_elevation=''

spase.display_data.spatial_coverage.minimum_elevation=''

spase.display_data.spatial_coverage.maximum_elevation=''

spase.display_data.spatial_coverage.acknowledgement=''

spase.display_data.spatial_coverage.description=''

spase.display_data.caveats=''

for keyword_loop=0,98 do spase.display_data.keyword(keyword_loop)=''

spase.display_data.input_resource_id=''

for parameter_loop=0,84 do begin

    spase.display_data.parameter(parameter_loop).name=''

    spase.display_data.parameter(parameter_loop).set=''

    spase.display_data.parameter(parameter_loop).parameter_key=''

    spase.display_data.parameter(parameter_loop).description=''

    spase.display_data.parameter(parameter_loop).ucd=''

    spase.display_data.parameter(parameter_loop).caveats=''

    spase.display_data.parameter(parameter_loop).cadence=''

    spase.display_data.parameter(parameter_loop).cadence_min=''

    spase.display_data.parameter(parameter_loop).cadence_max=''

    spase.display_data.parameter(parameter_loop).units=''

    spase.display_data.parameter(parameter_loop).units_conversion=''

    spase.display_data.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    spase.display_data.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    spase.display_data.parameter(parameter_loop).rendering_hints.display_type=''

    spase.display_data.parameter(parameter_loop).rendering_hints.axis_label=''

    spase.display_data.parameter(parameter_loop).rendering_hints.rendering_axis=''

    spase.display_data.parameter(parameter_loop).rendering_hints.index=''

    spase.display_data.parameter(parameter_loop).rendering_hints.value_format=''

    spase.display_data.parameter(parameter_loop).rendering_hints.scale_min=''

    spase.display_data.parameter(parameter_loop).rendering_hints.scale_max=''

    spase.display_data.parameter(parameter_loop).rendering_hints.scale_type=''

    spase.display_data.parameter(parameter_loop).structure.size=''

    spase.display_data.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do spase.display_data.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).index=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).units=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        spase.display_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    spase.display_data.parameter(parameter_loop).valid_min=''

    spase.display_data.parameter(parameter_loop).valid_max=''

    spase.display_data.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do spase.display_data.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    spase.display_data.parameter(parameter_loop).field.field_quantity=''

    spase.display_data.parameter(parameter_loop).field.frequency_range.spectral_range=''

    spase.display_data.parameter(parameter_loop).field.frequency_range.low=''

    spase.display_data.parameter(parameter_loop).field.frequency_range.high=''

    spase.display_data.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        spase.display_data.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        spase.display_data.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        spase.display_data.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do spase.display_data.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do spase.display_data.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    spase.display_data.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do spase.display_data.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    spase.display_data.parameter(parameter_loop).particle.energy_range.low=''

    spase.display_data.parameter(parameter_loop).particle.energy_range.high=''

    spase.display_data.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        spase.display_data.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        spase.display_data.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        spase.display_data.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    spase.display_data.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    spase.display_data.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    spase.display_data.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.display_data.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        spase.display_data.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        spase.display_data.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    spase.display_data.parameter(parameter_loop).particle.polar_angle_range.low=''

    spase.display_data.parameter(parameter_loop).particle.polar_angle_range.high=''

    spase.display_data.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.display_data.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        spase.display_data.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        spase.display_data.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    spase.display_data.parameter(parameter_loop).particle.mass_range.low=''

    spase.display_data.parameter(parameter_loop).particle.mass_range.high=''

    spase.display_data.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        spase.display_data.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        spase.display_data.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        spase.display_data.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    spase.display_data.parameter(parameter_loop).particle.pitch_angle_range.low=''

    spase.display_data.parameter(parameter_loop).particle.pitch_angle_range.high=''

    spase.display_data.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.display_data.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        spase.display_data.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        spase.display_data.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    spase.display_data.parameter(parameter_loop).particle.chemical_formula=''

    spase.display_data.parameter(parameter_loop).particle.population=''

    spase.display_data.parameter(parameter_loop).particle.population_mass_number=''

    spase.display_data.parameter(parameter_loop).particle.population_charge_state=''

    spase.display_data.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do spase.display_data.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    spase.display_data.parameter(parameter_loop).wave.wave_quantity=''

    spase.display_data.parameter(parameter_loop).wave.energy_range.low=''

    spase.display_data.parameter(parameter_loop).wave.energy_range.high=''

    spase.display_data.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        spase.display_data.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        spase.display_data.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        spase.display_data.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    spase.display_data.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    spase.display_data.parameter(parameter_loop).wave.frequency_range.low=''

    spase.display_data.parameter(parameter_loop).wave.frequency_range.high=''

    spase.display_data.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        spase.display_data.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        spase.display_data.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        spase.display_data.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    spase.display_data.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    spase.display_data.parameter(parameter_loop).wave.wavelength_range.low=''

    spase.display_data.parameter(parameter_loop).wave.wavelength_range.high=''

    spase.display_data.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        spase.display_data.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        spase.display_data.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        spase.display_data.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    spase.display_data.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do spase.display_data.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do spase.display_data.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do spase.display_data.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    spase.display_data.parameter(parameter_loop).support.support_quantity=''

endfor

spase.display_data.extension=''

spase.numerical_data.resource_id=''

spase.numerical_data.resource_header.resource_name=''

spase.numerical_data.resource_header.alternate_name=''

spase.numerical_data.resource_header.doi=''

spase.numerical_data.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.numerical_data.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.numerical_data.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.numerical_data.resource_header.expiration_date=''

spase.numerical_data.resource_header.description=''

spase.numerical_data.resource_header.acknowledgement=''

spase.numerical_data.resource_header.publication_info.title=''

spase.numerical_data.resource_header.publication_info.authors=''

spase.numerical_data.resource_header.publication_info.publication_date=''

spase.numerical_data.resource_header.publication_info.published_by=''

spase.numerical_data.resource_header.publication_info.landing_page_url=''

spase.numerical_data.resource_header.funding.agency=''

spase.numerical_data.resource_header.funding.project=''

spase.numerical_data.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.numerical_data.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.numerical_data.resource_header.contact(contact_loop).role(role_loop)=''

    spase.numerical_data.resource_header.contact(contact_loop).start_date=''

    spase.numerical_data.resource_header.contact(contact_loop).stop_date=''

    spase.numerical_data.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.numerical_data.resource_header.information_url(information_url_loop).name=''

    spase.numerical_data.resource_header.information_url(information_url_loop).url=''

    spase.numerical_data.resource_header.information_url(information_url_loop).description=''

    spase.numerical_data.resource_header.information_url(information_url_loop).language=''

endfor

spase.numerical_data.resource_header.association.association_id=''

spase.numerical_data.resource_header.association.association_type=''

spase.numerical_data.resource_header.association.note=''

for prior_id_loop=0,8 do spase.numerical_data.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    spase.numerical_data.access_information(access_information_loop).repository_id=''

    spase.numerical_data.access_information(access_information_loop).availability=''

    spase.numerical_data.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        spase.numerical_data.access_information(access_information_loop).access_url(access_url_loop).name=''

        spase.numerical_data.access_information(access_information_loop).access_url(access_url_loop).url=''

        spase.numerical_data.access_information(access_information_loop).access_url(access_url_loop).style=''

        spase.numerical_data.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        spase.numerical_data.access_information(access_information_loop).access_url(access_url_loop).description=''

        spase.numerical_data.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    spase.numerical_data.access_information(access_information_loop).format=''

    spase.numerical_data.access_information(access_information_loop).encoding=''

    spase.numerical_data.access_information(access_information_loop).access_directory_template=''

    spase.numerical_data.access_information(access_information_loop).access_filename_template=''

    spase.numerical_data.access_information(access_information_loop).data_extent.quantity=''

    spase.numerical_data.access_information(access_information_loop).data_extent.units=''

    spase.numerical_data.access_information(access_information_loop).data_extent.per=''

    spase.numerical_data.access_information(access_information_loop).acknowledgement=''

endfor

spase.numerical_data.processing_level=''

spase.numerical_data.provider_name=''

spase.numerical_data.provider_resource_name=''

spase.numerical_data.provider_processing_level=''

spase.numerical_data.provider_version=''

for instrument_id_loop=0,98 do spase.numerical_data.instrument_id(instrument_id_loop)=''

for measurement_type_loop=0,4 do spase.numerical_data.measurement_type(measurement_type_loop)=''

spase.numerical_data.temporal_description.time_span.start_date=''

if keyword_set(keyword_stop_date) then spase.numerical_data.temporal_description.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then spase.numerical_data.temporal_description.time_span.relative_stop_date=''

spase.numerical_data.temporal_description.time_span.note=''

spase.numerical_data.temporal_description.cadence=''

spase.numerical_data.temporal_description.cadence_min=''

spase.numerical_data.temporal_description.cadence_max=''

spase.numerical_data.temporal_description.exposure=''

spase.numerical_data.temporal_description.exposure_min=''

spase.numerical_data.temporal_description.exposure_max=''

spase.numerical_data.spectral_range=''

for observed_region_loop=0,14 do spase.numerical_data.observed_region(observed_region_loop)=''

spase.numerical_data.spatial_coverage.coordinate_system.coordinate_representation=''

spase.numerical_data.spatial_coverage.coordinate_system.coordinate_system_name=''

spase.numerical_data.spatial_coverage.center_latitude=''

spase.numerical_data.spatial_coverage.northernmost_latitude=''

spase.numerical_data.spatial_coverage.southernmost_latitude=''

spase.numerical_data.spatial_coverage.center_longitude=''

spase.numerical_data.spatial_coverage.easternmost_longitude=''

spase.numerical_data.spatial_coverage.westernmost_longitude=''

spase.numerical_data.spatial_coverage.center_elevation=''

spase.numerical_data.spatial_coverage.minimum_elevation=''

spase.numerical_data.spatial_coverage.maximum_elevation=''

spase.numerical_data.spatial_coverage.acknowledgement=''

spase.numerical_data.spatial_coverage.description=''

spase.numerical_data.caveats=''

for keyword_loop=0,98 do spase.numerical_data.keyword(keyword_loop)=''

spase.numerical_data.input_resource_id=''

for parameter_loop=0,84 do begin

    spase.numerical_data.parameter(parameter_loop).name=''

    spase.numerical_data.parameter(parameter_loop).set=''

    spase.numerical_data.parameter(parameter_loop).parameter_key=''

    spase.numerical_data.parameter(parameter_loop).description=''

    spase.numerical_data.parameter(parameter_loop).ucd=''

    spase.numerical_data.parameter(parameter_loop).caveats=''

    spase.numerical_data.parameter(parameter_loop).cadence=''

    spase.numerical_data.parameter(parameter_loop).cadence_min=''

    spase.numerical_data.parameter(parameter_loop).cadence_max=''

    spase.numerical_data.parameter(parameter_loop).units=''

    spase.numerical_data.parameter(parameter_loop).units_conversion=''

    spase.numerical_data.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    spase.numerical_data.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    spase.numerical_data.parameter(parameter_loop).rendering_hints.display_type=''

    spase.numerical_data.parameter(parameter_loop).rendering_hints.axis_label=''

    spase.numerical_data.parameter(parameter_loop).rendering_hints.rendering_axis=''

    spase.numerical_data.parameter(parameter_loop).rendering_hints.index=''

    spase.numerical_data.parameter(parameter_loop).rendering_hints.value_format=''

    spase.numerical_data.parameter(parameter_loop).rendering_hints.scale_min=''

    spase.numerical_data.parameter(parameter_loop).rendering_hints.scale_max=''

    spase.numerical_data.parameter(parameter_loop).rendering_hints.scale_type=''

    spase.numerical_data.parameter(parameter_loop).structure.size=''

    spase.numerical_data.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).index=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).units=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        spase.numerical_data.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    spase.numerical_data.parameter(parameter_loop).valid_min=''

    spase.numerical_data.parameter(parameter_loop).valid_max=''

    spase.numerical_data.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do spase.numerical_data.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    spase.numerical_data.parameter(parameter_loop).field.field_quantity=''

    spase.numerical_data.parameter(parameter_loop).field.frequency_range.spectral_range=''

    spase.numerical_data.parameter(parameter_loop).field.frequency_range.low=''

    spase.numerical_data.parameter(parameter_loop).field.frequency_range.high=''

    spase.numerical_data.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_data.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        spase.numerical_data.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        spase.numerical_data.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do spase.numerical_data.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do spase.numerical_data.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    spase.numerical_data.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do spase.numerical_data.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    spase.numerical_data.parameter(parameter_loop).particle.energy_range.low=''

    spase.numerical_data.parameter(parameter_loop).particle.energy_range.high=''

    spase.numerical_data.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_data.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        spase.numerical_data.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        spase.numerical_data.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    spase.numerical_data.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    spase.numerical_data.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    spase.numerical_data.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_data.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        spase.numerical_data.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        spase.numerical_data.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    spase.numerical_data.parameter(parameter_loop).particle.polar_angle_range.low=''

    spase.numerical_data.parameter(parameter_loop).particle.polar_angle_range.high=''

    spase.numerical_data.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_data.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        spase.numerical_data.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        spase.numerical_data.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    spase.numerical_data.parameter(parameter_loop).particle.mass_range.low=''

    spase.numerical_data.parameter(parameter_loop).particle.mass_range.high=''

    spase.numerical_data.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_data.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        spase.numerical_data.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        spase.numerical_data.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    spase.numerical_data.parameter(parameter_loop).particle.pitch_angle_range.low=''

    spase.numerical_data.parameter(parameter_loop).particle.pitch_angle_range.high=''

    spase.numerical_data.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_data.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        spase.numerical_data.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        spase.numerical_data.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    spase.numerical_data.parameter(parameter_loop).particle.chemical_formula=''

    spase.numerical_data.parameter(parameter_loop).particle.population=''

    spase.numerical_data.parameter(parameter_loop).particle.population_mass_number=''

    spase.numerical_data.parameter(parameter_loop).particle.population_charge_state=''

    spase.numerical_data.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do spase.numerical_data.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    spase.numerical_data.parameter(parameter_loop).wave.wave_quantity=''

    spase.numerical_data.parameter(parameter_loop).wave.energy_range.low=''

    spase.numerical_data.parameter(parameter_loop).wave.energy_range.high=''

    spase.numerical_data.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_data.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        spase.numerical_data.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        spase.numerical_data.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    spase.numerical_data.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    spase.numerical_data.parameter(parameter_loop).wave.frequency_range.low=''

    spase.numerical_data.parameter(parameter_loop).wave.frequency_range.high=''

    spase.numerical_data.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_data.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        spase.numerical_data.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        spase.numerical_data.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    spase.numerical_data.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    spase.numerical_data.parameter(parameter_loop).wave.wavelength_range.low=''

    spase.numerical_data.parameter(parameter_loop).wave.wavelength_range.high=''

    spase.numerical_data.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_data.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        spase.numerical_data.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        spase.numerical_data.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    spase.numerical_data.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do spase.numerical_data.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do spase.numerical_data.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do spase.numerical_data.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    spase.numerical_data.parameter(parameter_loop).support.support_quantity=''

endfor

spase.numerical_data.extension=''

spase.granule.resource_id=''

spase.granule.release_date=''

spase.granule.expiration_date=''

spase.granule.parent_id=''

for prior_id_loop=0,8 do spase.granule.prior_id(prior_id_loop)=''

spase.granule.start_date=''

spase.granule.stop_date=''

spase.granule.spatial_coverage.coordinate_system.coordinate_representation=''

spase.granule.spatial_coverage.coordinate_system.coordinate_system_name=''

spase.granule.spatial_coverage.center_latitude=''

spase.granule.spatial_coverage.northernmost_latitude=''

spase.granule.spatial_coverage.southernmost_latitude=''

spase.granule.spatial_coverage.center_longitude=''

spase.granule.spatial_coverage.easternmost_longitude=''

spase.granule.spatial_coverage.westernmost_longitude=''

spase.granule.spatial_coverage.center_elevation=''

spase.granule.spatial_coverage.minimum_elevation=''

spase.granule.spatial_coverage.maximum_elevation=''

spase.granule.spatial_coverage.acknowledgement=''

spase.granule.spatial_coverage.description=''

spase.granule.source.source_type=''

spase.granule.source.url=''

spase.granule.source.mirror_url=''

spase.granule.source.checksum.hash_value=''

spase.granule.source.checksum.hash_function=''

spase.granule.source.data_extent.quantity=''

spase.granule.source.data_extent.units=''

spase.granule.source.data_extent.per=''

spase.granule.region_begin=''

spase.granule.region_end=''

spase.instrument.resource_id=''

spase.instrument.resource_header.resource_name=''

spase.instrument.resource_header.alternate_name=''

spase.instrument.resource_header.doi=''

spase.instrument.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.instrument.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.instrument.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.instrument.resource_header.expiration_date=''

spase.instrument.resource_header.description=''

spase.instrument.resource_header.acknowledgement=''

spase.instrument.resource_header.publication_info.title=''

spase.instrument.resource_header.publication_info.authors=''

spase.instrument.resource_header.publication_info.publication_date=''

spase.instrument.resource_header.publication_info.published_by=''

spase.instrument.resource_header.publication_info.landing_page_url=''

spase.instrument.resource_header.funding.agency=''

spase.instrument.resource_header.funding.project=''

spase.instrument.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.instrument.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.instrument.resource_header.contact(contact_loop).role(role_loop)=''

    spase.instrument.resource_header.contact(contact_loop).start_date=''

    spase.instrument.resource_header.contact(contact_loop).stop_date=''

    spase.instrument.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.instrument.resource_header.information_url(information_url_loop).name=''

    spase.instrument.resource_header.information_url(information_url_loop).url=''

    spase.instrument.resource_header.information_url(information_url_loop).description=''

    spase.instrument.resource_header.information_url(information_url_loop).language=''

endfor

spase.instrument.resource_header.association.association_id=''

spase.instrument.resource_header.association.association_type=''

spase.instrument.resource_header.association.note=''

for prior_id_loop=0,8 do spase.instrument.resource_header.prior_id(prior_id_loop)=''

spase.instrument.instrument_type=''

spase.instrument.instrument_group_id=''

spase.instrument.investigation_name=''

spase.instrument.operating_span.start_date=''

spase.instrument.operating_span.stop_date=''

spase.instrument.operating_span.note=''

spase.instrument.observatory_id=''

spase.instrument.caveats=''

spase.instrument.extension=''

spase.observatory.resource_id=''

spase.observatory.resource_header.resource_name=''

spase.observatory.resource_header.alternate_name=''

spase.observatory.resource_header.doi=''

spase.observatory.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.observatory.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.observatory.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.observatory.resource_header.expiration_date=''

spase.observatory.resource_header.description=''

spase.observatory.resource_header.acknowledgement=''

spase.observatory.resource_header.publication_info.title=''

spase.observatory.resource_header.publication_info.authors=''

spase.observatory.resource_header.publication_info.publication_date=''

spase.observatory.resource_header.publication_info.published_by=''

spase.observatory.resource_header.publication_info.landing_page_url=''

spase.observatory.resource_header.funding.agency=''

spase.observatory.resource_header.funding.project=''

spase.observatory.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.observatory.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.observatory.resource_header.contact(contact_loop).role(role_loop)=''

    spase.observatory.resource_header.contact(contact_loop).start_date=''

    spase.observatory.resource_header.contact(contact_loop).stop_date=''

    spase.observatory.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.observatory.resource_header.information_url(information_url_loop).name=''

    spase.observatory.resource_header.information_url(information_url_loop).url=''

    spase.observatory.resource_header.information_url(information_url_loop).description=''

    spase.observatory.resource_header.information_url(information_url_loop).language=''

endfor

spase.observatory.resource_header.association.association_id=''

spase.observatory.resource_header.association.association_type=''

spase.observatory.resource_header.association.note=''

for prior_id_loop=0,8 do spase.observatory.resource_header.prior_id(prior_id_loop)=''

spase.observatory.observatory_group_id=''

spase.observatory.location.observatory_region=''

spase.observatory.location.coordinate_system_name=''

spase.observatory.location.latitude=''

spase.observatory.location.longitude=''

spase.observatory.location.elevation=''

spase.observatory.operating_span.start_date=''

spase.observatory.operating_span.stop_date=''

spase.observatory.operating_span.note=''

spase.observatory.extension=''

spase.person.resource_id=''

spase.person.release_date=''

spase.person.person_name=''

spase.person.organization_name=''

spase.person.address=''

spase.person.email=''

spase.person.phone_number=''

spase.person.fax_number=''

spase.person.orcidentifier=''

spase.person.note=''

spase.person.extension=''

spase.registry.resource_id=''

spase.registry.resource_header.resource_name=''

spase.registry.resource_header.alternate_name=''

spase.registry.resource_header.doi=''

spase.registry.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.registry.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.registry.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.registry.resource_header.expiration_date=''

spase.registry.resource_header.description=''

spase.registry.resource_header.acknowledgement=''

spase.registry.resource_header.publication_info.title=''

spase.registry.resource_header.publication_info.authors=''

spase.registry.resource_header.publication_info.publication_date=''

spase.registry.resource_header.publication_info.published_by=''

spase.registry.resource_header.publication_info.landing_page_url=''

spase.registry.resource_header.funding.agency=''

spase.registry.resource_header.funding.project=''

spase.registry.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.registry.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.registry.resource_header.contact(contact_loop).role(role_loop)=''

    spase.registry.resource_header.contact(contact_loop).start_date=''

    spase.registry.resource_header.contact(contact_loop).stop_date=''

    spase.registry.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.registry.resource_header.information_url(information_url_loop).name=''

    spase.registry.resource_header.information_url(information_url_loop).url=''

    spase.registry.resource_header.information_url(information_url_loop).description=''

    spase.registry.resource_header.information_url(information_url_loop).language=''

endfor

spase.registry.resource_header.association.association_id=''

spase.registry.resource_header.association.association_type=''

spase.registry.resource_header.association.note=''

for prior_id_loop=0,8 do spase.registry.resource_header.prior_id(prior_id_loop)=''

for access_url_loop=0,4 do begin

    spase.registry.access_url(access_url_loop).name=''

    spase.registry.access_url(access_url_loop).url=''

    spase.registry.access_url(access_url_loop).style=''

    spase.registry.access_url(access_url_loop).product_key=''

    spase.registry.access_url(access_url_loop).description=''

    spase.registry.access_url(access_url_loop).language=''

endfor

spase.registry.extension=''

spase.repository.resource_id=''

spase.repository.resource_header.resource_name=''

spase.repository.resource_header.alternate_name=''

spase.repository.resource_header.doi=''

spase.repository.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.repository.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.repository.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.repository.resource_header.expiration_date=''

spase.repository.resource_header.description=''

spase.repository.resource_header.acknowledgement=''

spase.repository.resource_header.publication_info.title=''

spase.repository.resource_header.publication_info.authors=''

spase.repository.resource_header.publication_info.publication_date=''

spase.repository.resource_header.publication_info.published_by=''

spase.repository.resource_header.publication_info.landing_page_url=''

spase.repository.resource_header.funding.agency=''

spase.repository.resource_header.funding.project=''

spase.repository.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.repository.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.repository.resource_header.contact(contact_loop).role(role_loop)=''

    spase.repository.resource_header.contact(contact_loop).start_date=''

    spase.repository.resource_header.contact(contact_loop).stop_date=''

    spase.repository.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.repository.resource_header.information_url(information_url_loop).name=''

    spase.repository.resource_header.information_url(information_url_loop).url=''

    spase.repository.resource_header.information_url(information_url_loop).description=''

    spase.repository.resource_header.information_url(information_url_loop).language=''

endfor

spase.repository.resource_header.association.association_id=''

spase.repository.resource_header.association.association_type=''

spase.repository.resource_header.association.note=''

for prior_id_loop=0,8 do spase.repository.resource_header.prior_id(prior_id_loop)=''

for access_url_loop=0,4 do begin

    spase.repository.access_url(access_url_loop).name=''

    spase.repository.access_url(access_url_loop).url=''

    spase.repository.access_url(access_url_loop).style=''

    spase.repository.access_url(access_url_loop).product_key=''

    spase.repository.access_url(access_url_loop).description=''

    spase.repository.access_url(access_url_loop).language=''

endfor

spase.repository.extension=''

spase.service.resource_id=''

spase.service.resource_header.resource_name=''

spase.service.resource_header.alternate_name=''

spase.service.resource_header.doi=''

spase.service.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.service.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.service.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.service.resource_header.expiration_date=''

spase.service.resource_header.description=''

spase.service.resource_header.acknowledgement=''

spase.service.resource_header.publication_info.title=''

spase.service.resource_header.publication_info.authors=''

spase.service.resource_header.publication_info.publication_date=''

spase.service.resource_header.publication_info.published_by=''

spase.service.resource_header.publication_info.landing_page_url=''

spase.service.resource_header.funding.agency=''

spase.service.resource_header.funding.project=''

spase.service.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.service.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.service.resource_header.contact(contact_loop).role(role_loop)=''

    spase.service.resource_header.contact(contact_loop).start_date=''

    spase.service.resource_header.contact(contact_loop).stop_date=''

    spase.service.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.service.resource_header.information_url(information_url_loop).name=''

    spase.service.resource_header.information_url(information_url_loop).url=''

    spase.service.resource_header.information_url(information_url_loop).description=''

    spase.service.resource_header.information_url(information_url_loop).language=''

endfor

spase.service.resource_header.association.association_id=''

spase.service.resource_header.association.association_type=''

spase.service.resource_header.association.note=''

for prior_id_loop=0,8 do spase.service.resource_header.prior_id(prior_id_loop)=''

for access_url_loop=0,4 do begin

    spase.service.access_url(access_url_loop).name=''

    spase.service.access_url(access_url_loop).url=''

    spase.service.access_url(access_url_loop).style=''

    spase.service.access_url(access_url_loop).product_key=''

    spase.service.access_url(access_url_loop).description=''

    spase.service.access_url(access_url_loop).language=''

endfor

spase.service.extension=''

spase.annotation.resource_id=''

spase.annotation.resource_header.resource_name=''

spase.annotation.resource_header.alternate_name=''

spase.annotation.resource_header.doi=''

spase.annotation.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.annotation.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.annotation.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.annotation.resource_header.expiration_date=''

spase.annotation.resource_header.description=''

spase.annotation.resource_header.acknowledgement=''

spase.annotation.resource_header.publication_info.title=''

spase.annotation.resource_header.publication_info.authors=''

spase.annotation.resource_header.publication_info.publication_date=''

spase.annotation.resource_header.publication_info.published_by=''

spase.annotation.resource_header.publication_info.landing_page_url=''

spase.annotation.resource_header.funding.agency=''

spase.annotation.resource_header.funding.project=''

spase.annotation.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.annotation.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.annotation.resource_header.contact(contact_loop).role(role_loop)=''

    spase.annotation.resource_header.contact(contact_loop).start_date=''

    spase.annotation.resource_header.contact(contact_loop).stop_date=''

    spase.annotation.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.annotation.resource_header.information_url(information_url_loop).name=''

    spase.annotation.resource_header.information_url(information_url_loop).url=''

    spase.annotation.resource_header.information_url(information_url_loop).description=''

    spase.annotation.resource_header.information_url(information_url_loop).language=''

endfor

spase.annotation.resource_header.association.association_id=''

spase.annotation.resource_header.association.association_type=''

spase.annotation.resource_header.association.note=''

for prior_id_loop=0,8 do spase.annotation.resource_header.prior_id(prior_id_loop)=''

spase.annotation.image_url=''

spase.annotation.annotation_type=''

for phenomenon_type_loop=0,4 do spase.annotation.phenomenon_type(phenomenon_type_loop)=''

spase.annotation.classification_method=''

spase.annotation.confidence_rating=''

spase.annotation.time_span.start_date=''

if keyword_set(keyword_stop_date) then spase.annotation.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then spase.annotation.time_span.relative_stop_date=''

spase.annotation.time_span.note=''

for observed_region_loop=0,14 do spase.annotation.observation_extent.observed_region(observed_region_loop)=''

spase.annotation.observation_extent.start_location=''

spase.annotation.observation_extent.stop_location=''

spase.annotation.observation_extent.note=''

spase.annotation.extension=''

spase.document.resource_id=''

spase.document.resource_header.resource_name=''

spase.document.resource_header.alternate_name=''

spase.document.resource_header.doi=''

spase.document.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.document.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.document.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.document.resource_header.expiration_date=''

spase.document.resource_header.description=''

spase.document.resource_header.acknowledgement=''

spase.document.resource_header.publication_info.title=''

spase.document.resource_header.publication_info.authors=''

spase.document.resource_header.publication_info.publication_date=''

spase.document.resource_header.publication_info.published_by=''

spase.document.resource_header.publication_info.landing_page_url=''

spase.document.resource_header.funding.agency=''

spase.document.resource_header.funding.project=''

spase.document.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.document.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.document.resource_header.contact(contact_loop).role(role_loop)=''

    spase.document.resource_header.contact(contact_loop).start_date=''

    spase.document.resource_header.contact(contact_loop).stop_date=''

    spase.document.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.document.resource_header.information_url(information_url_loop).name=''

    spase.document.resource_header.information_url(information_url_loop).url=''

    spase.document.resource_header.information_url(information_url_loop).description=''

    spase.document.resource_header.information_url(information_url_loop).language=''

endfor

spase.document.resource_header.association.association_id=''

spase.document.resource_header.association.association_type=''

spase.document.resource_header.association.note=''

for prior_id_loop=0,8 do spase.document.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    spase.document.access_information(access_information_loop).repository_id=''

    spase.document.access_information(access_information_loop).availability=''

    spase.document.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        spase.document.access_information(access_information_loop).access_url(access_url_loop).name=''

        spase.document.access_information(access_information_loop).access_url(access_url_loop).url=''

        spase.document.access_information(access_information_loop).access_url(access_url_loop).style=''

        spase.document.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        spase.document.access_information(access_information_loop).access_url(access_url_loop).description=''

        spase.document.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    spase.document.access_information(access_information_loop).format=''

    spase.document.access_information(access_information_loop).encoding=''

    spase.document.access_information(access_information_loop).access_directory_template=''

    spase.document.access_information(access_information_loop).access_filename_template=''

    spase.document.access_information(access_information_loop).data_extent.quantity=''

    spase.document.access_information(access_information_loop).data_extent.units=''

    spase.document.access_information(access_information_loop).data_extent.per=''

    spase.document.access_information(access_information_loop).acknowledgement=''

endfor

for keyword_loop=0,98 do spase.document.keyword(keyword_loop)=''

spase.document.document_type=''

spase.document.mimetype=''

spase.document.input_resource_id=''

spase.software.resource_id=''

spase.software.resource_header.resource_name=''

spase.software.resource_header.alternate_name=''

spase.software.resource_header.doi=''

spase.software.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.software.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.software.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.software.resource_header.expiration_date=''

spase.software.resource_header.description=''

spase.software.resource_header.acknowledgement=''

spase.software.resource_header.publication_info.title=''

spase.software.resource_header.publication_info.authors=''

spase.software.resource_header.publication_info.publication_date=''

spase.software.resource_header.publication_info.published_by=''

spase.software.resource_header.publication_info.landing_page_url=''

spase.software.resource_header.funding.agency=''

spase.software.resource_header.funding.project=''

spase.software.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.software.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.software.resource_header.contact(contact_loop).role(role_loop)=''

    spase.software.resource_header.contact(contact_loop).start_date=''

    spase.software.resource_header.contact(contact_loop).stop_date=''

    spase.software.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.software.resource_header.information_url(information_url_loop).name=''

    spase.software.resource_header.information_url(information_url_loop).url=''

    spase.software.resource_header.information_url(information_url_loop).description=''

    spase.software.resource_header.information_url(information_url_loop).language=''

endfor

spase.software.resource_header.association.association_id=''

spase.software.resource_header.association.association_type=''

spase.software.resource_header.association.note=''

for prior_id_loop=0,8 do spase.software.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    spase.software.access_information(access_information_loop).repository_id=''

    spase.software.access_information(access_information_loop).availability=''

    spase.software.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        spase.software.access_information(access_information_loop).access_url(access_url_loop).name=''

        spase.software.access_information(access_information_loop).access_url(access_url_loop).url=''

        spase.software.access_information(access_information_loop).access_url(access_url_loop).style=''

        spase.software.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        spase.software.access_information(access_information_loop).access_url(access_url_loop).description=''

        spase.software.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    spase.software.access_information(access_information_loop).format=''

    spase.software.access_information(access_information_loop).encoding=''

    spase.software.access_information(access_information_loop).access_directory_template=''

    spase.software.access_information(access_information_loop).access_filename_template=''

    spase.software.access_information(access_information_loop).data_extent.quantity=''

    spase.software.access_information(access_information_loop).data_extent.units=''

    spase.software.access_information(access_information_loop).data_extent.per=''

    spase.software.access_information(access_information_loop).acknowledgement=''

endfor

spase.software.software_version=''

spase.software.application_interface=''

spase.software.code_language=''

spase.software.prerequisites=''

spase.software.execution_environment.operating_system=''

spase.software.execution_environment.installer.availability=''

spase.software.execution_environment.installer.access_rights=''

spase.software.execution_environment.installer.acknowledgement=''

spase.software.execution_environment.installer.url=''

spase.software.execution_environment.cores=''

spase.software.execution_environment.storage=''

spase.software.execution_environment.memory=''

if keyword_set(keyword_input_property) then begin

   spase.software.input_property.name=''

   spase.software.input_property.description=''

   spase.software.input_property.caveats=''

   spase.software.input_property.units=''

   spase.software.input_property.valid_min=''

   spase.software.input_property.valid_max=''

endif

if keyword_set(keyword_output_property) then begin

   spase.software.output_property.name=''

   spase.software.output_property.description=''

   spase.software.output_property.caveats=''

   spase.software.output_property.units=''

   spase.software.output_property.valid_min=''

   spase.software.output_property.valid_max=''

endif

spase.collection.resource_id=''

spase.collection.resource_header.resource_name=''

spase.collection.resource_header.alternate_name=''

spase.collection.resource_header.doi=''

spase.collection.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.collection.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.collection.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.collection.resource_header.expiration_date=''

spase.collection.resource_header.description=''

spase.collection.resource_header.acknowledgement=''

spase.collection.resource_header.publication_info.title=''

spase.collection.resource_header.publication_info.authors=''

spase.collection.resource_header.publication_info.publication_date=''

spase.collection.resource_header.publication_info.published_by=''

spase.collection.resource_header.publication_info.landing_page_url=''

spase.collection.resource_header.funding.agency=''

spase.collection.resource_header.funding.project=''

spase.collection.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.collection.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.collection.resource_header.contact(contact_loop).role(role_loop)=''

    spase.collection.resource_header.contact(contact_loop).start_date=''

    spase.collection.resource_header.contact(contact_loop).stop_date=''

    spase.collection.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.collection.resource_header.information_url(information_url_loop).name=''

    spase.collection.resource_header.information_url(information_url_loop).url=''

    spase.collection.resource_header.information_url(information_url_loop).description=''

    spase.collection.resource_header.information_url(information_url_loop).language=''

endfor

spase.collection.resource_header.association.association_id=''

spase.collection.resource_header.association.association_type=''

spase.collection.resource_header.association.note=''

for prior_id_loop=0,8 do spase.collection.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    spase.collection.access_information(access_information_loop).repository_id=''

    spase.collection.access_information(access_information_loop).availability=''

    spase.collection.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        spase.collection.access_information(access_information_loop).access_url(access_url_loop).name=''

        spase.collection.access_information(access_information_loop).access_url(access_url_loop).url=''

        spase.collection.access_information(access_information_loop).access_url(access_url_loop).style=''

        spase.collection.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        spase.collection.access_information(access_information_loop).access_url(access_url_loop).description=''

        spase.collection.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    spase.collection.access_information(access_information_loop).format=''

    spase.collection.access_information(access_information_loop).encoding=''

    spase.collection.access_information(access_information_loop).access_directory_template=''

    spase.collection.access_information(access_information_loop).access_filename_template=''

    spase.collection.access_information(access_information_loop).data_extent.quantity=''

    spase.collection.access_information(access_information_loop).data_extent.units=''

    spase.collection.access_information(access_information_loop).data_extent.per=''

    spase.collection.access_information(access_information_loop).acknowledgement=''

endfor

spase.collection.member.resource_name=''

spase.collection.member.description=''

spase.collection.member.member_id=''

spase.collection.member.start_date=''

spase.collection.member.stop_date=''

spase.collection.member.spatial_coverage.coordinate_system.coordinate_representation=''

spase.collection.member.spatial_coverage.coordinate_system.coordinate_system_name=''

spase.collection.member.spatial_coverage.center_latitude=''

spase.collection.member.spatial_coverage.northernmost_latitude=''

spase.collection.member.spatial_coverage.southernmost_latitude=''

spase.collection.member.spatial_coverage.center_longitude=''

spase.collection.member.spatial_coverage.easternmost_longitude=''

spase.collection.member.spatial_coverage.westernmost_longitude=''

spase.collection.member.spatial_coverage.center_elevation=''

spase.collection.member.spatial_coverage.minimum_elevation=''

spase.collection.member.spatial_coverage.maximum_elevation=''

spase.collection.member.spatial_coverage.acknowledgement=''

spase.collection.member.spatial_coverage.description=''

spase.collection.extension=''

spase.model.resource_id=''

spase.model.resource_header.resource_name=''

spase.model.resource_header.alternate_name=''

spase.model.resource_header.doi=''

spase.model.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.model.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.model.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.model.resource_header.expiration_date=''

spase.model.resource_header.description=''

spase.model.resource_header.acknowledgement=''

spase.model.resource_header.publication_info.title=''

spase.model.resource_header.publication_info.authors=''

spase.model.resource_header.publication_info.publication_date=''

spase.model.resource_header.publication_info.published_by=''

spase.model.resource_header.publication_info.landing_page_url=''

spase.model.resource_header.funding.agency=''

spase.model.resource_header.funding.project=''

spase.model.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.model.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.model.resource_header.contact(contact_loop).role(role_loop)=''

    spase.model.resource_header.contact(contact_loop).start_date=''

    spase.model.resource_header.contact(contact_loop).stop_date=''

    spase.model.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.model.resource_header.information_url(information_url_loop).name=''

    spase.model.resource_header.information_url(information_url_loop).url=''

    spase.model.resource_header.information_url(information_url_loop).description=''

    spase.model.resource_header.information_url(information_url_loop).language=''

endfor

spase.model.resource_header.association.association_id=''

spase.model.resource_header.association.association_type=''

spase.model.resource_header.association.note=''

for prior_id_loop=0,8 do spase.model.resource_header.prior_id(prior_id_loop)=''

spase.model.access_information_optional.repository_id=''

spase.model.access_information_optional.availability=''

spase.model.access_information_optional.access_rights=''

for access_url_loop=0,4 do begin

    spase.model.access_information_optional.access_url(access_url_loop).name=''

    spase.model.access_information_optional.access_url(access_url_loop).url=''

    spase.model.access_information_optional.access_url(access_url_loop).style=''

    spase.model.access_information_optional.access_url(access_url_loop).product_key=''

    spase.model.access_information_optional.access_url(access_url_loop).description=''

    spase.model.access_information_optional.access_url(access_url_loop).language=''

endfor

spase.model.access_information_optional.format=''

spase.model.access_information_optional.encoding=''

spase.model.access_information_optional.access_directory_template=''

spase.model.access_information_optional.access_filename_template=''

spase.model.access_information_optional.data_extent.quantity=''

spase.model.access_information_optional.data_extent.units=''

spase.model.access_information_optional.data_extent.per=''

spase.model.access_information_optional.acknowledgement=''

spase.model.versions.model_version.version_tag=''

spase.model.versions.model_version.release_date=''

spase.model.versions.model_version.description=''

spase.model.versions.model_version.caveats=''

spase.model.model_type=''

spase.model.code_language=''

spase.model.temporal_dependence=''

spase.model.spatial_description.dimension=''

spase.model.spatial_description.coordinate_system.coordinate_representation=''

spase.model.spatial_description.coordinate_system.coordinate_system_name=''

spase.model.spatial_description.units=''

spase.model.spatial_description.units_conversion=''

spase.model.spatial_description.coordinates_label=''

if keyword_set(keyword_cuts_description) then spase.model.spatial_description.cuts_description=''

if keyword_set(keyword_cubes_description) then spase.model.spatial_description.cubes_description=''

if keyword_set(keyword_plane_normal_vector) then spase.model.spatial_description.plane_normal_vector=''

if keyword_set(keyword_plane_point) then spase.model.spatial_description.plane_point=''

if keyword_set(keyword_region_begin) then spase.model.spatial_description.region_begin=''

if keyword_set(keyword_region_end) then spase.model.spatial_description.region_end=''

spase.model.spatial_description.step=''

spase.model.modeled_region=''

spase.model.input_properties.property.name=''

spase.model.input_properties.property.description=''

spase.model.input_properties.property.caveats=''

spase.model.input_properties.property.property_quantity=''

for qualifier_loop=0,4 do spase.model.input_properties.property.qualifier(qualifier_loop)=''

spase.model.input_properties.property.units=''

spase.model.input_properties.property.units_conversion=''

spase.model.input_properties.property.property_label=''

spase.model.input_properties.property.property_value=''

spase.model.input_properties.property.property_table_url=''

spase.model.input_properties.property.valid_min=''

spase.model.input_properties.property.valid_max=''

spase.model.input_properties.property.property_model=''

spase.model.input_properties.property.model_url=''

for parameter_loop=0,84 do begin

    spase.model.output_parameters.parameter(parameter_loop).name=''

    spase.model.output_parameters.parameter(parameter_loop).set=''

    spase.model.output_parameters.parameter(parameter_loop).parameter_key=''

    spase.model.output_parameters.parameter(parameter_loop).description=''

    spase.model.output_parameters.parameter(parameter_loop).ucd=''

    spase.model.output_parameters.parameter(parameter_loop).caveats=''

    spase.model.output_parameters.parameter(parameter_loop).cadence=''

    spase.model.output_parameters.parameter(parameter_loop).cadence_min=''

    spase.model.output_parameters.parameter(parameter_loop).cadence_max=''

    spase.model.output_parameters.parameter(parameter_loop).units=''

    spase.model.output_parameters.parameter(parameter_loop).units_conversion=''

    spase.model.output_parameters.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    spase.model.output_parameters.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    spase.model.output_parameters.parameter(parameter_loop).rendering_hints.display_type=''

    spase.model.output_parameters.parameter(parameter_loop).rendering_hints.axis_label=''

    spase.model.output_parameters.parameter(parameter_loop).rendering_hints.rendering_axis=''

    spase.model.output_parameters.parameter(parameter_loop).rendering_hints.index=''

    spase.model.output_parameters.parameter(parameter_loop).rendering_hints.value_format=''

    spase.model.output_parameters.parameter(parameter_loop).rendering_hints.scale_min=''

    spase.model.output_parameters.parameter(parameter_loop).rendering_hints.scale_max=''

    spase.model.output_parameters.parameter(parameter_loop).rendering_hints.scale_type=''

    spase.model.output_parameters.parameter(parameter_loop).structure.size=''

    spase.model.output_parameters.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).index=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).units=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        spase.model.output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    spase.model.output_parameters.parameter(parameter_loop).valid_min=''

    spase.model.output_parameters.parameter(parameter_loop).valid_max=''

    spase.model.output_parameters.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do spase.model.output_parameters.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    spase.model.output_parameters.parameter(parameter_loop).field.field_quantity=''

    spase.model.output_parameters.parameter(parameter_loop).field.frequency_range.spectral_range=''

    spase.model.output_parameters.parameter(parameter_loop).field.frequency_range.low=''

    spase.model.output_parameters.parameter(parameter_loop).field.frequency_range.high=''

    spase.model.output_parameters.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        spase.model.output_parameters.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        spase.model.output_parameters.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        spase.model.output_parameters.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do spase.model.output_parameters.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do spase.model.output_parameters.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    spase.model.output_parameters.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do spase.model.output_parameters.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    spase.model.output_parameters.parameter(parameter_loop).particle.energy_range.low=''

    spase.model.output_parameters.parameter(parameter_loop).particle.energy_range.high=''

    spase.model.output_parameters.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        spase.model.output_parameters.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        spase.model.output_parameters.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        spase.model.output_parameters.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    spase.model.output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    spase.model.output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    spase.model.output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.model.output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        spase.model.output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        spase.model.output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    spase.model.output_parameters.parameter(parameter_loop).particle.polar_angle_range.low=''

    spase.model.output_parameters.parameter(parameter_loop).particle.polar_angle_range.high=''

    spase.model.output_parameters.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.model.output_parameters.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        spase.model.output_parameters.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        spase.model.output_parameters.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    spase.model.output_parameters.parameter(parameter_loop).particle.mass_range.low=''

    spase.model.output_parameters.parameter(parameter_loop).particle.mass_range.high=''

    spase.model.output_parameters.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        spase.model.output_parameters.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        spase.model.output_parameters.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        spase.model.output_parameters.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    spase.model.output_parameters.parameter(parameter_loop).particle.pitch_angle_range.low=''

    spase.model.output_parameters.parameter(parameter_loop).particle.pitch_angle_range.high=''

    spase.model.output_parameters.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.model.output_parameters.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        spase.model.output_parameters.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        spase.model.output_parameters.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    spase.model.output_parameters.parameter(parameter_loop).particle.chemical_formula=''

    spase.model.output_parameters.parameter(parameter_loop).particle.population=''

    spase.model.output_parameters.parameter(parameter_loop).particle.population_mass_number=''

    spase.model.output_parameters.parameter(parameter_loop).particle.population_charge_state=''

    spase.model.output_parameters.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do spase.model.output_parameters.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    spase.model.output_parameters.parameter(parameter_loop).wave.wave_quantity=''

    spase.model.output_parameters.parameter(parameter_loop).wave.energy_range.low=''

    spase.model.output_parameters.parameter(parameter_loop).wave.energy_range.high=''

    spase.model.output_parameters.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        spase.model.output_parameters.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        spase.model.output_parameters.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        spase.model.output_parameters.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    spase.model.output_parameters.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    spase.model.output_parameters.parameter(parameter_loop).wave.frequency_range.low=''

    spase.model.output_parameters.parameter(parameter_loop).wave.frequency_range.high=''

    spase.model.output_parameters.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        spase.model.output_parameters.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        spase.model.output_parameters.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        spase.model.output_parameters.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    spase.model.output_parameters.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    spase.model.output_parameters.parameter(parameter_loop).wave.wavelength_range.low=''

    spase.model.output_parameters.parameter(parameter_loop).wave.wavelength_range.high=''

    spase.model.output_parameters.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        spase.model.output_parameters.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        spase.model.output_parameters.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        spase.model.output_parameters.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    spase.model.output_parameters.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do spase.model.output_parameters.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do spase.model.output_parameters.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do spase.model.output_parameters.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    spase.model.output_parameters.parameter(parameter_loop).support.support_quantity=''

endfor

spase.model.model_url=''

spase.model_run.resource_id=''

spase.model_run.resource_header.resource_name=''

spase.model_run.resource_header.alternate_name=''

spase.model_run.resource_header.doi=''

spase.model_run.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.model_run.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.model_run.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.model_run.resource_header.expiration_date=''

spase.model_run.resource_header.description=''

spase.model_run.resource_header.acknowledgement=''

spase.model_run.resource_header.publication_info.title=''

spase.model_run.resource_header.publication_info.authors=''

spase.model_run.resource_header.publication_info.publication_date=''

spase.model_run.resource_header.publication_info.published_by=''

spase.model_run.resource_header.publication_info.landing_page_url=''

spase.model_run.resource_header.funding.agency=''

spase.model_run.resource_header.funding.project=''

spase.model_run.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.model_run.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.model_run.resource_header.contact(contact_loop).role(role_loop)=''

    spase.model_run.resource_header.contact(contact_loop).start_date=''

    spase.model_run.resource_header.contact(contact_loop).stop_date=''

    spase.model_run.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.model_run.resource_header.information_url(information_url_loop).name=''

    spase.model_run.resource_header.information_url(information_url_loop).url=''

    spase.model_run.resource_header.information_url(information_url_loop).description=''

    spase.model_run.resource_header.information_url(information_url_loop).language=''

endfor

spase.model_run.resource_header.association.association_id=''

spase.model_run.resource_header.association.association_type=''

spase.model_run.resource_header.association.note=''

for prior_id_loop=0,8 do spase.model_run.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    spase.model_run.access_information(access_information_loop).repository_id=''

    spase.model_run.access_information(access_information_loop).availability=''

    spase.model_run.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        spase.model_run.access_information(access_information_loop).access_url(access_url_loop).name=''

        spase.model_run.access_information(access_information_loop).access_url(access_url_loop).url=''

        spase.model_run.access_information(access_information_loop).access_url(access_url_loop).style=''

        spase.model_run.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        spase.model_run.access_information(access_information_loop).access_url(access_url_loop).description=''

        spase.model_run.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    spase.model_run.access_information(access_information_loop).format=''

    spase.model_run.access_information(access_information_loop).encoding=''

    spase.model_run.access_information(access_information_loop).access_directory_template=''

    spase.model_run.access_information(access_information_loop).access_filename_template=''

    spase.model_run.access_information(access_information_loop).data_extent.quantity=''

    spase.model_run.access_information(access_information_loop).data_extent.units=''

    spase.model_run.access_information(access_information_loop).data_extent.per=''

    spase.model_run.access_information(access_information_loop).acknowledgement=''

endfor

spase.model_run.provider_resource_name=''

spase.model_run.provider_processing_level=''

spase.model_run.provider_version=''

spase.model_run.model_specification.model_id=''

spase.model_run.model_specification.version_tag=''

spase.model_run.temporal_dependence=''

spase.model_run.modeled_region=''

spase.model_run.likelihood_rating=''

spase.model_run.caveats=''

for keyword_loop=0,98 do spase.model_run.keyword(keyword_loop)=''

spase.model_run.input_resource_id=''

spase.model_run.model_time.description=''

spase.model_run.model_time.caveats=''

spase.model_run.model_time.duration=''

spase.model_run.model_time.time_start=''

spase.model_run.model_time.time_stop=''

spase.model_run.model_time.time_step=''

spase.model_run.model_time.diagnosis_time_step.time_start=''

spase.model_run.model_time.diagnosis_time_step.duration=''

spase.model_run.model_time.diagnosis_time_step.saved_quantity=''

spase.model_run.model_domain.coordinate_system.coordinate_representation=''

spase.model_run.model_domain.coordinate_system.coordinate_system_name=''

spase.model_run.model_domain.description=''

spase.model_run.model_domain.caveats=''

spase.model_run.model_domain.spatial_dimension=''

spase.model_run.model_domain.velocity_dimension=''

spase.model_run.model_domain.field_dimension=''

spase.model_run.model_domain.units=''

spase.model_run.model_domain.units_conversion=''

spase.model_run.model_domain.coordinates_label=''

spase.model_run.model_domain.valid_min=''

spase.model_run.model_domain.valid_max=''

spase.model_run.model_domain.grid_structure=''

spase.model_run.model_domain.grid_cell_size=''

spase.model_run.model_domain.symmetry=''

spase.model_run.model_domain.boundary_conditions.particle_boundary=''

spase.model_run.model_domain.boundary_conditions.field_boundary=''

if keyword_set(keyword_region_parameter) then begin

   spase.model_run.region_parameter.modeled_region=''

   spase.model_run.region_parameter.description=''

   spase.model_run.region_parameter.caveats=''

   spase.model_run.region_parameter.radius=''

   spase.model_run.region_parameter.sub_longitude=''

   spase.model_run.region_parameter.period=''

   spase.model_run.region_parameter.object_mass=''

   spase.model_run.region_parameter.input_table_url=''

   spase.model_run.region_parameter.property.name=''

   spase.model_run.region_parameter.property.description=''

   spase.model_run.region_parameter.property.caveats=''

   spase.model_run.region_parameter.property.property_quantity=''

   for qualifier_loop=0,4 do spase.model_run.region_parameter.property.qualifier(qualifier_loop)=''

   spase.model_run.region_parameter.property.units=''

   spase.model_run.region_parameter.property.units_conversion=''

   spase.model_run.region_parameter.property.property_label=''

   spase.model_run.region_parameter.property.property_value=''

   spase.model_run.region_parameter.property.property_table_url=''

   spase.model_run.region_parameter.property.valid_min=''

   spase.model_run.region_parameter.property.valid_max=''

   spase.model_run.region_parameter.property.property_model=''

   spase.model_run.region_parameter.property.model_url=''

endif

if keyword_set(keyword_input_parameter) then begin

   spase.model_run.input_parameter.name=''

   spase.model_run.input_parameter.description=''

   spase.model_run.input_parameter.caveats=''

   spase.model_run.input_parameter.modeled_region=''

   for qualifier_loop=0,4 do spase.model_run.input_parameter.qualifier(qualifier_loop)=''

   spase.model_run.input_parameter.input_table_url=''

   spase.model_run.input_parameter.parameter_quantity=''

   spase.model_run.input_parameter.property.name=''

   spase.model_run.input_parameter.property.description=''

   spase.model_run.input_parameter.property.caveats=''

   spase.model_run.input_parameter.property.property_quantity=''

   for qualifier_loop=0,4 do spase.model_run.input_parameter.property.qualifier(qualifier_loop)=''

   spase.model_run.input_parameter.property.units=''

   spase.model_run.input_parameter.property.units_conversion=''

   spase.model_run.input_parameter.property.property_label=''

   spase.model_run.input_parameter.property.property_value=''

   spase.model_run.input_parameter.property.property_table_url=''

   spase.model_run.input_parameter.property.valid_min=''

   spase.model_run.input_parameter.property.valid_max=''

   spase.model_run.input_parameter.property.property_model=''

   spase.model_run.input_parameter.property.model_url=''

endif

if keyword_set(keyword_input_population) then begin

   spase.model_run.input_population.name=''

   spase.model_run.input_population.set=''

   spase.model_run.input_population.parameter_key=''

   spase.model_run.input_population.description=''

   spase.model_run.input_population.caveats=''

   spase.model_run.input_population.modeled_region=''

   for qualifier_loop=0,4 do spase.model_run.input_population.qualifier(qualifier_loop)=''

   for particle_type_loop=0,4 do spase.model_run.input_population.particle_type(particle_type_loop)=''

   spase.model_run.input_population.chemical_formula=''

   for atomic_number_loop=0,4 do spase.model_run.input_population.atomic_number(atomic_number_loop)=''

   spase.model_run.input_population.population_mass_number=''

   spase.model_run.input_population.population_charge_state=''

   spase.model_run.input_population.population_density=''

   spase.model_run.input_population.population_temperature=''

   spase.model_run.input_population.population_flow_speed=''

   spase.model_run.input_population.distribution=''

   spase.model_run.input_population.production_rate=''

   spase.model_run.input_population.total_production_rate=''

   spase.model_run.input_population.input_table_url=''

   spase.model_run.input_population.density_profile=''

   spase.model_run.input_population.model_url=''

endif

if keyword_set(keyword_input_field) then begin

   spase.model_run.input_field.name=''

   spase.model_run.input_field.set=''

   spase.model_run.input_field.parameter_key=''

   spase.model_run.input_field.description=''

   spase.model_run.input_field.caveats=''

   spase.model_run.input_field.modeled_region=''

   spase.model_run.input_field.coordinate_system.coordinate_representation=''

   spase.model_run.input_field.coordinate_system.coordinate_system_name=''

   for qualifier_loop=0,4 do spase.model_run.input_field.qualifier(qualifier_loop)=''

   spase.model_run.input_field.field_quantity=''

   spase.model_run.input_field.units=''

   spase.model_run.input_field.units_conversion=''

   spase.model_run.input_field.input_label=''

   spase.model_run.input_field.field_value=''

   spase.model_run.input_field.input_table_url=''

   spase.model_run.input_field.valid_min=''

   spase.model_run.input_field.valid_max=''

   spase.model_run.input_field.field_model=''

   spase.model_run.input_field.model_url=''

endif

if keyword_set(keyword_input_process) then begin

   spase.model_run.input_process.name=''

   spase.model_run.input_process.set=''

   spase.model_run.input_process.parameter_key=''

   spase.model_run.input_process.description=''

   spase.model_run.input_process.caveats=''

   spase.model_run.input_process.modeled_region=''

   spase.model_run.input_process.process_type=''

   spase.model_run.input_process.units=''

   spase.model_run.input_process.units_conversion=''

   spase.model_run.input_process.process_coefficient=''

   spase.model_run.input_process.process_coeff_type=''

   spase.model_run.input_process.process_model=''

   spase.model_run.input_process.model_url=''

endif

spase.model_run.extension=''

spase.display_output.resource_id=''

spase.display_output.resource_header.resource_name=''

spase.display_output.resource_header.alternate_name=''

spase.display_output.resource_header.doi=''

spase.display_output.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.display_output.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.display_output.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.display_output.resource_header.expiration_date=''

spase.display_output.resource_header.description=''

spase.display_output.resource_header.acknowledgement=''

spase.display_output.resource_header.publication_info.title=''

spase.display_output.resource_header.publication_info.authors=''

spase.display_output.resource_header.publication_info.publication_date=''

spase.display_output.resource_header.publication_info.published_by=''

spase.display_output.resource_header.publication_info.landing_page_url=''

spase.display_output.resource_header.funding.agency=''

spase.display_output.resource_header.funding.project=''

spase.display_output.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.display_output.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.display_output.resource_header.contact(contact_loop).role(role_loop)=''

    spase.display_output.resource_header.contact(contact_loop).start_date=''

    spase.display_output.resource_header.contact(contact_loop).stop_date=''

    spase.display_output.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.display_output.resource_header.information_url(information_url_loop).name=''

    spase.display_output.resource_header.information_url(information_url_loop).url=''

    spase.display_output.resource_header.information_url(information_url_loop).description=''

    spase.display_output.resource_header.information_url(information_url_loop).language=''

endfor

spase.display_output.resource_header.association.association_id=''

spase.display_output.resource_header.association.association_type=''

spase.display_output.resource_header.association.note=''

for prior_id_loop=0,8 do spase.display_output.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    spase.display_output.access_information(access_information_loop).repository_id=''

    spase.display_output.access_information(access_information_loop).availability=''

    spase.display_output.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        spase.display_output.access_information(access_information_loop).access_url(access_url_loop).name=''

        spase.display_output.access_information(access_information_loop).access_url(access_url_loop).url=''

        spase.display_output.access_information(access_information_loop).access_url(access_url_loop).style=''

        spase.display_output.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        spase.display_output.access_information(access_information_loop).access_url(access_url_loop).description=''

        spase.display_output.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    spase.display_output.access_information(access_information_loop).format=''

    spase.display_output.access_information(access_information_loop).encoding=''

    spase.display_output.access_information(access_information_loop).access_directory_template=''

    spase.display_output.access_information(access_information_loop).access_filename_template=''

    spase.display_output.access_information(access_information_loop).data_extent.quantity=''

    spase.display_output.access_information(access_information_loop).data_extent.units=''

    spase.display_output.access_information(access_information_loop).data_extent.per=''

    spase.display_output.access_information(access_information_loop).acknowledgement=''

endfor

spase.display_output.processing_level=''

spase.display_output.provider_resource_name=''

spase.display_output.provider_processing_level=''

spase.display_output.provider_version=''

spase.display_output.modeled_instrument_id=''

for measurement_type_loop=0,4 do spase.display_output.measurement_type(measurement_type_loop)=''

spase.display_output.temporal_description.time_span.start_date=''

if keyword_set(keyword_stop_date) then spase.display_output.temporal_description.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then spase.display_output.temporal_description.time_span.relative_stop_date=''

spase.display_output.temporal_description.time_span.note=''

spase.display_output.temporal_description.cadence=''

spase.display_output.temporal_description.cadence_min=''

spase.display_output.temporal_description.cadence_max=''

spase.display_output.temporal_description.exposure=''

spase.display_output.temporal_description.exposure_min=''

spase.display_output.temporal_description.exposure_max=''

spase.display_output.spatial_description.dimension=''

spase.display_output.spatial_description.coordinate_system.coordinate_representation=''

spase.display_output.spatial_description.coordinate_system.coordinate_system_name=''

spase.display_output.spatial_description.units=''

spase.display_output.spatial_description.units_conversion=''

spase.display_output.spatial_description.coordinates_label=''

if keyword_set(keyword_cuts_description) then spase.display_output.spatial_description.cuts_description=''

if keyword_set(keyword_cubes_description) then spase.display_output.spatial_description.cubes_description=''

if keyword_set(keyword_plane_normal_vector) then spase.display_output.spatial_description.plane_normal_vector=''

if keyword_set(keyword_plane_point) then spase.display_output.spatial_description.plane_point=''

if keyword_set(keyword_region_begin) then spase.display_output.spatial_description.region_begin=''

if keyword_set(keyword_region_end) then spase.display_output.spatial_description.region_end=''

spase.display_output.spatial_description.step=''

spase.display_output.spectral_range=''

spase.display_output.display_cadence=''

spase.display_output.modeled_region=''

spase.display_output.caveats=''

for keyword_loop=0,98 do spase.display_output.keyword(keyword_loop)=''

spase.display_output.input_resource_id=''

for parameter_loop=0,84 do begin

    spase.display_output.parameter(parameter_loop).name=''

    spase.display_output.parameter(parameter_loop).set=''

    spase.display_output.parameter(parameter_loop).parameter_key=''

    spase.display_output.parameter(parameter_loop).description=''

    spase.display_output.parameter(parameter_loop).ucd=''

    spase.display_output.parameter(parameter_loop).caveats=''

    spase.display_output.parameter(parameter_loop).cadence=''

    spase.display_output.parameter(parameter_loop).cadence_min=''

    spase.display_output.parameter(parameter_loop).cadence_max=''

    spase.display_output.parameter(parameter_loop).units=''

    spase.display_output.parameter(parameter_loop).units_conversion=''

    spase.display_output.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    spase.display_output.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    spase.display_output.parameter(parameter_loop).rendering_hints.display_type=''

    spase.display_output.parameter(parameter_loop).rendering_hints.axis_label=''

    spase.display_output.parameter(parameter_loop).rendering_hints.rendering_axis=''

    spase.display_output.parameter(parameter_loop).rendering_hints.index=''

    spase.display_output.parameter(parameter_loop).rendering_hints.value_format=''

    spase.display_output.parameter(parameter_loop).rendering_hints.scale_min=''

    spase.display_output.parameter(parameter_loop).rendering_hints.scale_max=''

    spase.display_output.parameter(parameter_loop).rendering_hints.scale_type=''

    spase.display_output.parameter(parameter_loop).structure.size=''

    spase.display_output.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do spase.display_output.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).index=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).units=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        spase.display_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    spase.display_output.parameter(parameter_loop).valid_min=''

    spase.display_output.parameter(parameter_loop).valid_max=''

    spase.display_output.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do spase.display_output.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    spase.display_output.parameter(parameter_loop).field.field_quantity=''

    spase.display_output.parameter(parameter_loop).field.frequency_range.spectral_range=''

    spase.display_output.parameter(parameter_loop).field.frequency_range.low=''

    spase.display_output.parameter(parameter_loop).field.frequency_range.high=''

    spase.display_output.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        spase.display_output.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        spase.display_output.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        spase.display_output.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do spase.display_output.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do spase.display_output.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    spase.display_output.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do spase.display_output.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    spase.display_output.parameter(parameter_loop).particle.energy_range.low=''

    spase.display_output.parameter(parameter_loop).particle.energy_range.high=''

    spase.display_output.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        spase.display_output.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        spase.display_output.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        spase.display_output.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    spase.display_output.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    spase.display_output.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    spase.display_output.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.display_output.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        spase.display_output.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        spase.display_output.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    spase.display_output.parameter(parameter_loop).particle.polar_angle_range.low=''

    spase.display_output.parameter(parameter_loop).particle.polar_angle_range.high=''

    spase.display_output.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.display_output.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        spase.display_output.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        spase.display_output.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    spase.display_output.parameter(parameter_loop).particle.mass_range.low=''

    spase.display_output.parameter(parameter_loop).particle.mass_range.high=''

    spase.display_output.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        spase.display_output.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        spase.display_output.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        spase.display_output.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    spase.display_output.parameter(parameter_loop).particle.pitch_angle_range.low=''

    spase.display_output.parameter(parameter_loop).particle.pitch_angle_range.high=''

    spase.display_output.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.display_output.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        spase.display_output.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        spase.display_output.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    spase.display_output.parameter(parameter_loop).particle.chemical_formula=''

    spase.display_output.parameter(parameter_loop).particle.population=''

    spase.display_output.parameter(parameter_loop).particle.population_mass_number=''

    spase.display_output.parameter(parameter_loop).particle.population_charge_state=''

    spase.display_output.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do spase.display_output.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    spase.display_output.parameter(parameter_loop).wave.wave_quantity=''

    spase.display_output.parameter(parameter_loop).wave.energy_range.low=''

    spase.display_output.parameter(parameter_loop).wave.energy_range.high=''

    spase.display_output.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        spase.display_output.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        spase.display_output.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        spase.display_output.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    spase.display_output.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    spase.display_output.parameter(parameter_loop).wave.frequency_range.low=''

    spase.display_output.parameter(parameter_loop).wave.frequency_range.high=''

    spase.display_output.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        spase.display_output.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        spase.display_output.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        spase.display_output.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    spase.display_output.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    spase.display_output.parameter(parameter_loop).wave.wavelength_range.low=''

    spase.display_output.parameter(parameter_loop).wave.wavelength_range.high=''

    spase.display_output.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        spase.display_output.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        spase.display_output.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        spase.display_output.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    spase.display_output.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do spase.display_output.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do spase.display_output.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do spase.display_output.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    spase.display_output.parameter(parameter_loop).support.support_quantity=''

endfor

spase.display_output.model_product=''

spase.display_output.property.name=''

spase.display_output.property.description=''

spase.display_output.property.caveats=''

spase.display_output.property.property_quantity=''

for qualifier_loop=0,4 do spase.display_output.property.qualifier(qualifier_loop)=''

spase.display_output.property.units=''

spase.display_output.property.units_conversion=''

spase.display_output.property.property_label=''

spase.display_output.property.property_value=''

spase.display_output.property.property_table_url=''

spase.display_output.property.valid_min=''

spase.display_output.property.valid_max=''

spase.display_output.property.property_model=''

spase.display_output.property.model_url=''

spase.display_output.extension=''

spase.numerical_output.resource_id=''

spase.numerical_output.resource_header.resource_name=''

spase.numerical_output.resource_header.alternate_name=''

spase.numerical_output.resource_header.doi=''

spase.numerical_output.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    spase.numerical_output.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    spase.numerical_output.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

spase.numerical_output.resource_header.expiration_date=''

spase.numerical_output.resource_header.description=''

spase.numerical_output.resource_header.acknowledgement=''

spase.numerical_output.resource_header.publication_info.title=''

spase.numerical_output.resource_header.publication_info.authors=''

spase.numerical_output.resource_header.publication_info.publication_date=''

spase.numerical_output.resource_header.publication_info.published_by=''

spase.numerical_output.resource_header.publication_info.landing_page_url=''

spase.numerical_output.resource_header.funding.agency=''

spase.numerical_output.resource_header.funding.project=''

spase.numerical_output.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    spase.numerical_output.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do spase.numerical_output.resource_header.contact(contact_loop).role(role_loop)=''

    spase.numerical_output.resource_header.contact(contact_loop).start_date=''

    spase.numerical_output.resource_header.contact(contact_loop).stop_date=''

    spase.numerical_output.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    spase.numerical_output.resource_header.information_url(information_url_loop).name=''

    spase.numerical_output.resource_header.information_url(information_url_loop).url=''

    spase.numerical_output.resource_header.information_url(information_url_loop).description=''

    spase.numerical_output.resource_header.information_url(information_url_loop).language=''

endfor

spase.numerical_output.resource_header.association.association_id=''

spase.numerical_output.resource_header.association.association_type=''

spase.numerical_output.resource_header.association.note=''

for prior_id_loop=0,8 do spase.numerical_output.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    spase.numerical_output.access_information(access_information_loop).repository_id=''

    spase.numerical_output.access_information(access_information_loop).availability=''

    spase.numerical_output.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        spase.numerical_output.access_information(access_information_loop).access_url(access_url_loop).name=''

        spase.numerical_output.access_information(access_information_loop).access_url(access_url_loop).url=''

        spase.numerical_output.access_information(access_information_loop).access_url(access_url_loop).style=''

        spase.numerical_output.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        spase.numerical_output.access_information(access_information_loop).access_url(access_url_loop).description=''

        spase.numerical_output.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    spase.numerical_output.access_information(access_information_loop).format=''

    spase.numerical_output.access_information(access_information_loop).encoding=''

    spase.numerical_output.access_information(access_information_loop).access_directory_template=''

    spase.numerical_output.access_information(access_information_loop).access_filename_template=''

    spase.numerical_output.access_information(access_information_loop).data_extent.quantity=''

    spase.numerical_output.access_information(access_information_loop).data_extent.units=''

    spase.numerical_output.access_information(access_information_loop).data_extent.per=''

    spase.numerical_output.access_information(access_information_loop).acknowledgement=''

endfor

spase.numerical_output.processing_level=''

spase.numerical_output.provider_resource_name=''

spase.numerical_output.provider_processing_level=''

spase.numerical_output.provider_version=''

spase.numerical_output.modeled_instrument_id=''

for measurement_type_loop=0,4 do spase.numerical_output.measurement_type(measurement_type_loop)=''

spase.numerical_output.temporal_description.time_span.start_date=''

if keyword_set(keyword_stop_date) then spase.numerical_output.temporal_description.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then spase.numerical_output.temporal_description.time_span.relative_stop_date=''

spase.numerical_output.temporal_description.time_span.note=''

spase.numerical_output.temporal_description.cadence=''

spase.numerical_output.temporal_description.cadence_min=''

spase.numerical_output.temporal_description.cadence_max=''

spase.numerical_output.temporal_description.exposure=''

spase.numerical_output.temporal_description.exposure_min=''

spase.numerical_output.temporal_description.exposure_max=''

spase.numerical_output.spatial_description.dimension=''

spase.numerical_output.spatial_description.coordinate_system.coordinate_representation=''

spase.numerical_output.spatial_description.coordinate_system.coordinate_system_name=''

spase.numerical_output.spatial_description.units=''

spase.numerical_output.spatial_description.units_conversion=''

spase.numerical_output.spatial_description.coordinates_label=''

if keyword_set(keyword_cuts_description) then spase.numerical_output.spatial_description.cuts_description=''

if keyword_set(keyword_cubes_description) then spase.numerical_output.spatial_description.cubes_description=''

if keyword_set(keyword_plane_normal_vector) then spase.numerical_output.spatial_description.plane_normal_vector=''

if keyword_set(keyword_plane_point) then spase.numerical_output.spatial_description.plane_point=''

if keyword_set(keyword_region_begin) then spase.numerical_output.spatial_description.region_begin=''

if keyword_set(keyword_region_end) then spase.numerical_output.spatial_description.region_end=''

spase.numerical_output.spatial_description.step=''

spase.numerical_output.spectral_range=''

spase.numerical_output.modeled_region=''

spase.numerical_output.caveats=''

for keyword_loop=0,98 do spase.numerical_output.keyword(keyword_loop)=''

spase.numerical_output.input_resource_id=''

for parameter_loop=0,84 do begin

    spase.numerical_output.parameter(parameter_loop).name=''

    spase.numerical_output.parameter(parameter_loop).set=''

    spase.numerical_output.parameter(parameter_loop).parameter_key=''

    spase.numerical_output.parameter(parameter_loop).description=''

    spase.numerical_output.parameter(parameter_loop).ucd=''

    spase.numerical_output.parameter(parameter_loop).caveats=''

    spase.numerical_output.parameter(parameter_loop).cadence=''

    spase.numerical_output.parameter(parameter_loop).cadence_min=''

    spase.numerical_output.parameter(parameter_loop).cadence_max=''

    spase.numerical_output.parameter(parameter_loop).units=''

    spase.numerical_output.parameter(parameter_loop).units_conversion=''

    spase.numerical_output.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    spase.numerical_output.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    spase.numerical_output.parameter(parameter_loop).rendering_hints.display_type=''

    spase.numerical_output.parameter(parameter_loop).rendering_hints.axis_label=''

    spase.numerical_output.parameter(parameter_loop).rendering_hints.rendering_axis=''

    spase.numerical_output.parameter(parameter_loop).rendering_hints.index=''

    spase.numerical_output.parameter(parameter_loop).rendering_hints.value_format=''

    spase.numerical_output.parameter(parameter_loop).rendering_hints.scale_min=''

    spase.numerical_output.parameter(parameter_loop).rendering_hints.scale_max=''

    spase.numerical_output.parameter(parameter_loop).rendering_hints.scale_type=''

    spase.numerical_output.parameter(parameter_loop).structure.size=''

    spase.numerical_output.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).index=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).units=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        spase.numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    spase.numerical_output.parameter(parameter_loop).valid_min=''

    spase.numerical_output.parameter(parameter_loop).valid_max=''

    spase.numerical_output.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do spase.numerical_output.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    spase.numerical_output.parameter(parameter_loop).field.field_quantity=''

    spase.numerical_output.parameter(parameter_loop).field.frequency_range.spectral_range=''

    spase.numerical_output.parameter(parameter_loop).field.frequency_range.low=''

    spase.numerical_output.parameter(parameter_loop).field.frequency_range.high=''

    spase.numerical_output.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_output.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        spase.numerical_output.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        spase.numerical_output.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do spase.numerical_output.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do spase.numerical_output.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    spase.numerical_output.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do spase.numerical_output.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    spase.numerical_output.parameter(parameter_loop).particle.energy_range.low=''

    spase.numerical_output.parameter(parameter_loop).particle.energy_range.high=''

    spase.numerical_output.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_output.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        spase.numerical_output.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        spase.numerical_output.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    spase.numerical_output.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    spase.numerical_output.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    spase.numerical_output.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_output.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        spase.numerical_output.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        spase.numerical_output.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    spase.numerical_output.parameter(parameter_loop).particle.polar_angle_range.low=''

    spase.numerical_output.parameter(parameter_loop).particle.polar_angle_range.high=''

    spase.numerical_output.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_output.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        spase.numerical_output.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        spase.numerical_output.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    spase.numerical_output.parameter(parameter_loop).particle.mass_range.low=''

    spase.numerical_output.parameter(parameter_loop).particle.mass_range.high=''

    spase.numerical_output.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_output.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        spase.numerical_output.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        spase.numerical_output.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    spase.numerical_output.parameter(parameter_loop).particle.pitch_angle_range.low=''

    spase.numerical_output.parameter(parameter_loop).particle.pitch_angle_range.high=''

    spase.numerical_output.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_output.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        spase.numerical_output.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        spase.numerical_output.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    spase.numerical_output.parameter(parameter_loop).particle.chemical_formula=''

    spase.numerical_output.parameter(parameter_loop).particle.population=''

    spase.numerical_output.parameter(parameter_loop).particle.population_mass_number=''

    spase.numerical_output.parameter(parameter_loop).particle.population_charge_state=''

    spase.numerical_output.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do spase.numerical_output.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    spase.numerical_output.parameter(parameter_loop).wave.wave_quantity=''

    spase.numerical_output.parameter(parameter_loop).wave.energy_range.low=''

    spase.numerical_output.parameter(parameter_loop).wave.energy_range.high=''

    spase.numerical_output.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_output.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        spase.numerical_output.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        spase.numerical_output.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    spase.numerical_output.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    spase.numerical_output.parameter(parameter_loop).wave.frequency_range.low=''

    spase.numerical_output.parameter(parameter_loop).wave.frequency_range.high=''

    spase.numerical_output.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_output.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        spase.numerical_output.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        spase.numerical_output.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    spase.numerical_output.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    spase.numerical_output.parameter(parameter_loop).wave.wavelength_range.low=''

    spase.numerical_output.parameter(parameter_loop).wave.wavelength_range.high=''

    spase.numerical_output.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        spase.numerical_output.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        spase.numerical_output.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        spase.numerical_output.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    spase.numerical_output.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do spase.numerical_output.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do spase.numerical_output.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do spase.numerical_output.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    spase.numerical_output.parameter(parameter_loop).support.support_quantity=''

endfor

spase.numerical_output.model_product=''

spase.numerical_output.property.name=''

spase.numerical_output.property.description=''

spase.numerical_output.property.caveats=''

spase.numerical_output.property.property_quantity=''

for qualifier_loop=0,4 do spase.numerical_output.property.qualifier(qualifier_loop)=''

spase.numerical_output.property.units=''

spase.numerical_output.property.units_conversion=''

spase.numerical_output.property.property_label=''

spase.numerical_output.property.property_value=''

spase.numerical_output.property.property_table_url=''

spase.numerical_output.property.valid_min=''

spase.numerical_output.property.valid_max=''

spase.numerical_output.property.property_model=''

spase.numerical_output.property.model_url=''

spase.numerical_output.extension=''

return,spase

end

