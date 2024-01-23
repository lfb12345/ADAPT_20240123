
function spase_model_populate_new,spase_ontology,spase_structure_list, $
                                  spase_keyword_list,spase_enumeration_list, $
                                  directory,verbose=verbose

stars=strjoin(replicate('*',275))

dashes='+'+strjoin(replicate('-',273))+'+'

print,stars,format='(a/)'

print,'Yataaaaa!!!   spase_model_populate_new start',format='(a/)'

print,stars,format='(a/)'

fill=''

spase_ontology_num=n_elements(spase_ontology)

structure_num=n_elements(spase_structure_list)

spase_model_populate_error=make_array(structure_num,/integer,value=1)

;
;   Collect information on the number of structure occurrences by structure name
;

structure_info_record= $
   create_struct(name='Structure Occur Info','name','','occur_num',0, $
                 'start_line',make_array(54,/integer,value=-1), $
                 'stop_line',make_array(54,/integer,value=-1))

structure_info=replicate(structure_info_record,structure_num)

for struct_loop=0,structure_num-1 do begin

    structure_info(struct_loop).name=spase_structure_list(struct_loop).name

    structure_start_line=where(structure_info(struct_loop).name eq $
                               spase_ontology.tag_name,structure_start_line_num)

    structure_info(struct_loop).occur_num=structure_start_line_num

    for start_loop=0,structure_start_line_num-1 do begin

        structure_info(struct_loop).start_line(start_loop)= $
           spase_ontology(structure_start_line(start_loop)).element_start_line

        structure_info(struct_loop).stop_line(start_loop)= $
           spase_ontology(structure_start_line(start_loop)).element_stop_line

;       print,start_loop,structure_info(struct_loop).start_line(start_loop), $
;             structure_info(struct_loop).stop_line(start_loop)

    endfor

endfor

occur_num=structure_info.occur_num

occur_num=occur_num(uniq(occur_num,sort(occur_num)))

for occur_loop=0,n_elements(occur_num)-1 do begin

    same_occur= $
       where(structure_info.occur_num eq occur_num(occur_loop),same_occur_num)

    for same_occur_loop=same_occur_num-1,0,-1 do begin

        start_line=structure_info(same_occur(same_occur_loop)).start_line

        stop_line=structure_info(same_occur(same_occur_loop)).stop_line

        start_line_check=where(start_line ne -1,start_line_num)

;       for start_line_loop=0,start_line_num-1 do $
;           printf,20,structure_info(same_occur(same_occur_loop)).name, $
;                 occur_num(occur_loop),start_line(start_line_loop), $
;                 stop_line(start_line_loop),format='(a-30,3i5)'

    endfor

endfor

;rintf,20,''

;
;   Loop once for every spase structure to generate a function that can be
;   customized to populate each structure.  The generic version of each populate
;   function is designed to compile correctly prior to user customization of
;   the value assignment statements present within the functions.
;

for loop=0,structure_num-1 do begin

    structure_name=spase_structure_list(loop).name

    structure_start_line=where(structure_name eq spase_ontology.tag_name, $
                               structure_start_line_num)

;   printf,20,structure_name,structure_start_line_num,format='(a-30,i5/)'

;
;   If the structure name is a valid element of the spase ontology model,
;   then generate a populate function for the structure.
;

    if (structure_start_line_num gt 0) then begin

       structure_start_line=structure_start_line(0)

       spase_model_populate_error(loop)=0

       record_start=spase_ontology(structure_start_line).element_start_line

       record_stop=spase_ontology(structure_start_line).element_stop_line

       tag_name=spase_ontology(structure_start_line).tag_name

       root_tag_level=spase_ontology(structure_start_line).tag_level

       record_mask=indgen(record_stop-record_start)+record_start

       level_num=max(spase_ontology(record_mask).tag_level)-root_tag_level+1

       openw,10,directory+'populate_'+structure_name+'.pro'

;
;      Create the suffix text that will be appended to the function procedure
;      start line to handle keywords that handle exclusionary substructures and
;      one additional keyword that allows one to include required elements only
;      in the spase structures.  A verbose keyword, if set, generates a complete
;      log file to be generated.
;

       suffix=',verbose=verbose'

