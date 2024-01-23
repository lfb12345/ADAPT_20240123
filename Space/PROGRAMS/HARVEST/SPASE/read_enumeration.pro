
function read_enumeration,list_file_name,member_file_name, $
                          dictionary_file_name,type_file_name, $
                          master_object_name,dictionary_usage_num, $
                          dictionary_type_check_num,verbose=verbose

stars=strjoin(replicate('*',275))

dashes='+'+strjoin(replicate('-',273))+'+'

!EXCEPT=2

list_table=read_tab_table(list_file_name)

list=list_table.table

enumeration_test=list_table.table

list_header=list_table.header

list_num=list_table.record_num

member_table=read_tab_table(member_file_name)

member=member_table.table

member_header=member_table.header

member_num=member_table.record_num

dictionary_table=read_tab_table(dictionary_file_name)

dictionary=dictionary_table.table

dictionary_header=dictionary_table.header

dictionary_num=dictionary_table.record_num

type_table=read_tab_table(type_file_name)

type=type_table.table

type_header=type_table.header

type_num=type_table.record_num

;
;   Add: if (file_error eq 0) then begin ... for the Enumeration List,
;   Enumeration Member, and Dictionary Tab Table Files
;

printf,20,stars,format='(a/)'

printf,20,master_object_name+' Model List Tab Table File Name:        ', $
          list_file_name,format='(2a/)'

printf,20,'List Tab Table Record Count:        ',list_num,format='(a,i/)'

printf,20,master_object_name+' Model Member Tab Table File Name:      ', $
          member_file_name,format='(2a/)'

printf,20,'Member Tab Table Record Count:      ',member_num,format='(a,i/)'

printf,20,master_object_name+' Model Type Tab Table File Name:        ', $
          type_file_name,format='(2a/)'

printf,20,'Type Tab Table Record Count:        ',type_num,format='(a,i/)'

printf,20,master_object_name+' Model Dictionary Tab Table File Name:  ', $
          dictionary_file_name,format='(2a/)'

printf,20,'Dictionary Tab Table Record Count:  ',dictionary_num,format='(a,i/)'

printf,20,stars,format='(a/)'

print,master_object_name+' Model List Tab Table File Name:        ', $
      list_file_name,format='(2a/)'

print,'List Tab Table Record Count:        ',list_num,format='(a,i/)'

print,dashes,format='(a/)'

print,'      | ',list_header.(0),' | ',list_header.(1),' | ',list_header.(2), $
      ' | ',list_header.(3),' | ',list_header.(4),' | ',list_header.(5),' |', $
      format='(a8,a-7,a3,a-7,a3,a-25,a3,a-10,a3,a-9,a3,a-93,a2/)'

for enumeration_test_loop=0,list_num-1 do $
    print,enumeration_test_loop,' | ', $
          enumeration_test(enumeration_test_loop).(0),' | ', $
          enumeration_test(enumeration_test_loop).(1),' | ', $
          enumeration_test(enumeration_test_loop).(2),' | ', $
          enumeration_test(enumeration_test_loop).(3),' | ', $
          enumeration_test(enumeration_test_loop).(4),' | ', $
          enumeration_test(enumeration_test_loop).(5),' |', $
          format='(i5.3,2(a3,a-7),a3,a-25,a3,a-10,a3,a-9,a3,a-93,a2)'

print,stars,format='(/a/)'

print,master_object_name+' Model Member Tab Table File Name:      ', $
      member_file_name,format='(2a/)'

print,'Member Tab Table Record Count:      ',member_num,format='(a,i/)'

print,dashes,format='(a/)'

print,' | ',member_header.(0),' | ',member_header.(1),' | ',member_header.(2), $
      ' | ',member_header.(3),' |',format='(5x,2(a3,a-7),a3,a-25,a3,a-30,a2/)'

for member_loop=0,member_num-1 do $
    print,member_loop,' | ',member(member_loop).(0),' | ', $
          member(member_loop).(1),' | ',member(member_loop).(2),' | ', $
          member(member_loop).(3),' |', $
          format='(i5.3,2(a3,a-7),a3,a-25,a3,a-30,a2)'

