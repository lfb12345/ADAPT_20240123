
function write_spatial_coverage,spatial_coverage,spase_ontology,full_xml,full_index,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(spatial_coverage) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

spatial_coverage_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),spatial_coverage_xml,index,preview=preview

temp_xml=xml_structure_write(spatial_coverage.coordinate_system,spatial_coverage_xml,index,spase_ontology(1:3),preview=preview,full=full)

xml_element_write,spatial_coverage.center_latitude,spase_ontology(4),spatial_coverage_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_coverage.northernmost_latitude,spase_ontology(5),spatial_coverage_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_coverage.southernmost_latitude,spase_ontology(6),spatial_coverage_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_coverage.center_longitude,spase_ontology(7),spatial_coverage_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_coverage.easternmost_longitude,spase_ontology(8),spatial_coverage_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_coverage.westernmost_longitude,spase_ontology(9),spatial_coverage_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_coverage.center_elevation,spase_ontology(10),spatial_coverage_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_coverage.minimum_elevation,spase_ontology(11),spatial_coverage_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_coverage.maximum_elevation,spase_ontology(12),spatial_coverage_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_coverage.acknowledgement,spase_ontology(13),spatial_coverage_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_coverage.description,spase_ontology(14),spatial_coverage_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),spatial_coverage_xml,index,preview=preview

xml_mirror,full_xml,spatial_coverage_xml,full_index,preview=preview

return,spatial_coverage_xml

end

