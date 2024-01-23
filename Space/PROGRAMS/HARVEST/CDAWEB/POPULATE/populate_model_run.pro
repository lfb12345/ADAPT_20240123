
function populate_model_run,spase_ontology,station_info,verbose=verbose,keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter

model_run=spase_model_create(spase_ontology,'model_run',verbose=verbose,keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter)

;
;-------------------------------------------------------------------------------
;
;  MODEL_RUN List Num:                             11
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

model_run.resource_id=''

model_run.resource_header.resource_name=''

model_run.resource_header.alternate_name=''

model_run.resource_header.doi=''

model_run.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    model_run.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    model_run.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

model_run.resource_header.expiration_date=''

model_run.resource_header.description=''

model_run.resource_header.acknowledgement=''

model_run.resource_header.publication_info.title=''

model_run.resource_header.publication_info.authors=''

model_run.resource_header.publication_info.publication_date=''

model_run.resource_header.publication_info.published_by=''

model_run.resource_header.publication_info.landing_page_url=''

model_run.resource_header.funding.agency=''

model_run.resource_header.funding.project=''

model_run.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    model_run.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do model_run.resource_header.contact(contact_loop).role(role_loop)=''

    model_run.resource_header.contact(contact_loop).start_date=''

    model_run.resource_header.contact(contact_loop).stop_date=''

    model_run.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    model_run.resource_header.information_url(information_url_loop).name=''

    model_run.resource_header.information_url(information_url_loop).url=''

    model_run.resource_header.information_url(information_url_loop).description=''

    model_run.resource_header.information_url(information_url_loop).language=''

endfor

model_run.resource_header.association.association_id=''

model_run.resource_header.association.association_type=''

model_run.resource_header.association.note=''

for prior_id_loop=0,8 do model_run.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    model_run.access_information(access_information_loop).repository_id=''

    model_run.access_information(access_information_loop).availability=''

    model_run.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        model_run.access_information(access_information_loop).access_url(access_url_loop).name=''

        model_run.access_information(access_information_loop).access_url(access_url_loop).url=''

        model_run.access_information(access_information_loop).access_url(access_url_loop).style=''

        model_run.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        model_run.access_information(access_information_loop).access_url(access_url_loop).description=''

        model_run.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    model_run.access_information(access_information_loop).format=''

    model_run.access_information(access_information_loop).encoding=''

    model_run.access_information(access_information_loop).access_directory_template=''

    model_run.access_information(access_information_loop).access_filename_template=''

    model_run.access_information(access_information_loop).data_extent.quantity=''

    model_run.access_information(access_information_loop).data_extent.units=''

    model_run.access_information(access_information_loop).data_extent.per=''

    model_run.access_information(access_information_loop).acknowledgement=''

endfor

model_run.provider_resource_name=''

model_run.provider_processing_level=''

model_run.provider_version=''

model_run.model_specification.model_id=''

model_run.model_specification.version_tag=''

model_run.temporal_dependence=''

model_run.modeled_region=''

model_run.likelihood_rating=''

model_run.caveats=''

for keyword_loop=0,98 do model_run.keyword(keyword_loop)=''

model_run.input_resource_id=''

model_run.model_time.description=''

model_run.model_time.caveats=''

model_run.model_time.duration=''

model_run.model_time.time_start=''

model_run.model_time.time_stop=''

model_run.model_time.time_step=''

model_run.model_time.diagnosis_time_step.time_start=''

model_run.model_time.diagnosis_time_step.duration=''

model_run.model_time.diagnosis_time_step.saved_quantity=''

model_run.model_domain.coordinate_system.coordinate_representation=''

model_run.model_domain.coordinate_system.coordinate_system_name=''

model_run.model_domain.description=''

model_run.model_domain.caveats=''

model_run.model_domain.spatial_dimension=''

model_run.model_domain.velocity_dimension=''

model_run.model_domain.field_dimension=''

model_run.model_domain.units=''

model_run.model_domain.units_conversion=''

model_run.model_domain.coordinates_label=''

model_run.model_domain.valid_min=''

model_run.model_domain.valid_max=''

model_run.model_domain.grid_structure=''

model_run.model_domain.grid_cell_size=''

model_run.model_domain.symmetry=''

model_run.model_domain.boundary_conditions.particle_boundary=''

model_run.model_domain.boundary_conditions.field_boundary=''

