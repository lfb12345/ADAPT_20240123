
function write_boundary_conditions,boundary_conditions,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(boundary_conditions) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

boundary_conditions_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),boundary_conditions_xml,index,preview=preview

xml_element_write,boundary_conditions.particle_boundary,spase_ontology(1),boundary_conditions_xml,index,blank_check=blank_check,preview=preview

xml_element_write,boundary_conditions.field_boundary,spase_ontology(2),boundary_conditions_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),boundary_conditions_xml,index,preview=preview

xml_mirror,full_xml,boundary_conditions_xml,full_index,preview=preview

return,boundary_conditions_xml

end

