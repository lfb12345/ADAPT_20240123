
function write_access_url,access_url,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(access_url) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

access_url_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),access_url_xml,index,preview=preview

xml_element_write,access_url.name,spase_ontology(1),access_url_xml,index,blank_check=blank_check,preview=preview

xml_element_write,access_url.url,spase_ontology(2),access_url_xml,index,blank_check=blank_check,preview=preview

xml_element_write,access_url.style,spase_ontology(3),access_url_xml,index,blank_check=blank_check,preview=preview

xml_element_write,access_url.product_key,spase_ontology(4),access_url_xml,index,blank_check=blank_check,preview=preview

xml_element_write,access_url.description,spase_ontology(5),access_url_xml,index,blank_check=blank_check,preview=preview

xml_element_write,access_url.language,spase_ontology(6),access_url_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),access_url_xml,index,preview=preview

xml_mirror,full_xml,access_url_xml,full_index,preview=preview

return,access_url_xml

end

