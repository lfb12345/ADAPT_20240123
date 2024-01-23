
function write_input_field,input_field,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(input_field) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

input_field_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),input_field_xml,index,preview=preview

xml_element_write,input_field.name,spase_ontology(1),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.set,spase_ontology(2),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.parameter_key,spase_ontology(3),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.description,spase_ontology(4),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.caveats,spase_ontology(5),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.modeled_region,spase_ontology(6),input_field_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(input_field.coordinate_system,input_field_xml,index,spase_ontology(7:9),preview=preview,full=full)

xml_element_write,input_field.qualifier,spase_ontology(10),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.field_quantity,spase_ontology(11),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.units,spase_ontology(12),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.units_conversion,spase_ontology(13),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.input_label,spase_ontology(14),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.field_value,spase_ontology(15),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.input_table_url,spase_ontology(16),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.valid_min,spase_ontology(17),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.valid_max,spase_ontology(18),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.field_model,spase_ontology(19),input_field_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_field.model_url,spase_ontology(20),input_field_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),input_field_xml,index,preview=preview

xml_mirror,full_xml,input_field_xml,full_index,preview=preview

return,input_field_xml

end

