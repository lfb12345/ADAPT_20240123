
function write_input_process,input_process,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(input_process) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

input_process_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),input_process_xml,index,preview=preview

xml_element_write,input_process.name,spase_ontology(1),input_process_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_process.set,spase_ontology(2),input_process_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_process.parameter_key,spase_ontology(3),input_process_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_process.description,spase_ontology(4),input_process_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_process.caveats,spase_ontology(5),input_process_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_process.modeled_region,spase_ontology(6),input_process_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_process.process_type,spase_ontology(7),input_process_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_process.units,spase_ontology(8),input_process_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_process.units_conversion,spase_ontology(9),input_process_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_process.process_coefficient,spase_ontology(10),input_process_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_process.process_coeff_type,spase_ontology(11),input_process_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_process.process_model,spase_ontology(12),input_process_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_process.model_url,spase_ontology(13),input_process_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),input_process_xml,index,preview=preview

xml_mirror,full_xml,input_process_xml,full_index,preview=preview

return,input_process_xml

end