print,stars,format='(/a/)'

print,master_object_name+' Model Type Tab Table File Name:        ', $
      type_file_name,format='(2a/)'

print,'Type Tab Table Record Count:        ',type_num,format='(a,i/)'

print,dashes,format='(a/)'

print,'      | ',type_header.(0),' | ',type_header.(1),' | ',type_header.(2), $
      ' | ',type_header.(3),' |',format='(a8,a-7,a3,a-7,a3,a-11,a3,a-132,a2/)'

for record_loop=0,type_num-1 do $
    print,record_loop,' | ',type(record_loop).(0),' | ',type(record_loop).(1), $
          ' | ',type(record_loop).(2),' | ',type(record_loop).(3),' |', $
          format='(i5.3,a3,a-7,a3,a-7,a3,a-11,a3,a-132,a2)'

print,stars,format='(/a/)'

print,master_object_name+' Model Dictionary Tab Table File Name:  ', $
      dictionary_file_name,format='(2a/)'

print,'Dictionary Record Count:            ',dictionary_num,format='(a,i/)'

print,dashes,format='(a/)'

print,'      | ',dictionary_header.(0),' | ',dictionary_header.(1),' | ', $
      dictionary_header.(2),' | ',dictionary_header.(3),' | ', $
      dictionary_header.(4),' | ',dictionary_header.(5),' | ', $
      dictionary_header.(6),' | ',dictionary_header.(7),' |', $
      format='(a8,2(a-7,a3),a-30,a3,a-11,a3,a-25,a3,a-8,a3,a-9,a3,a-48,a2/)'

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

;
;   Check to verify that all List Name are unique.
;   Issue a duplicate warning if necessary.
;

list_name=list.name

unique_list_name=list_name(uniq(list_name,sort(list_name)))

unique_list_name_num=n_elements(unique_list_name)

if (unique_list_name_num lt list_num) then begin

   for unique_loop=0,unique_list_name_num-1 do begin

       check=where(unique_list_name(unique_loop) eq list.name,check_num)

       if (check_num gt 1) then $
          print,'Warning:  ',unique_list_name(unique_loop), $
                ' is duplicated in the Name column of the list.tab file.', $
                format='(a,a-30,a)'

   endfor

   print,''

endif

;
;   Check that all Enumeration Lists have at least one List Item.
;   Issue warning if an Enumeration contains no items.
;

count=0

member_list=member.list

for list_loop=0,list_num-1 do begin

    list_mask=where(list_name(list_loop) eq member_list,list_mask_num)

    if (list_mask_num eq 0) then begin

       print,'Warning:  ',list_name(list_loop),'Does not have any List Members!!!', $
             format='(a,a-30,a)'

       count=count+1

    endif

endfor

if (count gt 0) then print,stars,format='(/a/)'

;
;   Check that each Enumeration present in the Ontology has a unique set of
;   List Members. List any Members that are duplicated.
;

count=0

for list_loop=0,list_num-1 do begin

    list_mask=where(list_name(list_loop) eq member_list,list_mask_num)

    if (list_mask_num gt 0) then begin

       member_item=member(list_mask).item

       unique_member_item=member_item(uniq(member_item,sort(member_item)))

       unique_member_item_num=n_elements(unique_member_item)

       if (unique_member_item_num lt list_mask_num) then begin

          for unique_loop=0,unique_member_item_num-1 do begin

              check= $
                 where(unique_member_item(unique_loop) eq member_item,check_num)

              if (check_num gt 1) then $
                 print,'Warning:  ',list_name(list_loop), $
                       'Duplicate Enumeration List Item:  '+ $
                       unique_member_item(unique_loop),format='(a,a-30,a)'

          endfor

          count=count+1

       endif

    endif

endfor

if (count gt 0) then print,stars,format='(/a/)'

