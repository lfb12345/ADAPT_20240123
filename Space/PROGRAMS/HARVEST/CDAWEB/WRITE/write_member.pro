
function write_member,member,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(member) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

member_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),member_xml,index,preview=preview

xml_element_write,member.resource_name,spase_ontology(1),member_xml,index,blank_check=blank_check,preview=preview

xml_element_write,member.description,spase_ontology(2),member_xml,index,blank_check=blank_check,preview=preview

xml_element_write,member.member_id,spase_ontology(3),member_xml,index,blank_check=blank_check,preview=preview

xml_element_write,member.start_date,spase_ontology(4),member_xml,index,blank_check=blank_check,preview=preview

xml_element_write,member.stop_date,spase_ontology(5),member_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(member.spatial_coverage,member_xml,index,spase_ontology(6:20),preview=preview,full=full)

xml_tag_close,spase_ontology(0),member_xml,index,preview=preview

xml_mirror,full_xml,member_xml,full_index,preview=preview

return,member_xml

end

