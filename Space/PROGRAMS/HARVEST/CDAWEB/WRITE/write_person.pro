
function write_person,person,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(person) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

person_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),person_xml,index,preview=preview

xml_element_write,person.resource_id,spase_ontology(1),person_xml,index,blank_check=blank_check,preview=preview

xml_element_write,person.release_date,spase_ontology(2),person_xml,index,blank_check=blank_check,preview=preview

xml_element_write,person.person_name,spase_ontology(3),person_xml,index,blank_check=blank_check,preview=preview

xml_element_write,person.organization_name,spase_ontology(4),person_xml,index,blank_check=blank_check,preview=preview

xml_element_write,person.address,spase_ontology(5),person_xml,index,blank_check=blank_check,preview=preview

xml_element_write,person.email,spase_ontology(6),person_xml,index,blank_check=blank_check,preview=preview

xml_element_write,person.phone_number,spase_ontology(7),person_xml,index,blank_check=blank_check,preview=preview

xml_element_write,person.fax_number,spase_ontology(8),person_xml,index,blank_check=blank_check,preview=preview

xml_element_write,person.orcidentifier,spase_ontology(9),person_xml,index,blank_check=blank_check,preview=preview

xml_element_write,person.note,spase_ontology(10),person_xml,index,blank_check=blank_check,preview=preview

xml_element_write,person.extension,spase_ontology(11),person_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),person_xml,index,preview=preview

xml_mirror,full_xml,person_xml,full_index,preview=preview

return,person_xml

end

