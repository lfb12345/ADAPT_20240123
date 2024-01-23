
function write_time_span,time_span,spase_ontology,full_xml,full_index,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(time_span) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

time_span_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),time_span_xml,index,preview=preview

xml_element_write,time_span.start_date,spase_ontology(1),time_span_xml,index,blank_check=blank_check,preview=preview

if keyword_set(keyword_stop_date) then xml_element_write,time_span.stop_date,spase_ontology(2),time_span_xml,index,blank_check=blank_check,preview=preview

if keyword_set(keyword_relative_stop_date) then xml_element_write,time_span.relative_stop_date,spase_ontology(3),time_span_xml,index,blank_check=blank_check,preview=preview

xml_element_write,time_span.note,spase_ontology(4),time_span_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),time_span_xml,index,preview=preview

xml_mirror,full_xml,time_span_xml,full_index,preview=preview

return,time_span_xml

end

