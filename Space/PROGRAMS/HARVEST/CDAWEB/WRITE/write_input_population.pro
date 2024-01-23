
function write_input_population,input_population,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(input_population) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

input_population_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),input_population_xml,index,preview=preview

xml_element_write,input_population.name,spase_ontology(1),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.set,spase_ontology(2),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.parameter_key,spase_ontology(3),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.description,spase_ontology(4),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.caveats,spase_ontology(5),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.modeled_region,spase_ontology(6),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.qualifier,spase_ontology(7),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.particle_type,spase_ontology(8),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.chemical_formula,spase_ontology(9),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.atomic_number,spase_ontology(10),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.population_mass_number,spase_ontology(11),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.population_charge_state,spase_ontology(12),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.population_density,spase_ontology(13),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.population_temperature,spase_ontology(14),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.population_flow_speed,spase_ontology(15),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.distribution,spase_ontology(16),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.production_rate,spase_ontology(17),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.total_production_rate,spase_ontology(18),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.input_table_url,spase_ontology(19),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.density_profile,spase_ontology(20),input_population_xml,index,blank_check=blank_check,preview=preview

xml_element_write,input_population.model_url,spase_ontology(21),input_population_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),input_population_xml,index,preview=preview

xml_mirror,full_xml,input_population_xml,full_index,preview=preview

return,input_population_xml

end