;
;   Check whether all unique List Item Names are defined in the Dictionary.
;   If a definition is found, increment the Dictionary usage number and the
;   Dictionary Type check number. Issue a warning if no definition is found.
;

unique_member_list=member(uniq(member.list,sort(member.list))).list

unique_member_list_num=n_elements(unique_member_list)

count=0

for loop=0,unique_member_list_num-1 do begin

    index=where(unique_member_list(loop) eq dictionary.term,index_num)

    if (index_num eq 0) then begin

       print,'Warning:  ',unique_member_list(loop), $
             'Member List Term is not in the SPASE Dictionary (XXX)', $
             format='(a,a-30,a)'

       count=count+1

    endif

    if (index_num eq 1) then begin

;      print,'Member List Term is in the SPASE '+ $
;            'Dictionary:                           '+unique_member_list(loop)

       dictionary_usage_num(index)=dictionary_usage_num(index)+1

       dictionary_type_check_num(index)=dictionary_type_check_num(index)+1

    endif

endfor

if (count gt 0) then print,stars,format='(/a/)'

;
;   Check whether all unique List Item Names are defined in the Dictionary.
;   Issue a warning if multiple definitions are found.
;

count=0

for loop=0,unique_member_list_num-1 do begin

    index=where(unique_member_list(loop) eq dictionary.term,index_num)

    if (index_num gt 1) then begin

       print,'Warning:  ',unique_member_list(loop), $
             'Member List Term appears multiple times in the SPASE ', $
             'Dictionary',format='(a,a-30,2a)'

       dictionary_usage_num(index)=dictionary_usage_num(index)+1

       count=count+1

    endif

endfor

if (count gt 0) then print,stars,format='(/a/)'

;
;   Check whether all Member Item Names are defined in the Dictionary.
;   If a definition is found, increment the Dictionary usage number and the
;   Dictionary Type check number. Issue a warning if no definition is found.
;

count=0

for loop=0,member_num-1 do begin

    index=where(member(loop).item eq dictionary.term,index_num)

    if (index_num eq 0) then begin

       print,'Warning:  ',member(loop).item, $
             'Member Item Term is not in the SPASE Dictionary', $
             format='(a,a-30,a)'

       count=count+1

    endif

    if (index_num eq 1) then begin

;      print,'Member Item Term is in the SPASE '+ $
;            'Dictionary:                           '+member(loop).item

       dictionary_usage_num(index)=dictionary_usage_num(index)+1

       dictionary_type_check_num(index)=dictionary_type_check_num(index)+1

    endif

endfor

if (count gt 0) then print,stars,format='(/a/)'

;
;   Check whether all Member Item Names are defined in the Dictionary.
;   Issue a warning if multiple definitions are found.
;

count=0

for loop=0,member_num-1 do begin

    index=where(member(loop).item eq dictionary.term,index_num)

    if (index_num gt 1) then begin

       print,'Warning:  ',member(loop).item, $
             'Member Item Term appears multiple times in the SPASE '+ $
             'Dictionary',format='(a,a-30,a)'

       dictionary_usage_num(index)=dictionary_usage_num(index)+1

       count=count+1

    endif

endfor

if (count gt 0) then print,stars,format='(/a/)'

;
;   Check for Enumeration Lists that contain subtree branches. SPASE has two
;   such Enumerations: Field Qualifier and Particle Qualifier, which contain
;   the Component subtree. And Region, which contains the Earth, Heliosphere,
;   Ionosphere, Magnetosphere, Near Surface, and Sun subtrees.
;
;   The subtree identification procedure is done two ways to see whether the
;   Enumeration structure is valid as defined by list.tab and member.tab files.
;

member_list_sub_tree=make_array(99,/string,value='')

sub_tree_num=0

;
;   First check to see whether a Member List appears as a Member Item.
;

