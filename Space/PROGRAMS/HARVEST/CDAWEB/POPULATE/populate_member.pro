
function populate_member,spase_ontology,station_info,verbose=verbose

member=spase_model_create(spase_ontology,'member',verbose=verbose)

member.resource_name=''

member.description=''

member.member_id=''

member.start_date=''

member.stop_date=''

member.spatial_coverage.coordinate_system.coordinate_representation=''

member.spatial_coverage.coordinate_system.coordinate_system_name=''

member.spatial_coverage.center_latitude=''

member.spatial_coverage.northernmost_latitude=''

member.spatial_coverage.southernmost_latitude=''

member.spatial_coverage.center_longitude=''

member.spatial_coverage.easternmost_longitude=''

member.spatial_coverage.westernmost_longitude=''

member.spatial_coverage.center_elevation=''

member.spatial_coverage.minimum_elevation=''

member.spatial_coverage.maximum_elevation=''

member.spatial_coverage.acknowledgement=''

member.spatial_coverage.description=''

return,member

end

