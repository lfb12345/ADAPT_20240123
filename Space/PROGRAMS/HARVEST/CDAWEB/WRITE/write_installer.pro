
function write_installer,installer,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(installer) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

installer_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),installer_xml,index,preview=preview

xml_element_write,installer.availability,spase_ontology(1),installer_xml,index,blank_check=blank_check,preview=preview

xml_element_write,installer.access_rights,spase_ontology(2),installer_xml,index,blank_check=blank_check,preview=preview

xml_element_write,installer.acknowledgement,spase_ontology(3),installer_xml,index,blank_check=blank_check,preview=preview

xml_element_write,installer.url,spase_ontology(4),installer_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),installer_xml,index,preview=preview

xml_mirror,full_xml,installer_xml,full_index,preview=preview

return,installer_xml

end

