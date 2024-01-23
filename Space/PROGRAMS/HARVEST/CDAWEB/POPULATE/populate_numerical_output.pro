
function populate_numerical_output,spase_ontology,station_info,verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date

numerical_output=spase_model_create(spase_ontology,'numerical_output',verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date)

;
;-------------------------------------------------------------------------------
;
;  NUMERICAL_OUTPUT List Num:                      12
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

numerical_output.resource_id=''

numerical_output.resource_header.resource_name=''

numerical_output.resource_header.alternate_name=''

numerical_output.resource_header.doi=''

numerical_output.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    numerical_output.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    numerical_output.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

numerical_output.resource_header.expiration_date=''

numerical_output.resource_header.description=''

numerical_output.resource_header.acknowledgement=''

numerical_output.resource_header.publication_info.title=''

numerical_output.resource_header.publication_info.authors=''

numerical_output.resource_header.publication_info.publication_date=''

numerical_output.resource_header.publication_info.published_by=''

numerical_output.resource_header.publication_info.landing_page_url=''

numerical_output.resource_header.funding.agency=''

numerical_output.resource_header.funding.project=''

numerical_output.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    numerical_output.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do numerical_output.resource_header.contact(contact_loop).role(role_loop)=''

    numerical_output.resource_header.contact(contact_loop).start_date=''

    numerical_output.resource_header.contact(contact_loop).stop_date=''

    numerical_output.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    numerical_output.resource_header.information_url(information_url_loop).name=''

    numerical_output.resource_header.information_url(information_url_loop).url=''

    numerical_output.resource_header.information_url(information_url_loop).description=''

    numerical_output.resource_header.information_url(information_url_loop).language=''

endfor

numerical_output.resource_header.association.association_id=''

numerical_output.resource_header.association.association_type=''

numerical_output.resource_header.association.note=''

for prior_id_loop=0,8 do numerical_output.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    numerical_output.access_information(access_information_loop).repository_id=''

    numerical_output.access_information(access_information_loop).availability=''

    numerical_output.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        numerical_output.access_information(access_information_loop).access_url(access_url_loop).name=''

        numerical_output.access_information(access_information_loop).access_url(access_url_loop).url=''

        numerical_output.access_information(access_information_loop).access_url(access_url_loop).style=''

        numerical_output.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        numerical_output.access_information(access_information_loop).access_url(access_url_loop).description=''

        numerical_output.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    numerical_output.access_information(access_information_loop).format=''

    numerical_output.access_information(access_information_loop).encoding=''

    numerical_output.access_information(access_information_loop).access_directory_template=''

    numerical_output.access_information(access_information_loop).access_filename_template=''

    numerical_output.access_information(access_information_loop).data_extent.quantity=''

    numerical_output.access_information(access_information_loop).data_extent.units=''

    numerical_output.access_information(access_information_loop).data_extent.per=''

    numerical_output.access_information(access_information_loop).acknowledgement=''

endfor

numerical_output.processing_level=''

numerical_output.provider_resource_name=''

numerical_output.provider_processing_level=''

numerical_output.provider_version=''

numerical_output.modeled_instrument_id=''

for measurement_type_loop=0,4 do numerical_output.measurement_type(measurement_type_loop)=''

numerical_output.temporal_description.time_span.start_date=''

if keyword_set(keyword_stop_date) then numerical_output.temporal_description.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then numerical_output.temporal_description.time_span.relative_stop_date=''

numerical_output.temporal_description.time_span.note=''

numerical_output.temporal_description.cadence=''

numerical_output.temporal_description.cadence_min=''

numerical_output.temporal_description.cadence_max=''

numerical_output.temporal_description.exposure=''

numerical_output.temporal_description.exposure_min=''

numerical_output.temporal_description.exposure_max=''

numerical_output.spatial_description.dimension=''

numerical_output.spatial_description.coordinate_system.coordinate_representation=''

numerical_output.spatial_description.coordinate_system.coordinate_system_name=''

numerical_output.spatial_description.units=''

numerical_output.spatial_description.units_conversion=''

numerical_output.spatial_description.coordinates_label=''

if keyword_set(keyword_cuts_description) then numerical_output.spatial_description.cuts_description=''

if keyword_set(keyword_cubes_description) then numerical_output.spatial_description.cubes_description=''

if keyword_set(keyword_plane_normal_vector) then numerical_output.spatial_description.plane_normal_vector=''

if keyword_set(keyword_plane_point) then numerical_output.spatial_description.plane_point=''

if keyword_set(keyword_region_begin) then numerical_output.spatial_description.region_begin=''

if keyword_set(keyword_region_end) then numerical_output.spatial_description.region_end=''

numerical_output.spatial_description.step=''

numerical_output.spectral_range=''

numerical_output.modeled_region=''

numerical_output.caveats=''

for keyword_loop=0,98 do numerical_output.keyword(keyword_loop)=''

numerical_output.input_resource_id=''

