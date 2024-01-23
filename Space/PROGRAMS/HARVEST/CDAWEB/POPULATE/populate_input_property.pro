
function populate_input_property,spase_ontology,station_info,verbose=verbose

input_property=spase_model_create(spase_ontology,'input_property',verbose=verbose)

input_property.name=''

input_property.description=''

input_property.caveats=''

input_property.units=''

input_property.valid_min=''

input_property.valid_max=''

return,input_property

end

