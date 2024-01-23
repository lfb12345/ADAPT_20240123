
function populate_observatory,spase_ontology,station_info,verbose=verbose

observatory=spase_model_create(spase_ontology,'observatory',verbose=verbose)

role_list= $
   ['','Author','ArchiveSpecialist','CoInvestigator','CoPI','Contributor', $
    'DataProducer','DeputyPI','Developer','FormerPI','GeneralContact', $
    'HostContact','InstrumentLead','InstrumentScientist','MetadataContact', $
    'MissionManager','MissionPrincipalInvestigator','PrincipalInvestigator', $
    'ProgramManager','ProgramScientist','ProjectEngineer','ProjectManager', $
    'ProjectScientist','Publisher','Scientist','TeamLeader','TeamMember', $
    'TechnicalContact','User']

observatory.resource_id=''

observatory.resource_header.resource_name=''

observatory.resource_header.alternate_name=''

observatory.resource_header.doi=''

observatory.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    observatory.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    observatory.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

observatory.resource_header.expiration_date=''

observatory.resource_header.description=''

observatory.resource_header.acknowledgement=''

observatory.resource_header.publication_info.title=''

observatory.resource_header.publication_info.authors=''

observatory.resource_header.publication_info.publication_date=''

observatory.resource_header.publication_info.published_by=''

observatory.resource_header.publication_info.landing_page_url=''

observatory.resource_header.funding.agency=''

observatory.resource_header.funding.project=''

observatory.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    observatory.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do observatory.resource_header.contact(contact_loop).role(role_loop)=''

    observatory.resource_header.contact(contact_loop).start_date=''

    observatory.resource_header.contact(contact_loop).stop_date=''

    observatory.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    observatory.resource_header.information_url(information_url_loop).name=''

    observatory.resource_header.information_url(information_url_loop).url=''

    observatory.resource_header.information_url(information_url_loop).description=''

    observatory.resource_header.information_url(information_url_loop).language=''

endfor

observatory.resource_header.association.association_id=''

observatory.resource_header.association.association_type=''

observatory.resource_header.association.note=''

for prior_id_loop=0,8 do observatory.resource_header.prior_id(prior_id_loop)=''

observatory.observatory_group_id=''

observatory.location.observatory_region=''

observatory.location.coordinate_system_name=''

observatory.location.latitude=''

observatory.location.longitude=''

observatory.location.elevation=''

observatory.operating_span.start_date=''

observatory.operating_span.stop_date=''

observatory.operating_span.note=''

observatory.extension=''

return,observatory

end

