
function write_location,location,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(location) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

location_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),location_xml,index,preview=preview

xml_element_write,location.observatory_region,spase_ontology(1),location_xml,index,blank_check=blank_check,preview=preview

xml_element_write,location.coordinate_system_name,spase_ontology(2),location_xml,index,blank_check=blank_check,preview=preview

xml_element_write,location.latitude,spase_ontology(3),location_xml,index,blank_check=blank_check,preview=preview

xml_element_write,location.longitude,spase_ontology(4),location_xml,index,blank_check=blank_check,preview=preview

xml_element_write,location.elevation,spase_ontology(5),location_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),location_xml,index,preview=preview

xml_mirror,full_xml,location_xml,full_index,preview=preview

return,location_xml

end

