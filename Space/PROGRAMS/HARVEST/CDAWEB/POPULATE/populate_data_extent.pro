
function populate_data_extent,spase_ontology,station_info,verbose=verbose

data_extent=spase_model_create(spase_ontology,'data_extent',verbose=verbose)

data_extent.quantity=''

data_extent.units=''

data_extent.per=''

return,data_extent

end

