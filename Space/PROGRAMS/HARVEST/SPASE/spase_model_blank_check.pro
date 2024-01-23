
function spase_model_blank_check,structure

tag_num=n_tags(structure)

tag_name=strlowcase(tag_names(structure))

tag_type=make_array(tag_num,/integer,value=0)

tag_element_num=make_array(tag_num,/integer,value=0)

for tag_loop=0L,tag_num-1L do begin

    tag_type(tag_loop)=size(structure.(tag_loop),/type)

    tag_element_num(tag_loop)=size(structure.(tag_loop),/n_elements)

endfor

all_concat=''

for tag_loop=0L,tag_num-1L do begin

    sub_concat=''

    for element_loop=0L,tag_element_num(tag_loop)-1L do begin

        if (tag_type(tag_loop) eq 7) then $
           sub_concat=sub_concat+structure.(tag_loop)(element_loop)

        if (tag_type(tag_loop) eq 8) then $
           sub_concat=sub_concat+ $
             spase_model_blank_check(structure.(tag_loop)(element_loop))

    endfor

    all_concat=all_concat+sub_concat

endfor

return,all_concat

end

