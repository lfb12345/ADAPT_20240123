
function populate_structure,spase_ontology,station_info,verbose=verbose

structure=spase_model_create(spase_ontology,'structure',verbose=verbose)

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

structure.size=''

structure.description=''

for element_loop=0,255 do begin

    structure.element(element_loop).name=''

    for qualifier_loop=0,4 do structure.element(element_loop).qualifier(qualifier_loop)=''

    structure.element(element_loop).index=''

    structure.element(element_loop).parameter_key=''

    structure.element(element_loop).units=''

    structure.element(element_loop).units_conversion=''

    structure.element(element_loop).valid_min=''

    structure.element(element_loop).valid_max=''

    structure.element(element_loop).fill_value=''

    structure.element(element_loop).rendering_hints.display_type=''

    structure.element(element_loop).rendering_hints.axis_label=''

    structure.element(element_loop).rendering_hints.rendering_axis=''

    structure.element(element_loop).rendering_hints.index=''

    structure.element(element_loop).rendering_hints.value_format=''

    structure.element(element_loop).rendering_hints.scale_min=''

    structure.element(element_loop).rendering_hints.scale_max=''

    structure.element(element_loop).rendering_hints.scale_type=''

endfor

return,structure

end

