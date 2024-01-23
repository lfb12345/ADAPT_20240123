
function variable_attribute_grep,variable_attribute,attribute

variable_attribute_text=''

variable_attribute_num=n_tags(variable_attribute)

for loop=0,variable_attribute_num-1 do begin

    attribute_mask=where(strmatch(variable_attribute.(loop).name,attribute, $
                         /fold_case),attribute_mask_num)

    if (attribute_mask_num gt 0) then begin

       variable_attribute_text=variable_attribute.(loop).text

;      if (variable_attribute_text ne '') then $
;         print,'WOW  '+attribute+' '+variable_attribute_text

    endif

endfor

return,variable_attribute_text

end

