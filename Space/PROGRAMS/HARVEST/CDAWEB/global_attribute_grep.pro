
function global_attribute_grep,global_attribute_info,attribute,grep_style, $
                               join_style,join_string,compress_style

grep_mask=where(strlowcase(global_attribute_info.name) eq attribute,grep_mask_num)

if (grep_mask(0) ne -1) then begin

   if (grep_mask_num eq 1 and global_attribute_info(grep_mask).record_num ne 0) then begin

      if (grep_style eq 'ALL') then begin

         record_num=global_attribute_info(grep_mask).record_num

      endif else begin

         record_num=1

      endelse

      mask=make_array(record_num,/integer,/index)

      text=make_array(record_num,/string,value='')

      for loop=0,record_num-1 do begin

          if (strmid(global_attribute_info(grep_mask).attribute(loop).text,0,1) eq '"') then $
             global_attribute_info(grep_mask).attribute(loop).text= $
                strmid(global_attribute_info(grep_mask).attribute(loop).text,1,strlen(global_attribute_info(grep_mask).attribute(loop).text)-1)

          if (strmid(global_attribute_info(grep_mask).attribute(loop).text,strlen(global_attribute_info(grep_mask).attribute(loop).text)-1,1) eq '"') then $
             global_attribute_info(grep_mask).attribute(loop).text= $
                strmid(global_attribute_info(grep_mask).attribute(loop).text,0,strlen(global_attribute_info(grep_mask).attribute(loop).text)-1)

          if (compress_style eq 'COMPRESS') then begin

             text(loop)=strcompress(strtrim(strjoin(strsplit(strjoin(strsplit(strjoin(strsplit(global_attribute_info(grep_mask).attribute(loop).text,"'",/extract)," "),">",/extract),"&gt;"),"<",/extract),"&lt;"),2))

          endif else begin

             text(loop)=strtrim(strjoin(strsplit(strjoin(strsplit(strjoin(strsplit(global_attribute_info(grep_mask).attribute(loop).text,"'",/extract)," "),">",/extract),"&gt;"),"<",/extract),"&lt;"),2)

          endelse

      endfor

      if (join_style eq 'JOIN') then text=strjoin(text,join_string)

   endif else begin

      mask=0

      text=''

      record_num=1

   endelse

endif else begin

   mask=0

   text=''

   record_num=1

endelse

global_attribute=create_struct('record_num',record_num,'text',text,'mask',mask)

return,global_attribute

end

