
function populate_pitch_angle_range,spase_ontology,station_info,verbose=verbose

pitch_angle_range=spase_model_create(spase_ontology,'pitch_angle_range',verbose=verbose)

pitch_angle_range.low=''

pitch_angle_range.high=''

pitch_angle_range.units=''

for bin_loop=0,31 do begin

    pitch_angle_range.bin(bin_loop).band_name=''

    pitch_angle_range.bin(bin_loop).low=''

    pitch_angle_range.bin(bin_loop).high=''

endfor

return,pitch_angle_range

end

