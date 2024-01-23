
function read_ontology,ontology_file_name,type_file_name,history_file_name, $
                       dictionary_file_name,master_object_name, $
                       dictionary_usage_num,dictionary_type_check_num

stars=strjoin(replicate('*',275))

dashes='+'+strjoin(replicate('-',273))+'+'

spacer='|'+strjoin(replicate(' ',273))+'|'

ontology_table=read_tab_table(ontology_file_name)

ontology=ontology_table.table

ontology_header=ontology_table.header

ontology_num=ontology_table.record_num

type_table=read_tab_table(type_file_name)

type=type_table.table

type_header=type_table.header

type_num=type_table.record_num

history_table=read_tab_table(history_file_name)

history=history_table.table

history_header=history_table.header

history_num=history_table.record_num

dictionary_table=read_tab_table(dictionary_file_name)

dictionary=dictionary_table.table

dictionary_header=dictionary_table.header

dictionary_num=dictionary_table.record_num

printf,20,stars,format='(a/)'

printf,20,master_object_name+' Model Ontology Tab Table File Name:    ', $
          ontology_file_name,format='(2a/)'

printf,20,'Ontology Tab Table Record Count:    ',ontology_num,format='(a,i/)'

printf,20,master_object_name+' Model History Tab Table File Name:     ', $
          history_file_name,format='(2a/)'

printf,20,'History Tab Table Record Count:     ',history_num,format='(a,i/)'

printf,20,master_object_name+' Model Type Tab Table File Name:        ', $
          type_file_name,format='(2a/)'

printf,20,'Type Tab Table Record Count:        ',type_num,format='(a,i/)'

printf,20,master_object_name+' Model Dictionary Tab Table File Name:  ', $
          dictionary_file_name,format='(2a/)'

printf,20,'Dictionary Tab Table Record Count:  ',dictionary_num,format='(a,i/)'

printf,20,stars,format='(a/)'

print,stars,format='(a/)'

print,dashes,spacer,format='(a/a)'

print,'| '+master_object_name+' Model Ontology Tab Table File Name:    '+ $
      ontology_file_name,'|',spacer,format='(a,a47/a)'

print,'| Ontology Tab Table Record Count:    ',ontology_num,'|',spacer, $
      format='(a,i,a126/a)'

print,dashes,spacer,format='(a/a)'

print,'|      | ',ontology_header.(0),' | ',ontology_header.(1),' | ', $
      ontology_header.(2),' | ',ontology_header.(3),' | ', $
      ontology_header.(4),' | ',ontology_header.(5),' | ', $
      ontology_header.(6),' |', $
      format='(a9,a-7,a3,a-7,a3,a-21,a3,a-25,a3,a-9,a3,a-10,a3,a-15,a55)'

print,spacer

for record_loop=0,ontology_num-1 do $
    print,'|',record_loop,' | ',ontology(record_loop).(0),' | ', $
          ontology(record_loop).(1),' | ',ontology(record_loop).(2),' | ', $
          ontology(record_loop).(3),' | ',ontology(record_loop).(4),' | ', $
          ontology(record_loop).(5),' | ',ontology(record_loop).(6),' |', $
          format='(a1,i5.3,2(a3,a-7),a3,a-21,a3,a-25,a3,a-9,a3,a-10,a3,a-15,a55)'

print,dashes,dashes,format='(/a//a/)'

print,master_object_name+' Model Type Tab Table File Name:        ', $
      type_file_name,format='(2a/)'

print,'Type Tab Table Record Count:        ',type_num,format='(a,i/)'

print,stars,format='(a/)'

print,'      | ',type_header.(0),' | ',type_header.(1),' | ',type_header.(2), $
      ' | ',type_header.(3),' |',format='(a8,a-7,a3,a-7,a3,a-11,a3,a-132,a2/)'

for record_loop=0,type_num-1 do $
    print,record_loop,' | ',type(record_loop).(0),' | ',type(record_loop).(1), $
          ' | ',type(record_loop).(2),' | ',type(record_loop).(3),' |', $
          format='(i5.3,a3,a-7,a3,a-7,a3,a-11,a3,a-132,a2)'

print,stars,format='(/a/)'

print,master_object_name+' Model History Tab Table File Name:     ', $
      history_file_name,format='(2a/)'

print,'History Tab Table Record Count:     ',history_num,format='(a,i/)'

