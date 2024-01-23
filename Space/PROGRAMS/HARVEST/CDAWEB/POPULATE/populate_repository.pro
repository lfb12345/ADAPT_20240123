
function populate_repository,spase_ontology,station_info,verbose=verbose

repository=spase_model_create(spase_ontology,'repository',verbose=verbose)

;
;-------------------------------------------------------------------------------
;
;  REPOSITORY List Num:                             2
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

repository.resource_id=''

repository.resource_header.resource_name=''

repository.resource_header.alternate_name=''

repository.resource_header.doi=''

repository.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    repository.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    repository.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

repository.resource_header.expiration_date=''

repository.resource_header.description=''

repository.resource_header.acknowledgement=''

repository.resource_header.publication_info.title=''

repository.resource_header.publication_info.authors=''

repository.resource_header.publication_info.publication_date=''

repository.resource_header.publication_info.published_by=''

repository.resource_header.publication_info.landing_page_url=''

repository.resource_header.funding.agency=''

repository.resource_header.funding.project=''

repository.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    repository.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do repository.resource_header.contact(contact_loop).role(role_loop)=''

    repository.resource_header.contact(contact_loop).start_date=''

    repository.resource_header.contact(contact_loop).stop_date=''

    repository.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    repository.resource_header.information_url(information_url_loop).name=''

    repository.resource_header.information_url(information_url_loop).url=''

    repository.resource_header.information_url(information_url_loop).description=''

    repository.resource_header.information_url(information_url_loop).language=''

endfor

repository.resource_header.association.association_id=''

repository.resource_header.association.association_type=''

repository.resource_header.association.note=''

for prior_id_loop=0,8 do repository.resource_header.prior_id(prior_id_loop)=''

for access_url_loop=0,4 do begin

    repository.access_url(access_url_loop).name=''

    repository.access_url(access_url_loop).url=''

    repository.access_url(access_url_loop).style=''

    repository.access_url(access_url_loop).product_key=''

    repository.access_url(access_url_loop).description=''

    repository.access_url(access_url_loop).language=''

endfor

repository.extension=''

return,repository

end

