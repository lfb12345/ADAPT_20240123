
function cdaweb_dimension_structure,dimension_structure,dimension_structure_mask

dimension_structure_split=strsplit(dimension_structure,'[',/extract)

dimension_structure_temp=strmid(dimension_structure_split(1),0,strlen(dimension_structure_split(1))-1)

dimension_structure_temp=strsplit(dimension_structure_temp,',',/extract)

dimension_structure_mask=strsplit(dimension_structure_mask,'/',/extract)

if (n_elements(dimension_structure_mask) eq 2) then begin

   dimension_structure_mask=dimension_structure_mask(n_elements(dimension_structure_mask)-1)

   dimension_structure_mask_num=strlen(dimension_structure_mask)

   dimension_structure_mask_char=make_array(dimension_structure_mask_num,/string,value='')

   for loop=0,dimension_structure_mask_num-1 do dimension_structure_mask_char(loop)=strmid(dimension_structure_mask,loop,1)

   dimension_structure_mask=strmatch(dimension_structure_mask_char,'T')

   dimension_structure_mask_num=fix(total(dimension_structure_mask))

   dimension_structure_mask=where(strmatch(dimension_structure_mask_char,'T') eq 1,dimension_structure_mask_num)

   dimension_structure_mask_num_string=strtrim(string(dimension_structure_mask_num),2)

endif else begin

   dimension_structure_mask_num=0

endelse

if (dimension_structure_mask_num gt 0) then begin

   dimension_structure=dimension_structure_mask_num_string+':['+strjoin(dimension_structure_temp(dimension_structure_mask),',')+']'

endif else begin

   dimension_structure='0:[]'

endelse

return,dimension_structure

end

