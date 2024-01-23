
function read_tab_table,tab_table_input_file,exist_flag,verbose=verbose, $
                        compress=compress

exist_flag=0

if keyword_set(verbose) then $
   printf,20,'Tab Table Input File Name:            ',tab_table_input_file,$
          format='(2a/)'

;
;   Read the Tab Table File from Disk
;

openr,30,tab_table_input_file,error=error

if (error eq 0) then begin

   tab_table_record=''

   tab_table=replicate('',99999L)

   record_count=0L

   while not eof(30) do begin

      readf,30,tab_table_record,format='(a)'

      tab_table(record_count)=tab_table_record

      record_count=record_count+1L

   endwhile

   close,30

   tab_table=tab_table(lindgen(record_count))

   tab_position=string_position(tab_table(0),string(9B))

   tab_position=[-1,[tab_position],strlen(tab_table(0))]

   element_num=n_elements(tab_position)-1

   temp=make_array(element_num,/string,value='')

   for element_loop=0,element_num-1 do begin

       temp(element_loop)=strmid(tab_table(0),tab_position(element_loop)+1, $
                                 tab_position(element_loop+1)- $
                                 tab_position(element_loop)-1)

       open_parenthesis_mask=string_position(temp(element_loop),'(')

       open_parenthesis_mask_num=0

       if (open_parenthesis_mask(0) ne -1) then $
          open_parenthesis_mask_num=n_elements(open_parenthesis_mask)

       if (open_parenthesis_mask_num gt 0) then $
          temp(element_loop)= $
             strmid(temp(element_loop),0,open_parenthesis_mask(0))

       temp(element_loop)=strjoin(strsplit(temp(element_loop),'#',/extract))

       temp(element_loop)= $
          strlowcase(string_condition(temp(element_loop),' ','_'))

       temp(element_loop)=string_condition(temp(element_loop),'-','_')

   endfor

   dot_position=string_position(tab_table_input_file,'.')

   dot_num=n_elements(dot_position)

   slash_position=string_position(tab_table_input_file,'/')

   slash_num=n_elements(slash_position)

   header_prefix= $
      strupcase(strmid(tab_table_input_file,slash_position(slash_num-1)+1, $
                       dot_position(dot_num-1)-slash_position(slash_num-1)-1))

;  command="header=create_struct(name='"+header_prefix+"_TABLE_HEADER','"

   command="header=create_struct('"+temp(0)+"','"+temp(0)+"')"

   result=execute(command)

   for element_loop=1,element_num-1 do begin

       command="header=create_struct(header,'"+temp(element_loop)+"','"+temp(element_loop)+"')"

       result=execute(command)

   endfor

;  header_text='ASTRO'+string(9B)

;  for element_loop=0,element_num-1 do begin

;      header.(element_loop)=temp(element_loop)

;      header_text=header_text+header.(element_loop)+string(9B)

;  endfor

;  printf,20,strtrim(header_text,2),format='(a/)'

   content=replicate(header,record_count-1)

   for record_loop=1L,record_count-1L do begin

      tab_position=string_position(tab_table(record_loop),string(9B))

      tab_position=[-1,[tab_position],strlen(tab_table(record_loop))]

      tab_position_num=n_elements(tab_position)

      if (element_num ne tab_position_num-1) then begin

         print,'READ_TAB_TABLE Warning, Incorrect tab count in line:  ', $
               tab_table_input_file,':  ', $
               record_loop,'Expected Count:  ',element_num, $
               '   Actual Count:  ',tab_position_num-1,format='(3a,i5/,2(a,i5))'

         print,string_position(tab_table(record_loop),string(9B)),format='(45i5)'

      endif

;     content_text='ASTRO'+string(9B)

      if (element_num eq n_elements(tab_position)-1) then begin

         for element_loop=0,element_num-1 do begin

             content(record_loop-1).(element_loop)= $
                strmid(tab_table(record_loop),tab_position(element_loop)+1, $
                       tab_position(element_loop+1)- $
                       tab_position(element_loop)-1)

             if keyword_set(verbose) then $
                content(record_loop-1).(element_loop)= $
                   strtrim(strcompress(content(record_loop-1).(element_loop)),2)

;            content_text=content_text+content(record_loop-1).(element_loop)+string(9B)

         endfor

      endif

;     printf,20,strtrim(content_text,2)

   endfor

;  printf,20,''

endif else begin

   if (error ne 0) then begin

      printf,20,'Tab Table File does not open properly'

      printf,20,tab_table_input_file

      printf,20,'Error #:',error

      printf,20,!ERR_STRING

      printf,20,''

      exist_flag=error

      tab_table=''

   endif

endelse

;
;   END OF PROCESSING, YEAH!!!
;

tab_table_structure= $
   create_struct('header',header,'table',content,'record_num',record_count-1)

;  create_struct(name=header_prefix+'_TAB_TABLE_STRUCTURE','header',header, $

return,tab_table_structure

end

