
function write_property,property,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(property) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

property_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),property_xml,index,preview=preview

xml_element_write,property.name,spase_ontology(1),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.description,spase_ontology(2),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.caveats,spase_ontology(3),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.property_quantity,spase_ontology(4),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.qualifier,spase_ontology(5),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.units,spase_ontology(6),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.units_conversion,spase_ontology(7),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.property_label,spase_ontology(8),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.property_value,spase_ontology(9),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.property_table_url,spase_ontology(10),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.valid_min,spase_ontology(11),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.valid_max,spase_ontology(12),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.property_model,spase_ontology(13),property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,property.model_url,spase_ontology(14),property_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),property_xml,index,preview=preview

xml_mirror,full_xml,property_xml,full_index,preview=preview

return,property_xml

end

