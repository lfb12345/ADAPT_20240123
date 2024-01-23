
function populate_spatial_coverage,spase_ontology,station_info,verbose=verbose

spatial_coverage=spase_model_create(spase_ontology,'spatial_coverage',verbose=verbose)

spatial_coverage.coordinate_system.coordinate_representation=''

spatial_coverage.coordinate_system.coordinate_system_name=''

spatial_coverage.center_latitude=''

spatial_coverage.northernmost_latitude=''

spatial_coverage.southernmost_latitude=''

spatial_coverage.center_longitude=''

spatial_coverage.easternmost_longitude=''

spatial_coverage.westernmost_longitude=''

spatial_coverage.center_elevation=''

spatial_coverage.minimum_elevation=''

spatial_coverage.maximum_elevation=''

spatial_coverage.acknowledgement=''

spatial_coverage.description=''

return,spatial_coverage

end

