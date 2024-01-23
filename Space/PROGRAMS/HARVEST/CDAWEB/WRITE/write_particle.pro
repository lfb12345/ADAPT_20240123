
function write_particle,particle,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(particle) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

particle_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),particle_xml,index,preview=preview

xml_element_write,particle.particle_type,spase_ontology(1),particle_xml,index,blank_check=blank_check,preview=preview

xml_element_write,particle.qualifier,spase_ontology(2),particle_xml,index,blank_check=blank_check,preview=preview

xml_element_write,particle.particle_quantity,spase_ontology(3),particle_xml,index,blank_check=blank_check,preview=preview

xml_element_write,particle.atomic_number,spase_ontology(4),particle_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(particle.energy_range,particle_xml,index,spase_ontology(5:12),preview=preview,full=full)

temp_xml=xml_structure_write(particle.azimuthal_angle_range,particle_xml,index,spase_ontology(13:20),preview=preview,full=full)

temp_xml=xml_structure_write(particle.polar_angle_range,particle_xml,index,spase_ontology(21:28),preview=preview,full=full)

temp_xml=xml_structure_write(particle.mass_range,particle_xml,index,spase_ontology(29:36),preview=preview,full=full)

temp_xml=xml_structure_write(particle.pitch_angle_range,particle_xml,index,spase_ontology(37:44),preview=preview,full=full)

xml_element_write,particle.chemical_formula,spase_ontology(45),particle_xml,index,blank_check=blank_check,preview=preview

xml_element_write,particle.population,spase_ontology(46),particle_xml,index,blank_check=blank_check,preview=preview

xml_element_write,particle.population_mass_number,spase_ontology(47),particle_xml,index,blank_check=blank_check,preview=preview

xml_element_write,particle.population_charge_state,spase_ontology(48),particle_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),particle_xml,index,preview=preview

xml_mirror,full_xml,particle_xml,full_index,preview=preview

return,particle_xml

end

