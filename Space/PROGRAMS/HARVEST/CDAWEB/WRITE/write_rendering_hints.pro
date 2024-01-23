
function write_rendering_hints,rendering_hints,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(rendering_hints) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

rendering_hints_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),rendering_hints_xml,index,preview=preview

xml_element_write,rendering_hints.display_type,spase_ontology(1),rendering_hints_xml,index,blank_check=blank_check,preview=preview

xml_element_write,rendering_hints.axis_label,spase_ontology(2),rendering_hints_xml,index,blank_check=blank_check,preview=preview

xml_element_write,rendering_hints.rendering_axis,spase_ontology(3),rendering_hints_xml,index,blank_check=blank_check,preview=preview

xml_element_write,rendering_hints.index,spase_ontology(4),rendering_hints_xml,index,blank_check=blank_check,preview=preview

xml_element_write,rendering_hints.value_format,spase_ontology(5),rendering_hints_xml,index,blank_check=blank_check,preview=preview

xml_element_write,rendering_hints.scale_min,spase_ontology(6),rendering_hints_xml,index,blank_check=blank_check,preview=preview

xml_element_write,rendering_hints.scale_max,spase_ontology(7),rendering_hints_xml,index,blank_check=blank_check,preview=preview

xml_element_write,rendering_hints.scale_type,spase_ontology(8),rendering_hints_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),rendering_hints_xml,index,preview=preview

xml_mirror,full_xml,rendering_hints_xml,full_index,preview=preview

return,rendering_hints_xml

end

