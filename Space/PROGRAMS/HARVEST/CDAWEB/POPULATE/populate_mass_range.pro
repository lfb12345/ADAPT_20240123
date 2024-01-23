
function populate_mass_range,spase_ontology,station_info,verbose=verbose

mass_range=spase_model_create(spase_ontology,'mass_range',verbose=verbose)

mass_range.low=''

mass_range.high=''

mass_range.units=''

for bin_loop=0,31 do begin

    mass_range.bin(bin_loop).band_name=''

    mass_range.bin(bin_loop).low=''

    mass_range.bin(bin_loop).high=''

endfor

return,mass_range

end

