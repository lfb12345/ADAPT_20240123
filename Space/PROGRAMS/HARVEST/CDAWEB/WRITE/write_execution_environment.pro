
function write_execution_environment,execution_environment,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(execution_environment) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

execution_environment_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),execution_environment_xml,index,preview=preview

xml_element_write,execution_environment.operating_system,spase_ontology(1),execution_environment_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(execution_environment.installer,execution_environment_xml,index,spase_ontology(2:6),preview=preview,full=full)

xml_element_write,execution_environment.cores,spase_ontology(7),execution_environment_xml,index,blank_check=blank_check,preview=preview

xml_element_write,execution_environment.storage,spase_ontology(8),execution_environment_xml,index,blank_check=blank_check,preview=preview

xml_element_write,execution_environment.memory,spase_ontology(9),execution_environment_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),execution_environment_xml,index,preview=preview

xml_mirror,full_xml,execution_environment_xml,full_index,preview=preview

return,execution_environment_xml

end

