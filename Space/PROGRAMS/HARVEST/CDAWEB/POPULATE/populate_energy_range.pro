
function populate_energy_range,spase_ontology,station_info,verbose=verbose

energy_range=spase_model_create(spase_ontology,'energy_range',verbose=verbose)

energy_range.low=''

energy_range.high=''

energy_range.units=''

for bin_loop=0,31 do begin

    energy_range.bin(bin_loop).band_name=''

    energy_range.bin(bin_loop).low=''

    energy_range.bin(bin_loop).high=''

endfor

return,energy_range

end

