
function write_association,association,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(association) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

association_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),association_xml,index,preview=preview

xml_element_write,association.association_id,spase_ontology(1),association_xml,index,blank_check=blank_check,preview=preview

xml_element_write,association.association_type,spase_ontology(2),association_xml,index,blank_check=blank_check,preview=preview

xml_element_write,association.note,spase_ontology(3),association_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),association_xml,index,preview=preview

xml_mirror,full_xml,association_xml,full_index,preview=preview

return,association_xml

end