print,stars,format='(a/)'

history_column_num=n_tags(history_header)

if (history_column_num eq 5) then begin

   print,'      | ',history_header.(0),' | ',history_header.(1),' | ', $
         history_header.(2),' | ',history_header.(3),' | ',history_header.(4), $
         ' |',format='(a8,a-2,a3,a-7,a3,a-10,a3,a-18,a3,a-117,a2/)'

   for record_loop=0,history_num-1 do $
       print,record_loop,' | ',history(record_loop).(0),' | ', $
             history(record_loop).(1),' | ',history(record_loop).(2),' | ', $
             history(record_loop).(3),' | ',history(record_loop).(4),' |', $
             format='(i5.3,a3,a-2,a3,a-7,a3,a-10,a3,a-18,a3,a-117,a2)'

endif

if (history_column_num eq 6) then begin

   print,'      | ',history_header.(0),' | ',history_header.(1),' | ', $
         history_header.(2),' | ',history_header.(3),' | ',history_header.(4), $
         ' | ',history_header.(5),' |', $
         format='(a8,a-2,a3,a-7,a3,a-10,a3,a-18,a3,a-77,a3,a-37,a2/)'

   for record_loop=0,history_num-1 do $
       print,record_loop,' | ',history(record_loop).(0),' | ', $
             history(record_loop).(1),' | ',history(record_loop).(2),' | ', $
             history(record_loop).(3),' | ',history(record_loop).(4),' | ', $
             history(record_loop).(5),' |', $
             format='(i5.3,a3,a-2,a3,a-7,a3,a-10,a3,a-18,a3,a-77,a3,a-37,a2)'

endif

print,stars,format='(/a/)'

print,master_object_name+' Model Dictionary Tab Table File Name:  ', $
      dictionary_file_name,format='(2a/)'

print,'Dictionary Record Count:            ',dictionary_num,format='(a,i/)'

print,stars,format='(a/)'

print,'      | ',dictionary_header.(0),' | ',dictionary_header.(1),' | ', $
      dictionary_header.(2),' | ',dictionary_header.(3),' | ', $
      dictionary_header.(4),' | ',dictionary_header.(5),' | ', $
      dictionary_header.(6),' | ',dictionary_header.(7),' |', $
      format='(a8,a-7,a3,a-7,a3,a-30,a3,a-11,a3,a-25,a3,a-8,a3,a-9,a3,a-48,a2/)'

for dictionary_loop=0,dictionary_num-1 do $
    print,dictionary_loop,' | ',dictionary[dictionary_loop].(0), $
          ' | ',dictionary[dictionary_loop].(1), $
          ' | ',dictionary[dictionary_loop].(2), $
          ' | ',dictionary[dictionary_loop].(3), $
          ' | ',dictionary[dictionary_loop].(4), $
          ' | ',dictionary[dictionary_loop].(5), $
          ' | ',dictionary[dictionary_loop].(6), $
          ' | ',dictionary[dictionary_loop].(7),' |', $
          format='(i5.3,2(a3,a-7),a3,a-30,a3,a-11,a3,a-25,a3,a-8,a3,a-9,a3,'+ $
                 'a-48,a2)'

print,stars,format='(/a/)'

ontology_record= $
   create_struct(name='Ontology','keyword','','tag_name','','tag_level',0, $
                 'tag_type',0,'occur_type','1','occur_num',1L, $
                 'occur_required',1,'group','','group_incl','','unique',0, $
                 'element_line',0,'element_start_line',0, $
                 'element_stop_line',0,'parent_line',0,'entity','', $
                 'enumeration_list','','raw_name','')

ontology_final=replicate(ontology_record,9999)

ontology_final_num=0

level=0

ontology_tree,ontology,dictionary,master_object_name,ontology_final, $
              ontology_final_num,level

;or loop=0,ontology_final_num-1 do $
;   print,loop,ontology_final(loop).tag_level,ontology_final(loop).group_incl, $
;         ontology_final(loop).group,ontology_final(loop).occur_type, $
;         ontology_final(loop).occur_num,ontology_final(loop).occur_required, $
;         ontology_final(loop).tag_type, $
;         ontology_final(loop).element_line, $
;         ontology_final(loop).element_start_line, $
;         ontology_final(loop).element_stop_line,ontology_final(loop).keyword, $
;         ontology_final(loop).tag_name,ontology_final(loop).unique, $
;         ontology_final(loop).raw_name,ontology_final(loop).enumeration_list, $
;         format='(i5.3,i5,a5,2a2,3i5,2i5,2a30,i5,2a26)'
;         format='(i5.3,i5,a5,2a2,3i5,3i5.3,2a30,i5,2a26)'

