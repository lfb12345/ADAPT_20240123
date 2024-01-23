
function string_position,text,search_string

remaining_text=text

scan_start_position=0

index=0

while (index ne -1) do begin

      index=strpos(remaining_text,search_string)

      if (index ne -1) then begin

         if (n_elements(position) eq 0) then begin

            position=index

         endif else begin

            position=[position,index+scan_start_position]

         endelse

         trim_length=strlen(remaining_text)-index-1

         remaining_text=strmid(remaining_text,index+1,trim_length)

         scan_start_position=index+scan_start_position+1

      endif

endwhile

if (n_elements(position) eq 0) then position=-1

return,position

end

