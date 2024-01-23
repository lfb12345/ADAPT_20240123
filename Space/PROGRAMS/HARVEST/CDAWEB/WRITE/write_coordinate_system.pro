
function write_coordinate_system,coordinate_system,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(coordinate_system) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

coordinate_system_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),coordinate_system_xml,index,preview=preview

xml_element_write,coordinate_system.coordinate_representation,spase_ontology(1),coordinate_system_xml,index,blank_check=blank_check,preview=preview

xml_element_write,coordinate_system.coordinate_system_name,spase_ontology(2),coordinate_system_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),coordinate_system_xml,index,preview=preview

xml_mirror,full_xml,coordinate_system_xml,full_index,preview=preview

return,coordinate_system_xml

end

