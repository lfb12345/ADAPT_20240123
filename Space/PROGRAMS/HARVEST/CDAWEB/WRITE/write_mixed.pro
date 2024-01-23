
function write_mixed,mixed,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(mixed) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

mixed_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),mixed_xml,index,preview=preview

xml_element_write,mixed.mixed_quantity,spase_ontology(1),mixed_xml,index,blank_check=blank_check,preview=preview

xml_element_write,mixed.particle_type,spase_ontology(2),mixed_xml,index,blank_check=blank_check,preview=preview

xml_element_write,mixed.qualifier,spase_ontology(3),mixed_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),mixed_xml,index,preview=preview

xml_mirror,full_xml,mixed_xml,full_index,preview=preview

return,mixed_xml

end

