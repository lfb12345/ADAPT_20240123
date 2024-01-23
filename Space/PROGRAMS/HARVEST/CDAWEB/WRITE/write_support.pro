
function write_support,support,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(support) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

support_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),support_xml,index,preview=preview

xml_element_write,support.qualifier,spase_ontology(1),support_xml,index,blank_check=blank_check,preview=preview

xml_element_write,support.support_quantity,spase_ontology(2),support_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),support_xml,index,preview=preview

xml_mirror,full_xml,support_xml,full_index,preview=preview

return,support_xml

end

