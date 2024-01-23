
function spase_model_reformat,spase_model_raw_text_filename,spase_model_filename

!EXCEPT=2

spase_model_raw_text=make_array(100,/string,value='')

printf,20,'SPASE Model Raw Text File Name:         ', $
          spase_model_raw_text_filename,format='(2a/)'

record=''

record_count=0L

openr,30,spase_model_raw_text_filename,error=error

if (error eq 0) then begin

   while not eof(30) do begin

         readf,30,record

         spase_model_raw_text(record_count)=record

         record_count=record_count+1L

   endwhile

   close,30

   spase_model_raw_text=spase_model_raw_text(indgen(record_count))

   openw,10,spase_model_filename

   for loop=0,record_count-1 do begin

      close_parenthesis_index=string_position(spase_model_raw_text(loop),')')

      start_index=0

      for line=0,n_elements(close_parenthesis_index)-1 do begin

          line_length=close_parenthesis_index(line)-start_index+2

          printf,10,strmid(spase_model_raw_text(loop),start_index,line_length)

          start_index=close_parenthesis_index(line)+2

      endfor

   endfor

   close,10

endif

return,error

end

