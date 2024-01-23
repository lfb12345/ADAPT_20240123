
function write_model_run,model_run,spase_ontology,full_xml,full_index,keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(model_run) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

model_run_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),model_run_xml,index,preview=preview

xml_element_write,model_run.resource_id,spase_ontology(1),model_run_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(model_run.resource_header,model_run_xml,index,spase_ontology(2:39),preview=preview,full=full)

temp_xml=xml_structure_write(model_run.access_information,model_run_xml,index,spase_ontology(40:59),preview=preview,full=full)

xml_element_write,model_run.provider_resource_name,spase_ontology(60),model_run_xml,index,blank_check=blank_check,preview=preview

xml_element_write,model_run.provider_processing_level,spase_ontology(61),model_run_xml,index,blank_check=blank_check,preview=preview

xml_element_write,model_run.provider_version,spase_ontology(62),model_run_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(model_run.model_specification,model_run_xml,index,spase_ontology(63:65),preview=preview,full=full)

xml_element_write,model_run.temporal_dependence,spase_ontology(66),model_run_xml,index,blank_check=blank_check,preview=preview

xml_element_write,model_run.modeled_region,spase_ontology(67),model_run_xml,index,blank_check=blank_check,preview=preview

xml_element_write,model_run.likelihood_rating,spase_ontology(68),model_run_xml,index,blank_check=blank_check,preview=preview

xml_element_write,model_run.caveats,spase_ontology(69),model_run_xml,index,blank_check=blank_check,preview=preview

xml_element_write,model_run.keyword,spase_ontology(70),model_run_xml,index,blank_check=blank_check,preview=preview

xml_element_write,model_run.input_resource_id,spase_ontology(71),model_run_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(model_run.model_time,model_run_xml,index,spase_ontology(72:82),preview=preview,full=full)

temp_xml=xml_structure_write(model_run.model_domain,model_run_xml,index,spase_ontology(83:102),preview=preview,full=full)

if keyword_set(keyword_region_parameter) then temp_xml=xml_structure_write(model_run.region_parameter,model_run_xml,index,spase_ontology(103:126),preview=preview,full=full)

if keyword_set(keyword_input_parameter) then temp_xml=xml_structure_write(model_run.input_parameter,model_run_xml,index,spase_ontology(127:149),preview=preview,full=full)

if keyword_set(keyword_input_population) then temp_xml=xml_structure_write(model_run.input_population,model_run_xml,index,spase_ontology(150:171),preview=preview,full=full)

if keyword_set(keyword_input_field) then temp_xml=xml_structure_write(model_run.input_field,model_run_xml,index,spase_ontology(172:192),preview=preview,full=full)

if keyword_set(keyword_input_process) then temp_xml=xml_structure_write(model_run.input_process,model_run_xml,index,spase_ontology(193:206),preview=preview,full=full)

xml_element_write,model_run.extension,spase_ontology(207),model_run_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),model_run_xml,index,preview=preview

xml_mirror,full_xml,model_run_xml,full_index,preview=preview

return,model_run_xml

end

