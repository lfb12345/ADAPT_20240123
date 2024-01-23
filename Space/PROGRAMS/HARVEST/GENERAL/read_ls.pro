
function read_ls,ls_file_name,exist_flag

!EXCEPT=2

exist_flag=0

stars=strjoin(replicate('*',275))

;
;    Create the Directory Listing Data Storage Structure
;

ls_text=make_array(100000L,/string,value='')

print,'Directory Listing Input File Name:  '+ls_file_name,format='(a/)'

record_count=0L

total_record_count=0L

record=''

openr,30,ls_file_name,error=error

if (error eq 0) then begin

   while not eof(30) do begin

         readf,30,record

         if (record ne '') then begin

;           print,total_record_count,record_count,strlen(record),record, $
;                 format='(3i5,x,a)'

            ls_text(record_count)=record

            record_count=record_count+1L

         endif

         total_record_count=total_record_count+1L

   endwhile

   close,30

   if (record_count gt 0) then begin

      ls_text=ls_text(indgen(record_count))

   endif else begin

      ls_text=''

      exist_flag=-1

   endelse

;  print,record_count,format='(/i5/)'

endif else begin

   print,'File does not open properly'
   print,'Error #:',error
   print,!ERR_STRING
   print,''

   ls_text=''

   exist_flag=error

   print,stars,format='(a/)'

endelse

return,ls_text

end

