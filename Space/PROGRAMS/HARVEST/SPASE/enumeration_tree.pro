
function enumeration_tree,list,member,tree_index,enumeration_name,parent, $
                          member_name,prefix,enumeration,index,verbose=verbose

list_mask=where(member_name eq member.list,list_mask_num)

if (list_mask_num gt 0) then begin

   for list_loop=0,list_mask_num-1 do begin

       sub_member_name=member(list_mask(list_loop)).item

       list_index=where(sub_member_name eq list.name,list_index_num)

       tree=0

       if (list_index_num eq 1) then $
          if (tree_index(list_index) eq 1) then tree=1

       enumeration(index)=prefix+string_condition(sub_member_name,' ','')

       sub_member_name=member(list_mask(list_loop)).item

       if (keyword_set(verbose)) then $
          print,index,tree,enumeration_name,member_name,sub_member_name, $
                format='(2i5.3,2x,a-60,a-60,a-60)'

       full_prefix=enumeration(index)+'.'

       index=index+1

       if (tree eq 1) then $
          index=enumeration_tree(list,member,tree_index,enumeration_name, $
                                 member_name,sub_member_name,full_prefix, $
                                 enumeration,index,verbose=verbose)

   endfor

endif else begin

   enumeration(index)=prefix+string_condition(member_name,' ','')

   index=index+1

   tree=0

   if (keyword_set(verbose)) then $
      print,index,tree,member_name,enumeration,format='(2i5.3,2x,a-60,a-60)'

endelse

return,index

end

