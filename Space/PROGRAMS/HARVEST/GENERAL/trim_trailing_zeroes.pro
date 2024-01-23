
function trim_trailing_zeroes,text

for text_loop=0,n_elements(text)-1 do begin

    string_length_begin=strlen(text(text_loop))

    position_dot=strpos(text(text_loop),'.')

    for loop=string_length_begin-1,position_dot+2,-1 do begin

        zero_position=strpos(text(text_loop),'0',/reverse_search)

        last_position=strlen(text(text_loop))-1

        if (zero_position eq last_position) then text(text_loop)=strmid(text(text_loop),0,last_position)

    endfor

endfor

return,text

end

