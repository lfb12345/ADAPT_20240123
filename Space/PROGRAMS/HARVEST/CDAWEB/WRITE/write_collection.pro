
function write_collection,collection,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(collection) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

collection_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),collection_xml,index,preview=preview

xml_element_write,collection.resource_id,spase_ontology(1),collection_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(collection.resource_header,collection_xml,index,spase_ontology(2:39),preview=preview,full=full)

temp_xml=xml_structure_write(collection.access_information,collection_xml,index,spase_ontology(40:59),preview=preview,full=full)

temp_xml=xml_structure_write(collection.member,collection_xml,index,spase_ontology(60:80),preview=preview,full=full)

xml_element_write,collection.extension,spase_ontology(81),collection_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),collection_xml,index,preview=preview

xml_mirror,full_xml,collection_xml,full_index,preview=preview

return,collection_xml

end