;      REQUIRED MASKING!!!

       required=where(spase_ontology(record_mask).occur_num eq 0,required_num)

       if (required_num gt 0) then $
          suffix=suffix+',keyword_required=keyword_required'

       group_incl_num=strlen(spase_ontology(structure_start_line).group_incl)

       if (group_incl_num gt 0) then begin

          for group_incl_index=0,group_incl_num-1 do begin

              case_char= $
                 strmid(spase_ontology(structure_start_line).group_incl, $
                        group_incl_index,1)

              if (case_char ne spase_ontology(structure_start_line).group and $
                  case_char ne 'A') then begin

                 case_index=where(case_char eq spase_keyword_list.case_char)

                 for keyword_num=0,spase_keyword_list(case_index).num-1 do $
                     suffix= $
                        suffix+',keyword_'+$
                        spase_keyword_list(case_index).keyword(keyword_num)+ $
                        '=keyword_'+$
                        spase_keyword_list(case_index).keyword(keyword_num)

              endif

          endfor

       endif

       printf,10,'function '+'populate_'+structure_name+ $
                 ',spase_ontology,station_info'+suffix,format='(/a/)'

       printf,10,structure_name+"=spase_model_create(spase_ontology,'"+ $
                 structure_name+"'"+suffix+')',format='(a/)'

;
;      Include any enumeration lists that are found in the requested
;      spase structure.   ---   ???   WHAT IF ENUMERATE_NUM > 1   ???   ---
;

       enumeration_list_name= $
          strlowcase(string_condition(spase_enumeration_list.tag_name,' ','_'))

;      for enumeration_list_name_num=1,n_elements(enumeration_list_name)-1 do begin

;          list_num=n_elements(spase_enumeration_list(enumeration_list_name_num).list)

;          list_num=999

;          printf,20,'AAA:',structure_name, $
;                    spase_enumeration_list(enumeration_list_name_num).num, $
;                    spase_enumeration_list(enumeration_list_name_num).tag_name, $
;                    spase_enumeration_list(enumeration_list_name_num).parent, $
;                    list_num,format='(a-6,a-24,i5,a30,2i5)'

;      endfor

;      print,''

       list_num=0

       for record=record_start,record_stop do begin

          if (spase_ontology(record).enumeration_list ne '') then begin

             enumerate=where(spase_ontology(record).enumeration_list eq $
                             enumeration_list_name,enumerate_num)

             if (enumerate_num eq 1) then begin

                valid= $
                   where(spase_enumeration_list(enumerate).list ne '',valid_num)

                list_elements=[spase_enumeration_list(enumerate).list(valid)]

                list_array="['',"+strjoin(list_elements,',')+']'

                list_num=list_num+1

             endif

          endif

       endfor

       if (list_num gt 1) then begin

          printf,10,';'

          printf,10,';'+strjoin(replicate('-',79))

          printf,10,';'

          printf,10,';  '+strupcase(structure_name)+' List Num:',strtrim(string(list_num),2),format='(a-50,a3)'

          printf,10,';'

          printf,10,';'+strjoin(replicate('-',79))

          printf,10,';',format='(a/)'

          print,dashes,format='(a/)'

          print,strupcase(structure_name)+' List Num:',strtrim(string(list_num),2),format='(a-50,a3/)'

          print,dashes,format='(a/)'

       endif

       enumeration_list_log=make_array(999,/string,value='')

       enumeration_list_log_num=0

       for record=record_start,record_stop do begin

          if (spase_ontology(record).enumeration_list ne '') then begin

;            print,'Enum_List:  '+spase_ontology(record).enumeration_list, $
;                  format='(/a/)'

             enumeration_list_log(enumeration_list_log_num)= $
                spase_ontology(record).tag_name

             enumeration_list_log_num=enumeration_list_log_num+1

             enumerate=where(spase_ontology(record).enumeration_list eq $
                             enumeration_list_name,enumerate_num)

             if (enumerate_num eq 1) then begin

                valid= $
                   where(spase_enumeration_list(enumerate).list ne '',valid_num)

                list_elements=[spase_enumeration_list(enumerate).list(valid)]

