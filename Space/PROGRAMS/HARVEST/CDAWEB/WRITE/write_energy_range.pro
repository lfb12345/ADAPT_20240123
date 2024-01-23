
function write_energy_range,energy_range,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(energy_range) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

energy_range_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),energy_range_xml,index,preview=preview

xml_element_write,energy_range.low,spase_ontology(1),energy_range_xml,index,blank_check=blank_check,preview=preview

xml_element_write,energy_range.high,spase_ontology(2),energy_range_xml,index,blank_check=blank_check,preview=preview

xml_element_write,energy_range.units,spase_ontology(3),energy_range_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(energy_range.bin,energy_range_xml,index,spase_ontology(4:7),preview=preview,full=full)

xml_tag_close,spase_ontology(0),energy_range_xml,index,preview=preview

xml_mirror,full_xml,energy_range_xml,full_index,preview=preview

return,energy_range_xml

end

