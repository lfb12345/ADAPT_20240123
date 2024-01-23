
function populate_contact,spase_ontology,station_info,verbose=verbose

contact=spase_model_create(spase_ontology,'contact',verbose=verbose)

role_list= $
   ['','Author','ArchiveSpecialist','CoInvestigator','CoPI','Contributor', $
    'DataProducer','DeputyPI','Developer','FormerPI','GeneralContact', $
    'HostContact','InstrumentLead','InstrumentScientist','MetadataContact', $
    'MissionManager','MissionPrincipalInvestigator','PrincipalInvestigator', $
    'ProgramManager','ProgramScientist','ProjectEngineer','ProjectManager', $
    'ProjectScientist','Publisher','Scientist','TeamLeader','TeamMember', $
    'TechnicalContact','User']

contact.person_id=''

for role_loop=0,4 do contact.role(role_loop)=''

contact.start_date=''

contact.stop_date=''

contact.note=''

return,contact

end

