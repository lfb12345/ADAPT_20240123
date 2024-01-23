
function populate_azimuthal_angle_range,spase_ontology,station_info,verbose=verbose

azimuthal_angle_range=spase_model_create(spase_ontology,'azimuthal_angle_range',verbose=verbose)

azimuthal_angle_range.low=''

azimuthal_angle_range.high=''

azimuthal_angle_range.units=''

for bin_loop=0,31 do begin

    azimuthal_angle_range.bin(bin_loop).band_name=''

    azimuthal_angle_range.bin(bin_loop).low=''

    azimuthal_angle_range.bin(bin_loop).high=''

endfor

return,azimuthal_angle_range

end