print,stars,format='(/a/)'

;
;   Check the Ontology to see if any Objects are listed multiple times in the
;   dictionary.
;

count=0

unique_raw_name=ontology_final(uniq(ontology_final.raw_name, $
                                    sort(ontology_final.raw_name))).raw_name

unique_raw_name_num=n_elements(unique_raw_name)

for loop=0,unique_raw_name_num-1 do begin

    index=where(unique_raw_name(loop) eq dictionary.term,index_num)

    if (index_num gt 1) then begin

       print,'Warning:  ',unique_raw_name(loop), $
             'is listed multiple times in the Dictionary ',index_num, $
             ' times total (raw name check)',format='(a,a-30,a,i5,a)'

       count=count+1

    endif

endfor

if (count gt 0) then print,''

dictionary_usage_num=make_array(dictionary_num,/integer,value=0)

dictionary_type_check_num=make_array(dictionary_num,/integer,value=0)

;
;   Check to ensure that all Enumeration Objects have their corresponding
;   Enumeration Lists define in the Dictionary.
;

count=0

for dictionary_loop=0,dictionary_num-1 do begin

    if (dictionary[dictionary_loop].type eq 'Enumeration' and $
        dictionary[dictionary_loop].list eq '') then begin

       print,'Warning:  ',dictionary[dictionary_loop].term,'is of Type '+ $
             'Enumeration but no Enumeration List is specified!!!', $
              format='(a,a-30,a)'

       count=count+1

    endif

endfor

if (count gt 0) then print,''

;
;   Check to ensure that Enumeration objects are the only objects that have
;   Enumeration Lists set in the Dictionary.
;

count=0

for dictionary_loop=0,dictionary_num-1 do begin

    if (dictionary[dictionary_loop].type ne 'Enumeration' and $
        dictionary[dictionary_loop].list ne '') then begin

       print,'Warning:  ',dictionary[dictionary_loop].term,'is not of Type '+ $
             'Enumeration but an Enumeration List is specified!!!', $
              format='(a,a-30,a)'

       count=count+1

    endif

endfor

if (count gt 0) then print,''

unique_ontology_object_mask=uniq(ontology.object,sort(ontology.object))

unique_ontology_object=ontology(unique_ontology_object_mask).object

unique_ontology_object_num=n_elements(unique_ontology_object)

;
;   Verify that all Objects present in the Ontology have their types set to
;   Container.  Increment the Dictionary usage number as long as the dictionary
;   dictionary does not multilist the Term name of the Object.  And, if the
;   Type is set to Container, increment the Dictionary Type check number for the
;   Term name of the Object only if the Term is not multilisted in the
;   dictionary.
;

count=0

for loop=0,unique_ontology_object_num-1 do begin

    index=where(unique_ontology_object(loop) eq dictionary.term,index_num)

    if (index_num eq 1) then begin

;      print,'Ontology Object Term is in the SPASE '+ $
;            'Dictionary:                       '+unique_ontology_object(loop)

       if (dictionary[index].type eq 'Container') then $
          dictionary_type_check_num(index)=dictionary_type_check_num(index)+1

       dictionary_usage_num(index)=dictionary_usage_num(index)+1

       if (dictionary[index].type ne 'Container') then begin

          print,'Warning:  ',unique_ontology_object(loop),'should be of '+ $
                'type Container however it is designated as type:  '+ $
                dictionary[index].type,format='(a,a-12,a)'

          count=count+1

       endif

    endif

endfor

if (count gt 0) then print,''

;
;  Check that all Ontology that are Containers are correctly defined as such
;  in the Dictionary.  The list of Container Object Names checked here is
;  generated for the Object Names for Ontology records with tag types set
;  equal to 1.  Issue a warning if the Type setting does not equal 'Container'.
;  Increment the Dictionary usage number as long as the Term Name of the
;  object is not multiply listed in the Dictionary.  Increment the Dictionary
;  Type check number again only if the Dictionary Term appears and is not
;  multilisted.
;

