
function cdaweb_granule_date_time,date_time_string,granule_info

year_string=strmid(date_time_string,0,4)

delta_hour=0

delta_minute=0

delta_second=0

if (strlen(date_time_string) ne 13) then begin

   resource_id_date_string=year_string+'.'+strmid(date_time_string,4,2)+'.'+ $
                           strmid(date_time_string,6,2)

endif else begin

   resource_id_date_string=year_string+'.'+strmid(date_time_string,4,3)

endelse

start_date='strange_date_time_string'

stop_date='strange_date_time_string'

date_string=year_string+'-'+strmid(date_time_string,4,2)+'-'+ $
            strmid(date_time_string,6,2)

if (strlen(date_time_string) eq 8) then begin

   start_date=date_string+'T00:00:00.000'

   stop_date=date_string+'T23:59:59.999'

endif

if (strlen(date_time_string) eq 10) then begin

   resource_id_date_string=resource_id_date_string+'.'+ $
                           strmid(date_time_string,8,2)

   start_date=date_string+'T'+strmid(date_time_string,8,2)+':00:00.000'

   stop_date=date_string+'T'+ $
             strtrim(string(fix(strmid(date_time_string,8,2))+delta_hour, $
                            format='(i2.2)'),1)+':59:59.999'

endif

if (strlen(date_time_string) eq 12) then begin

   resource_id_date_string=resource_id_date_string+'.'+ $
                           strmid(date_time_string,8,2)+'.'+ $
                           strmid(date_time_string,10,2)

   start_date=date_string+'T'+strmid(date_time_string,8,2)+':'+ $
              strmid(date_time_string,10,2)+':00.000'

   stop_date=date_string+'T'+strmid(date_time_string,8,2)+':'+ $
             strtrim(string(fix(strmid(date_time_string,10,2))+delta_minute, $
                            format='(i2.2)'),1)+':59.999'

endif

if (strlen(date_time_string) eq 13) then begin

   resource_id_date_string=resource_id_date_string+'.'+ $
                           strmid(date_time_string,7,2)+'.'+ $
                           strmid(date_time_string,9,2)+'.'+ $
                           strmid(date_time_string,11,2)

   start_date=date_string+'T'+strmid(date_time_string,7,2)+':'+ $
              strmid(date_time_string,9,2)+':'+ $
              strmid(date_time_string,11,2)+'.000'

   stop_date=date_string+'T'+strmid(date_time_string,7,2)+':'+ $
             strmid(date_time_string,9,2)+':'+ $
             strtrim(string(fix(strmid(date_time_string,11,2))+delta_second, $
                            format='(i2.2)'),1)+'.999'

endif

if (strlen(date_time_string) eq 14) then begin

   resource_id_date_string=resource_id_date_string+'.'+ $
                           strmid(date_time_string,8,2)+'.'+ $
                           strmid(date_time_string,10,2)+'.'+ $
                           strmid(date_time_string,12,2)

   start_date=date_string+'T'+strmid(date_time_string,8,2)+':'+ $
              strmid(date_time_string,10,2)+':'+ $
              strmid(date_time_string,12,2)+'.000'

   stop_date=date_string+'T'+strmid(date_time_string,8,2)+':'+ $
             strmid(date_time_string,10,2)+':'+ $
             strtrim(string(fix(strmid(date_time_string,12,2))+delta_second, $
                            format='(i2.2)'),1)+'.999'

endif

granule_info.resource_id=granule_info.resource_id+resource_id_date_string

granule_info.start_date=start_date

granule_info.stop_date=stop_date

return,granule_info

end

