
function populate_model_specification,spase_ontology,station_info,verbose=verbose

model_specification=spase_model_create(spase_ontology,'model_specification',verbose=verbose)

model_specification.model_id=''

model_specification.version_tag=''

return,model_specification

end

