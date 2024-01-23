
function write_bin,bin,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(bin) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

bin_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),bin_xml,index,preview=preview

xml_element_write,bin.band_name,spase_ontology(1),bin_xml,index,blank_check=blank_check,preview=preview

xml_element_write,bin.low,spase_ontology(2),bin_xml,index,blank_check=blank_check,preview=preview

xml_element_write,bin.high,spase_ontology(3),bin_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),bin_xml,index,preview=preview

xml_mirror,full_xml,bin_xml,full_index,preview=preview

return,bin_xml

end

