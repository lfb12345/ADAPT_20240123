
function populate_region_parameter,spase_ontology,station_info,verbose=verbose

region_parameter=spase_model_create(spase_ontology,'region_parameter',verbose=verbose)

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

region_parameter.modeled_region=''

region_parameter.description=''

region_parameter.caveats=''

region_parameter.radius=''

region_parameter.sub_longitude=''

region_parameter.period=''

region_parameter.object_mass=''

region_parameter.input_table_url=''

region_parameter.property.name=''

region_parameter.property.description=''

region_parameter.property.caveats=''

region_parameter.property.property_quantity=''

for qualifier_loop=0,4 do region_parameter.property.qualifier(qualifier_loop)=''

region_parameter.property.units=''

region_parameter.property.units_conversion=''

region_parameter.property.property_label=''

region_parameter.property.property_value=''

region_parameter.property.property_table_url=''

region_parameter.property.valid_min=''

region_parameter.property.valid_max=''

region_parameter.property.property_model=''

region_parameter.property.model_url=''

return,region_parameter

end

