
function write_temporal_description,temporal_description,spase_ontology,full_xml,full_index,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(temporal_description) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

temporal_description_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),temporal_description_xml,index,preview=preview

temp_xml=xml_structure_write(temporal_description.time_span,temporal_description_xml,index,spase_ontology(1:5),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

xml_element_write,temporal_description.cadence,spase_ontology(6),temporal_description_xml,index,blank_check=blank_check,preview=preview

xml_element_write,temporal_description.cadence_min,spase_ontology(7),temporal_description_xml,index,blank_check=blank_check,preview=preview

xml_element_write,temporal_description.cadence_max,spase_ontology(8),temporal_description_xml,index,blank_check=blank_check,preview=preview

xml_element_write,temporal_description.exposure,spase_ontology(9),temporal_description_xml,index,blank_check=blank_check,preview=preview

xml_element_write,temporal_description.exposure_min,spase_ontology(10),temporal_description_xml,index,blank_check=blank_check,preview=preview

xml_element_write,temporal_description.exposure_max,spase_ontology(11),temporal_description_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),temporal_description_xml,index,preview=preview

xml_mirror,full_xml,temporal_description_xml,full_index,preview=preview

return,temporal_description_xml

end

