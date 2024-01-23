
function date_time_string,year,month,day,hour,minute,second,duration=duration

if keyword_set(duration) then begin

   time_key='PT'

endif else begin

   time_key='T'

endelse

date_string=string(year,format='(i4.4)')+'-'+ $
            string(month,format='(i2.2)')+'-'+ $
            string(day,format='(i2.2)')+time_key+ $
            string(hour,format='(i2.2)')+':'+ $
            string(minute,format='(i2.2)')+':'+ $
            string(fix(second),format='(i2.2)')+ $
            strmid(string(second mod 1.0,format='(f6.3)'),2,4)

return,date_string

end

