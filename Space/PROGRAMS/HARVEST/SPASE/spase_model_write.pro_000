
function spase_model_write,spase_ontology,spase_keyword,directory, $
                           verbose=verbose

stars=strjoin(replicate('*',275))

loop_suffix= $
   ['zero','one','two','three','four','five','six','seven','eight','nine']

record_count=n_elements(spase_ontology)

max_level=max(spase_ontology.tag_level)

structure_list=make_array(100,/string,value='')

structure=0

warning=0

for level=max_level,1,-1 do begin

    collapse=where(spase_ontology.tag_level le level)

    level_mask=where(spase_ontology(collapse).tag_level eq level,level_mask_num)

    group_index=level_mask-indgen(level_mask_num)

    groups=group_index(uniq(group_index,sort(group_index)))

    groups_num=n_elements(groups)

;   print,'LEVEL:            ',collapse
;   print,'COLLAPSE:         ',collapse
;   print,'LEVEL_MASK:       ',level_mask
;   print,'GROUP_INDEX:      ',group_index
;   print,'GROUPS:           ',groups,format='(2a/)'

    for loop=0,groups_num-1 do begin

        group=where(groups(loop) eq group_index,group_num)

        spase_ontology(collapse(level_mask(group(0))-1)).tag_type=1

        parent=spase_ontology(collapse(level_mask(group(0))-1))

;       print,'PARENT.TAG_NAME:  ',parent.tag_name,format='(2a/)'

        structure_exist=where(parent.tag_name eq structure_list, $
                              structure_exist_num)

        resource_index=where(parent.tag_name eq spase_ontology.tag_name)

        parent=spase_ontology(resource_index(0))

;       print,'PARENT:  ',parent

        if (structure_exist_num eq 0) then begin

           structure_list(structure)=parent.tag_name

           structure=structure+1

           openw,10,directory+'write_'+parent.tag_name+'.pro'

           suffix=spase_model_write_suffix(parent,spase_keyword)

           if (parent.tag_name eq 'spase') then begin

              printf,10,'function write_'+parent.tag_name+','+parent.tag_name+ $
                        ',spase_ontology,spase_version'+suffix+ $
                        ',blank_check=blank_check,preview=preview,full=full', $
                        format='(/a/)'

              printf,10,parent.tag_name+"_xml=replicate('',99999L)", $
                        format='(a/)'

              printf,10,'spase_xml_tag_open,spase_version,'+parent.tag_name+ $
                        '_xml,preview=preview',format='(a/)'

              printf,10,'index_mask=where('+parent.tag_name+'_xml ne '+"''"+',index)',format='(a/)'

           endif else begin

              printf,10,'function write_'+parent.tag_name+','+parent.tag_name+ $
                        ',spase_ontology,full_xml,full_index'+suffix+ $
                        ',blank_check=blank_check,preview=preview,full=full', $
                        format='(/a/)'

              printf,10,'if ((spase_model_blank_check('+parent.tag_name+ $
                        ") eq '' and keyword_set(blank_check)) and "+ $
                        'spase_ontology(0).occur_required ne 1) then '+ $
                        "return,''",format='(a/)'

              printf,10,parent.tag_name+"_xml=replicate('',99999L)",format='(a/)'

              printf,10,'index=0',format='(a/)'

              printf,10,'xml_tag_open,spase_ontology(0),'+parent.tag_name+ $
                        '_xml,index,preview=preview',format='(a/)'

           endelse

           shift=0

           for index=0,group_num-1 do begin

               collapse_index=collapse(level_mask(group(index)))

               prefix=''

               if (spase_ontology(collapse_index).group ne '' and $
                   spase_ontology(collapse_index).group ne 'A') then $
                  prefix='if keyword_set(keyword_'+ $
                         spase_ontology(collapse_index).tag_name+') then '

               suffix=spase_model_write_suffix(spase_ontology(collapse_index), $
                                               spase_keyword)

               occur_num=spase_ontology(collapse_index).occur_num

;              if (occur_num gt 1) then begin

;                 print,'PLURAL:  ',spase_ontology(collapse_index)

;                 print,''

;              endif

               element_path=parent.tag_name+'.'+ $
                            spase_ontology(collapse_index).tag_name

               if (spase_ontology(collapse_index).tag_type eq 0) then begin

                  required_text=''

                  if (spase_ontology(collapse_index).occur_required eq 0) $
                     then required_text='if ('+element_path+'(loop_'+ $
                                        loop_suffix(level)+") ne '' or "+ $
                                        'not keyword_set(blank_check)) then '

                  if (spase_ontology(collapse_index).occur_required eq 1) $
                     then required_text='if (loop_'+loop_suffix(level)+ $
                                        ' eq 0 or (loop_'+ $
                                        loop_suffix(level)+' gt 0 and '+ $
                                        element_path+'(loop_'+ $
                                        loop_suffix(level)+")) ne '' or "+ $
                                        'not keyword_set(blank_check)) then '

                  offset=collapse_index-collapse(level_mask(group(0))-1)

                  format=format_integer(offset)

                  required_text=''

                  printf,10,prefix+required_text+'xml_element_write,'+ $
                            element_path+',spase_ontology('+ $
                            string(offset,format=format)+'),'+parent.tag_name+ $
                            '_xml,index'+suffix+',blank_check=blank_check,'+ $
                            'preview=preview',format='(a/)'

               endif else begin

                  test_index=where(spase_ontology(collapse_index).tag_name eq $
                                   spase_ontology.tag_name,test_num)

                  sub_structure_ontology_num= $
                     spase_ontology(test_index(0)).element_stop_line- $
                     spase_ontology(test_index(0)).element_start_line+2

                  sub_ontology_mask=index+indgen(sub_structure_ontology_num)+ $
                                    shift+1

                  shift=shift+sub_structure_ontology_num-1

                  start_index=sub_ontology_mask(0)

                  start_index_string= $
                     string(start_index,format=format_integer(start_index))

                  stop_index=sub_ontology_mask(sub_structure_ontology_num-1)

                  stop_index_string= $
                     string(stop_index,format=format_integer(stop_index))

                  printf,10,prefix+'temp_xml=xml_structure_write('+ $
                            parent.tag_name+'.'+ $
                            spase_ontology(collapse_index).tag_name+','+ $
                            parent.tag_name+'_xml,index,spase_ontology'+ $
                            '('+start_index_string+':'+stop_index_string+')'+ $
                            suffix+',preview=preview,full=full)',format='(a/)'

               endelse

           endfor

           printf,10,'xml_tag_close,spase_ontology(0),'+parent.tag_name+ $
                     '_xml,index,preview=preview',format='(a/)'

           if (parent.tag_name eq 'spase') then begin

              printf,10,'mask=indgen(index)',format='(a/)'

              printf,10,'spase_xml=spase_xml(mask)',format='(a/)'

           endif

           if (parent.tag_name ne 'spase') then $
              printf,10,'xml_mirror,full_xml,'+parent.tag_name+'_xml,'+ $
                        'full_index,preview=preview',format='(a/)'

           printf,10,'return,'+parent.tag_name+'_xml',format='(a/)'

           printf,10,'end',format='(a/)'

           close,10

        endif else begin

           printf,20,'WARNING:  Structure already exists for ', $
                     parent.tag_name,format='(2a)'

           warning=1

        endelse

    endfor

endfor

if (warning eq 1) then printf,20,stars,format='(/a/)'

printf,20,'Structure Count:  ',structure,format='(a-21,i2/)'

for loop=0,structure-1 do printf,20,structure_list(loop),loop,format='(a-21,i2)'

printf,20,stars,format='(/a/)'

return,spase_ontology

end

