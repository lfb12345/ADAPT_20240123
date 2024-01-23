
function write_revision_event,revision_event,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(revision_event) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

revision_event_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),revision_event_xml,index,preview=preview

xml_element_write,revision_event.release_date,spase_ontology(1),revision_event_xml,index,blank_check=blank_check,preview=preview

xml_element_write,revision_event.note,spase_ontology(2),revision_event_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),revision_event_xml,index,preview=preview

xml_mirror,full_xml,revision_event_xml,full_index,preview=preview

return,revision_event_xml

end

