
function write_source,source,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(source) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

source_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),source_xml,index,preview=preview

xml_element_write,source.source_type,spase_ontology(1),source_xml,index,blank_check=blank_check,preview=preview

xml_element_write,source.url,spase_ontology(2),source_xml,index,blank_check=blank_check,preview=preview

xml_element_write,source.mirror_url,spase_ontology(3),source_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(source.checksum,source_xml,index,spase_ontology(4:6),preview=preview,full=full)

temp_xml=xml_structure_write(source.data_extent,source_xml,index,spase_ontology(7:10),preview=preview,full=full)

xml_tag_close,spase_ontology(0),source_xml,index,preview=preview

xml_mirror,full_xml,source_xml,full_index,preview=preview

return,source_xml

end

