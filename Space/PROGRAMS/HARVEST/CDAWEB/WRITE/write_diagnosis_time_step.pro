
function write_diagnosis_time_step,diagnosis_time_step,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(diagnosis_time_step) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

diagnosis_time_step_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),diagnosis_time_step_xml,index,preview=preview

xml_element_write,diagnosis_time_step.time_start,spase_ontology(1),diagnosis_time_step_xml,index,blank_check=blank_check,preview=preview

xml_element_write,diagnosis_time_step.duration,spase_ontology(2),diagnosis_time_step_xml,index,blank_check=blank_check,preview=preview

xml_element_write,diagnosis_time_step.saved_quantity,spase_ontology(3),diagnosis_time_step_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),diagnosis_time_step_xml,index,preview=preview

xml_mirror,full_xml,diagnosis_time_step_xml,full_index,preview=preview

return,diagnosis_time_step_xml

end

