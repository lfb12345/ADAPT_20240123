
function write_operating_span,operating_span,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(operating_span) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

operating_span_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),operating_span_xml,index,preview=preview

xml_element_write,operating_span.start_date,spase_ontology(1),operating_span_xml,index,blank_check=blank_check,preview=preview

xml_element_write,operating_span.stop_date,spase_ontology(2),operating_span_xml,index,blank_check=blank_check,preview=preview

xml_element_write,operating_span.note,spase_ontology(3),operating_span_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),operating_span_xml,index,preview=preview

xml_mirror,full_xml,operating_span_xml,full_index,preview=preview

return,operating_span_xml

end

