
function cdaweb_instrument_id_list,data_product_name,numerical_data_parameter_all,registry_dir

data_product_name_mask=where(data_product_name eq numerical_data_parameter_all.table.data_product_name,data_product_name_mask_num)

if (data_product_name_mask_num gt 0) then begin

   instrument_id_list_000_mask=where(numerical_data_parameter_all.table(data_product_name_mask).instrument_id_000 ne '',instrument_id_list_000_mask_num)

   if (instrument_id_list_000_mask_num gt 0) then begin

      instrument_id_list=make_array(999,/string,value='')

      instrument_id_list_num=0

      instrument_id_list_000=numerical_data_parameter_all.table(data_product_name_mask(instrument_id_list_000_mask)).instrument_id_000

      instrument_id_list_001=numerical_data_parameter_all.table(data_product_name_mask(instrument_id_list_000_mask)).instrument_id_001

      for instrument_id_list_000_mask_loop=0,instrument_id_list_000_mask_num-1 do begin

          instrument_id_list_000_element_num=n_elements(strsplit(instrument_id_list_000(instrument_id_list_000_mask_loop)))

          if (instrument_id_list_000_element_num eq 1) then begin

             if (instrument_id_list_001(instrument_id_list_000_mask_loop) eq '') then begin

                instrument_id_list(instrument_id_list_num)=instrument_id_list_000(instrument_id_list_000_mask_loop)

             endif else begin

                instrument_id_list(instrument_id_list_num)=instrument_id_list_000(instrument_id_list_000_mask_loop)+'/'+ $
                                                           instrument_id_list_001(instrument_id_list_000_mask_loop)

             endelse

          endif else begin

             instrument_id_list(instrument_id_list_num+indgen(instrument_id_list_000_element_num))=strsplit(instrument_id_list_000(instrument_id_list_000_mask_loop),/extract)

          endelse

          instrument_id_list_num=instrument_id_list_num+instrument_id_list_000_element_num

      endfor

   endif else begin

      instrument_id_list='UNKNOWN'

   endelse

   instrument_id_list_mask=where(instrument_id_list ne '',instrument_id_list_mask_num)

   if (instrument_id_list_mask_num gt 0) then instrument_id_list=instrument_id_list(instrument_id_list_mask)

   instrument_id_list=instrument_id_list(uniq(instrument_id_list,sort(instrument_id_list)))

   instrument_id_list_num=n_elements(instrument_id_list)

   for instrument_id_list_loop=0,instrument_id_list_num-1 do begin

       command='find '+registry_dir+'/SMWG/Instrument | sort | grep -c ^"'+registry_dir+'/SMWG/Instrument/'+instrument_id_list(instrument_id_list_loop)+'.xml"$'

       spawn,command,instrument_id_registry_num,error

       if (instrument_id_registry_num eq 1) then begin

          registry_status='PRESENT'

       endif else begin

          registry_status='MISSING'

       endelse

   endfor

endif else begin

   instrument_id_list=''

endelse

return,instrument_id_list

end

