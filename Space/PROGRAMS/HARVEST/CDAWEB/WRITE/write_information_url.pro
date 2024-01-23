
function write_information_url,information_url,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(information_url) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

information_url_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),information_url_xml,index,preview=preview

xml_element_write,information_url.name,spase_ontology(1),information_url_xml,index,blank_check=blank_check,preview=preview

xml_element_write,information_url.url,spase_ontology(2),information_url_xml,index,blank_check=blank_check,preview=preview

xml_element_write,information_url.description,spase_ontology(3),information_url_xml,index,blank_check=blank_check,preview=preview

xml_element_write,information_url.language,spase_ontology(4),information_url_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),information_url_xml,index,preview=preview

xml_mirror,full_xml,information_url_xml,full_index,preview=preview

return,information_url_xml

end