for unique_member_loop=0,unique_member_list_num-1 do begin

    sub_tree_mask=where(unique_member_list(unique_member_loop) eq member.item, $
                        sub_tree_mask_num)

    if (sub_tree_mask_num gt 0) then begin

       print,'SUB TREE NUM (member.tab Unique List Check):  ', $
             unique_member_list(unique_member_loop),sub_tree_mask_num, $
             format='(a-47,a-30,i3)'

       member_list_sub_tree(sub_tree_num)=unique_member_list(unique_member_loop)

       sub_tree_num=sub_tree_num+1

    endif

endfor

print,''

member_list_sub_tree=member_list_sub_tree(0:sub_tree_num-1)

member_list_sub_tree_num=sub_tree_num

if (member_list_sub_tree_num gt 0) then begin

   for loop=0,member_list_sub_tree_num-1 do $
       print,'MEMBER_LIST_SUB_TREE:  ',loop,member_list_sub_tree(loop), $
             format='(a-23,i2,1x,a)'

   print,''

endif

;
;   Now check to see whether a List Name appears an a Member Item.
;   If so, set the tree_index equal to one.
;

member_item=member.item

tree_index=make_array(list_num,/integer,value=0)

list_name_sub_tree=make_array(99,/string,value='')

sub_tree_num=0

for list_loop=0,list_num-1 do begin

    sub_tree_mask=where(list_name(list_loop) eq member_item,sub_tree_mask_num)

    if (sub_tree_mask_num gt 0) then begin

       print,'SUB TREE NUM (list.tab Name Check):',list_name(list_loop), $
             sub_tree_mask_num,format='(a-47,a-30,i3)'

       tree_index(list_loop)=1

       list_name_sub_tree(sub_tree_num)=list_name(list_loop)

       sub_tree_num=sub_tree_num+1

    endif

endfor

print,''

list_name_sub_tree=list_name_sub_tree(0:sub_tree_num-1)

list_name_sub_tree_num=sub_tree_num

if (list_name_sub_tree_num gt 0) then begin

   for loop=0,list_name_sub_tree_num-1 do $
       print,'LIST_NAME_SUB_TREE:  ',loop,list_name_sub_tree(loop), $
             format='(a-23,i2,1x,a)'

   print,''

endif

;
;   Issue a warning if the two subtree checks do not identify the same number of
;   subtrees!!!
;

if (member_list_sub_tree_num ne list_name_sub_tree_num) then $
   print,'WARNING:  The number of Member Lists that have subtrees is not '+ $
         'equal','to the number of List Names terms that have subtrees.', $
          format='(a/,a64/)'

print,stars,format='(a/)'

;
;   Get a count of the number of List items in each Enumeration List.
;

enumeration_num=make_array(list_num,/integer,value=0)

for list_loop=0,list_num-1 do begin

    list_mask=where(list_name(list_loop) eq member_list,list_mask_num)

    enumeration_num(list_loop)=list_mask_num

    print,list_loop,enumeration_num(list_loop),list_name(list_loop), $
          format='(2i5.3,2x,a/)'

    if (enumeration_num(list_loop) gt 0) then begin

       for member_loop=0,enumeration_num(list_loop)-1 do $
           print,list_loop,enumeration_num(list_loop),list_name(list_loop), $
                 member_loop,member(list_mask(member_loop)).item, $
                 format='(2i5.3,2x,a-30,i5.3,2x,a)'

       print,''

    endif

endfor

print,stars,format='(a/)'

;
;   Identify Enumeration Lists that contain one or more subtrees and the List
;   is also the root of the full tree.
;
;   The Parent Mask identifies the Enumeration Lists that are the root
;   of Enumeration trees that have subtrees.
;

parent_index=make_array(list_num,/integer,value=0)

for list_loop=0,list_num-1 do begin

    list_mask=where(list_name(list_loop) eq member.list,list_mask_num)

    if (list_mask_num gt 0) then member_list=member(list_mask).item

    for member_loop=0,n_elements(member_list)-1 do begin

        match=where(member_list(member_loop) eq list.name,match_num)

        if (match_num eq 1 and tree_index(match) eq 1) then $
           parent_index(list_loop)=1

    endfor

