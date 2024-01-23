
function write_granule,granule,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(granule) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

granule_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),granule_xml,index,preview=preview

xml_element_write,granule.resource_id,spase_ontology(1),granule_xml,index,blank_check=blank_check,preview=preview

xml_element_write,granule.release_date,spase_ontology(2),granule_xml,index,blank_check=blank_check,preview=preview

xml_element_write,granule.expiration_date,spase_ontology(3),granule_xml,index,blank_check=blank_check,preview=preview

xml_element_write,granule.parent_id,spase_ontology(4),granule_xml,index,blank_check=blank_check,preview=preview

xml_element_write,granule.prior_id,spase_ontology(5),granule_xml,index,blank_check=blank_check,preview=preview

xml_element_write,granule.start_date,spase_ontology(6),granule_xml,index,blank_check=blank_check,preview=preview

xml_element_write,granule.stop_date,spase_ontology(7),granule_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(granule.spatial_coverage,granule_xml,index,spase_ontology(8:22),preview=preview,full=full)

temp_xml=xml_structure_write(granule.source,granule_xml,index,spase_ontology(23:33),preview=preview,full=full)

xml_element_write,granule.region_begin,spase_ontology(34),granule_xml,index,blank_check=blank_check,preview=preview

xml_element_write,granule.region_end,spase_ontology(35),granule_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),granule_xml,index,preview=preview

xml_mirror,full_xml,granule_xml,full_index,preview=preview

return,granule_xml

end

