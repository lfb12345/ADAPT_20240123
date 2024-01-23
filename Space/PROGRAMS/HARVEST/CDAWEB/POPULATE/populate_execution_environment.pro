
function populate_execution_environment,spase_ontology,station_info,verbose=verbose

execution_environment=spase_model_create(spase_ontology,'execution_environment',verbose=verbose)

availability_list=['','Offline','Online']

execution_environment.operating_system=''

execution_environment.installer.availability=''

execution_environment.installer.access_rights=''

execution_environment.installer.acknowledgement=''

execution_environment.installer.url=''

execution_environment.cores=''

execution_environment.storage=''

execution_environment.memory=''

return,execution_environment

end

