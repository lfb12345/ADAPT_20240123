
function write_tab_table,tab_table_output_file_name,tab_table,tab_header, $
                         tab_table_num,verbose=verbose

exist_flag=0

stars=strjoin(replicate('*',275))

if keyword_set(verbose) then begin

   printf,20,'XXX:  Tab Table Output File Name:',tab_table_output_file_name, $
             format='(a-45,a/)'

   printf,20,'XXX:  Tab Table Record Count:       ',tab_table_num, $
             format='(a,i/)'

   printf,20,stars,format='(a/)'

endif

;
;   Write the Tab Table File to Disk
;

openw,50,tab_table_output_file_name,error=error

if (error eq 0) then begin

   printf,50,tab_header.(0),string(9B),tab_header.(1),string(9B), $
             tab_header.(2),string(9B),tab_header.(3),string(9B), $
             tab_header.(4),string(9B),tab_header.(5),string(9B), $
             tab_header.(6),format='(13a)'

   for loop=0L,tab_table_num-1L do $
       printf,50,tab_table(loop).(0),string(9B),tab_table(loop).(1), $
                 string(9B),tab_table(loop).(2),string(9B), $
                 tab_table(loop).(3),string(9B),tab_table(loop).(4), $
                 string(9B),tab_table(loop).(5),string(9B), $
                 tab_table(loop).(6),format='(13a)'

endif else begin

   if (error ne 0) then begin

      printf,50,'Tab Table File does not open properly'
      printf,50,tab_table_output_file_name
      printf,50,'Error #:',error
      printf,50,!ERR_STRING,format='(a/)'

      exist_flag=error

      tab_table=''

   endif

endelse

close,50

;
;   END OF PROCESSING, YEAH!!!
;

return,exist_flag

end

