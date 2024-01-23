
function write_publication_info,publication_info,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(publication_info) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

publication_info_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),publication_info_xml,index,preview=preview

xml_element_write,publication_info.title,spase_ontology(1),publication_info_xml,index,blank_check=blank_check,preview=preview

xml_element_write,publication_info.authors,spase_ontology(2),publication_info_xml,index,blank_check=blank_check,preview=preview

xml_element_write,publication_info.publication_date,spase_ontology(3),publication_info_xml,index,blank_check=blank_check,preview=preview

xml_element_write,publication_info.published_by,spase_ontology(4),publication_info_xml,index,blank_check=blank_check,preview=preview

xml_element_write,publication_info.landing_page_url,spase_ontology(5),publication_info_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),publication_info_xml,index,preview=preview

xml_mirror,full_xml,publication_info_xml,full_index,preview=preview

return,publication_info_xml

end

