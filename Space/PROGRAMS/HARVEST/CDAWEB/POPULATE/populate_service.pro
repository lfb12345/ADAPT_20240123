
function populate_service,spase_ontology,station_info,verbose=verbose

service=spase_model_create(spase_ontology,'service',verbose=verbose)

;
;-------------------------------------------------------------------------------
;
;  SERVICE List Num:                                2
;
;-------------------------------------------------------------------------------
;

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

service.resource_id=''

service.resource_header.resource_name=''

service.resource_header.alternate_name=''

service.resource_header.doi=''

service.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    service.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    service.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

service.resource_header.expiration_date=''

service.resource_header.description=''

service.resource_header.acknowledgement=''

service.resource_header.publication_info.title=''

service.resource_header.publication_info.authors=''

service.resource_header.publication_info.publication_date=''

service.resource_header.publication_info.published_by=''

service.resource_header.publication_info.landing_page_url=''

service.resource_header.funding.agency=''

service.resource_header.funding.project=''

service.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    service.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do service.resource_header.contact(contact_loop).role(role_loop)=''

    service.resource_header.contact(contact_loop).start_date=''

    service.resource_header.contact(contact_loop).stop_date=''

    service.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    service.resource_header.information_url(information_url_loop).name=''

    service.resource_header.information_url(information_url_loop).url=''

    service.resource_header.information_url(information_url_loop).description=''

    service.resource_header.information_url(information_url_loop).language=''

endfor

service.resource_header.association.association_id=''

service.resource_header.association.association_type=''

service.resource_header.association.note=''

for prior_id_loop=0,8 do service.resource_header.prior_id(prior_id_loop)=''

for access_url_loop=0,4 do begin

    service.access_url(access_url_loop).name=''

    service.access_url(access_url_loop).url=''

    service.access_url(access_url_loop).style=''

    service.access_url(access_url_loop).product_key=''

    service.access_url(access_url_loop).description=''

    service.access_url(access_url_loop).language=''

endfor

service.extension=''

return,service

end

