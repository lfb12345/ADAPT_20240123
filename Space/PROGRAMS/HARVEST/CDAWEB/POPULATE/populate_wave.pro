
function populate_wave,spase_ontology,station_info,verbose=verbose

wave=spase_model_create(spase_ontology,'wave',verbose=verbose)

qualifier_list= $
   ['','Incident','Anisotropy','Array','AutoSpectrum','Average', $
    'Characteristic','Circular','Coherence','Column','Component', $
    'Component.I','Component.J','Component.K','Confidence','Core', $
    'CrossSpectrum','Deviation','Differential','Direction','Directional', $
    'DirectionAngle','DirectionAngle.AzimuthAngle', $
    'DirectionAngle.ElevationAngle','DirectionAngle.PolarAngle', $
    'DirectionCosine','DirectionCosine.I','DirectionCosine.J', $
    'DirectionCosine.K','EncodedParameter','FieldAligned','Fit','Group', $
    'Halo','ImaginaryPart','Integral','Integral.Area','Integral.Bandwidth', $
    'Integral.SolidAngle','Linear','LineOfSight','Magnitude','Maximum', $
    'Median','Minimum','Moment','Parallel','Peak','Perpendicular', $
    'Perturbation','Phase','PhaseAngle','PowerSpectralDensity','Projection', $
    'Projection.IJ','Projection.IK','Projection.JK','Pseudo','Ratio', $
    'RealPart','Scalar','Spectral','StandardDeviation','StokesParameters', $
    'Strahl','Superhalo','Symmetric','Tensor','Total','Trace','Uncertainty', $
    'Variance','Vector']

wave.wave_type=''

for qualifier_loop=0,4 do wave.qualifier(qualifier_loop)=''

wave.wave_quantity=''

wave.energy_range.low=''

wave.energy_range.high=''

wave.energy_range.units=''

for bin_loop=0,31 do begin

    wave.energy_range.bin(bin_loop).band_name=''

    wave.energy_range.bin(bin_loop).low=''

    wave.energy_range.bin(bin_loop).high=''

endfor

wave.frequency_range.spectral_range=''

wave.frequency_range.low=''

wave.frequency_range.high=''

wave.frequency_range.units=''

for bin_loop=0,31 do begin

    wave.frequency_range.bin(bin_loop).band_name=''

    wave.frequency_range.bin(bin_loop).low=''

    wave.frequency_range.bin(bin_loop).high=''

endfor

wave.wavelength_range.spectral_range=''

wave.wavelength_range.low=''

wave.wavelength_range.high=''

wave.wavelength_range.units=''

for bin_loop=0,31 do begin

    wave.wavelength_range.bin(bin_loop).band_name=''

    wave.wavelength_range.bin(bin_loop).low=''

    wave.wavelength_range.bin(bin_loop).high=''

endfor

return,wave

end

