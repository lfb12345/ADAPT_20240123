
function populate_person,spase_ontology,station_info,verbose=verbose

person=spase_model_create(spase_ontology,'person',verbose=verbose)

person.resource_id=''

person.release_date=''

person.person_name=''

person.organization_name=''

person.address=''

person.email=''

person.phone_number=''

person.fax_number=''

person.orcidentifier=''

person.note=''

person.extension=''

return,person

end

