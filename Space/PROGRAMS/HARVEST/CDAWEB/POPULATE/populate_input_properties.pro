
function populate_input_properties,spase_ontology,station_info,verbose=verbose

input_properties=spase_model_create(spase_ontology,'input_properties',verbose=verbose)

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

input_properties.property.name=''

input_properties.property.description=''

input_properties.property.caveats=''

input_properties.property.property_quantity=''

for qualifier_loop=0,4 do input_properties.property.qualifier(qualifier_loop)=''

input_properties.property.units=''

input_properties.property.units_conversion=''

input_properties.property.property_label=''

input_properties.property.property_value=''

input_properties.property.property_table_url=''

input_properties.property.valid_min=''

input_properties.property.valid_max=''

input_properties.property.property_model=''

input_properties.property.model_url=''

return,input_properties

end

