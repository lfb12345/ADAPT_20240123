
function populate_location,spase_ontology,station_info,verbose=verbose

location=spase_model_create(spase_ontology,'location',verbose=verbose)

location.observatory_region=''

location.coordinate_system_name=''

location.latitude=''

location.longitude=''

location.elevation=''

return,location

end

