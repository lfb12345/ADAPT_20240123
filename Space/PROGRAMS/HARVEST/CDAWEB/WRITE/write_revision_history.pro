
function write_revision_history,revision_history,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(revision_history) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

revision_history_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),revision_history_xml,index,preview=preview

temp_xml=xml_structure_write(revision_history.revision_event,revision_history_xml,index,spase_ontology(1:3),preview=preview,full=full)

xml_tag_close,spase_ontology(0),revision_history_xml,index,preview=preview

xml_mirror,full_xml,revision_history_xml,full_index,preview=preview

return,revision_history_xml

end

