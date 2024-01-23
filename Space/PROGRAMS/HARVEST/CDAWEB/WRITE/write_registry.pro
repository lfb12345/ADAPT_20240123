
function write_registry,registry,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(registry) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

registry_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),registry_xml,index,preview=preview

xml_element_write,registry.resource_id,spase_ontology(1),registry_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(registry.resource_header,registry_xml,index,spase_ontology(2:39),preview=preview,full=full)

temp_xml=xml_structure_write(registry.access_url,registry_xml,index,spase_ontology(40:46),preview=preview,full=full)

xml_element_write,registry.extension,spase_ontology(47),registry_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),registry_xml,index,preview=preview

xml_mirror,full_xml,registry_xml,full_index,preview=preview

return,registry_xml

end