for parameter_loop=0,84 do begin

    numerical_output.parameter(parameter_loop).name=''

    numerical_output.parameter(parameter_loop).set=''

    numerical_output.parameter(parameter_loop).parameter_key=''

    numerical_output.parameter(parameter_loop).description=''

    numerical_output.parameter(parameter_loop).ucd=''

    numerical_output.parameter(parameter_loop).caveats=''

    numerical_output.parameter(parameter_loop).cadence=''

    numerical_output.parameter(parameter_loop).cadence_min=''

    numerical_output.parameter(parameter_loop).cadence_max=''

    numerical_output.parameter(parameter_loop).units=''

    numerical_output.parameter(parameter_loop).units_conversion=''

    numerical_output.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    numerical_output.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    numerical_output.parameter(parameter_loop).rendering_hints.display_type=''

    numerical_output.parameter(parameter_loop).rendering_hints.axis_label=''

    numerical_output.parameter(parameter_loop).rendering_hints.rendering_axis=''

    numerical_output.parameter(parameter_loop).rendering_hints.index=''

    numerical_output.parameter(parameter_loop).rendering_hints.value_format=''

    numerical_output.parameter(parameter_loop).rendering_hints.scale_min=''

    numerical_output.parameter(parameter_loop).rendering_hints.scale_max=''

    numerical_output.parameter(parameter_loop).rendering_hints.scale_type=''

    numerical_output.parameter(parameter_loop).structure.size=''

    numerical_output.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        numerical_output.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do numerical_output.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).index=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).units=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        numerical_output.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    numerical_output.parameter(parameter_loop).valid_min=''

    numerical_output.parameter(parameter_loop).valid_max=''

    numerical_output.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do numerical_output.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    numerical_output.parameter(parameter_loop).field.field_quantity=''

    numerical_output.parameter(parameter_loop).field.frequency_range.spectral_range=''

    numerical_output.parameter(parameter_loop).field.frequency_range.low=''

    numerical_output.parameter(parameter_loop).field.frequency_range.high=''

    numerical_output.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        numerical_output.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        numerical_output.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        numerical_output.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do numerical_output.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do numerical_output.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    numerical_output.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do numerical_output.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    numerical_output.parameter(parameter_loop).particle.energy_range.low=''

    numerical_output.parameter(parameter_loop).particle.energy_range.high=''

    numerical_output.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        numerical_output.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        numerical_output.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        numerical_output.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    numerical_output.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    numerical_output.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    numerical_output.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        numerical_output.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        numerical_output.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        numerical_output.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    numerical_output.parameter(parameter_loop).particle.polar_angle_range.low=''

    numerical_output.parameter(parameter_loop).particle.polar_angle_range.high=''

    numerical_output.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        numerical_output.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        numerical_output.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        numerical_output.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    numerical_output.parameter(parameter_loop).particle.mass_range.low=''

    numerical_output.parameter(parameter_loop).particle.mass_range.high=''

    numerical_output.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        numerical_output.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        numerical_output.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        numerical_output.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    numerical_output.parameter(parameter_loop).particle.pitch_angle_range.low=''

    numerical_output.parameter(parameter_loop).particle.pitch_angle_range.high=''

    numerical_output.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        numerical_output.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        numerical_output.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        numerical_output.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    numerical_output.parameter(parameter_loop).particle.chemical_formula=''

    numerical_output.parameter(parameter_loop).particle.population=''

    numerical_output.parameter(parameter_loop).particle.population_mass_number=''

    numerical_output.parameter(parameter_loop).particle.population_charge_state=''

    numerical_output.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do numerical_output.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    numerical_output.parameter(parameter_loop).wave.wave_quantity=''

    numerical_output.parameter(parameter_loop).wave.energy_range.low=''

    numerical_output.parameter(parameter_loop).wave.energy_range.high=''

    numerical_output.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        numerical_output.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        numerical_output.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        numerical_output.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    numerical_output.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    numerical_output.parameter(parameter_loop).wave.frequency_range.low=''

    numerical_output.parameter(parameter_loop).wave.frequency_range.high=''

    numerical_output.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        numerical_output.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        numerical_output.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        numerical_output.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    numerical_output.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    numerical_output.parameter(parameter_loop).wave.wavelength_range.low=''

    numerical_output.parameter(parameter_loop).wave.wavelength_range.high=''

    numerical_output.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        numerical_output.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        numerical_output.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        numerical_output.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    numerical_output.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do numerical_output.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do numerical_output.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do numerical_output.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    numerical_output.parameter(parameter_loop).support.support_quantity=''

endfor

numerical_output.model_product=''

numerical_output.property.name=''

numerical_output.property.description=''

numerical_output.property.caveats=''

numerical_output.property.property_quantity=''

for qualifier_loop=0,4 do numerical_output.property.qualifier(qualifier_loop)=''

numerical_output.property.units=''

numerical_output.property.units_conversion=''

numerical_output.property.property_label=''

numerical_output.property.property_value=''

numerical_output.property.property_table_url=''

numerical_output.property.valid_min=''

numerical_output.property.valid_max=''

numerical_output.property.property_model=''

numerical_output.property.model_url=''

numerical_output.extension=''

return,numerical_output

end

