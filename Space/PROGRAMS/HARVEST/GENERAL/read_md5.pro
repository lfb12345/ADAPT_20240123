
function read_md5,station_code,directory,exist_flag

!EXCEPT=2

exist_flag=0

stars=strjoin(replicate('*',275))

;
;    Create the MD5 Listing Data Storage Structure
;

md5_text=make_array(10000,/string,value='')

md5_file_name=directory+strlowcase(station_code)+'_md5_list.txt'

print,'MD5 Listing Input File Name:        '+md5_file_name,format='(a/)'

record_count=0L

total_record_count=0L

record=''

openr,30,md5_file_name,error=error

if (error eq 0) then begin

   while not eof(30) do begin

         readf,30,record

         if (record ne '') then begin

;           print,total_record_count,record_count,strlen(record),record, $
;                 format='(3i5,x,a)'

            md5_text(record_count)=record

            record_count=record_count+1L

         endif

         total_record_count=total_record_count+1L

   endwhile

   close,30

   if (record_count gt 0) then begin
   
      md5_text=md5_text(indgen(record_count))

   endif else begin

      md5_text=''

      exist_flag=-1

   endelse

;  print,record_count,format='(/i5/)'

endif else begin

   print,'File does not open properly'
   print,'Error #:',error
   print,!ERR_STRING
   print,''

   exist_flag=error

   print,stars,format='(a/)'

endelse

return,md5_text

end

