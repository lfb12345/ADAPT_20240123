
function write_spase,spase,spase_ontology,spase_version,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,blank_check=blank_check,preview=preview,full=full

spase_xml=replicate('',99999L)

spase_xml_tag_open,spase_version,spase_xml,preview=preview

index_mask=where(spase_xml ne '',index)

xml_element_write,spase.version,spase_ontology(1),spase_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(spase.catalog,spase_xml,index,spase_ontology(2:222),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(spase.display_data,spase_xml,index,spase_ontology(223:470),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(spase.numerical_data,spase_xml,index,spase_ontology(471:717),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(spase.granule,spase_xml,index,spase_ontology(718:753),preview=preview,full=full)

temp_xml=xml_structure_write(spase.instrument,spase_xml,index,spase_ontology(754:803),preview=preview,full=full)

temp_xml=xml_structure_write(spase.observatory,spase_xml,index,spase_ontology(804:855),preview=preview,full=full)

temp_xml=xml_structure_write(spase.person,spase_xml,index,spase_ontology(856:867),preview=preview,full=full)

temp_xml=xml_structure_write(spase.registry,spase_xml,index,spase_ontology(868:915),preview=preview,full=full)

temp_xml=xml_structure_write(spase.repository,spase_xml,index,spase_ontology(916:963),preview=preview,full=full)

temp_xml=xml_structure_write(spase.service,spase_xml,index,spase_ontology(964:1011),preview=preview,full=full)

temp_xml=xml_structure_write(spase.annotation,spase_xml,index,spase_ontology(1012:1067),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(spase.document,spase_xml,index,spase_ontology(1068:1131),preview=preview,full=full)

temp_xml=xml_structure_write(spase.software,spase_xml,index,spase_ontology(1132:1219),keyword_input_property=keyword_input_property,keyword_output_property=keyword_output_property,preview=preview,full=full)

temp_xml=xml_structure_write(spase.collection,spase_xml,index,spase_ontology(1220:1301),preview=preview,full=full)

temp_xml=xml_structure_write(spase.model,spase_xml,index,spase_ontology(1302:1551),keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter,keyword_cubes_description=keyword_cubes_description,keyword_cuts_description=keyword_cuts_description,keyword_plane_normal_vector=keyword_plane_normal_vector,keyword_plane_point=keyword_plane_point,keyword_region_begin=keyword_region_begin,keyword_region_end=keyword_region_end,preview=preview,full=full)

temp_xml=xml_structure_write(spase.model_run,spase_xml,index,spase_ontology(1552:1759),keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter,preview=preview,full=full)

temp_xml=xml_structure_write(spase.display_output,spase_xml,index,spase_ontology(1760:2022),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(spase.numerical_output,spase_xml,index,spase_ontology(2023:2284),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

xml_tag_close,spase_ontology(0),spase_xml,index,preview=preview

mask=indgen(index)

spase_xml=spase_xml(mask)

return,spase_xml

end

