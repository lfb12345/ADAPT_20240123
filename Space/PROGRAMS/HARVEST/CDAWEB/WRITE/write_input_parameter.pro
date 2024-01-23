
function write_input_parameter,input_parameter,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(input_parameter) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

input_parameter_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),input_parameter_xml,index,preview=preview

xml_element_write,input_parameter.name,spase_ontology(1),input_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_parameter.description,spase_ontology(2),input_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_parameter.caveats,spase_ontology(3),input_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_parameter.modeled_region,spase_ontology(4),input_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_parameter.qualifier,spase_ontology(5),input_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_parameter.input_table_url,spase_ontology(6),input_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_parameter.parameter_quantity,spase_ontology(7),input_parameter_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(input_parameter.property,input_parameter_xml,index,spase_ontology(8:22),preview=preview,full=full)

xml_tag_close,spase_ontology(0),input_parameter_xml,index,preview=preview

xml_mirror,full_xml,input_parameter_xml,full_index,preview=preview

return,input_parameter_xml

end

