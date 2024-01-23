
function populate_frequency_range,spase_ontology,station_info,verbose=verbose

frequency_range=spase_model_create(spase_ontology,'frequency_range',verbose=verbose)

frequency_range.spectral_range=''

frequency_range.low=''

frequency_range.high=''

frequency_range.units=''

for bin_loop=0,31 do begin

    frequency_range.bin(bin_loop).band_name=''

    frequency_range.bin(bin_loop).low=''

    frequency_range.bin(bin_loop).high=''

endfor

return,frequency_range

end

