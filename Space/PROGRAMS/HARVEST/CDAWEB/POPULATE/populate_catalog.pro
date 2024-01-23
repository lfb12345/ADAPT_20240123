
function populate_catalog,spase_ontology,station_info,verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date

catalog=spase_model_create(spase_ontology,'catalog',verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date)

;
;-------------------------------------------------------------------------------
;
;  CATALOG List Num:                               11
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

catalog.resource_id=''

catalog.resource_header.resource_name=''

catalog.resource_header.alternate_name=''

catalog.resource_header.doi=''

catalog.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    catalog.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    catalog.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

catalog.resource_header.expiration_date=''

catalog.resource_header.description=''

catalog.resource_header.acknowledgement=''

catalog.resource_header.publication_info.title=''

catalog.resource_header.publication_info.authors=''

catalog.resource_header.publication_info.publication_date=''

catalog.resource_header.publication_info.published_by=''

catalog.resource_header.publication_info.landing_page_url=''

catalog.resource_header.funding.agency=''

catalog.resource_header.funding.project=''

catalog.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    catalog.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do catalog.resource_header.contact(contact_loop).role(role_loop)=''

    catalog.resource_header.contact(contact_loop).start_date=''

    catalog.resource_header.contact(contact_loop).stop_date=''

    catalog.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    catalog.resource_header.information_url(information_url_loop).name=''

    catalog.resource_header.information_url(information_url_loop).url=''

    catalog.resource_header.information_url(information_url_loop).description=''

    catalog.resource_header.information_url(information_url_loop).language=''

endfor

catalog.resource_header.association.association_id=''

catalog.resource_header.association.association_type=''

catalog.resource_header.association.note=''

for prior_id_loop=0,8 do catalog.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    catalog.access_information(access_information_loop).repository_id=''

    catalog.access_information(access_information_loop).availability=''

    catalog.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        catalog.access_information(access_information_loop).access_url(access_url_loop).name=''

        catalog.access_information(access_information_loop).access_url(access_url_loop).url=''

        catalog.access_information(access_information_loop).access_url(access_url_loop).style=''

        catalog.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        catalog.access_information(access_information_loop).access_url(access_url_loop).description=''

        catalog.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    catalog.access_information(access_information_loop).format=''

    catalog.access_information(access_information_loop).encoding=''

    catalog.access_information(access_information_loop).access_directory_template=''

    catalog.access_information(access_information_loop).access_filename_template=''

    catalog.access_information(access_information_loop).data_extent.quantity=''

    catalog.access_information(access_information_loop).data_extent.units=''

    catalog.access_information(access_information_loop).data_extent.per=''

    catalog.access_information(access_information_loop).acknowledgement=''

endfor

catalog.provider_name=''

catalog.provider_resource_name=''

catalog.provider_version=''

for instrument_id_loop=0,98 do catalog.instrument_id(instrument_id_loop)=''

for phenomenon_type_loop=0,4 do catalog.phenomenon_type(phenomenon_type_loop)=''

catalog.time_span.start_date=''

if keyword_set(keyword_stop_date) then catalog.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then catalog.time_span.relative_stop_date=''

catalog.time_span.note=''

catalog.caveats=''

for keyword_loop=0,98 do catalog.keyword(keyword_loop)=''

catalog.input_resource_id=''

for parameter_loop=0,84 do begin

    catalog.parameter(parameter_loop).name=''

    catalog.parameter(parameter_loop).set=''

    catalog.parameter(parameter_loop).parameter_key=''

    catalog.parameter(parameter_loop).description=''

    catalog.parameter(parameter_loop).ucd=''

    catalog.parameter(parameter_loop).caveats=''

    catalog.parameter(parameter_loop).cadence=''

    catalog.parameter(parameter_loop).cadence_min=''

    catalog.parameter(parameter_loop).cadence_max=''

    catalog.parameter(parameter_loop).units=''

    catalog.parameter(parameter_loop).units_conversion=''

    catalog.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    catalog.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    catalog.parameter(parameter_loop).rendering_hints.display_type=''

    catalog.parameter(parameter_loop).rendering_hints.axis_label=''

    catalog.parameter(parameter_loop).rendering_hints.rendering_axis=''

    catalog.parameter(parameter_loop).rendering_hints.index=''

    catalog.parameter(parameter_loop).rendering_hints.value_format=''

    catalog.parameter(parameter_loop).rendering_hints.scale_min=''

    catalog.parameter(parameter_loop).rendering_hints.scale_max=''

    catalog.parameter(parameter_loop).rendering_hints.scale_type=''

    catalog.parameter(parameter_loop).structure.size=''

    catalog.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        catalog.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do catalog.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        catalog.parameter(parameter_loop).structure.element(element_loop).index=''

        catalog.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        catalog.parameter(parameter_loop).structure.element(element_loop).units=''

        catalog.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        catalog.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        catalog.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        catalog.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        catalog.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    catalog.parameter(parameter_loop).valid_min=''

    catalog.parameter(parameter_loop).valid_max=''

    catalog.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do catalog.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    catalog.parameter(parameter_loop).field.field_quantity=''

    catalog.parameter(parameter_loop).field.frequency_range.spectral_range=''

    catalog.parameter(parameter_loop).field.frequency_range.low=''

    catalog.parameter(parameter_loop).field.frequency_range.high=''

    catalog.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        catalog.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        catalog.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        catalog.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do catalog.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do catalog.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    catalog.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do catalog.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    catalog.parameter(parameter_loop).particle.energy_range.low=''

    catalog.parameter(parameter_loop).particle.energy_range.high=''

    catalog.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        catalog.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        catalog.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        catalog.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    catalog.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    catalog.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    catalog.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        catalog.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        catalog.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        catalog.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    catalog.parameter(parameter_loop).particle.polar_angle_range.low=''

    catalog.parameter(parameter_loop).particle.polar_angle_range.high=''

    catalog.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        catalog.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        catalog.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        catalog.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    catalog.parameter(parameter_loop).particle.mass_range.low=''

    catalog.parameter(parameter_loop).particle.mass_range.high=''

    catalog.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        catalog.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        catalog.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        catalog.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    catalog.parameter(parameter_loop).particle.pitch_angle_range.low=''

    catalog.parameter(parameter_loop).particle.pitch_angle_range.high=''

    catalog.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        catalog.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        catalog.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        catalog.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    catalog.parameter(parameter_loop).particle.chemical_formula=''

    catalog.parameter(parameter_loop).particle.population=''

    catalog.parameter(parameter_loop).particle.population_mass_number=''

    catalog.parameter(parameter_loop).particle.population_charge_state=''

    catalog.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do catalog.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    catalog.parameter(parameter_loop).wave.wave_quantity=''

    catalog.parameter(parameter_loop).wave.energy_range.low=''

    catalog.parameter(parameter_loop).wave.energy_range.high=''

    catalog.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        catalog.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        catalog.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        catalog.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    catalog.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    catalog.parameter(parameter_loop).wave.frequency_range.low=''

    catalog.parameter(parameter_loop).wave.frequency_range.high=''

    catalog.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        catalog.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        catalog.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        catalog.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    catalog.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    catalog.parameter(parameter_loop).wave.wavelength_range.low=''

    catalog.parameter(parameter_loop).wave.wavelength_range.high=''

    catalog.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        catalog.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        catalog.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        catalog.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    catalog.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do catalog.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do catalog.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do catalog.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    catalog.parameter(parameter_loop).support.support_quantity=''

endfor

catalog.extension=''

return,catalog

end

