
function fix_invalid_xml_characters,text

;ext=strjoin(strsplit(text,'&',/extract,/regex),'&amp;')

text=strjoin(strsplit(text,"'",/extract,/regex),'&apos;')

text=strjoin(strsplit(text,'<',/extract,/regex),'&lt;')

text=strjoin(strsplit(text,'>',/extract,/regex),'&gt;')

text=strjoin(strsplit(text,'"',/extract,/regex),'&quot;')

return,0

end