index=where(ontology_final.tag_type eq 1,index_num)

if (index_num gt 0) then begin

   container_raw_name=ontology_final(index).raw_name

   unique_container_raw_name= $
      container_raw_name(uniq(container_raw_name,sort(container_raw_name)))

   unique_container_raw_name_num=n_elements(unique_container_raw_name)

   for loop=0,unique_container_raw_name_num-1 do begin

       index=where(unique_container_raw_name(loop) eq dictionary.term,index_num)

       if (index_num eq 1) then begin

          if (dictionary[index].type eq 'Container') then $
             dictionary_type_check_num(index)=dictionary_type_check_num(index)+1

          if (dictionary[index].type ne 'Container') then begin

             print,'Warning:  ',unique_container_raw_name(loop),'should be '+ $
                   'of type Container however it is designated as type:  '+ $
                   dictionary[index].type,format='(a,a-30,a)'

             count=count+1

          endif

       endif

   endfor

   if (count gt 0) then print,''

endif

;
;   Ensure that the unique_container_raw_name list and unique_ontology_object
;   list match exactly member by member.
;

natch=where(unique_container_raw_name eq unique_ontology_object,match_num)

if (match_num ne unique_ontology_object_num) then $
   print,'Hello World, the two ontology container lists are not identical!!!', $
         format='(a/)'

;
;   Check the to see if all unique Ontology objects are listed in the
;   Dictionary.  There are 37 unique Ontology objects in SPASE 1.3.0
;   (that is, unique_ontology_object_num=37).
;

count=0

for loop=0,unique_ontology_object_num-1 do begin

    index=where(unique_ontology_object(loop) eq dictionary.term,index_num)

    if (index_num eq 0) then begin

       print,'Ontology Object Term is not in the SPASE '+ $
             'Dictionary:                   '+unique_ontology_object(loop)

       count=count+1

    endif

endfor

if (count gt 0) then print,''

;
;   Check to see if any Ontology Objects are multilisted in the Dictionary.  Go
;   ahead and increment the Dictionary usage number even if the Term Name of the
;   Object is multiply listed.
;

count=0

for loop=0,unique_ontology_object_num-1 do begin

    index=where(unique_ontology_object(loop) eq dictionary.term,index_num)

    if (index_num gt 1) then begin

       print,'Warning:  ',unique_ontology_object(loop), $
             'is listed multiple times in the Dictionary ',index_num, $
             ' times total (unique ontology.object check)', $
             format='(a,a-30,a,i5,a)'

       dictionary_usage_num(index)=dictionary_usage_num(index)+1

       count=count+1

    endif

endfor

if (count gt 0) then print,''

;
;   Check that each Container in the Ontology has a unique set of Elements.
;   List any Elements that are duplicated.  Reset the Reference count for the
;   list of Elements in all unique Ontology Containers.
;

count=0

for loop=0,unique_ontology_object_num-1 do begin

    index=where(unique_ontology_object(loop) eq dictionary.term,index_num)

    if (index_num eq 1) then begin

       element_mask= $
          where(unique_ontology_object(loop) eq ontology.object,element_num)

       unique_element_mask= $
          uniq(ontology(element_mask).element,sort(ontology(element_mask).element))

       unique_element=ontology(unique_element_mask).element

       unique_element_num=n_elements(unique_element)

       if (unique_element_num eq element_num) then begin

;         print,unique_ontology_object(loop),ontology(element_mask).element, $
;               format='(96a-44)'

;         print,unique_ontology_object(loop),ontology(element_mask).order, $
;               format='(a-30,20i3.2)'

          sort_order=sort(ontology(element_mask).order)

;         print,unique_ontology_object(loop),sort_order,format='(a-30,20i3.2)'

;         print,unique_ontology_object(loop), $
;               ontology(element_mask(sort_order)).order,format='(a-30,20i3.2)'

          ontology(element_mask(sort_order)).order= $
             string(indgen(unique_element_num)+1,format='(i2.2)')

;         print,unique_ontology_object(loop), $
;               ontology(element_mask(sort_order)).order,format='(a-30,20i3.2)'

       endif

       if (unique_element_num lt element_num) then begin

          for unique_loop=0,unique_element_num-1 do begin

              check=where(unique_element(unique_loop) eq $
                          ontology(element_mask).element,check_num)

              if (check_num gt 1) then $
                 print,'Warning:  ',unique_ontology_object(loop), $
                       'Duplicate Element:  '+unique_element(unique_loop), $
                       format='(a,a-30,a)'

          endfor

          count=count+1

       endif

    endif