endfor

parent_mask=where(parent_index eq 1 and tree_index ne 1,parent_mask_num)

;
;   Start Filling out the Enumeration Lists that have subtrees. Identify Member
;   Items of these Lists that have subtrees. These currently
;
;   The two loops that follow are nearly the same. The first loop ascertains the
;   maximum number of List Items in the set of Enumeration Lists of the schema.
;

for parent_loop=0,parent_mask_num-1 do begin

    enumeration=make_array(999,/string,value='')

    index=0

    list_mask= $
       where(list_name(parent_mask(parent_loop)) eq member.list,list_mask_num)

    parent=list_name(parent_mask(parent_loop))

    print,'Enumeration Tree Expand:  '+parent,format='(a/)'

    if (list_mask_num gt 0) then begin

       member_list=member(list_mask).item

       member_tree_index=make_array(list_mask_num,/integer,value=0)

       for list_loop=0,list_mask_num-1 do begin

           member_name=member(list_mask(list_loop)).item

           member_list_index= $
              where(member(list_mask(list_loop)).item eq list.name, $
                    member_list_index_num)

           tree=0

           if (member_list_index_num eq 1) then $
              if (tree_index(member_list_index) eq 1) then tree=1

           print,index,tree,parent,member_name,format='(i5.3,i5.3,2x,a-60,a-60)'

           prefix=string_condition(member_name,' ','')+'.'

           index=index+1

           if (member_list_index_num eq 1) then $
              index=enumeration_tree(list,member,tree_index,parent,member_name, $
                                     member_name,prefix,enumeration,index, $
                                     /verbose)

       endfor

       print,''

    endif

    enumeration_num(parent_mask(parent_loop))=index

    enumeration=enumeration(indgen(enumeration_num(parent_mask(parent_loop))))

endfor

if (index gt 0) then print,stars,format='(a/)'

;
;   Define the Enumeration List structure to capture fully enumerated Lists.
;

prune_mask=where(tree_index eq 0,prune_mask_num)

list_mask_num_max=max(enumeration_num(prune_mask))

spase_enumeration_list_record= $
   create_struct(name='Enumeration List','num',0,'tag_name','','parent',0, $
                 'list',make_array(list_mask_num_max,/string,value=''))

spase_enumeration_list=replicate(spase_enumeration_list_record,list_num)

spase_enumeration_list.num=enumeration_num

spase_enumeration_list.tag_name=list.name

spase_enumeration_list.parent=parent_index

for parent_loop=0,parent_mask_num-1 do begin

    enumeration=make_array(999,/string,value='')

    index=0

    list_mask= $
       where(list_name(parent_mask(parent_loop)) eq member.list,list_mask_num)

    parent=list_name(parent_mask(parent_loop))

    if (list_mask_num gt 0) then begin

       member_list=member(list_mask).item

       member_tree_index=make_array(list_mask_num,/integer,value=0)

       for list_loop=0,list_mask_num-1 do begin

           member_name=member(list_mask(list_loop)).item

           member_list_index= $
              where(member(list_mask(list_loop)).item eq list.name, $
                    member_list_index_num)

           tree=0

           if (member_list_index_num eq 1) then $
              if (tree_index(member_list_index) eq 1) then tree=1

           prefix=string_condition(member_name,' ','')+'.'

           member_name=member(list_mask(list_loop)).item

           enumeration(index)=string_condition(member_name,' ','')

           index=index+1

           if (member_list_index_num eq 1) then $
              index=enumeration_tree(list,member,tree_index,parent,member_name, $
                                     member_name,prefix,enumeration,index)

       endfor

    endif

    enumeration_num(parent_mask(parent_loop))=index

    for enumeration_loop=0,enumeration_num(parent_mask(parent_loop))-1 do begin

        quote_index=string_position(enumeration(enumeration_loop),"'")

        if (quote_index ne -1) then begin

           enumeration(enumeration_loop)='"'+enumeration(enumeration_loop)+'"'

        endif else begin

           enumeration(enumeration_loop)="'"+enumeration(enumeration_loop)+"'"

        endelse

    endfor

    enumeration_list_mask=indgen(enumeration_num(parent_mask(parent_loop)))

    parent_mask_loop=parent_mask(parent_loop)

    spase_enumeration_list(parent_mask_loop).list(enumeration_list_mask)= $
       enumeration(enumeration_list_mask)

    spase_enumeration_list(parent_mask(parent_loop)).parent=1

