
function populate_output_property,spase_ontology,station_info,verbose=verbose

output_property=spase_model_create(spase_ontology,'output_property',verbose=verbose)

output_property.name=''

output_property.description=''

output_property.caveats=''

output_property.units=''

output_property.valid_min=''

output_property.valid_max=''

return,output_property

end

