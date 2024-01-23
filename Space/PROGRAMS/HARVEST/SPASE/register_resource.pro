
function register_resource,resource,registry,registry_index,new_flag

new_flag=0

filled_resource_id_mask= $
   where(resource.resource_id ne '',filled_resource_id_mask_num)

if (filled_resource_id_mask_num gt 0) then begin

   resource=resource(filled_resource_id_mask)

   resource_num=n_elements(resource)

   check=make_array(resource_num,/integer,value=0)

   for loop=0L,resource_num-1L do begin

       id_match_num=0

       if (registry_index gt 0 and resource(loop).resource_id ne '') then begin

          filled_mask=where(registry ne '',filled_mask_num)

          id_match=where(resource(loop).resource_id eq registry(filled_mask), $
                         id_match_num)

       endif

       if (id_match_num eq 0) then begin

          check(loop)=1

          registry(registry_index)=resource(loop).resource_id

          registry_index=registry_index+1

      endif

   endfor

   check_mask=where(check eq 1,check_mask_num)

   if (check_mask_num gt 0) then begin

      new_flag=1

      resource=resource(check_mask)

   endif

endif

return,resource

end