;               print,'EEEE_LIST: ',spase_enumeration_list(enumerate).list

                list_array_text=spase_ontology(record).tag_name+'_list='+ $
                                "['',"+strjoin(list_elements,',')+']'

;               print,'LIST_ENUM: '+list_array_text

                list_array_text=line_margin(list_array_text)

                list_array_text_num=n_elements(list_array_text)

;               for list_array_text_loop=0,list_array_text_num-1 do $
;                   print,'ENUM_LIST:  '+list_array_text(list_array_text_loop)

;               for list_array_text_loop=0,list_array_text_num-1 do $
;                   printf,10,list_array_text(list_array_text_loop)

;               printf,10,''

;               for list_array_text_loop=0,list_array_text_num-1 do $
;                   printf,20,list_array_text(list_array_text_loop)

;               printf,20,''

                list_num=list_num+1

             endif

          endif

       endfor

       enumeration_list_log_mask= $
          where(enumeration_list_log ne '',enumeration_list_log_mask_num)

       enumeration_list_log=enumeration_list_log(enumeration_list_log_mask)

;      print,''

;      for enumeration_list_log_mask_loop=0,enumeration_list_log_mask_num-1 do $
;          print,'Enumeration LIST:',structure_name, $
;                enumeration_list_log(enumeration_list_log_mask_loop), $
;                format='(a-20,a-24,a)'

;      print,''

       enumeration_list_log= $
          enumeration_list_log(uniq(enumeration_list_log, $
                                    sort(enumeration_list_log)))

       enumeration_list_log_num=n_elements(enumeration_list_log)

       for enumeration_list_log_loop=0,enumeration_list_log_num-1 do begin

;          print,'Enumeration List:',structure_name, $
;                enumeration_list_log(enumeration_list_log_loop), $
;                format='(a-20,a-24,a)'

           enumeration_check=enumeration_list_log(enumeration_list_log_loop)

           if (enumeration_check eq 'observed_region' or $
               enumeration_check eq 'observatory_region') then begin

              enumeration_check='region'

           endif else begin

              enumeration_check=enumeration_list_log(enumeration_list_log_loop)

           endelse

           enumerate= $
              where(enumeration_check eq enumeration_list_name,enumerate_num)

           if (enumerate_num eq 1) then begin

              valid= $
                 where(spase_enumeration_list(enumerate).list ne '',valid_num)

              list_elements=[spase_enumeration_list(enumerate).list(valid)]

;             print,'EEEE_LIST: ',spase_enumeration_list(enumerate).list

              list_array_text=enumeration_list_log(enumeration_list_log_loop)+ $
                              '_list='+"['',"+strjoin(list_elements,',')+']'

;             print,'LIST_ENUM: '+list_array_text

              list_array_text=line_margin(list_array_text)

              list_array_text_num=n_elements(list_array_text)

;             for list_array_text_loop=0,list_array_text_num-1 do $
;                 print,'ENUM_LIST:  '+list_array_text(list_array_text_loop)

              for list_array_text_loop=0,list_array_text_num-1 do $
                  printf,10,list_array_text(list_array_text_loop)

              printf,10,''

;             for list_array_text_loop=0,list_array_text_num-1 do $
;                 printf,20,list_array_text(list_array_text_loop)

;             printf,20,''

           endif

       endfor

;      ontology_record= $
;         create_struct(name='Ontology','keyword','','tag_name','','tag_level',0,'tag_type',0,'occur_type','1','occur_num',1,'occur_required',1,'group','','group_incl','', $
;                       'unique',0,'element_line',0,'element_start_line',0,'element_stop_line',0,'parent_line',0,'entity','','enumeration_list','','raw_name','')

;      spase_enumeration_list_record= $
;         create_struct(name='Enumeration List','num',0,'tag_name','','parent',0,'list',make_array(list_mask_num_max,/string,value=''))

