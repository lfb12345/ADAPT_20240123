
function string_condition,text,old_delimiters,new_delimiter

delimiter_num=strlen(old_delimiters)

text_temp=text

for text_loop=0,n_elements(text)-1 do begin

    for delimiter_loop=0,delimiter_num-1 do begin

        delimiter=strmid(old_delimiters,delimiter_loop,1)

        text_temp(text_loop)= $
           strjoin(strsplit(text_temp(text_loop),delimiter,/extract), $
                            new_delimiter)

    endfor

endfor

return,text_temp

end

