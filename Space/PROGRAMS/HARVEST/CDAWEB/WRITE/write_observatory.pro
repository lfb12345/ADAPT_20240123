
function write_observatory,observatory,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(observatory) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

observatory_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),observatory_xml,index,preview=preview

xml_element_write,observatory.resource_id,spase_ontology(1),observatory_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(observatory.resource_header,observatory_xml,index,spase_ontology(2:39),preview=preview,full=full)

xml_element_write,observatory.observatory_group_id,spase_ontology(40),observatory_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(observatory.location,observatory_xml,index,spase_ontology(41:46),preview=preview,full=full)

temp_xml=xml_structure_write(observatory.operating_span,observatory_xml,index,spase_ontology(47:50),preview=preview,full=full)

xml_element_write,observatory.extension,spase_ontology(51),observatory_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),observatory_xml,index,preview=preview

xml_mirror,full_xml,observatory_xml,full_index,preview=preview

return,observatory_xml

end

