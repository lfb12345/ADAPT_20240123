
function format_integer,number

format_spec='(i'+strtrim(string(strlen(strtrim(string(number),1))),1)+')'

return,format_spec

end

