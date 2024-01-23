
function populate_model_domain,spase_ontology,station_info,verbose=verbose

model_domain=spase_model_create(spase_ontology,'model_domain',verbose=verbose)

symmetry_list=['','Axial','Central','None','Plane']

model_domain.coordinate_system.coordinate_representation=''

model_domain.coordinate_system.coordinate_system_name=''

model_domain.description=''

model_domain.caveats=''

model_domain.spatial_dimension=''

model_domain.velocity_dimension=''

model_domain.field_dimension=''

model_domain.units=''

model_domain.units_conversion=''

model_domain.coordinates_label=''

model_domain.valid_min=''

model_domain.valid_max=''

model_domain.grid_structure=''

model_domain.grid_cell_size=''

model_domain.symmetry=''

model_domain.boundary_conditions.particle_boundary=''

model_domain.boundary_conditions.field_boundary=''

return,model_domain

end

