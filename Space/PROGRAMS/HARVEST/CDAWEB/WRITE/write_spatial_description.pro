
function write_spatial_description,spatial_description,spase_ontology,full_xml,full_index,keyword_cubes_description=keyword_cubes_description,keyword_cuts_description=keyword_cuts_description,keyword_plane_normal_vector=keyword_plane_normal_vector,keyword_plane_point=keyword_plane_point,keyword_region_begin=keyword_region_begin,keyword_region_end=keyword_region_end,blank_check=blank_check,preview=preview,full=full

if ((spase_model_blank_check(spatial_description) eq '' and keyword_set(blank_check)) and spase_ontology(0).occur_required ne 1) then return,''

spatial_description_xml=replicate('',99999L)

index=0

xml_tag_open,spase_ontology(0),spatial_description_xml,index,preview=preview

xml_element_write,spatial_description.dimension,spase_ontology(1),spatial_description_xml,index,blank_check=blank_check,preview=preview

temp_xml=xml_structure_write(spatial_description.coordinate_system,spatial_description_xml,index,spase_ontology(2:4),preview=preview,full=full)

xml_element_write,spatial_description.units,spase_ontology(5),spatial_description_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_description.units_conversion,spase_ontology(6),spatial_description_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_description.coordinates_label,spase_ontology(7),spatial_description_xml,index,blank_check=blank_check,preview=preview

if keyword_set(keyword_cuts_description) then xml_element_write,spatial_description.cuts_description,spase_ontology(8),spatial_description_xml,index,blank_check=blank_check,preview=preview

if keyword_set(keyword_cubes_description) then xml_element_write,spatial_description.cubes_description,spase_ontology(9),spatial_description_xml,index,blank_check=blank_check,preview=preview

if keyword_set(keyword_plane_normal_vector) then xml_element_write,spatial_description.plane_normal_vector,spase_ontology(10),spatial_description_xml,index,blank_check=blank_check,preview=preview

if keyword_set(keyword_plane_point) then xml_element_write,spatial_description.plane_point,spase_ontology(11),spatial_description_xml,index,blank_check=blank_check,preview=preview

if keyword_set(keyword_region_begin) then xml_element_write,spatial_description.region_begin,spase_ontology(12),spatial_description_xml,index,blank_check=blank_check,preview=preview

if keyword_set(keyword_region_end) then xml_element_write,spatial_description.region_end,spase_ontology(13),spatial_description_xml,index,blank_check=blank_check,preview=preview

xml_element_write,spatial_description.step,spase_ontology(14),spatial_description_xml,index,blank_check=blank_check,preview=preview

xml_tag_close,spase_ontology(0),spatial_description_xml,index,preview=preview

xml_mirror,full_xml,spatial_description_xml,full_index,preview=preview

return,spatial_description_xml

end