;
;      Set up arrays that track information for each node of the spase model
;      branch under consideration including node names, node occurrence numbers,
;      node level numbers (relative to the level number of the spase structure
;      under consideration), and arrays that track whether if and for IDL code
;      blocks remain open.
;

       branch=make_array(level_num,/string,value='')

       branch_actual=make_array(level_num,/string,value='')

       branch_multiple=make_array(level_num,/string,value='')

       branch(0)=structure_name

       branch_actual(0)=structure_name

       branch_multiple(0)=structure_name+'('+structure_name+'_loop)'

       branch_occur_num=make_array(level_num,/integer,value=0)

       open_if_set=make_array(level_num,/integer,value=0)

       open_for_set=make_array(level_num,/integer,value=0)

       tab_if=replicate('',level_num)

       tab_for=replicate('',level_num)

       for tab_loop=1,level_num-1 do begin

           tab_if(tab_loop)=strjoin(replicate('   ',tab_loop))

           tab_for(tab_loop)=strjoin(replicate('    ',tab_loop))

       endfor

       for record=record_start,record_stop do begin

           branch_index=spase_ontology(record).tag_level-root_tag_level

           branch_occur_num(branch_index)=spase_ontology(record).occur_num

           branch(branch_index)=spase_ontology(record).tag_name

           branch_actual(branch_index)=branch(branch_index)

           branch_multiple(branch_index)=branch(branch_index)+'('+ $
                                         branch(branch_index)+'_loop)'

           tab_if_check=where(open_if_set eq 1,tab_if_index)

           if (spase_ontology(record).element_start_line ne $
               spase_ontology(record).element_stop_line) then begin

;
;             If the SPASE element specified using spase_ontology(record) is a
;             container, come here to do the text processing for the element's
;             corresponding code snippet in the IDL populate function under
;             construction.
;

              if (spase_ontology(record).group ne 'A' and $
                  spase_ontology(record).group ne '') then begin

                 command=tab_if(tab_if_index)+'if keyword_set(keyword_'+ $
                         branch(branch_index)+') then begin'

                 printf,10,command,format='(a/)'

                 open_if_set(branch_index)=1

              endif

              if (branch_occur_num(branch_index) gt 1) then begin

                 branch_actual(branch_index)=branch_multiple(branch_index)

                 tab_if_check=where(open_if_set eq 1,tab_if_index)

                 tab_for_check=where(open_for_set eq 1,tab_for_index)

                 open_for_set(branch_index)=1

                 format_spec=format_integer(branch_occur_num(branch_index))

                 printf,10,tab_if(tab_if_index)+tab_for(tab_for_index)+'for '+ $
                           branch(branch_index)+'_loop=0,'+ $
                           string(branch_occur_num(branch_index)-1, $
                                  format=format_spec)+' do begin',format='(a/)'

              endif

           endif else begin

