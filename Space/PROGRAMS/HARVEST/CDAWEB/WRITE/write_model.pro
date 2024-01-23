
function write_model,model,spase_ontology,full_xml,full_index,keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter,keyword_cubes_description=keyword_cubes_description,keyword_cuts_description=keyword_cuts_description,keyword_plane_normal_vector=keyword_plane_normal_vector,keyword_plane_point=keyword_plane_point,keyword_region_begin=keyword_region_begin,keyword_region_end=keyword_region_end,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(model) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

model_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),model_xml,index,preview=preview

xml_element_write,model.resource_id,spase_ontology(1),model_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(model.resource_header,model_xml,index,spase_ontology(2:39),preview=preview,full=full)

temp_xml=xml_structure_write(model.access_information_optional,model_xml,index,spase_ontology(40:59),preview=preview,full=full)

temp_xml=xml_structure_write(model.versions,model_xml,index,spase_ontology(60:65),preview=preview,full=full)

xml_element_write,model.model_type,spase_ontology(66),model_xml,index,blank_check=blank_check,preview=preview

xml_element_write,model.code_language,spase_ontology(67),model_xml,index,blank_check=blank_check,preview=preview

xml_element_write,model.temporal_dependence,spase_ontology(68),model_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(model.spatial_description,model_xml,index,spase_ontology(69:83),keyword_cubes_description=keyword_cubes_description,keyword_cuts_description=keyword_cuts_description,keyword_plane_normal_vector=keyword_plane_normal_vector,keyword_plane_point=keyword_plane_point,keyword_region_begin=keyword_region_begin,keyword_region_end=keyword_region_end,preview=preview,full=full)

xml_element_write,model.modeled_region,spase_ontology(84),model_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(model.input_properties,model_xml,index,spase_ontology(85:100),preview=preview,full=full)

temp_xml=xml_structure_write(model.output_parameters,model_xml,index,spase_ontology(101:248),keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter,preview=preview,full=full)

xml_element_write,model.model_url,spase_ontology(249),model_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),model_xml,index,preview=preview

xml_mirror,full_xml,model_xml,full_index,preview=preview

return,model_xml

end

