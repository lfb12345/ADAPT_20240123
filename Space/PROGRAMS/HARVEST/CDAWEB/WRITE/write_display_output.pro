
function write_display_output,display_output,spase_ontology,full_xml,full_index,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(display_output) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

display_output_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),display_output_xml,index,preview=preview

xml_element_write,display_output.resource_id,spase_ontology(1),display_output_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(display_output.resource_header,display_output_xml,index,spase_ontology(2:39),preview=preview,full=full)

temp_xml=xml_structure_write(display_output.access_information,display_output_xml,index,spase_ontology(40:59),preview=preview,full=full)

xml_element_write,display_output.processing_level,spase_ontology(60),display_output_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_output.provider_resource_name,spase_ontology(61),display_output_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_output.provider_processing_level,spase_ontology(62),display_output_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_output.provider_version,spase_ontology(63),display_output_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_output.modeled_instrument_id,spase_ontology(64),display_output_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_output.measurement_type,spase_ontology(65),display_output_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(display_output.temporal_description,display_output_xml,index,spase_ontology(66:77),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(display_output.spatial_description,display_output_xml,index,spase_ontology(78:92),keyword_cubes_description=keyword_cubes_description,keyword_cuts_description=keyword_cuts_description,keyword_plane_normal_vector=keyword_plane_normal_vector,keyword_plane_point=keyword_plane_point,keyword_region_begin=keyword_region_begin,keyword_region_end=keyword_region_end,preview=preview,full=full)

xml_element_write,display_output.spectral_range,spase_ontology(93),display_output_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_output.display_cadence,spase_ontology(94),display_output_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_output.modeled_region,spase_ontology(95),display_output_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_output.caveats,spase_ontology(96),display_output_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_output.keyword,spase_ontology(97),display_output_xml,index,blank_check=blank_check,preview=preview

xml_element_write,display_output.input_resource_id,spase_ontology(98),display_output_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(display_output.parameter,display_output_xml,index,spase_ontology(99:245),preview=preview,full=full)

xml_element_write,display_output.model_product,spase_ontology(246),display_output_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(display_output.property,display_output_xml,index,spase_ontology(247:261),preview=preview,full=full)

xml_element_write,display_output.extension,spase_ontology(262),display_output_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),display_output_xml,index,preview=preview

xml_mirror,full_xml,display_output_xml,full_index,preview=preview

return,display_output_xml

end

