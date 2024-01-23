
function xml_structure_write,structure,full_xml,index,spase_ontology, $
                          keyword_stop_date=keyword_stop_date, $
                          keyword_relative_stop_date=keyword_relative_stop_date, $
                          keyword_support=keyword_support, $
                          keyword_field=keyword_field, $
                          keyword_mixed=keyword_mixed, $
                          keyword_particle=keyword_particle, $
                          keyword_wave=keyword_wave, $
                          blank_check=blank_check,preview=preview,full=full

spase_keyword=spase_model_keyword(spase_ontology)

help,spase_ontology,spase_ontology(0).tag_name,spase_keyword

print,''

print,spase_keyword

print,''

print,spase_ontology

print,''

suffix=spase_model_write_suffix(spase_ontology(0),spase_keyword)

concat_structure=replicate('',n_elements(structure))

temp_xml=replicate('',99999L)

temp_index=0

if (not keyword_set(full)) then begin

   suffix=spase_model_write_suffix(spase_ontology(0),spase_keyword)

   command='concat_structure(loop)=strjoin(strtrim(write_'+ $
           spase_ontology(0).tag_name+'(structure(loop),spase_ontology,'+ $
           'temp_xml,temp_index'+suffix+',blank_check=blank_check,/preview),2))'

   for loop=0L,n_elements(structure)-1L do result=execute(command)

   unique_index=spase_model_uniqueness(concat_structure)

   filled_mask_num=n_elements(unique_index)

   filled_mask=indgen(filled_mask_num)

   if (n_elements(unique_index) gt 1) then begin

      concat_string=replicate('',n_elements(unique_index))

      for loop=0L,n_elements(unique_index)-1L do $
          concat_string(loop)= $
             spase_model_blank_check(structure(unique_index(loop)))

      filled_mask=where(concat_string ne '',filled_mask_num)

   endif

endif

structure_xml=replicate('',99999L)

structure_index=0

if (not keyword_set(preview) and not keyword_set(full)) then begin

   command='segment_xml=write_'+spase_ontology(0).tag_name+'(structure'+ $
           '(unique_index(filled_mask(loop))),spase_ontology,full_xml,index'+ $
           suffix+',/blank_check,preview=preview)'

   print,'Command: '+command

   for loop=0L,filled_mask_num-1L do begin

       print,loop

       result=execute(command)

       print,result

       segment_xml_num=n_elements(segment_xml)

;      if (segment_xml_num gt 0) then begin

       mask=indgen(segment_xml_num)+structure_index

       structure_xml(mask)=segment_xml

       structure_index=structure_index+segment_xml_num

;      endif

   endfor

endif

if (keyword_set(full)) then begin

   command='segment_xml=write_'+spase_ontology(0).tag_name+ $
           '(structure(loop),spase_ontology,full_xml,index'+suffix+ $
           ',blank_check=blank_check,preview=preview,/full)'

   for loop=0L,n_elements(structure)-1L do begin

       result=execute(command)

       segment_xml_num=n_elements(segment_xml)

       mask=indgen(segment_xml_num)+structure_index

       structure_xml(mask)=segment_xml

       structure_index=structure_index+segment_xml_num

   endfor

endif

if (structure_index gt 0) then begin

   structure_xml=structure_xml(indgen(structure_index))

endif else begin

   structure_xml=''

endelse

return,structure_xml

end

