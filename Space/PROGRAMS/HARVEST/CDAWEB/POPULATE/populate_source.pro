
function populate_source,spase_ontology,station_info,verbose=verbose

source=spase_model_create(spase_ontology,'source',verbose=verbose)

source.source_type=''

source.url=''

source.mirror_url=''

source.checksum.hash_value=''

source.checksum.hash_function=''

source.data_extent.quantity=''

source.data_extent.units=''

source.data_extent.per=''

return,source

end

