
function write_output_property,output_property,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(output_property) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

output_property_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),output_property_xml,index,preview=preview

xml_element_write,output_property.name,spase_ontology(1),output_property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,output_property.description,spase_ontology(2),output_property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,output_property.caveats,spase_ontology(3),output_property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,output_property.units,spase_ontology(4),output_property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,output_property.valid_min,spase_ontology(5),output_property_xml,index,blank_check=blank_check,preview=preview

xml_element_write,output_property.valid_max,spase_ontology(6),output_property_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),output_property_xml,index,preview=preview

xml_mirror,full_xml,output_property_xml,full_index,preview=preview

return,output_property_xml

end

