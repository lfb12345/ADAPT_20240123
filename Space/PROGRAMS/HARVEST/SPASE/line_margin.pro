
function line_margin,text

if (strlen(text) le 80) then begin

   text_final=text

endif else begin

   substring=strsplit(text,'=',count=substring_num,/extract)

   if (strlen(substring(1))+3 le 80) then begin

      text_final=[substring(0)+'= $','   '+substring(1)]

   endif else begin

      substring=strsplit(text,',[]',count=substring_num,/extract)

      character_count_num=0

      substring_loop_start=1

      for substring_loop=1,substring_num-1 do begin

          character_count_num=character_count_num+strlen(substring(substring_loop))+1

          if (character_count_num gt 74) then begin

             substring_loop_stop=substring_loop-1

             if (n_elements(text_final) eq 0) then begin

                text_final=strjoin(substring(substring_loop_start:substring_loop_stop),',')

                text_final_num=n_elements(text_final)

             endif else begin

                text_final=[text_final,strjoin(substring(substring_loop_start:substring_loop_stop),',')]

                text_final_num=n_elements(text_final)

             endelse

             substring_loop_start=substring_loop

             character_count_num=strlen(substring(substring_loop))+1

             text_final_num=n_elements(text_final)

          endif

          if (substring_loop eq substring_num-1) then begin

             text_final_num=n_elements(text_final)

             text_final=[text_final,strjoin(substring(substring_loop_start:substring_num-1),',')]

             text_final_num=n_elements(text_final)

          endif

      endfor 

      text_final=[substring(0)+' $',text_final]

      text_final_num=n_elements(text_final)

      text_final(1)='   ['+text_final(1)+', $'

      if (text_final_num gt 3) then $
         text_final(2:text_final_num-2)='    '+text_final(2:text_final_num-2)+', $'

      text_final(text_final_num-1)='    '+text_final(text_final_num-1)+']'

   endelse

endelse

return,text_final

end

