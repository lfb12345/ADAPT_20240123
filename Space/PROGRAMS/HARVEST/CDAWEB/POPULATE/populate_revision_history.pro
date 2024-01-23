
function populate_revision_history,spase_ontology,station_info,verbose=verbose

revision_history=spase_model_create(spase_ontology,'revision_history',verbose=verbose)

revision_history.revision_event.release_date=''

revision_history.revision_event.note=''

return,revision_history

end

