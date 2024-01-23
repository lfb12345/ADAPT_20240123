
function populate_rendering_hints,spase_ontology,station_info,verbose=verbose

rendering_hints=spase_model_create(spase_ontology,'rendering_hints',verbose=verbose)

rendering_hints.display_type=''

rendering_hints.axis_label=''

rendering_hints.rendering_axis=''

rendering_hints.index=''

rendering_hints.value_format=''

rendering_hints.scale_min=''

rendering_hints.scale_max=''

rendering_hints.scale_type=''

return,rendering_hints

end

