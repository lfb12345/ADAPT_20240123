
function write_field,field,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(field) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

field_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),field_xml,index,preview=preview

xml_element_write,field.qualifier,spase_ontology(1),field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,field.field_quantity,spase_ontology(2),field_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(field.frequency_range,field_xml,index,spase_ontology(3:11),preview=preview,full=full)

xml_tag_close,spase_ontology(0),field_xml,index,preview=preview

xml_mirror,full_xml,field_xml,full_index,preview=preview

return,field_xml

end

