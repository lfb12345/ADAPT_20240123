
function write_contact,contact,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(contact) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

contact_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),contact_xml,index,preview=preview

xml_element_write,contact.person_id,spase_ontology(1),contact_xml,index,blank_check=blank_check,preview=preview

xml_element_write,contact.role,spase_ontology(2),contact_xml,index,blank_check=blank_check,preview=preview

xml_element_write,contact.start_date,spase_ontology(3),contact_xml,index,blank_check=blank_check,preview=preview

xml_element_write,contact.stop_date,spase_ontology(4),contact_xml,index,blank_check=blank_check,preview=preview

xml_element_write,contact.note,spase_ontology(5),contact_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),contact_xml,index,preview=preview

xml_mirror,full_xml,contact_xml,full_index,preview=preview

return,contact_xml

end

