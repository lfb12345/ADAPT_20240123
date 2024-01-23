
function populate_input_field,spase_ontology,station_info,verbose=verbose

input_field=spase_model_create(spase_ontology,'input_field',verbose=verbose)

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

input_field.name=''

input_field.set=''

input_field.parameter_key=''

input_field.description=''

input_field.caveats=''

input_field.modeled_region=''

input_field.coordinate_system.coordinate_representation=''

input_field.coordinate_system.coordinate_system_name=''

for qualifier_loop=0,4 do input_field.qualifier(qualifier_loop)=''

input_field.field_quantity=''

input_field.units=''

input_field.units_conversion=''

input_field.input_label=''

input_field.field_value=''

input_field.input_table_url=''

input_field.valid_min=''

input_field.valid_max=''

input_field.field_model=''

input_field.model_url=''

return,input_field

end

