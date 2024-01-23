
function write_annotation,annotation,spase_ontology,full_xml,full_index,keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(annotation) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

annotation_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),annotation_xml,index,preview=preview

xml_element_write,annotation.resource_id,spase_ontology(1),annotation_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(annotation.resource_header,annotation_xml,index,spase_ontology(2:39),preview=preview,full=full)

xml_element_write,annotation.image_url,spase_ontology(40),annotation_xml,index,blank_check=blank_check,preview=preview

xml_element_write,annotation.annotation_type,spase_ontology(41),annotation_xml,index,blank_check=blank_check,preview=preview

xml_element_write,annotation.phenomenon_type,spase_ontology(42),annotation_xml,index,blank_check=blank_check,preview=preview

xml_element_write,annotation.classification_method,spase_ontology(43),annotation_xml,index,blank_check=blank_check,preview=preview

xml_element_write,annotation.confidence_rating,spase_ontology(44),annotation_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(annotation.time_span,annotation_xml,index,spase_ontology(45:49),keyword_relative_stop_date=keyword_relative_stop_date,keyword_stop_date=keyword_stop_date,preview=preview,full=full)

temp_xml=xml_structure_write(annotation.observation_extent,annotation_xml,index,spase_ontology(50:54),preview=preview,full=full)

xml_element_write,annotation.extension,spase_ontology(55),annotation_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),annotation_xml,index,preview=preview

xml_mirror,full_xml,annotation_xml,full_index,preview=preview

return,annotation_xml

end

