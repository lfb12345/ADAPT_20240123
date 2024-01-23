
function write_checksum,checksum,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(checksum) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

checksum_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),checksum_xml,index,preview=preview

xml_element_write,checksum.hash_value,spase_ontology(1),checksum_xml,index,blank_check=blank_check,preview=preview

xml_element_write,checksum.hash_function,spase_ontology(2),checksum_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),checksum_xml,index,preview=preview

xml_mirror,full_xml,checksum_xml,full_index,preview=preview

return,checksum_xml

end

