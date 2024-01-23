
pro xml_mirror,full_xml,xml_segment,full_index,preview=preview

xml_segment_num=n_elements(xml_segment)

mask=full_index+indgen(xml_segment_num)

if (not keyword_set(preview)) then full_xml(mask)=xml_segment

if (not keyword_set(preview)) then full_index=full_index+n_elements(xml_segment)

return

end

