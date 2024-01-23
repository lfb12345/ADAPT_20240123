
function spase_model_structure,spase_ontology,spase_keyword,directory, $
                               verbose=verbose

dashes='+'+strjoin(replicate('-',273))+'+'

stars=strjoin(replicate('*',275))

record_count=n_elements(spase_ontology)

max_level=max(spase_ontology.tag_level)

keyword_case_num=n_elements(spase_keyword)

suffix=',keyword_required=keyword_required'

for case_index=0,keyword_case_num-1 do begin

    keyword_check=where(spase_keyword(case_index).keyword ne '',keyword_num)

    for keyword_index=0,keyword_num-1 do $
        suffix=suffix+',keyword_'+ $
               spase_keyword(case_index).keyword(keyword_index)+'=keyword_'+ $
               spase_keyword(case_index).keyword(keyword_index)

endfor

openw,10,directory+'spase_model_create.pro'

printf,10, $
   'function spase_model_create,spase_ontology,request,verbose=verbose'+ $
   suffix,format='(/a/)'

structure_list_record=create_struct(name='STRUCTURE_LIST','name','', $
                                    'children_num',0, $
                                    'children',make_array(99,/string,value=''))

structure_list=replicate(structure_list_record,99)

structure=0

warning=0

for level=max_level,1,-1 do begin

