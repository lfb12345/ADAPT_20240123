
function write_catalog,catalog,spase_ontology,full_xml,full_index,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(catalog) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

catalog_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),catalog_xml,index,preview=preview

xml_element_write,catalog.resource_id,spase_ontology(1),catalog_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(catalog.resource_header,catalog_xml,index,spase_ontology(2:39),preview=preview,full=full)

temp_xml=xml_structure_write(catalog.access_information,catalog_xml,index,spase_ontology(40:59),preview=preview,full=full)

xml_element_write,catalog.provider_name,spase_ontology(60),catalog_xml,index,blank_check=blank_check,preview=preview

xml_element_write,catalog.provider_resource_name,spase_ontology(61),catalog_xml,index,blank_check=blank_check,preview=preview

xml_element_write,catalog.provider_version,spase_ontology(62),catalog_xml,index,blank_check=blank_check,preview=preview

xml_element_write,catalog.instrument_id,spase_ontology(63),catalog_xml,index,blank_check=blank_check,preview=preview

xml_element_write,catalog.phenomenon_type,spase_ontology(64),catalog_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(catalog.time_span,catalog_xml,index,spase_ontology(65:69),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

xml_element_write,catalog.caveats,spase_ontology(70),catalog_xml,index,blank_check=blank_check,preview=preview

xml_element_write,catalog.keyword,spase_ontology(71),catalog_xml,index,blank_check=blank_check,preview=preview

xml_element_write,catalog.input_resource_id,spase_ontology(72),catalog_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(catalog.parameter,catalog_xml,index,spase_ontology(73:219),preview=preview,full=full)

xml_element_write,catalog.extension,spase_ontology(220),catalog_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),catalog_xml,index,preview=preview

xml_mirror,full_xml,catalog_xml,full_index,preview=preview

return,catalog_xml

end

