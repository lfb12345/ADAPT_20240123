
function populate_checksum,spase_ontology,station_info,verbose=verbose

checksum=spase_model_create(spase_ontology,'checksum',verbose=verbose)

checksum.hash_value=''

checksum.hash_function=''

return,checksum

end

