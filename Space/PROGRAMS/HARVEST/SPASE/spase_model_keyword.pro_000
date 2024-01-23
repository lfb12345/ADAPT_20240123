
function spase_model_keyword,spase_ontology

case_char=['B','C','D']

case_char=['B','C']

case_num=n_elements(case_char)

spase_keyword_record= $
   create_struct(name='SPASE KEYWORD','case_char','','num',0, $
                 'keyword',make_array(5,/string,value=''))

case_mask=[0,0,0]

case_mask=[0,0]

spase_keyword_list=replicate(spase_keyword_record,case_num)

spase_keyword_list.case_char=case_char

for loop=0,case_num-1 do begin

    case_index=where(spase_keyword_list(loop).case_char eq $
                     spase_ontology.group,case_index_num)

    if (case_index_num gt 0) then begin

       all_case_list=spase_ontology(case_index).tag_name

       case_list=all_case_list(uniq(all_case_list,sort(all_case_list)))

       spase_keyword_list(loop).num=n_elements(case_list)

       spase_keyword_list(loop).keyword(indgen(n_elements(case_list)))=case_list

       case_mask(loop)=1

    endif

endfor

keep_mask=where(case_mask eq 1,keep_mask_num)

;print,case_mask,keep_mask

if (keep_mask_num gt 0) then begin

   spase_keyword_list=spase_keyword_list(keep_mask)

endif else begin

   spase_keyword_list=spase_keyword_record

endelse

return,spase_keyword_list

end

