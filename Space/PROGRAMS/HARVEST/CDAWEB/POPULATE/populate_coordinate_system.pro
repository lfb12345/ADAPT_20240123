
function populate_coordinate_system,spase_ontology,station_info,verbose=verbose

coordinate_system=spase_model_create(spase_ontology,'coordinate_system',verbose=verbose)

coordinate_system.coordinate_representation=''

coordinate_system.coordinate_system_name=''

return,coordinate_system

end

