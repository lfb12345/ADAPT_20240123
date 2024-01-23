
function populate_particle,spase_ontology,station_info,verbose=verbose

particle=spase_model_create(spase_ontology,'particle',verbose=verbose)

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

for particle_type_loop=0,4 do particle.particle_type(particle_type_loop)=''

for qualifier_loop=0,4 do particle.qualifier(qualifier_loop)=''

particle.particle_quantity=''

for atomic_number_loop=0,4 do particle.atomic_number(atomic_number_loop)=''

particle.energy_range.low=''

particle.energy_range.high=''

particle.energy_range.units=''

for bin_loop=0,31 do begin

    particle.energy_range.bin(bin_loop).band_name=''

    particle.energy_range.bin(bin_loop).low=''

    particle.energy_range.bin(bin_loop).high=''

endfor

particle.azimuthal_angle_range.low=''

particle.azimuthal_angle_range.high=''

particle.azimuthal_angle_range.units=''

for bin_loop=0,31 do begin

    particle.azimuthal_angle_range.bin(bin_loop).band_name=''

    particle.azimuthal_angle_range.bin(bin_loop).low=''

    particle.azimuthal_angle_range.bin(bin_loop).high=''

endfor

particle.polar_angle_range.low=''

particle.polar_angle_range.high=''

particle.polar_angle_range.units=''

for bin_loop=0,31 do begin

    particle.polar_angle_range.bin(bin_loop).band_name=''

    particle.polar_angle_range.bin(bin_loop).low=''

    particle.polar_angle_range.bin(bin_loop).high=''

endfor

particle.mass_range.low=''

particle.mass_range.high=''

particle.mass_range.units=''

for bin_loop=0,31 do begin

    particle.mass_range.bin(bin_loop).band_name=''

    particle.mass_range.bin(bin_loop).low=''

    particle.mass_range.bin(bin_loop).high=''

endfor

particle.pitch_angle_range.low=''

particle.pitch_angle_range.high=''

particle.pitch_angle_range.units=''

for bin_loop=0,31 do begin

    particle.pitch_angle_range.bin(bin_loop).band_name=''

    particle.pitch_angle_range.bin(bin_loop).low=''

    particle.pitch_angle_range.bin(bin_loop).high=''

endfor

particle.chemical_formula=''

particle.population=''

particle.population_mass_number=''

particle.population_charge_state=''

return,particle

end