;
;             If the SPASE element that is currently under consideration, that
;             is, spase_ontology(record) is not a container, then it must be a
;             simple text field or an array of text fields (dependent on the
;             element's occurrence specification).  For this case, come here to
;             do the text processing for the element's code snippet in the
;             populate function.
;

;             if (open_if_set(branch_index) eq 1) then $
;                printf,10,tab_if(tab_if_index)+tab_for(tab_for_index)+ $
;                          'endif',format='(a/)'

              prefix=''

              if (spase_ontology(record).group ne '' and $
                  spase_ontology(record).group ne 'A') then begin

                 prefix=prefix+'if keyword_set(keyword_'+branch(branch_index)+ $
                        ') then '

              endif

              command=prefix+strjoin(branch_actual(indgen(branch_index)),'.')

              enumerate=where(spase_enumeration_list.tag_name eq $
                              branch(branch_index),enumerate_num)

              if (enumerate_num eq 0) then begin

                 if (branch_occur_num(branch_index) eq 1) then $
                    command=prefix+ $
                            strjoin(branch_actual(indgen(branch_index)),'.')+ $
                            '.'+branch(branch_index)+"='"+fill+"'"

                 if (branch_occur_num(branch_index) gt 1) then begin

                    format_spec=format_integer(branch_occur_num(branch_index)-1)

                    tab_for_check=where(open_for_set eq 1,tab_for_index)

                    tab_if_check=where(open_if_set eq 1,tab_if_index)

                    branch_actual(branch_index)=branch_multiple(branch_index)

                    command=prefix+'for '+branch(branch_index)+'_loop=0,'+ $
                            string(branch_occur_num(branch_index)-1, $
                                   format=format_spec)+' do '+ $
                            strjoin(branch_actual(indgen(branch_index)),'.')+ $
                            '.'+branch_actual(branch_index)+"='"+fill+"'"

                 endif

              endif else begin

                 tab_for_check=where(open_for_set eq 1,tab_for_index)

                 tab_if_check=where(open_if_set eq 1,tab_if_index)

                 printf,10,tab_if(tab_if_index)+tab_for(tab_for_index)+ $
                           branch(branch_index)+'_num=0',format='(a/)'

                 if (branch_occur_num(branch_index) eq 1) then $
                    command=command+'.'+branch(branch_index)+'='+ $
                            branch(branch_index)+'_list('+ $
                            branch(branch_index)+'_num)'

                 if (branch_occur_num(branch_index) gt 1) then begin

                    format_spec=format_integer(branch_occur_num(branch_index))

                    tab_if_check=where(open_if_set eq 1,tab_if_index)

                    tab_for_check=where(open_for_set eq 1,tab_for_index)

;                   open_for_set(branch_index)=1

                    branch_actual(branch_index)=branch_multiple(branch_index)

;                   printf,10,tab_if(tab_if_index)+tab_for(tab_for_index)+ $
;                             'for loop=0,'+ $
;                             string(branch_occur_num(branch_index), $
;                                    format=format_spec)+ $
;                             ' do begin',format='(a/)'

                    command=prefix+'for '+branch(branch_index)+'_loop=0,'+ $
                            string(branch_occur_num(branch_index)-1, $
                                   format=format_spec)+' do '+ $
                            strjoin(branch_actual(indgen(branch_index)),'.')+ $
                            '.'+branch_actual(branch_index)+"="+ $
                            branch(branch_index)+'_list('+ $
                            branch(branch_index)+'_num)'

                 endif

              endelse

              tab_for_check=where(open_for_set eq 1,tab_for_index)

              tab_if_check=where(open_if_set eq 1,tab_if_index)

              printf,10,tab_if(tab_if_index)+tab_for(tab_for_index)+command, $
                        format='(a/)'

           endelse

;          printf,20,strjoin(branch(indgen(branch_index+1)),'.')

;
;          Close IDL if and for statements and reset branch characteristics as
;          required by the spase model specified.
;
;          SPASE Kluge for last record!!!
;

           record_next=record+1

           if (record+1 gt spase_ontology_num-1) then record_next=record

           if ((record lt record_stop and spase_ontology(record).tag_level gt $
                spase_ontology(record_next).tag_level) or $
               record eq record_stop) $
              then begin

              level_reset=0

              if (record lt record_stop and spase_ontology(record).tag_level $
                  gt spase_ontology(record_next).tag_level) then $
                 level_reset=spase_ontology(record_next).tag_level- $
                             root_tag_level

              for reset_loop=level_num-1,level_reset,-1 do begin

                  branch(reset_loop)=''

                  mask=indgen(level_num-level_reset+1)

                  if (open_if_set(reset_loop) eq 1) then begin

                     open_if_set(reset_loop)=0

                     tab_if_check=where(open_if_set(mask) eq 1,tab_if_index)

                     tab_for_check=where(open_for_set(mask) eq 1,tab_for_index)

                     printf,10,tab_if(tab_if_index)+tab_if(tab_if_index)+ $
                               'endif',format='(a/)'

                  endif

                  if (open_for_set(reset_loop) eq 1) then begin

                     branch_occur_num(reset_loop)=0

                     tab_if_check=where(open_if_set(mask) eq 1,tab_if_index)

                     open_for_set(reset_loop)=0

                     tab_for_check=where(open_for_set(mask) eq 1,tab_for_index)

                     printf,10,tab_for(tab_for_index)+tab_if(tab_if_index)+ $
                               'endfor',format='(a/)'

                  endif

              endfor

           endif

       endfor

;      printf,20,''

       open_if_num=total(open_if_set)

       printf,10,'return,'+structure_name,format='(a/)'

       printf,10,'end',format='(a/)'

       close,10

    endif

endfor

print,stars,format='(a/)'

print,'Yataaaaa!!!   spase_model_populate_new stop',format='(a/)'

print,stars,format='(a/)'

return,spase_model_populate_error

end

