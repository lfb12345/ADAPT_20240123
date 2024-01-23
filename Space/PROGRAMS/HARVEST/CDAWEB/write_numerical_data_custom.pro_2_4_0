
function write_numerical_data_custom,numerical_data,spase_ontology,resource_info,full_xml,full_index,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,keyword_field=keyword_field,keyword_mixed=keyword_mixed,keyword_particle=keyword_particle,keyword_support=keyword_support,keyword_wave=keyword_wave,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(numerical_data) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

numerical_data_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),numerical_data_xml,index,preview=preview

xml_element_write,numerical_data.resource_id,spase_ontology(1),numerical_data_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(numerical_data.resource_header,numerical_data_xml,index,spase_ontology(2:37),preview=preview,full=full)

temp_xml=xml_structure_write(numerical_data.access_information,numerical_data_xml,index,spase_ontology(38:55),preview=preview,full=full)

xml_element_write,numerical_data.processing_level,spase_ontology(56),numerical_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,numerical_data.provider_name,spase_ontology(57),numerical_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,numerical_data.provider_resource_name,spase_ontology(58),numerical_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,numerical_data.provider_processing_level,spase_ontology(59),numerical_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,numerical_data.provider_version,spase_ontology(60),numerical_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,numerical_data.instrument_id,spase_ontology(61),numerical_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,numerical_data.measurement_type,spase_ontology(62),numerical_data_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(numerical_data.temporal_description,numerical_data_xml,index,spase_ontology(63:74),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

xml_element_write,numerical_data.spectral_range,spase_ontology(75),numerical_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,numerical_data.observed_region,spase_ontology(76),numerical_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,numerical_data.caveats,spase_ontology(77),numerical_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,numerical_data.keyword,spase_ontology(78),numerical_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,numerical_data.input_resource_id,spase_ontology(79),numerical_data_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(numerical_data.parameter,numerical_data_xml,index,spase_ontology(80:222),keyword_field=keyword_field,keyword_mixed=keyword_mixed,keyword_particle=keyword_particle,keyword_support=keyword_support,keyword_wave=keyword_wave,preview=preview,full=full)

xml_element_write,numerical_data.extension,spase_ontology(223),numerical_data_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),numerical_data_xml,index,preview=preview

xml_mirror,full_xml,numerical_data_xml,full_index,preview=preview

return,numerical_data_xml

end

