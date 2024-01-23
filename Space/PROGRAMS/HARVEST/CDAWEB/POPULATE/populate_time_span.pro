
function populate_time_span,spase_ontology,station_info,verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date

time_span=spase_model_create(spase_ontology,'time_span',verbose=verbose,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date)

time_span.start_date=''

if keyword_set(keyword_stop_date) then time_span.stop_date=''

if keyword_set(keyword_relative_stop_date) then time_span.relative_stop_date=''

time_span.note=''

return,time_span

end

