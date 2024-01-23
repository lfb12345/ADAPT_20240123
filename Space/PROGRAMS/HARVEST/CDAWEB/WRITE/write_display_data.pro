
function write_display_data,display_data,spase_ontology,full_xml,full_index,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(display_data) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

display_data_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),display_data_xml,index,preview=preview

xml_element_write,display_data.resource_id,spase_ontology(1),display_data_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(display_data.resource_header,display_data_xml,index,spase_ontology(2:39),preview=preview,full=full)

temp_xml=xml_structure_write(display_data.access_information,display_data_xml,index,spase_ontology(40:59),preview=preview,full=full)

xml_element_write,display_data.processing_level,spase_ontology(60),display_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_data.provider_name,spase_ontology(61),display_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_data.provider_resource_name,spase_ontology(62),display_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_data.provider_processing_level,spase_ontology(63),display_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_data.provider_version,spase_ontology(64),display_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_data.instrument_id,spase_ontology(65),display_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_data.measurement_type,spase_ontology(66),display_data_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(display_data.temporal_description,display_data_xml,index,spase_ontology(67:78),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

xml_element_write,display_data.spectral_range,spase_ontology(79),display_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_data.display_cadence,spase_ontology(80),display_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_data.observed_region,spase_ontology(81),display_data_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(display_data.spatial_coverage,display_data_xml,index,spase_ontology(82:96),preview=preview,full=full)

xml_element_write,display_data.caveats,spase_ontology(97),display_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_data.keyword,spase_ontology(98),display_data_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_data.input_resource_id,spase_ontology(99),display_data_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(display_data.parameter,display_data_xml,index,spase_ontology(100:246),preview=preview,full=full)

xml_element_write,display_data.extension,spase_ontology(247),display_data_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),display_data_xml,index,preview=preview

xml_mirror,full_xml,display_data_xml,full_index,preview=preview

return,display_data_xml

end