endfor

;
;   Prune out Enumeration Lists that are actually subtrees of other Lists.
;

branch_mask=where(tree_index eq 1,branch_mask_num)

if (branch_mask_num gt 0) then begin

   print,'Prune the following subtree List Names from the Enumeration List:', $
         format='(a/)'

   for loop=0,branch_mask_num-1 do $
       print,loop,list_name(branch_mask(loop)),format='(i5.3,2x,a)'

   print,''

endif

list_keep=list

list_keep_num=list_num

list=list(prune_mask)

list_num=prune_mask_num

spase_enumeration_list=spase_enumeration_list(prune_mask)

list_index=make_array(prune_mask_num,/integer,value=0)

for list_loop=0,prune_mask_num-1 do begin

    list_mask=where(spase_enumeration_list(list_loop).tag_name eq member.list, $
                    list_mask_num)

;
;   Observatory Group, Observatory Name, and Repository Name are Open Lists.
;   The next if structure handles this case.
;

    if (list_mask_num eq 1) then begin

       if (member(list_mask).item ne 'Open List') then begin

          list_index(list_loop)=1

          spase_enumeration_list(list_loop).list(0)= $
             string_condition(member(list_mask).item,' ','')

       endif

       quote_index=string_position(member(list_mask).item,"'")

       if (quote_index ne -1) then begin

          member(list_mask).item='"'+member(list_mask).item+'"'

       endif else begin

          member(list_mask).item="'"+member(list_mask).item+"'"

       endelse

    endif

;
;   Come here for all closed Enumerations.
;

    if (list_mask_num gt 1) then begin

       list_index(list_loop)=1

       if (spase_enumeration_list(list_loop).parent ne 1) then begin

          member_list=member(list_mask).item

          for loop=0,list_mask_num-1 do begin

             quote_index=string_position(member_list(loop),"'")

             if (quote_index ne -1) then begin

                member_list(loop)='"'+member_list(loop)+'"'

             endif else begin

                member_list(loop)="'"+member_list(loop)+"'"

             endelse

          endfor

          spase_enumeration_list(list_loop).list(indgen(list_mask_num))= $
             string_condition(member_list,' ','')

       endif

    endif

;   if (list_mask_num gt 1) then print,'Aaahhhhh too many:  '+ $
;      spase_enumeration_list(list_loop).tag_name

;   if (list_mask_num eq 0) then print,'No list?????:       '+ $
;      spase_enumeration_list(list_loop).tag_name

endfor

list_mask=where(list_index eq 1,list_mask_num)

branch_mask=where(list_index ne 1,branch_mask_num)

;
;   Prune out Enumeration Lists that are open.
;

if (branch_mask_num gt 0) then begin

   print,'Prune the following subtree List Names from the Enumeration List:', $
         format='(a/)'

   for loop=0,branch_mask_num-1 do $
       print,loop,spase_enumeration_list(branch_mask(loop)).tag_name, $
             format='(i5.3,2x,a)'

   print,''

endif

print,stars,format='(a/)'

print,list_mask_num,prune_mask_num,list_keep_num

print,''

for loop=0,list_keep_num-1 do $
    print,loop,list_keep(loop).name,format='(i5.3,2x,a)'

print,''

for loop=0,prune_mask_num-1 do $
    print,loop,spase_enumeration_list(loop).tag_name,format='(i5.3,2x,a)'

print,''

spase_enumeration_list=spase_enumeration_list(list_mask)

