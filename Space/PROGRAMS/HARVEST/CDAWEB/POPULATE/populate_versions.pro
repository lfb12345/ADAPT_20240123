
function populate_versions,spase_ontology,station_info,verbose=verbose

versions=spase_model_create(spase_ontology,'versions',verbose=verbose)

versions.model_version.version_tag=''

versions.model_version.release_date=''

versions.model_version.description=''

versions.model_version.caveats=''

return,versions

end

