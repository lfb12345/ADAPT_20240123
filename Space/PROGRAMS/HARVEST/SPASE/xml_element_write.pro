
pro xml_element_write,element,spase_ontology,full_xml,index,blank_check=blank_check,preview=preview

indent=''

if (spase_ontology.tag_level gt 0) then $
   indent=strjoin(replicate('   ',spase_ontology.tag_level))

unique_element=element

if (spase_ontology.unique eq 1) then $
   unique_element=spase_model_uniqueness(element)

unique_element_num=n_elements(unique_element)

xml_segment=replicate('',unique_element_num)

fill=0

fill_check=make_array(unique_element_num,/integer,value=0)

for loop=0,unique_element_num-1 do begin

    if ((loop eq 0 and $
        (element(loop) ne '' or spase_ontology.occur_required eq 1)) or $
        (loop gt 0 and element(loop) ne '') or not keyword_set(blank_check)) $
       then begin

       xml_segment(loop)=indent+'<'+spase_ontology.keyword+'>'+ element(loop)+ $
                         '</'+spase_ontology.keyword+'>'

       fill=1

       fill_check(loop)=1

    endif

    if (not keyword_set(preview) and ((loop eq 0 and $
        (element(loop) ne '' or spase_ontology.occur_required eq 1)) or $
        (loop gt 0 and element(loop) ne '') or not keyword_set(blank_check))) $
       then begin

       printf,10,xml_segment(loop)

       fill_check(loop)=1

    endif

endfor

xml_segment_mask=where(fill_check eq 1,xml_segment_mask_num)

if (xml_segment_mask_num gt 0) then begin

   mask=index+indgen(xml_segment_mask_num)

   full_xml(mask)=xml_segment(xml_segment_mask)

   if (fix(total(fill_check)) gt 0) then index=index+xml_segment_mask_num

endif

return

end

