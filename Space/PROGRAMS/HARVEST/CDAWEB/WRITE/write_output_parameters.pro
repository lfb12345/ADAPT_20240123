
function write_output_parameters,output_parameters,spase_ontology,full_xml,full_index,keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(output_parameters) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

output_parameters_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),output_parameters_xml,index,preview=preview

temp_xml=xml_structure_write(output_parameters.parameter,output_parameters_xml,index,spase_ontology(1:147),preview=preview,full=full)

xml_tag_close,spase_ontology(0),output_parameters_xml,index,preview=preview

xml_mirror,full_xml,output_parameters_xml,full_index,preview=preview

return,output_parameters_xml

end