for loop=0,list_mask_num-1 do $
    print,loop,spase_enumeration_list(loop).tag_name,format='(i5.3,2x,a)'

print,stars,format='(/a/)'

;
;   All valid Enumeration Lists have been compiled now. Next, they must be
;   associated to the ontology via the dictionary.tab column named List.
;

printf,20,'Number of Enumeration Lists:',list_mask_num,prune_mask_num, $
          list_keep_num,format='(a,i6,2i7/)'

for list_loop=0,list_mask_num-1 do $
    printf,20,list_loop,spase_enumeration_list(list_loop).tag_name, $
              spase_enumeration_list(list_loop).parent, $
              spase_enumeration_list(list_loop).num,format='(i3.2,a26,i12,i7)'

printf,20,stars,format='(/a/)'

for list_loop=0,list_mask_num-1 do begin

    list_mask=indgen(spase_enumeration_list(list_loop).num)

    print,list_loop,spase_enumeration_list(list_loop).num, $
          spase_enumeration_list(list_loop).tag_name, $
          spase_enumeration_list(list_loop).list(list_mask), $
          format='(2i5.3,2x,a//,99(3a-58/))'

    if (spase_enumeration_list(list_loop).num mod 3 ne 0) then print,''

endfor

print,stars,format='(a/)'

;
;   Check to see whether all List names are defined in the Dictionary.
;   If the List name is defined, increment the Dictionary usage number and the
;   Dictionary Type check number. Issue a warning if no definition is found.
;

count=0

for loop=0,list_keep_num-1 do begin

    index=where(list_keep(loop).name eq dictionary.term,index_num)

    if (index_num eq 0) then begin

       print,'Warning:  ',list_keep(loop).name, $
             'List Name Term is not in the SPASE Dictionary',format='(a,a-30,a)'

       count=count+1

    endif

    if (index_num eq 1) then begin

;      print,'List Name Term is in the SPASE '+ $
;            'Dictionary:                             '+list_keep(loop).name

       dictionary_usage_num(index)=dictionary_usage_num(index)+1

       dictionary_type_check_num(index)=dictionary_type_check_num(index)+1

    endif

endfor

if (count gt 0) then print,stars,format='(/a/)'

;
;   Check to see whether the List Name appears in the Dictionary File.
;   If so issue a warning if there are multiple Dictionary Listings.
;

count=0

for loop=0,list_keep_num-1 do begin

    index=where(list_keep(loop).name eq dictionary.term,index_num)

    if (index_num gt 1) then begin

       print,'Warning:  ',list_keep(loop).name, $
             'List Name Term appears multiple times in the SPASE Dictionary', $
             format='(a,a-30,a)'

       dictionary_usage_num(index)=dictionary_usage_num(index)+1

       count=count+1

    endif

endfor

if (count gt 0) then print,stars,format='(/a/)'

;
;   List all Dictionary Terms that are not used in the List and Member files
;   as well as the Ontology file. Unused terms have dictionary_usage_num equal
;   to zero.
;

not_used_mask=where(dictionary_usage_num eq 0,not_used_mask_num)

for loop=0,not_used_mask_num-1 do $
    print,'Warning:  ',dictionary[not_used_mask(loop)].term, $
          'Dictionary Term that is not present in the List or Member Files', $
          dictionary_usage_num(not_used_mask(loop)), $
          dictionary_type_check_num(not_used_mask(loop)), $
          format='(a,a-30,a,2i3)'

if (not_used_mask_num gt 0) then print,stars,format='(/a/)'

;
;   List all Dictionary Terms that are used in the List and Member files
;   as well as the Ontology file.
;

used_mask=where(dictionary_usage_num gt 0,used_mask_num)

for loop=0,used_mask_num-1 do $
    print,loop,'  Dictionary Term usage count:', $
          dictionary[used_mask(loop)].term, $
          dictionary_usage_num(used_mask(loop)), $
          dictionary_type_check_num(used_mask(loop)), $
          format='(i5.3,a-42,a-30,2i3)'

if (used_mask_num gt 0) then print,stars,format='(/a/)'

