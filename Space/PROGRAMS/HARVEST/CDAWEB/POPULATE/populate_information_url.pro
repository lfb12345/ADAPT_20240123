
function populate_information_url,spase_ontology,station_info,verbose=verbose

information_url=spase_model_create(spase_ontology,'information_url',verbose=verbose)

information_url.name=''

information_url.url=''

information_url.description=''

information_url.language=''

return,information_url

end

