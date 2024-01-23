
function populate_software,spase_ontology,station_info,verbose=verbose,keyword_input_property=keyword_input_property,keyword_output_property=keyword_output_property

software=spase_model_create(spase_ontology,'software',verbose=verbose,keyword_input_property=keyword_input_property,keyword_output_property=keyword_output_property)

;
;-------------------------------------------------------------------------------
;
;  SOFTWARE List Num:                               6
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

software.resource_id=''

software.resource_header.resource_name=''

software.resource_header.alternate_name=''

software.resource_header.doi=''

software.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    software.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    software.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

software.resource_header.expiration_date=''

software.resource_header.description=''

software.resource_header.acknowledgement=''

software.resource_header.publication_info.title=''

software.resource_header.publication_info.authors=''

software.resource_header.publication_info.publication_date=''

software.resource_header.publication_info.published_by=''

software.resource_header.publication_info.landing_page_url=''

software.resource_header.funding.agency=''

software.resource_header.funding.project=''

software.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    software.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do software.resource_header.contact(contact_loop).role(role_loop)=''

    software.resource_header.contact(contact_loop).start_date=''

    software.resource_header.contact(contact_loop).stop_date=''

    software.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    software.resource_header.information_url(information_url_loop).name=''

    software.resource_header.information_url(information_url_loop).url=''

    software.resource_header.information_url(information_url_loop).description=''

    software.resource_header.information_url(information_url_loop).language=''

endfor

software.resource_header.association.association_id=''

software.resource_header.association.association_type=''

software.resource_header.association.note=''

for prior_id_loop=0,8 do software.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    software.access_information(access_information_loop).repository_id=''

    software.access_information(access_information_loop).availability=''

    software.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        software.access_information(access_information_loop).access_url(access_url_loop).name=''

        software.access_information(access_information_loop).access_url(access_url_loop).url=''

        software.access_information(access_information_loop).access_url(access_url_loop).style=''

        software.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        software.access_information(access_information_loop).access_url(access_url_loop).description=''

        software.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    software.access_information(access_information_loop).format=''

    software.access_information(access_information_loop).encoding=''

    software.access_information(access_information_loop).access_directory_template=''

    software.access_information(access_information_loop).access_filename_template=''

    software.access_information(access_information_loop).data_extent.quantity=''

    software.access_information(access_information_loop).data_extent.units=''

    software.access_information(access_information_loop).data_extent.per=''

    software.access_information(access_information_loop).acknowledgement=''

endfor

software.software_version=''

software.application_interface=''

software.code_language=''

software.prerequisites=''

software.execution_environment.operating_system=''

software.execution_environment.installer.availability=''

software.execution_environment.installer.access_rights=''

software.execution_environment.installer.acknowledgement=''

software.execution_environment.installer.url=''

software.execution_environment.cores=''

software.execution_environment.storage=''

software.execution_environment.memory=''

if keyword_set(keyword_input_property) then begin

   software.input_property.name=''

   software.input_property.description=''

   software.input_property.caveats=''

   software.input_property.units=''

   software.input_property.valid_min=''

   software.input_property.valid_max=''

endif

if keyword_set(keyword_output_property) then begin

   software.output_property.name=''

   software.output_property.description=''

   software.output_property.caveats=''

   software.output_property.units=''

   software.output_property.valid_min=''

   software.output_property.valid_max=''

endif

return,software

end

