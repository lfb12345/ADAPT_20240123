
function write_wave,wave,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(wave) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

wave_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),wave_xml,index,preview=preview

xml_element_write,wave.wave_type,spase_ontology(1),wave_xml,index,blank_check=blank_check,preview=preview

xml_element_write,wave.qualifier,spase_ontology(2),wave_xml,index,blank_check=blank_check,preview=preview

xml_element_write,wave.wave_quantity,spase_ontology(3),wave_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(wave.energy_range,wave_xml,index,spase_ontology(4:11),preview=preview,full=full)

temp_xml=xml_structure_write(wave.frequency_range,wave_xml,index,spase_ontology(12:20),preview=preview,full=full)

temp_xml=xml_structure_write(wave.wavelength_range,wave_xml,index,spase_ontology(21:29),preview=preview,full=full)

xml_tag_close,spase_ontology(0),wave_xml,index,preview=preview

xml_mirror,full_xml,wave_xml,full_index,preview=preview

return,wave_xml

end

