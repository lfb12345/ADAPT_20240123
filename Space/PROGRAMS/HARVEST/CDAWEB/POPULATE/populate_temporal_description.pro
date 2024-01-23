
function populate_temporal_description,spase_ontology,station_info,verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date

temporal_description=spase_model_create(spase_ontology,'temporal_description',verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date)

temporal_description.time_span.start_date=''

if keyword_set(keyword_stop_date) then temporal_description.time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then temporal_description.time_span.relative_stop_date=''

temporal_description.time_span.note=''

temporal_description.cadence=''

temporal_description.cadence_min=''

temporal_description.cadence_max=''

temporal_description.exposure=''

temporal_description.exposure_min=''

temporal_description.exposure_max=''

return,temporal_description

end

