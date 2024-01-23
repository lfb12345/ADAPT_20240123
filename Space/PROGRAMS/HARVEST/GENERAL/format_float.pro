
function format_float,number,significant_figures_num

format_suffix=strtrim(string(significant_figures_num,format='(i2)'),1)

format_spec='(f'+strtrim(string(strlen(strtrim(string(number,format='(f99.'+format_suffix+')'),1))),1)+'.'+format_suffix+')'

return,format_spec

end

