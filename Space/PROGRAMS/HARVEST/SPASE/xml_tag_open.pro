
pro xml_tag_open,spase_ontology,full_xml,index,preview=preview

indent=''

if (spase_ontology.tag_level gt 0) then $
   indent=strjoin(replicate('   ',spase_ontology.tag_level))

xml_line=indent+'<'+spase_ontology.keyword+'>'

if (not keyword_set(preview)) then printf,10,xml_line

full_xml(index)=xml_line

index=index+1

return

end

