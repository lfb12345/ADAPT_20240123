
function populate_operating_span,spase_ontology,station_info,verbose=verbose

operating_span=spase_model_create(spase_ontology,'operating_span',verbose=verbose)

operating_span.start_date=''

operating_span.stop_date=''

operating_span.note=''

return,operating_span

end

