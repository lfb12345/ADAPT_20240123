
function write_data_extent,data_extent,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(data_extent) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

data_extent_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),data_extent_xml,index,preview=preview

xml_element_write,data_extent.quantity,spase_ontology(1),data_extent_xml,index,blank_check=blank_check,preview=preview

xml_element_write,data_extent.units,spase_ontology(2),data_extent_xml,index,blank_check=blank_check,preview=preview

xml_element_write,data_extent.per,spase_ontology(3),data_extent_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),data_extent_xml,index,preview=preview

xml_mirror,full_xml,data_extent_xml,full_index,preview=preview

return,data_extent_xml

end

