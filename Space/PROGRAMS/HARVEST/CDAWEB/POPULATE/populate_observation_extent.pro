
function populate_observation_extent,spase_ontology,station_info,verbose=verbose

observation_extent=spase_model_create(spase_ontology,'observation_extent',verbose=verbose)

for observed_region_loop=0,14 do observation_extent.observed_region(observed_region_loop)=''

observation_extent.start_location=''

observation_extent.stop_location=''

observation_extent.note=''

return,observation_extent

end

