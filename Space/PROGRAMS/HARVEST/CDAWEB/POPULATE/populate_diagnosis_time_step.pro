
function populate_diagnosis_time_step,spase_ontology,station_info,verbose=verbose

diagnosis_time_step=spase_model_create(spase_ontology,'diagnosis_time_step',verbose=verbose)

diagnosis_time_step.time_start=''

diagnosis_time_step.duration=''

diagnosis_time_step.saved_quantity=''

return,diagnosis_time_step

end

