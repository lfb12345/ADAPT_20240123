
function write_input_properties,input_properties,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(input_properties) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

input_properties_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),input_properties_xml,index,preview=preview

temp_xml=xml_structure_write(input_properties.property,input_properties_xml,index,spase_ontology(1:15),preview=preview,full=full)

xml_tag_close,spase_ontology(0),input_properties_xml,index,preview=preview

xml_mirror,full_xml,input_properties_xml,full_index,preview=preview

return,input_properties_xml

end

