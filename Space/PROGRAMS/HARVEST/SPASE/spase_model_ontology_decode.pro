
function spase_model_ontology_decode,spase_ontology,level,offset,verbose=verbose

record_num=n_elements(spase_ontology)

current_level_index= $
   where(spase_ontology.tag_level eq level,current_level_index_num)

for loop=0,current_level_index_num-1 do begin

    current_offset=offset+current_level_index(loop)

    start_index=current_level_index(loop)+1

    if (loop lt current_level_index_num-1) then begin

       stop_index=current_level_index(loop+1)-1

    endif else begin

       stop_index=record_num-1

    endelse

    if (start_index lt stop_index) then begin

       spase_ontology(current_level_index(loop)).element_start_line= $
          offset+start_index+level-1

       spase_ontology(current_level_index(loop)).element_stop_line= $
          offset+stop_index+level-1

       group_incl=spase_ontology(start_index-1:stop_index).group

       spase_ontology(current_level_index(loop)).group_incl= $
          strjoin(group_incl(uniq(group_incl,sort(group_incl))))

       mask=indgen(stop_index-start_index+1)+start_index

       next_level_index= $
          where(spase_ontology(mask).tag_level eq level+1,next_level_index_num)

       if (next_level_index_num gt 0) then $
          spase_ontology(mask)= $
             spase_model_ontology_decode(spase_ontology(mask),level+1, $
                                         current_offset,/verbose)

    endif

endfor

return,spase_ontology

end