endfor

if (count gt 0) then print,''

;
;   Write out a New ontology tab file with Reference numbers resequenced.
;

;ntology_output_file_name='/Users/lfb/Space/PROGRAMS/XML/ontology.tab'

;xist_flag=write_tab_table(ontology_output_file_name,ontology,ontology_header, $
;                          ontology_num,/verbose)

;
;   Ontology Element checking starts here!!!
;

;ntology_element=

;nique_ontology_element=

;
;   Issue warning if the Ontology Element Term name is not listed in the
;   Dictionary.  Increment the Dictionary usage number if the Term does
;   appear in the Dictionary.
;

count=0

for loop=0,ontology_num-1 do begin

    index=where(ontology(loop).element eq dictionary.term,index_num)

    if (index_num eq 0) then begin

       print,'Ontology Element Term is not in the SPASE '+ $
             'Dictionary:                  '+ontology(loop).element

       count=count+1

    endif

    if (index_num eq 1) then begin

;      print,'Ontology Element Term is in the SPASE '+ $
;            'Dictionary:                      '+ontology(loop).element

       dictionary_usage_num(index)=dictionary_usage_num(index)+1

       if (dictionary[index].type eq 'Enumeration') then $
          dictionary_type_check_num(index)=dictionary_type_check_num(index)+1

    endif

endfor

if (count gt 0) then print,''

;
;   Issue a warning if the Ontology Element Term name is listed multiple
;   times in the Dictionary.
;

count=0

for loop=0,ontology_num-1 do begin

    index=where(ontology(loop).element eq dictionary.term,index_num)

    if (index_num gt 1) then begin

       print,'Warning:  ',ontology(loop).element, $
             'is listed multiple times in the Dictionary ',index_num, $
             ' times total (ontology.element check)',format='(a,a-30,a,i5,a)'

       dictionary_usage_num(index)=dictionary_usage_num(index)+1

       count=count+1

    endif

endfor

if (count gt 0) then print,''

;
;   Print a summary of Dictionary Terms that are either nonlisted and
;   multilisted in the Dictionary!!!
;

count=0

for loop=0,ontology_num-1 do begin

    element_mask= $
       where(ontology(loop).element eq dictionary.term,element_mask_num)

    if (element_mask_num ne 1) then begin

       print,ontology(loop).element,loop,element_mask_num,format='(a-30,2i5)'

       count=count+1

    endif

endfor

if (count gt 0) then print,''

;
;   Type Tab file checking starts from here!!!  Check if Type names appear
;   in the Dictionary.  Increment the Dictionary usage number the Type name
;   is listed in the Dictionary.  Issue a multiple listing warning if the
;   Type name is listed more than once in the Dictionary.
;

count=0

for loop=0,type_num-1 do begin

    index=where(type(loop).type eq dictionary.term,index_num)

    if (index_num eq 0) then begin

       print,'Warning:  ',type(loop).type, $
             'Type Term is not in the SPASE Dictionary.', $
              format='(a,a-30,a,i5,a)'

       count=count+1

    endif

    if (index_num eq 1) then begin

;      print,'Type Term is in the SPASE '+ $
;            'Dictionary:                                  '+type(loop).type

       dictionary_usage_num(index)=dictionary_usage_num(index)+1

    endif

    if (index_num gt 1) then begin

       print,'Warning:  ',type(loop).type, $
             'is listed multiple times in the Dictionary ',index_num, $
             ' times total (type.type check)',format='(a,a-30,a,i5,a)'

;      print,'Type Term appears multiple times in the SPASE '+ $
;            'Dictionary:              '+type(loop).type

       dictionary_usage_num(index)=dictionary_usage_num(index)+1

       count=count+1

    endif

endfor

if (count gt 0) then print,stars,format='(/a/)'

;
;   Look for any phantom Types listed in the dictionary.  The only valid Type
;   names are those listed in the Type tab file.
;

non_type=dictionary.type

non_type_name=dictionary.term

