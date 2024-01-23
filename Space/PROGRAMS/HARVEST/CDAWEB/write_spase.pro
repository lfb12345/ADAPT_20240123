
function write_spase,spase,spase_ontology,spase_version,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,blank_check=blank_check,preview=preview,full=full

spase_xml=replicate('',99999L)

spase_xml_tag_open,spase_version,spase_xml,preview=preview

index_mask=where(spase_xml ne '',index)

xml_element_write,spase.version,spase_ontology(1),spase_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(spase.catalog,spase_xml,index,spase_ontology(2:214),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(spase.display_data,spase_xml,index,spase_ontology(215:439),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(spase.numerical_data,spase_xml,index,spase_ontology(440:663),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(spase.document,spase_xml,index,spase_ontology(664:719),preview=preview,full=full)

temp_xml=xml_structure_write(spase.granule,spase_xml,index,spase_ontology(720:740),preview=preview,full=full)

temp_xml=xml_structure_write(spase.instrument,spase_xml,index,spase_ontology(741:783),preview=preview,full=full)

temp_xml=xml_structure_write(spase.observatory,spase_xml,index,spase_ontology(784:829),preview=preview,full=full)

temp_xml=xml_structure_write(spase.person,spase_xml,index,spase_ontology(830:841),preview=preview,full=full)

temp_xml=xml_structure_write(spase.registry,spase_xml,index,spase_ontology(842:883),preview=preview,full=full)

temp_xml=xml_structure_write(spase.repository,spase_xml,index,spase_ontology(884:925),preview=preview,full=full)

temp_xml=xml_structure_write(spase.service,spase_xml,index,spase_ontology(926:967),preview=preview,full=full)

temp_xml=xml_structure_write(spase.annotation,spase_xml,index,spase_ontology(968:1017),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(spase.simulation_model,spase_xml,index,spase_ontology(1018:1241),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(spase.simulation_run,spase_xml,index,spase_ontology(1242:1453),preview=preview,full=full)

temp_xml=xml_structure_write(spase.numerical_output,spase_xml,index,spase_ontology(1454:1707),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(spase.display_output,spase_xml,index,spase_ontology(1708:1962),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

xml_tag_close,spase_ontology(0),spase_xml,index,preview=preview

mask=indgen(index)

spase_xml=spase_xml(mask)

return,spase_xml

end

