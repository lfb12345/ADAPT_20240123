
function populate_wavelength_range,spase_ontology,station_info,verbose=verbose

wavelength_range=spase_model_create(spase_ontology,'wavelength_range',verbose=verbose)

wavelength_range.spectral_range=''

wavelength_range.low=''

wavelength_range.high=''

wavelength_range.units=''

for bin_loop=0,31 do begin

    wavelength_range.bin(bin_loop).band_name=''

    wavelength_range.bin(bin_loop).low=''

    wavelength_range.bin(bin_loop).high=''

endfor

return,wavelength_range

end

