
function populate_input_parameter,spase_ontology,station_info,verbose=verbose

input_parameter=spase_model_create(spase_ontology,'input_parameter',verbose=verbose)

;
;-------------------------------------------------------------------------------
;
;  INPUT_PARAMETER List Num:                        2
;
;-------------------------------------------------------------------------------
;

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

input_parameter.name=''

input_parameter.description=''

input_parameter.caveats=''

input_parameter.modeled_region=''

for qualifier_loop=0,4 do input_parameter.qualifier(qualifier_loop)=''

input_parameter.input_table_url=''

input_parameter.parameter_quantity=''

input_parameter.property.name=''

input_parameter.property.description=''

input_parameter.property.caveats=''

input_parameter.property.property_quantity=''

for qualifier_loop=0,4 do input_parameter.property.qualifier(qualifier_loop)=''

input_parameter.property.units=''

input_parameter.property.units_conversion=''

input_parameter.property.property_label=''

input_parameter.property.property_value=''

input_parameter.property.property_table_url=''

input_parameter.property.valid_min=''

input_parameter.property.valid_max=''

input_parameter.property.property_model=''

input_parameter.property.model_url=''

return,input_parameter

end

