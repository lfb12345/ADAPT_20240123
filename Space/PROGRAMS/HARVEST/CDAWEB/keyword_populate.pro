
function keyword_populate,keyword,index,text

mask=where(text ne "",mask_num)

keyword_mask=make_array(mask_num,/integer,/index)

keyword(index+keyword_mask)=text(mask)

index=index+mask_num

keyword_structure=create_struct('keyword',keyword,'index',index)

return,keyword_structure

end

