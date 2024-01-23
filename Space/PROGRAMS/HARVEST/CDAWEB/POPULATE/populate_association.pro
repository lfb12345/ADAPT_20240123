
function populate_association,spase_ontology,station_info,verbose=verbose

association=spase_model_create(spase_ontology,'association',verbose=verbose)

association.association_id=''

association.association_type=''

association.note=''

return,association

end

