
function populate_resource_header,spase_ontology,station_info,verbose=verbose

resource_header=spase_model_create(spase_ontology,'resource_header',verbose=verbose)

role_list= $
   ['','Author','ArchiveSpecialist','CoInvestigator','CoPI','Contributor', $
    'DataProducer','DeputyPI','Developer','FormerPI','GeneralContact', $
    'HostContact','InstrumentLead','InstrumentScientist','MetadataContact', $
    'MissionManager','MissionPrincipalInvestigator','PrincipalInvestigator', $
    'ProgramManager','ProgramScientist','ProjectEngineer','ProjectManager', $
    'ProjectScientist','Publisher','Scientist','TeamLeader','TeamMember', $
    'TechnicalContact','User']

resource_header.resource_name=''

resource_header.alternate_name=''

resource_header.doi=''

resource_header.release_date=''

for revision_history_loop=0,14 do begin

    resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

resource_header.expiration_date=''

resource_header.description=''

resource_header.acknowledgement=''

resource_header.publication_info.title=''

resource_header.publication_info.authors=''

resource_header.publication_info.publication_date=''

resource_header.publication_info.published_by=''

resource_header.publication_info.landing_page_url=''

resource_header.funding.agency=''

resource_header.funding.project=''

resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do resource_header.contact(contact_loop).role(role_loop)=''

    resource_header.contact(contact_loop).start_date=''

    resource_header.contact(contact_loop).stop_date=''

    resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    resource_header.information_url(information_url_loop).name=''

    resource_header.information_url(information_url_loop).url=''

    resource_header.information_url(information_url_loop).description=''

    resource_header.information_url(information_url_loop).language=''

endfor

resource_header.association.association_id=''

resource_header.association.association_type=''

resource_header.association.note=''

for prior_id_loop=0,8 do resource_header.prior_id(prior_id_loop)=''

return,resource_header

end

