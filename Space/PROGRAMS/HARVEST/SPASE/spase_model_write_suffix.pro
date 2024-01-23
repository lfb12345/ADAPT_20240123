
function spase_model_write_suffix,spase_record,spase_keyword

suffix=''

group_incl_num=strlen(spase_record.group_incl)

if (group_incl_num gt 0) then begin

   for group_incl_index=0,group_incl_num-1 do begin

       case_char=strmid(spase_record.group_incl,group_incl_index,1)

       if (case_char ne 'A' and case_char ne spase_record.group) then begin

          case_index=where(case_char eq spase_keyword.case_char)

          for keyword=0,spase_keyword(case_index).num-1 do $
              suffix=suffix+ $
                     ',keyword_'+spase_keyword(case_index).keyword(keyword)+ $
                     '=keyword_'+spase_keyword(case_index).keyword(keyword)

       endif

   endfor

endif

return,suffix

end

