
function populate_model_time,spase_ontology,station_info,verbose=verbose

model_time=spase_model_create(spase_ontology,'model_time',verbose=verbose)

model_time.description=''

model_time.caveats=''

model_time.duration=''

model_time.time_start=''

model_time.time_stop=''

model_time.time_step=''

model_time.diagnosis_time_step.time_start=''

model_time.diagnosis_time_step.duration=''

model_time.diagnosis_time_step.saved_quantity=''

return,model_time

end

