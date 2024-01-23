
function write_frequency_range,frequency_range,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(frequency_range) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

frequency_range_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),frequency_range_xml,index,preview=preview

xml_element_write,frequency_range.spectral_range,spase_ontology(1),frequency_range_xml,index,blank_check=blank_check,preview=preview

xml_element_write,frequency_range.low,spase_ontology(2),frequency_range_xml,index,blank_check=blank_check,preview=preview

xml_element_write,frequency_range.high,spase_ontology(3),frequency_range_xml,index,blank_check=blank_check,preview=preview

xml_element_write,frequency_range.units,spase_ontology(4),frequency_range_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(frequency_range.bin,frequency_range_xml,index,spase_ontology(5:8),preview=preview,full=full)

xml_tag_close,spase_ontology(0),frequency_range_xml,index,preview=preview

xml_mirror,full_xml,frequency_range_xml,full_index,preview=preview

return,frequency_range_xml

end

