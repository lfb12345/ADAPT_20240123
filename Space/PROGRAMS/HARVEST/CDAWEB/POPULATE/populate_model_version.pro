
function populate_model_version,spase_ontology,station_info,verbose=verbose

model_version=spase_model_create(spase_ontology,'model_version',verbose=verbose)

model_version.version_tag=''

model_version.release_date=''

model_version.description=''

model_version.caveats=''

return,model_version

end

