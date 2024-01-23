
function populate_polar_angle_range,spase_ontology,station_info,verbose=verbose

polar_angle_range=spase_model_create(spase_ontology,'polar_angle_range',verbose=verbose)

polar_angle_range.low=''

polar_angle_range.high=''

polar_angle_range.units=''

for bin_loop=0,31 do begin

    polar_angle_range.bin(bin_loop).band_name=''

    polar_angle_range.bin(bin_loop).low=''

    polar_angle_range.bin(bin_loop).high=''

endfor

return,polar_angle_range

end

