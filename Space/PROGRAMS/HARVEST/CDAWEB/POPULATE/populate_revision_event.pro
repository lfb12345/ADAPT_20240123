
function populate_revision_event,spase_ontology,station_info,verbose=verbose

revision_event=spase_model_create(spase_ontology,'revision_event',verbose=verbose)

revision_event.release_date=''

revision_event.note=''

return,revision_event

end

