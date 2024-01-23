
function populate_input_process,spase_ontology,station_info,verbose=verbose

input_process=spase_model_create(spase_ontology,'input_process',verbose=verbose)

input_process.name=''

input_process.set=''

input_process.parameter_key=''

input_process.description=''

input_process.caveats=''

input_process.modeled_region=''

input_process.process_type=''

input_process.units=''

input_process.units_conversion=''

input_process.process_coefficient=''

input_process.process_coeff_type=''

input_process.process_model=''

input_process.model_url=''

return,input_process

end

