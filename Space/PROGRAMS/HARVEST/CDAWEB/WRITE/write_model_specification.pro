
function write_model_specification,model_specification,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(model_specification) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

model_specification_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),model_specification_xml,index,preview=preview

xml_element_write,model_specification.model_id,spase_ontology(1),model_specification_xml,index,blank_check=blank_check,preview=preview

xml_element_write,model_specification.version_tag,spase_ontology(2),model_specification_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),model_specification_xml,index,preview=preview

xml_mirror,full_xml,model_specification_xml,full_index,preview=preview

return,model_specification_xml

end

