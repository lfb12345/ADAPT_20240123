
function spase_model_ontology,spase_ontology_raw,verbose=verbose

offset=0

level=1

spase_ontology= $
   spase_model_ontology_decode(spase_ontology_raw,level,offset,/verbose)

spase_ontology(0).element_start_line=1

spase_ontology(0).element_stop_line=n_elements(spase_ontology)-1

group_incl=spase_ontology.group

spase_ontology(0).group_incl= $
   strjoin(group_incl(uniq(group_incl,sort(group_incl))))

return,spase_ontology

end

