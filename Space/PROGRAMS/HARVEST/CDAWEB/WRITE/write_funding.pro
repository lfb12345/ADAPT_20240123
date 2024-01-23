
function write_funding,funding,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(funding) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

funding_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),funding_xml,index,preview=preview

xml_element_write,funding.agency,spase_ontology(1),funding_xml,index,blank_check=blank_check,preview=preview

xml_element_write,funding.project,spase_ontology(2),funding_xml,index,blank_check=blank_check,preview=preview

xml_element_write,funding.award_number,spase_ontology(3),funding_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),funding_xml,index,preview=preview

xml_mirror,full_xml,funding_xml,full_index,preview=preview

return,funding_xml

end