if keyword_set(keyword_region_parameter) then begin

   model_run.region_parameter.modeled_region=''

   model_run.region_parameter.description=''

   model_run.region_parameter.caveats=''

   model_run.region_parameter.radius=''

   model_run.region_parameter.sub_longitude=''

   model_run.region_parameter.period=''

   model_run.region_parameter.object_mass=''

   model_run.region_parameter.input_table_url=''

   model_run.region_parameter.property.name=''

   model_run.region_parameter.property.description=''

   model_run.region_parameter.property.caveats=''

   model_run.region_parameter.property.property_quantity=''

   for qualifier_loop=0,4 do model_run.region_parameter.property.qualifier(qualifier_loop)=''

   model_run.region_parameter.property.units=''

   model_run.region_parameter.property.units_conversion=''

   model_run.region_parameter.property.property_label=''

   model_run.region_parameter.property.property_value=''

   model_run.region_parameter.property.property_table_url=''

   model_run.region_parameter.property.valid_min=''

   model_run.region_parameter.property.valid_max=''

   model_run.region_parameter.property.property_model=''

   model_run.region_parameter.property.model_url=''

endif

if keyword_set(keyword_input_parameter) then begin

   model_run.input_parameter.name=''

   model_run.input_parameter.description=''

   model_run.input_parameter.caveats=''

   model_run.input_parameter.modeled_region=''

   for qualifier_loop=0,4 do model_run.input_parameter.qualifier(qualifier_loop)=''

   model_run.input_parameter.input_table_url=''

   model_run.input_parameter.parameter_quantity=''

   model_run.input_parameter.property.name=''

   model_run.input_parameter.property.description=''

   model_run.input_parameter.property.caveats=''

   model_run.input_parameter.property.property_quantity=''

   for qualifier_loop=0,4 do model_run.input_parameter.property.qualifier(qualifier_loop)=''

   model_run.input_parameter.property.units=''

   model_run.input_parameter.property.units_conversion=''

   model_run.input_parameter.property.property_label=''

   model_run.input_parameter.property.property_value=''

   model_run.input_parameter.property.property_table_url=''

   model_run.input_parameter.property.valid_min=''

   model_run.input_parameter.property.valid_max=''

   model_run.input_parameter.property.property_model=''

   model_run.input_parameter.property.model_url=''

endif

if keyword_set(keyword_input_population) then begin

   model_run.input_population.name=''

   model_run.input_population.set=''

   model_run.input_population.parameter_key=''

   model_run.input_population.description=''

   model_run.input_population.caveats=''

   model_run.input_population.modeled_region=''

   for qualifier_loop=0,4 do model_run.input_population.qualifier(qualifier_loop)=''

   for particle_type_loop=0,4 do model_run.input_population.particle_type(particle_type_loop)=''

   model_run.input_population.chemical_formula=''

   for atomic_number_loop=0,4 do model_run.input_population.atomic_number(atomic_number_loop)=''

   model_run.input_population.population_mass_number=''

   model_run.input_population.population_charge_state=''

   model_run.input_population.population_density=''

   model_run.input_population.population_temperature=''

   model_run.input_population.population_flow_speed=''

   model_run.input_population.distribution=''

   model_run.input_population.production_rate=''

   model_run.input_population.total_production_rate=''

   model_run.input_population.input_table_url=''

   model_run.input_population.density_profile=''

   model_run.input_population.model_url=''

endif

if keyword_set(keyword_input_field) then begin

   model_run.input_field.name=''

   model_run.input_field.set=''

   model_run.input_field.parameter_key=''

   model_run.input_field.description=''

   model_run.input_field.caveats=''

   model_run.input_field.modeled_region=''

   model_run.input_field.coordinate_system.coordinate_representation=''

   model_run.input_field.coordinate_system.coordinate_system_name=''

   for qualifier_loop=0,4 do model_run.input_field.qualifier(qualifier_loop)=''

   model_run.input_field.field_quantity=''

   model_run.input_field.units=''

   model_run.input_field.units_conversion=''

   model_run.input_field.input_label=''

   model_run.input_field.field_value=''

   model_run.input_field.input_table_url=''

   model_run.input_field.valid_min=''

   model_run.input_field.valid_max=''

   model_run.input_field.field_model=''

   model_run.input_field.model_url=''

endif

if keyword_set(keyword_input_process) then begin

   model_run.input_process.name=''

   model_run.input_process.set=''

   model_run.input_process.parameter_key=''

   model_run.input_process.description=''

   model_run.input_process.caveats=''

   model_run.input_process.modeled_region=''

   model_run.input_process.process_type=''

   model_run.input_process.units=''

   model_run.input_process.units_conversion=''

   model_run.input_process.process_coefficient=''

   model_run.input_process.process_coeff_type=''

   model_run.input_process.process_model=''

   model_run.input_process.model_url=''

endif

model_run.extension=''

return,model_run

end

