
function populate_input_population,spase_ontology,station_info,verbose=verbose

input_population=spase_model_create(spase_ontology,'input_population',verbose=verbose)

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

input_population.name=''

input_population.set=''

input_population.parameter_key=''

input_population.description=''

input_population.caveats=''

input_population.modeled_region=''

for qualifier_loop=0,4 do input_population.qualifier(qualifier_loop)=''

for particle_type_loop=0,4 do input_population.particle_type(particle_type_loop)=''

input_population.chemical_formula=''

for atomic_number_loop=0,4 do input_population.atomic_number(atomic_number_loop)=''

input_population.population_mass_number=''

input_population.population_charge_state=''

input_population.population_density=''

input_population.population_temperature=''

input_population.population_flow_speed=''

input_population.distribution=''

input_population.production_rate=''

input_population.total_production_rate=''

input_population.input_table_url=''

input_population.density_profile=''

input_population.model_url=''

return,input_population

end

