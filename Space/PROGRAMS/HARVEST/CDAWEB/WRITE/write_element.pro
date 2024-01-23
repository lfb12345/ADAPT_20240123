
function write_element,element,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(element) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

element_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),element_xml,index,preview=preview

xml_element_write,element.name,spase_ontology(1),element_xml,index,blank_check=blank_check,preview=preview

xml_element_write,element.qualifier,spase_ontology(2),element_xml,index,blank_check=blank_check,preview=preview

xml_element_write,element.index,spase_ontology(3),element_xml,index,blank_check=blank_check,preview=preview

xml_element_write,element.parameter_key,spase_ontology(4),element_xml,index,blank_check=blank_check,preview=preview

xml_element_write,element.units,spase_ontology(5),element_xml,index,blank_check=blank_check,preview=preview

xml_element_write,element.units_conversion,spase_ontology(6),element_xml,index,blank_check=blank_check,preview=preview

xml_element_write,element.valid_min,spase_ontology(7),element_xml,index,blank_check=blank_check,preview=preview

xml_element_write,element.valid_max,spase_ontology(8),element_xml,index,blank_check=blank_check,preview=preview

xml_element_write,element.fill_value,spase_ontology(9),element_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(element.rendering_hints,element_xml,index,spase_ontology(10:18),preview=preview,full=full)

xml_tag_close,spase_ontology(0),element_xml,index,preview=preview

xml_mirror,full_xml,element_xml,full_index,preview=preview

return,element_xml

end

