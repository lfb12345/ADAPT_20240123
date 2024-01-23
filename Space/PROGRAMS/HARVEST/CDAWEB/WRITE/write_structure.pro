
function write_structure,structure,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(structure) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

structure_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),structure_xml,index,preview=preview

xml_element_write,structure.size,spase_ontology(1),structure_xml,index,blank_check=blank_check,preview=preview

xml_element_write,structure.description,spase_ontology(2),structure_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(structure.element,structure_xml,index,spase_ontology(3:21),preview=preview,full=full)

xml_tag_close,spase_ontology(0),structure_xml,index,preview=preview

xml_mirror,full_xml,structure_xml,full_index,preview=preview

return,structure_xml

end