;
;   List any Dictionary Terms that have been checked to verify Type assignment.
;   Organize the List Type by Type.
;

for type_loop=0,type_num-1 do begin

    dictionary_type_mask= $
       where(dictionary.type eq type(type_loop).type,dictionary_type_mask_num)

    if (dictionary_type_mask_num gt 0) then begin

       count=0

       for loop=0,dictionary_type_mask_num-1 do begin

           if (dictionary_type_check_num(dictionary_type_mask(loop)) gt 0) $
              then begin

              print,loop,dictionary[dictionary_type_mask(loop)].term, $
                    dictionary[dictionary_type_mask(loop)].type, $
                    dictionary_usage_num(dictionary_type_mask(loop)), $
                    dictionary_type_check_num(dictionary_type_mask(loop)), $
                    format='(i5.3,2x,a-33,a-12,2i5)'

;             print,loop,' | ', $
;                   dictionary[dictionary_type_mask(loop)].(0),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(1),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(2),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(3),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(4),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(5),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(6),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(7),' |', $
;                   format='(i5.3,2(a3,a-7),a3,a-30,a3,a-11,a3,a-25,a3,a-8,'+ $
;                           'a3,a-9,a3,a-48,a2)'

              count=count+1

           endif

       endfor

       if (count gt 0) then print,''

    endif

endfor

;f (count eq 0) then print,stars,format='(/a/)'

;f (count gt 0) then print,stars,format='(a/)'

print,stars,format='(a/)'

;
;   List any Dictionary Terms that cannot be checked to verify Type assignment.
;   Organize the List Type by Type.
;

for type_loop=0,type_num-1 do begin

    dictionary_type_mask= $
       where(dictionary.type eq type(type_loop).type,dictionary_type_mask_num)

    if (dictionary_type_mask_num gt 0) then begin

       count=0

       for loop=0,dictionary_type_mask_num-1 do begin

           if (dictionary_type_check_num(dictionary_type_mask(loop)) eq 0) $
              then begin

              print,loop,dictionary[dictionary_type_mask(loop)].term, $
                    dictionary[dictionary_type_mask(loop)].type, $
                    dictionary_usage_num(dictionary_type_mask(loop)), $
                    dictionary_type_check_num(dictionary_type_mask(loop)), $
                    format='(i5.3,2x,a-33,a-12,2i5)'

;             print,loop,' | ', $
;                   dictionary[dictionary_type_mask(loop)].(0),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(1),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(2),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(3),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(4),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(5),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(6),' | ', $
;                   dictionary[dictionary_type_mask(loop)].(7),' |', $
;                   format='(i5.3,2(a3,a-7),a3,a-30,a3,a-11,a3,a-25,a3,a-8,'+ $
;                           'a3,a-9,a3,a-48,a2)'

              count=count+1

           endif

       endfor

       if (count gt 0) then print,''

    endif

endfor

if (count eq 0) then print,''

print,stars,format='(a/)'

;
;   Issue a message that the Dictionary Term List is valid to the extent that it
;   can be verified. It is still possible that valid Terms could be missing.
;

if (not_used_mask_num eq 0) then $
   print,'The Dictionary has Term List contains valid terms only!', $
         'There are no extra Terms that are foreign to the schema.', $
         'There may be Terms that are missing in the schema.',format='(3(a/))'

print,stars,format='(a/)'

print,'ENUMERATION_LIST',format='(a/)'

for list_loop=0,list_mask_num-1 do begin

    list_mask=indgen(spase_enumeration_list(list_loop).num)

    print,list_loop,spase_enumeration_list(list_loop).num, $
          spase_enumeration_list(list_loop).tag_name, $
          spase_enumeration_list(list_loop).list(list_mask), $
          format='(2i5.3,2x,a//,99(3a-58/))'

    if (spase_enumeration_list(list_loop).num mod 3 ne 0) then print,''

endfor

print,stars,format='(/a/)'

return,spase_enumeration_list

end

