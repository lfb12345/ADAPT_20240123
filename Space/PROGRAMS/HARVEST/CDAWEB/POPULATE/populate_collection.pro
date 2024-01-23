
function populate_collection,spase_ontology,station_info,verbose=verbose

collection=spase_model_create(spase_ontology,'collection',verbose=verbose)

;
;-------------------------------------------------------------------------------
;
;  COLLECTION List Num:                             5
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

collection.resource_id=''

collection.resource_header.resource_name=''

collection.resource_header.alternate_name=''

collection.resource_header.doi=''

collection.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    collection.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    collection.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

collection.resource_header.expiration_date=''

collection.resource_header.description=''

collection.resource_header.acknowledgement=''

collection.resource_header.publication_info.title=''

collection.resource_header.publication_info.authors=''

collection.resource_header.publication_info.publication_date=''

collection.resource_header.publication_info.published_by=''

collection.resource_header.publication_info.landing_page_url=''

collection.resource_header.funding.agency=''

collection.resource_header.funding.project=''

collection.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    collection.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do collection.resource_header.contact(contact_loop).role(role_loop)=''

    collection.resource_header.contact(contact_loop).start_date=''

    collection.resource_header.contact(contact_loop).stop_date=''

    collection.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    collection.resource_header.information_url(information_url_loop).name=''

    collection.resource_header.information_url(information_url_loop).url=''

    collection.resource_header.information_url(information_url_loop).description=''

    collection.resource_header.information_url(information_url_loop).language=''

endfor

collection.resource_header.association.association_id=''

collection.resource_header.association.association_type=''

collection.resource_header.association.note=''

for prior_id_loop=0,8 do collection.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    collection.access_information(access_information_loop).repository_id=''

    collection.access_information(access_information_loop).availability=''

    collection.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        collection.access_information(access_information_loop).access_url(access_url_loop).name=''

        collection.access_information(access_information_loop).access_url(access_url_loop).url=''

        collection.access_information(access_information_loop).access_url(access_url_loop).style=''

        collection.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        collection.access_information(access_information_loop).access_url(access_url_loop).description=''

        collection.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    collection.access_information(access_information_loop).format=''

    collection.access_information(access_information_loop).encoding=''

    collection.access_information(access_information_loop).access_directory_template=''

    collection.access_information(access_information_loop).access_filename_template=''

    collection.access_information(access_information_loop).data_extent.quantity=''

    collection.access_information(access_information_loop).data_extent.units=''

    collection.access_information(access_information_loop).data_extent.per=''

    collection.access_information(access_information_loop).acknowledgement=''

endfor

collection.member.resource_name=''

collection.member.description=''

collection.member.member_id=''

collection.member.start_date=''

collection.member.stop_date=''

collection.member.spatial_coverage.coordinate_system.coordinate_representation=''

collection.member.spatial_coverage.coordinate_system.coordinate_system_name=''

collection.member.spatial_coverage.center_latitude=''

collection.member.spatial_coverage.northernmost_latitude=''

collection.member.spatial_coverage.southernmost_latitude=''

collection.member.spatial_coverage.center_longitude=''

collection.member.spatial_coverage.easternmost_longitude=''

collection.member.spatial_coverage.westernmost_longitude=''

collection.member.spatial_coverage.center_elevation=''

collection.member.spatial_coverage.minimum_elevation=''

collection.member.spatial_coverage.maximum_elevation=''

collection.member.spatial_coverage.acknowledgement=''

collection.member.spatial_coverage.description=''

collection.extension=''

return,collection

end