for loop=0,type_num-1 do begin

    type_mask=where(dictionary.type eq type(loop).type,type_mask_num)

    non_type_mask=where(non_type ne type(loop).type,non_type_mask_num)

    if (non_type_mask_num gt 0) then begin

       non_type=non_type(non_type_mask)

       non_type_name=non_type_name(non_type_mask)

    endif

    print,type(loop).type,type_mask_num,non_type_mask_num, $
          type_mask_num+non_type_mask_num,format='(a-12,3i5)'

endfor

print,''

;
;  List any Type names that are found in the Dictionary but not defined in the
;  Type tab file.
;

non_type_num=n_elements(non_type)

if (non_type_mask_num gt 0) then begin

   for loop=0,non_type_num-1 do $
       print,'Warning:  ',non_type(loop),non_type_name(loop), $
             format='(a,a-12,a-30)'

   if (count gt 0) then print,''

endif

print,stars,format='(a/)'

;
;   List the Dictionary Terms sorted on Type.
;

for loop=0,type_num-1 do begin

    type_mask=where(dictionary.type eq type(loop).type,type_mask_num)

    if (type_mask_num gt 0) then begin

       print,'      | ',dictionary_header.(0),' | ',dictionary_header.(1), $
             ' | ',dictionary_header.(2),' | ',dictionary_header.(3),' | ', $
             dictionary_header.(4),' | ',dictionary_header.(5),' | ', $
             dictionary_header.(6),' | ',dictionary_header.(7),' |', $
             format='(a8,a-7,a3,a-7,a3,a-30,a3,a-11,a3,a-25,a3,a-8,a3,a-9,'+ $
                    'a3,a-48,a2/)'

       for mask_loop=0,type_mask_num-1 do $
           print,mask_loop,' | ',dictionary[type_mask(mask_loop)].(0), $
                 ' | ',dictionary[type_mask(mask_loop)].(1), $
                 ' | ',dictionary[type_mask(mask_loop)].(2), $
                 ' | ',dictionary[type_mask(mask_loop)].(3), $
                 ' | ',dictionary[type_mask(mask_loop)].(4), $
                 ' | ',dictionary[type_mask(mask_loop)].(5), $
                 ' | ',dictionary[type_mask(mask_loop)].(6), $
                 ' | ',dictionary[type_mask(mask_loop)].(7),' |', $
                 format='(i5.3,2(a3,a-7),a3,a-30,a3,a-11,a3,a-25,a3,a-8,a3,'+ $
                        'a-9,a3,a-48,a2)'

       print,stars,format='(/a/)'

    endif

endfor

;
;   List any Dictionary Terms that have been checked to verify Type assignment.
;   Organize the list Type by Type
;

for type_loop=0,type_num-1 do begin

    dictionary_type_mask= $
       where(dictionary.type eq type(type_loop).type,dictionary_type_mask_num)

    if (dictionary_type_mask_num gt 0) then begin

       count=0

       for loop=0,dictionary_type_mask_num-1 do begin

           if (dictionary_type_check_num(dictionary_type_mask(loop)) gt 0) $
              then begin

              print,dictionary[dictionary_type_mask(loop)].term, $
                    dictionary[dictionary_type_mask(loop)].type, $
                    dictionary_type_check_num(dictionary_type_mask(loop)), $
                    format='(2(a-30),i5)'

;             print,mask_loop,' | ', $
;                   dictionary[dictionary_type_mask(mask_loop)].(0),' | ', $
;                   dictionary[dictionary_type_mask(mask_loop)].(1),' | ', $
;                   dictionary[dictionary_type_mask(mask_loop)].(2),' | ', $
;                   dictionary[dictionary_type_mask(mask_loop)].(3),' | ', $
;                   dictionary[dictionary_type_mask(mask_loop)].(4),' | ', $
;                   dictionary[dictionary_type_mask(mask_loop)].(5),' | ', $
;                   dictionary[dictionary_type_mask(mask_loop)].(6),' | ', $
;                   dictionary[dictionary_type_mask(mask_loop)].(7),' |', $
;                   format='(i5.3,2(a3,a-7),a3,a-30,a3,a-11,a3,a-25,a3,a-8,'+ $
;                           'a3,a-9,a3,a-48,a2)'

              count=count+1

           endif

       endfor

       if (count gt 0) then print,stars,format='(/a/)'

    endif

endfor

return,ontology_final

end

