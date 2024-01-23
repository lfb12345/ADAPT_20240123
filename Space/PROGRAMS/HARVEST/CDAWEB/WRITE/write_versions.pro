
function write_versions,versions,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(versions) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

versions_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),versions_xml,index,preview=preview

temp_xml=xml_structure_write(versions.model_version,versions_xml,index,spase_ontology(1:5),preview=preview,full=full)

xml_tag_close,spase_ontology(0),versions_xml,index,preview=preview

xml_mirror,full_xml,versions_xml,full_index,preview=preview

return,versions_xml

end

