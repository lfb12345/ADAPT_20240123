
function date_to_scale_min_max,date_time

if (strmatch(date_time,'[0-3][0-9]-[ADFJMNOS][aceopu][bcglnprtvy]-[12][0-9][0-9][0-9] [0-2][0-9]:[0-5][0-9]:[0-5][0-9].[0-9]*')) then begin

   date_time_split=strsplit(date_time,'-: ',/extract) 

   months=['   ','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','OCT','Nov','Dec']

   date_time_split(1)=strtrim(string(where(date_time_split(1) eq months)),2)                                                                                                               

   date_time=double((julday(date_time_split(1),date_time_split(0),date_time_split(2),date_time_split(3),date_time_split(4),date_time_split(5)))-2415020.5d0)*(86400000.0d0)+5.9958208e+13

   date_time=strtrim(string(date_time,format='(e19.13)'),2)

endif

if (strmatch(date_time,'[12][0-9][0-9][0-9]-[01][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9].[0-9]*')) then begin

   date_time_split=strsplit(date_time,'-:T',/extract)

   date_time=double((julday(date_time_split(1),date_time_split(2),date_time_split(0),date_time_split(3),date_time_split(4),date_time_split(5)))-2415020.5d0)*(86400000.0d0)+5.9958208e+13

   date_time=strtrim(string(date_time,format='(e19.13)'),2)

endif

return,date_time

end

