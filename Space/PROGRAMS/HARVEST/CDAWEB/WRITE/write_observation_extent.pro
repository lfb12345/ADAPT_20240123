
function write_observation_extent,observation_extent,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(observation_extent) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

observation_extent_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),observation_extent_xml,index,preview=preview

xml_element_write,observation_extent.observed_region,spase_ontology(1),observation_extent_xml,index,blank_check=blank_check,preview=preview

xml_element_write,observation_extent.start_location,spase_ontology(2),observation_extent_xml,index,blank_check=blank_check,preview=preview

xml_element_write,observation_extent.stop_location,spase_ontology(3),observation_extent_xml,index,blank_check=blank_check,preview=preview

xml_element_write,observation_extent.note,spase_ontology(4),observation_extent_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),observation_extent_xml,index,preview=preview

xml_mirror,full_xml,observation_extent_xml,full_index,preview=preview

return,observation_extent_xml

end

