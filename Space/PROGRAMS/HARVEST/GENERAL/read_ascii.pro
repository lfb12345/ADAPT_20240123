
function read_ascii,file_name,file_description,exist_flag

!EXCEPT=2

printf,20,file_description+' File Name:',file_name,format='(a-28,a/)'

record_count=0L

record=''

text=make_array(file_lines(file_name),/string,value='')

openr,30,file_name,error=error

if (error eq 0) then begin

   exist_flag=0

   while not eof(30) do begin

         readf,30,record

;        printf,20,record_count,strlen(record),record,format='(i5.5,i5,x,a)'

         text(record_count)=record

         record_count=record_count+1L

   endwhile

;  printf,20,''

   close,30

   text=text(lindgen(record_count))

endif else begin

   printf,20,'File does not open properly'

   printf,20,'Error #:',error

   printf,20,!ERR_STRING

   exist_flag=error

endelse

return,text

end

