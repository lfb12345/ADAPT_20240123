
function populate_boundary_conditions,spase_ontology,station_info,verbose=verbose

boundary_conditions=spase_model_create(spase_ontology,'boundary_conditions',verbose=verbose)

boundary_conditions.particle_boundary=''

boundary_conditions.field_boundary=''

return,boundary_conditions

end

