
pro ontology_tree,ontology_raw,dictionary,parent_object,ontology,ontology_num, $
                  level

master_parent_object=parent_object

element=where(parent_object eq ontology_raw.object,element_num)

if (element_num gt 0) then begin

   ontology(ontology_num).keyword=strjoin(strsplit(parent_object,/extract))

   ontology(ontology_num).tag_name= $
      strlowcase(strjoin(strsplit(parent_object,/extract),'_'))

   ontology(ontology_num).tag_level=level

   if (level gt 0) then begin

      parent_index=where(parent_object eq ontology_raw.element,parent_raw_num)

      parent_raw=ontology_raw(parent_index(0))

      ontology(ontology_num).entity=parent_raw.group

   endif

   parent_num=ontology_num

   ontology_num=ontology_num+1

   for element_loop=0,element_num-1 do begin

       parent_object=ontology_raw(element(element_loop)).element

       ontology(ontology_num).keyword=strjoin(strsplit(parent_object,/extract))

       ontology(ontology_num).tag_name= $
          strlowcase(strjoin(strsplit(parent_object,/extract),'_'))

       sub_element=where(parent_object eq ontology_raw.object,sub_element_num)

       ontology(ontology_num).tag_level=level+1

       ontology(ontology_num).occur_type= $
          ontology_raw(element(element_loop)).occurrence

       if (ontology(ontology_num).occur_type eq '1' or $
           ontology(ontology_num).occur_type eq '+') then $
          ontology(ontology_num).occur_required=1

       if (ontology(ontology_num).occur_type eq '0' or $
           ontology(ontology_num).occur_type eq '*') then $
          ontology(ontology_num).occur_required=0

       ontology(ontology_num).entity=ontology_raw(element(element_loop)).group

       ontology(ontology_num).raw_name= $
          ontology_raw(element(element_loop)).element

       if (sub_element_num eq 0) then begin

          ontology(ontology_num).tag_type=0

          ontology(ontology_num).element_start_line=ontology_num

          ontology(ontology_num).element_stop_line=ontology_num

          ontology_num=ontology_num+1

       endif

       if (sub_element_num gt 0) then begin

          ontology(ontology_num).tag_type=1

          ontology(ontology_num).element_start_line=ontology_num+1

          ontology_num_save=ontology_num

          ontology_tree,ontology_raw,dictionary,parent_object,ontology, $
                        ontology_num,level+1

          ontology(ontology_num_save).element_stop_line=ontology_num-1

       endif

   endfor

   ontology(parent_num).element_stop_line=ontology_num-1

   if (level eq 0) then begin

      ontology=ontology(indgen(ontology_num))

      ontology(0).tag_type=1

      ontology(0).element_start_line=1

      ontology(0).raw_name=master_parent_object

      group=['A','B','C','D','E','F','G','H','I','J','K','L','M']

      filled_mask=where(ontology.entity ne '',filled_mask_num)

      group_incl=ontology(filled_mask).entity

      entities=group_incl(uniq(group_incl,sort(group_incl)))

      entity_index=make_array(n_elements(entities),/integer,value=0)

      for loop =0,n_elements(entities)-1 do begin

          mask=where(ontology.entity eq entities(loop),mask_num)

          entity_index(loop)=mask(0)

      endfor

      entity_string=ontology(entity_index(sort(entity_index))).entity

      for loop=0,n_elements(entity_string)-1 do begin

          mask=where(ontology.entity eq entity_string(loop),mask_num)

          ontology(mask).group=group(loop)

      endfor

      for loop=0,ontology_num-1 do begin

          if (ontology(loop).tag_type eq 0) then mask=loop

          if (ontology(loop).tag_type eq 1) then $
             mask=indgen(ontology(loop).element_stop_line- $
                         ontology(loop).element_start_line+2)+ $
                  ontology(loop).element_start_line-1

          group_incl=ontology(mask).group

          ontology(loop).group_incl= $
             strjoin(group_incl(uniq(group_incl,sort(group_incl))))

      endfor

   endif

endif

if (level eq 0) then begin

   for loop=0,n_elements(ontology)-1 do begin

       index=where(ontology(loop).raw_name eq dictionary.term,index_num)

       if (index_num gt 0) then $
          if (dictionary[index(0)].type eq 'Enumeration') then $
             ontology(loop).enumeration_list= $
                strlowcase(string_condition(dictionary[index(0)].list,' ','_'))

   endfor

   ontology=ontology(indgen(ontology_num))

endif

end

