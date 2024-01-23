
function populate_annotation,spase_ontology,station_info,verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date

annotation=spase_model_create(spase_ontology,'annotation',verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date)

role_list= $
   ['','Author','ArchiveSpecialist','CoInvestigator','CoPI','Contributor', $
    'DataProducer','DeputyPI','Developer','FormerPI','GeneralContact', $
    'HostContact','InstrumentLead','InstrumentScientist','MetadataContact', $
    'MissionManager','MissionPrincipalInvestigator','PrincipalInvestigator', $
    'ProgramManager','ProgramScientist','ProjectEngineer','ProjectManager', $
    'ProjectScientist','Publisher','Scientist','TeamLeader','TeamMember', $
    'TechnicalContact','User']

annotation.resource_id=''

annotation.resource_header.resource_name=''

annotation.resource_header.alternate_name=''

annotation.resource_header.doi=''

annotation.resource_header.release_date=''

for revision_history_loop=0,14 do begin

    annotation.resource_header.revision_history(revision_history_loop).revision_event.release_date=''

    annotation.resource_header.revision_history(revision_history_loop).revision_event.note=''

endfor

annotation.resource_header.expiration_date=''

annotation.resource_header.description=''

annotation.resource_header.acknowledgement=''

annotation.resource_header.publication_info.title=''

annotation.resource_header.publication_info.authors=''

annotation.resource_header.publication_info.publication_date=''

annotation.resource_header.publication_info.published_by=''

annotation.resource_header.publication_info.landing_page_url=''

annotation.resource_header.funding.agency=''

annotation.resource_header.funding.project=''

annotation.resource_header.funding.award_number=''

for contact_loop=0,14 do begin

    annotation.resource_header.contact(contact_loop).person_id=''

    for role_loop=0,4 do annotation.resource_header.contact(contact_loop).role(role_loop)=''

    annotation.resource_header.contact(contact_loop).start_date=''

    annotation.resource_header.contact(contact_loop).stop_date=''

    annotation.resource_header.contact(contact_loop).note=''

endfor

for information_url_loop=0,14 do begin

    annotation.resource_header.information_url(information_url_loop).name=''

    annotation.resource_header.information_url(information_url_loop).url=''

    annotation.resource_header.information_url(information_url_loop).description=''

    annotation.resource_header.information_url(information_url_loop).language=''

endfor

annotation.resource_header.association.association_id=''

annotation.resource_header.association.association_type=''

annotation.resource_header.association.note=''

for prior_id_loop=0,8 do annotation.resource_header.prior_id(prior_id_loop)=''

annotation.image_url=''

annotation.annotation_type=''

for phenomenon_type_loop=0,4 do annotation.phenomenon_type(phenomenon_type_loop)=''

annotation.classification_method=''

annotation.confidence_rating=''

annotation.time_span.start_date=''

if keyword_set(keyword_stop_date) then annotation.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then annotation.time_span.relative_stop_date=''

annotation.time_span.note=''

for observed_region_loop=0,14 do annotation.observation_extent.observed_region(observed_region_loop)=''

annotation.observation_extent.start_location=''

annotation.observation_extent.stop_location=''

annotation.observation_extent.note=''

annotation.extension=''

return,annotation

end

