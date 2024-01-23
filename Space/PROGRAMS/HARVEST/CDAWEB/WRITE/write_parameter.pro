
function write_parameter,parameter,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(parameter) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

parameter_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),parameter_xml,index,preview=preview

xml_element_write,parameter.name,spase_ontology(1),parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,parameter.set,spase_ontology(2),parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,parameter.parameter_key,spase_ontology(3),parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,parameter.description,spase_ontology(4),parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,parameter.ucd,spase_ontology(5),parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,parameter.caveats,spase_ontology(6),parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,parameter.cadence,spase_ontology(7),parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,parameter.cadence_min,spase_ontology(8),parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,parameter.cadence_max,spase_ontology(9),parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,parameter.units,spase_ontology(10),parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,parameter.units_conversion,spase_ontology(11),parameter_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(parameter.coordinate_system,parameter_xml,index,spase_ontology(12:14),preview=preview,full=full)

temp_xml=xml_structure_write(parameter.rendering_hints,parameter_xml,index,spase_ontology(15:23),preview=preview,full=full)

temp_xml=xml_structure_write(parameter.structure,parameter_xml,index,spase_ontology(24:45),preview=preview,full=full)

xml_element_write,parameter.valid_min,spase_ontology(46),parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,parameter.valid_max,spase_ontology(47),parameter_xml,index,blank_check=blank_check,preview=preview

xml_element_write,parameter.fill_value,spase_ontology(48),parameter_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(parameter.field,parameter_xml,index,spase_ontology(49:60),preview=preview,full=full)

temp_xml=xml_structure_write(parameter.particle,parameter_xml,index,spase_ontology(61:109),preview=preview,full=full)

temp_xml=xml_structure_write(parameter.wave,parameter_xml,index,spase_ontology(110:139),preview=preview,full=full)

temp_xml=xml_structure_write(parameter.mixed,parameter_xml,index,spase_ontology(140:143),preview=preview,full=full)

temp_xml=xml_structure_write(parameter.support,parameter_xml,index,spase_ontology(144:146),preview=preview,full=full)

xml_tag_close,spase_ontology(0),parameter_xml,index,preview=preview

xml_mirror,full_xml,parameter_xml,full_index,preview=preview

return,parameter_xml

end

