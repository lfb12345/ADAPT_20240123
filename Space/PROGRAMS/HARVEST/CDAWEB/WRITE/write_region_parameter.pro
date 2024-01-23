
function write_region_parameter,region_parameter,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(region_parameter) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

region_parameter_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),region_parameter_xml,index,preview=preview

xml_element_write,region_parameter.modeled_region,spase_ontology(1),region_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,region_parameter.description,spase_ontology(2),region_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,region_parameter.caveats,spase_ontology(3),region_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,region_parameter.radius,spase_ontology(4),region_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,region_parameter.sub_longitude,spase_ontology(5),region_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,region_parameter.period,spase_ontology(6),region_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,region_parameter.object_mass,spase_ontology(7),region_parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,region_parameter.input_table_url,spase_ontology(8),region_parameter_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(region_parameter.property,region_parameter_xml,index,spase_ontology(9:23),preview=preview,full=full)

xml_tag_close,spase_ontology(0),region_parameter_xml,index,preview=preview

xml_mirror,full_xml,region_parameter_xml,full_index,preview=preview

return,region_parameter_xml

end

