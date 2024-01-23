
function read_spase_xml,spase_xml_input_file,exist_flag,verbose=verbose

exist_flag=0

if keyword_set(verbose) then $
   printf,20,'Spase XML Input File Name:            ', $
             spase_xml_input_file,format='(2a/)'

;
;   Read the Spase XML File from Disk
;

openr,30,spase_xml_input_file,error=error

if (error eq 0) then begin

   spase_xml_record=''

   spase_xml=replicate('',99999L)

   record_count=0L

   while not eof(30) do begin

      readf,30,spase_xml_record,format='(a)'

      spase_xml(record_count)=spase_xml_record

      record_count=record_count+1L

   endwhile

   close,30

   spase_xml=spase_xml(lindgen(record_count))

endif else begin

   if (error ne 0) then begin

      printf,20,'SPASE XML File does not open properly'
      printf,20,spase_xml_input_file
      printf,20,'Error #:',error
      printf,20,!ERR_STRING
      printf,20,''

      exist_flag=error

      spase_xml=''

   endif

endelse

;
;   END OF PROCESSING, YEAH!!!
;

return,spase_xml

end

