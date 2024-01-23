
function populate_funding,spase_ontology,station_info,verbose=verbose

funding=spase_model_create(spase_ontology,'funding',verbose=verbose)

funding.agency=''

funding.project=''

funding.award_number=''

return,funding

end

