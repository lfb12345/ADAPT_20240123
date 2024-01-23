
function populate_field,spase_ontology,station_info,verbose=verbose

field=spase_model_create(spase_ontology,'field',verbose=verbose)

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

for qualifier_loop=0,4 do field.qualifier(qualifier_loop)=''

field.field_quantity=''

field.frequency_range.spectral_range=''

field.frequency_range.low=''

field.frequency_range.high=''

field.frequency_range.units=''

for bin_loop=0,31 do begin

    field.frequency_range.bin(bin_loop).band_name=''

    field.frequency_range.bin(bin_loop).low=''

    field.frequency_range.bin(bin_loop).high=''

endfor

return,field

end

