
function write_software,software,spase_ontology,full_xml,full_index,keyword_input_property=keyword_input_property,keyword_output_property=keyword_output_property,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(software) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

software_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),software_xml,index,preview=preview

xml_element_write,software.resource_id,spase_ontology(1),software_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(software.resource_header,software_xml,index,spase_ontology(2:39),preview=preview,full=full)

temp_xml=xml_structure_write(software.access_information,software_xml,index,spase_ontology(40:59),preview=preview,full=full)

xml_element_write,software.software_version,spase_ontology(60),software_xml,index,blank_check=blank_check,preview=preview

xml_element_write,software.application_interface,spase_ontology(61),software_xml,index,blank_check=blank_check,preview=preview

xml_element_write,software.code_language,spase_ontology(62),software_xml,index,blank_check=blank_check,preview=preview

xml_element_write,software.prerequisites,spase_ontology(63),software_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(software.execution_environment,software_xml,index,spase_ontology(64:73),preview=preview,full=full)

if keyword_set(keyword_input_property) then temp_xml=xml_structure_write(software.input_property,software_xml,index,spase_ontology(74:80),preview=preview,full=full)

if keyword_set(keyword_output_property) then temp_xml=xml_structure_write(software.output_property,software_xml,index,spase_ontology(81:87),preview=preview,full=full)

xml_tag_close,spase_ontology(0),software_xml,index,preview=preview

xml_mirror,full_xml,software_xml,full_index,preview=preview

return,software_xml

end