;for level=2,2,-1 do begin

    collapse=where(spase_ontology.tag_level le level,collapse_num)

    print,spase_ontology(collapse).keyword

    print,spase_ontology(collapse).tag_level

    print,spase_ontology(collapse)

    same_level=where(spase_ontology(collapse).tag_level eq level,same_level_num)

    contents_check=same_level-indgen(same_level_num)

    groups=contents_check(uniq(contents_check,sort(contents_check)))

    groups_num=n_elements(groups)

    for loop=0,groups_num-1 do begin

        contents_id=groups(loop)

        group=where(contents_id eq contents_check,contents_num)

        spase_ontology(collapse(same_level(group(0))-1)).tag_type=1

        parent=spase_ontology(collapse(same_level(group(0))-1))

        structure_exist= $
           where(parent.tag_name eq structure_list.name,structure_exist_num)

        if (structure_exist_num eq 0) then begin

           child_num=0

           collapse_group=collapse(same_level(group))

           complexity=where(spase_ontology(collapse_group).group ne '' and $
                            spase_ontology(collapse_group).group ne 'A', $
                            complexity_num)

           if (complexity_num eq 0) then begin

              command_full=parent.tag_name+"=create_struct(name='"+ $
                           parent.keyword+"'"

              command_terse=parent.tag_name+"=create_struct(name='"+ $
                            parent.keyword+"'"

              for index=0,contents_num-1 do begin

                  collapse_index=collapse(same_level(group(index)))

                  if (spase_ontology(collapse_index).tag_type eq 0) then begin

                     if (spase_ontology(collapse_index).occur_type eq '0' or $
                         spase_ontology(collapse_index).occur_type eq '1') $
                         then $
                        command_full=command_full+",'"+ $
                                     spase_ontology(collapse_index).tag_name+ $
                                     "',''"

                     if (spase_ontology(collapse_index).occur_type eq '1') $
                        then $
                        command_terse=command_terse+",'"+ $
                                      spase_ontology(collapse_index).tag_name+ $
                                      "',''"

                     format_spec=format_integer(collapse_index)

                     if (spase_ontology(collapse_index).occur_type eq '*' or $
                         spase_ontology(collapse_index).occur_type eq '+') $
                        then $
                        command_full= $
                           command_full+",'"+ $
                           spase_ontology(collapse_index).tag_name+ $
                           "',make_array(spase_ontology("+ $
                           string(collapse_index,format=format_spec)+ $
                           ").occur_num,/string,value='')"

                     if (spase_ontology(collapse_index).occur_type eq '+') $
                        then $
                        command_terse= $
                           command_terse+",'"+ $
                           spase_ontology(collapse_index).tag_name+ $
                           "',make_array(spase_ontology("+ $
                           string(collapse_index,format=format_spec)+ $
                           ").occur_num,/string,value='')"

                  endif else begin

                     if (spase_ontology(collapse_index).occur_type eq '0' or $
                         spase_ontology(collapse_index).occur_type eq '1') $
                        then $
                        command_full=command_full+",'"+ $
                                     spase_ontology(collapse_index).tag_name+ $
                                     "',"+ $
                                     spase_ontology(collapse_index).tag_name

                     if (spase_ontology(collapse_index).occur_type eq '1') $
                        then $
                        command_terse=command_terse+",'"+ $
                                      spase_ontology(collapse_index).tag_name+ $
                                      "',"+ $
                                      spase_ontology(collapse_index).tag_name

                     format_spec=format_integer(collapse_index)

                     if (spase_ontology(collapse_index).occur_type eq '*' or $
                         spase_ontology(collapse_index).occur_type eq '+') $
                        then $
                        command_full= $
                           command_full+",'"+ $
                           spase_ontology(collapse_index).tag_name+ $
                           "',"+'replicate('+ $
                           spase_ontology(collapse_index).tag_name+ $
                           ',spase_ontology('+ $
                           string(collapse_index,format=format_spec)+ $
                           ').occur_num)'

                     if (spase_ontology(collapse_index).occur_type eq '+') $
                        then $
                        command_terse= $
                           command_terse+",'"+ $
                           spase_ontology(collapse_index).tag_name+ $
                           "',"+'replicate('+ $
                           spase_ontology(collapse_index).tag_name+ $
                           ',spase_ontology('+ $
                           string(collapse_index,format=format_spec)+ $
                           ').occur_num)'

                     children_check= $
                        where(spase_ontology(collapse_index).tag_name eq $
                              structure_list(structure).children, $
                              children_check_num)

                     if (children_check_num eq 0) then begin

                        structure_list(structure).children(child_num)= $
                           spase_ontology(collapse_index).tag_name

                        child_num=child_num+1

                     endif

                  endelse

              endfor

              command_full=command_full+')'

              command_terse=command_terse+')'

              element_num=n_elements(string_position(command_terse,','))/2

              if (element_num gt 0 and $
                  strlen(command_terse) lt strlen(command_full)) then begin

                 prefix='if not keyword_set(keyword_required) then '

                 printf,10,prefix+command_full,format='(a/)'

                 prefix='if keyword_set(keyword_required) then '

                 printf,10,prefix+command_terse,format='(a/)'

                 printf,10,"if (request eq '"+parent.tag_name+ $
                           "') then requested_structure="+ $
                           parent.tag_name,format='(a/)'

              endif else begin

                 printf,10,command_full,format='(a/)'

                 printf,10,"if (request eq '"+parent.tag_name+ $
                           "') then requested_structure="+ $
                           parent.tag_name,format='(a/)'

              endelse

              structure_list(structure).name=parent.tag_name

              structure_list(structure).children_num=child_num

              structure=structure+1

           endif else begin

              for complexity_index=0,complexity_num-1 do begin

                  command_full=parent.tag_name+"=create_struct(name='"+ $
                               parent.keyword+"'"

                  command_terse=parent.tag_name+"=create_struct(name='"+ $
                                parent.keyword+"'"

                  temp_index= $
                     collapse(same_level(group(complexity(complexity_index))))

                  current_tag_name=spase_ontology(temp_index).tag_name

                  for index=0,contents_num-1 do begin

                      collapse_index=collapse(same_level(group(index)))

                      if (spase_ontology(collapse_index).group eq '' or $
                          (spase_ontology(collapse_index).group ne '' and $
                           spase_ontology(collapse_index).group ne 'A' and $
                           spase_ontology(collapse_index).tag_name eq $
                           current_tag_name)) then begin

                         if (spase_ontology(collapse_index).tag_type eq 0) $
                            then begin

                            if (spase_ontology(collapse_index).occur_type eq $
                                '0' or $
                                spase_ontology(collapse_index).occur_type eq $
                                '1') then $
                               command_full= $
                                  command_full+",'"+ $
                                  spase_ontology(collapse_index).tag_name+"',''"

                            if (spase_ontology(collapse_index).occur_type eq $
                               '1') then $
                               command_terse= $
                                 command_terse+",'"+ $
                                 spase_ontology(collapse_index).tag_name+"',''"

                            format_spec=format_integer(collapse_index)

                            if (spase_ontology(collapse_index).occur_type eq $
                                '*' or $
                                spase_ontology(collapse_index).occur_type eq $
                                '+') then $
                               command_full= $
                                 command_full+",'"+ $
                                 spase_ontology(collapse_index).tag_name+ $
                                 "',make_array(spase_ontology("+ $
                                 string(collapse_index,format=format_spec)+ $
                                 ").occur_num,/string,value='')"

                            if (spase_ontology(collapse_index).occur_type eq $
                                '+') then $
                               command_terse= $
                                  command_terse+",'"+ $
                                  spase_ontology(collapse_index).tag_name+ $
                                  "',make_array(spase_ontology("+ $
                                  string(collapse_index,format=format_spec)+ $
                                  ").occur_num,/string,value='')"

                         endif else begin

                           if (spase_ontology(collapse_index).occur_type eq $
                               '0' or $
                               spase_ontology(collapse_index).occur_type eq $
                               '1') then $
                              command_full= $
                                command_full+",'"+ $
                                spase_ontology(collapse_index).tag_name+"',"+ $
                                spase_ontology(collapse_index).tag_name

                           if (spase_ontology(collapse_index).occur_type eq $
                               '1') then $
                              command_terse= $
                                command_terse+",'"+ $
                                spase_ontology(collapse_index).tag_name+"',"+ $
                                spase_ontology(collapse_index).tag_name

                           format_spec=format_integer(collapse_index)

                           if (spase_ontology(collapse_index).occur_type eq $
                               '*' or $
                               spase_ontology(collapse_index).occur_type eq $
                               '+') then $
                              command_full= $
                                command_full+",'"+ $
                                spase_ontology(collapse_index).tag_name+"',"+ $
                                'replicate('+ $
                                spase_ontology(collapse_index).tag_name+ $
                                ',spase_ontology('+ $
                                string(collapse_index,format=format_spec)+ $
                                ').occur_num)'

                           if (spase_ontology(collapse_index).occur_type eq $
                               '+') then $
                              command_terse= $
                                 command_terse+",'"+ $
                                 spase_ontology(collapse_index).tag_name+"',"+ $
                                 'replicate('+ $
                                 spase_ontology(collapse_index).tag_name+ $
                                 ',spase_ontology('+ $
                                 string(collapse_index,format=format_spec)+ $
                                 ').occur_num)'

                               temp_tag_name= $
                                  spase_ontology(collapse_index).tag_name

                            children_check= $
                               where(temp_tag_name eq $
                                     structure_list(structure).children, $
                                     children_check_num)

                            if (children_check_num eq 0) then begin

                               structure_list(structure).children(child_num)= $
                                  spase_ontology(collapse_index).tag_name

                               child_num=child_num+1

                            endif

                         endelse

                      endif

                  endfor

                  command_full=command_full+')'

                  command_terse=command_terse+')'

                  element_num=n_elements(string_position(command_terse,','))/2

                  if (element_num gt 0 and $
                      strlen(command_terse) lt strlen(command_full)) then begin

                     prefix='if keyword_set(keyword_'+current_tag_name+ $
                            ') and not keyword_set(keyword_required) then '

                     printf,10,prefix+command_full,format='(a/)'

                     prefix='if keyword_set(keyword_'+current_tag_name+ $
                            ') and keyword_set(keyword_required) then '

                     printf,10,prefix+command_terse,format='(a/)'

                  endif else begin

                     prefix='if keyword_set(keyword_'+current_tag_name+') then '

                     printf,10,prefix+command_full,format='(a/)'

                  endelse

              endfor

              printf,10,"if (request eq '"+parent.tag_name+ $
                        "') then requested_structure="+parent.tag_name, $
                        format='(a/)'

              structure_list(structure).name=parent.tag_name

              structure_list(structure).children_num=child_num

              structure=structure+1

           endelse

        endif else begin

           printf,20,'WARNING:  Structure already exists for ', $
                     parent.tag_name,format='(2a)'

           warning=1

        endelse

    endfor

endfor

if (warning eq 1) then printf,20,stars,format='(/a/)'

printf,10,'return,requested_structure',format='(a/)'

printf,10,'end',format='(a/)'

close,10

structure_list=structure_list(indgen(structure))

printf,20,dashes,format='(/a/)'

printf,20,"Structure Count:  ",structure,format='(a18,i2/)'

printf,20,dashes,format='(a/)'

dashes_short=strjoin(replicate('-',39))

for loop=0,structure-1 do begin

    printf,20,loop,structure_list(loop).children_num, $
              structure_list(loop).name,format='(2i5.3,8x,a)'

    if (structure_list(loop).children_num gt 0) then begin

       printf,20,''

       for child=0,structure_list(loop).children_num-1 do $
           printf,20,loop,structure_list(loop).children_num,child, $
                     structure_list(loop).children(child),format='(3i5.3,3x,a)'

    endif

    printf,20,dashes_short,format='(/a/)'

endfor

printf,20,dashes,format='(a/)'

printf,20,stars,format='(a/)'

return,structure_list

end

