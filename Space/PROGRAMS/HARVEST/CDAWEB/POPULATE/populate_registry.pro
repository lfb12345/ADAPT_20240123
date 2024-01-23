
function populate_registry,spase_ontology,station_info,verbose=verbose

registry=spase_model_create(spase_ontology,'registry',verbose=verbose)

;
;-------------------------------------------------------------------------------
;
;  REGISTRY List Num:                               2
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

registry.resource_id=''

registry.resource_header.resource_name=''

registry.resource_header.alternate_name=''

registry.resource_header.doi=''

registry.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    registry.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    registry.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

registry.resource_header.expiration_date=''

registry.resource_header.description=''

registry.resource_header.acknowledgement=''

registry.resource_header.publication_info.title=''

registry.resource_header.publication_info.authors=''

registry.resource_header.publication_info.publication_date=''

registry.resource_header.publication_info.published_by=''

registry.resource_header.publication_info.landing_page_url=''

registry.resource_header.funding.agency=''

registry.resource_header.funding.project=''

registry.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    registry.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do registry.resource_header.contact(contact_loop).role(role_loop)=''

    registry.resource_header.contact(contact_loop).start_date=''

    registry.resource_header.contact(contact_loop).stop_date=''

    registry.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    registry.resource_header.information_url(information_url_loop).name=''

    registry.resource_header.information_url(information_url_loop).url=''

    registry.resource_header.information_url(information_url_loop).description=''

    registry.resource_header.information_url(information_url_loop).language=''

endfor

registry.resource_header.association.association_id=''

registry.resource_header.association.association_type=''

registry.resource_header.association.note=''

for prior_id_loop=0,8 do registry.resource_header.prior_id(prior_id_loop)=''

for access_url_loop=0,4 do begin

    registry.access_url(access_url_loop).name=''

    registry.access_url(access_url_loop).url=''

    registry.access_url(access_url_loop).style=''

    registry.access_url(access_url_loop).product_key=''

    registry.access_url(access_url_loop).description=''

    registry.access_url(access_url_loop).language=''

endfor

registry.extension=''

return,registry

end

