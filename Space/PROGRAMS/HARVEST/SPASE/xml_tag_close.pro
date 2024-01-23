
pro xml_tag_close,spase_ontology,full_xml,full_index,preview=preview

indent=''

if (spase_ontology.tag_level gt 0) then $
   indent=strjoin(replicate('   ',spase_ontology.tag_level))

xml_line=indent+'</'+spase_ontology.keyword+'>'

if (not keyword_set(preview)) then printf,10,xml_line

full_xml(full_index)=xml_line

full_xml=full_xml(0:full_index)

full_index=full_index+1

return

end

