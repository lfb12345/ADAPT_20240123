
function populate_bin,spase_ontology,station_info,verbose=verbose

bin=spase_model_create(spase_ontology,'bin',verbose=verbose)

bin.band_name=''

bin.low=''

bin.high=''

return,bin

end

