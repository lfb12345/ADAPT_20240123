
function populate_document,spase_ontology,station_info,verbose=verbose

document=spase_model_create(spase_ontology,'document',verbose=verbose)

;
;-------------------------------------------------------------------------------
;
;  DOCUMENT List Num:                               5
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

document.resource_id=''

document.resource_header.resource_name=''

document.resource_header.alternate_name=''

document.resource_header.doi=''

document.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    document.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    document.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

document.resource_header.expiration_date=''

document.resource_header.description=''

document.resource_header.acknowledgement=''

document.resource_header.publication_info.title=''

document.resource_header.publication_info.authors=''

document.resource_header.publication_info.publication_date=''

document.resource_header.publication_info.published_by=''

document.resource_header.publication_info.landing_page_url=''

document.resource_header.funding.agency=''

document.resource_header.funding.project=''

document.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    document.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do document.resource_header.contact(contact_loop).role(role_loop)=''

    document.resource_header.contact(contact_loop).start_date=''

    document.resource_header.contact(contact_loop).stop_date=''

    document.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    document.resource_header.information_url(information_url_loop).name=''

    document.resource_header.information_url(information_url_loop).url=''

    document.resource_header.information_url(information_url_loop).description=''

    document.resource_header.information_url(information_url_loop).language=''

endfor

document.resource_header.association.association_id=''

document.resource_header.association.association_type=''

document.resource_header.association.note=''

for prior_id_loop=0,8 do document.resource_header.prior_id(prior_id_loop)=''

for access_information_loop=0,4 do begin

    document.access_information(access_information_loop).repository_id=''

    document.access_information(access_information_loop).availability=''

    document.access_information(access_information_loop).access_rights=''

    for access_url_loop=0,4 do begin

        document.access_information(access_information_loop).access_url(access_url_loop).name=''

        document.access_information(access_information_loop).access_url(access_url_loop).url=''

        document.access_information(access_information_loop).access_url(access_url_loop).style=''

        document.access_information(access_information_loop).access_url(access_url_loop).product_key=''

        document.access_information(access_information_loop).access_url(access_url_loop).description=''

        document.access_information(access_information_loop).access_url(access_url_loop).language=''

    endfor

    document.access_information(access_information_loop).format=''

    document.access_information(access_information_loop).encoding=''

    document.access_information(access_information_loop).access_directory_template=''

    document.access_information(access_information_loop).access_filename_template=''

    document.access_information(access_information_loop).data_extent.quantity=''

    document.access_information(access_information_loop).data_extent.units=''

    document.access_information(access_information_loop).data_extent.per=''

    document.access_information(access_information_loop).acknowledgement=''

endfor

for keyword_loop=0,98 do document.keyword(keyword_loop)=''

document.document_type=''

document.mimetype=''

document.input_resource_id=''

return,document

end

