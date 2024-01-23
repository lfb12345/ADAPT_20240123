
function populate_parameter,spase_ontology,station_info,verbose=verbose

parameter=spase_model_create(spase_ontology,'parameter',verbose=verbose)

;
;-------------------------------------------------------------------------------
;
;  PARAMETER List Num:                              6
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

parameter.name=''

parameter.set=''

parameter.parameter_key=''

parameter.description=''

parameter.ucd=''

parameter.caveats=''

parameter.cadence=''

parameter.cadence_min=''

parameter.cadence_max=''

parameter.units=''

parameter.units_conversion=''

parameter.coordinate_system.coordinate_representation=''

parameter.coordinate_system.coordinate_system_name=''

parameter.rendering_hints.display_type=''

parameter.rendering_hints.axis_label=''

parameter.rendering_hints.rendering_axis=''

parameter.rendering_hints.index=''

parameter.rendering_hints.value_format=''

parameter.rendering_hints.scale_min=''

parameter.rendering_hints.scale_max=''

parameter.rendering_hints.scale_type=''

parameter.structure.size=''

parameter.structure.description=''

for element_loop=0,255 do begin

    parameter.structure.element(element_loop).name=''

    for qualifier_loop=0,4 do parameter.structure.element(element_loop).qualifier(qualifier_loop)=''

    parameter.structure.element(element_loop).index=''

    parameter.structure.element(element_loop).parameter_key=''

    parameter.structure.element(element_loop).units=''

    parameter.structure.element(element_loop).units_conversion=''

    parameter.structure.element(element_loop).valid_min=''

    parameter.structure.element(element_loop).valid_max=''

    parameter.structure.element(element_loop).fill_value=''

    parameter.structure.element(element_loop).rendering_hints.display_type=''

    parameter.structure.element(element_loop).rendering_hints.axis_label=''

    parameter.structure.element(element_loop).rendering_hints.rendering_axis=''

    parameter.structure.element(element_loop).rendering_hints.index=''

    parameter.structure.element(element_loop).rendering_hints.value_format=''

    parameter.structure.element(element_loop).rendering_hints.scale_min=''

    parameter.structure.element(element_loop).rendering_hints.scale_max=''

    parameter.structure.element(element_loop).rendering_hints.scale_type=''

endfor

parameter.valid_min=''

parameter.valid_max=''

parameter.fill_value=''

for qualifier_loop=0,4 do parameter.field.qualifier(qualifier_loop)=''

parameter.field.field_quantity=''

parameter.field.frequency_range.spectral_range=''

parameter.field.frequency_range.low=''

parameter.field.frequency_range.high=''

parameter.field.frequency_range.units=''

for bin_loop=0,31 do begin

    parameter.field.frequency_range.bin(bin_loop).band_name=''

    parameter.field.frequency_range.bin(bin_loop).low=''

    parameter.field.frequency_range.bin(bin_loop).high=''

endfor

for particle_type_loop=0,4 do parameter.particle.particle_type(particle_type_loop)=''

for qualifier_loop=0,4 do parameter.particle.qualifier(qualifier_loop)=''

parameter.particle.particle_quantity=''

for atomic_number_loop=0,4 do parameter.particle.atomic_number(atomic_number_loop)=''

parameter.particle.energy_range.low=''

parameter.particle.energy_range.high=''

parameter.particle.energy_range.units=''

for bin_loop=0,31 do begin

    parameter.particle.energy_range.bin(bin_loop).band_name=''

    parameter.particle.energy_range.bin(bin_loop).low=''

    parameter.particle.energy_range.bin(bin_loop).high=''

endfor

parameter.particle.azimuthal_angle_range.low=''

parameter.particle.azimuthal_angle_range.high=''

parameter.particle.azimuthal_angle_range.units=''

for bin_loop=0,31 do begin

    parameter.particle.azimuthal_angle_range.bin(bin_loop).band_name=''

    parameter.particle.azimuthal_angle_range.bin(bin_loop).low=''

    parameter.particle.azimuthal_angle_range.bin(bin_loop).high=''

endfor

parameter.particle.polar_angle_range.low=''

parameter.particle.polar_angle_range.high=''

parameter.particle.polar_angle_range.units=''

for bin_loop=0,31 do begin

    parameter.particle.polar_angle_range.bin(bin_loop).band_name=''

    parameter.particle.polar_angle_range.bin(bin_loop).low=''

    parameter.particle.polar_angle_range.bin(bin_loop).high=''

endfor

parameter.particle.mass_range.low=''

parameter.particle.mass_range.high=''

parameter.particle.mass_range.units=''

for bin_loop=0,31 do begin

    parameter.particle.mass_range.bin(bin_loop).band_name=''

    parameter.particle.mass_range.bin(bin_loop).low=''

    parameter.particle.mass_range.bin(bin_loop).high=''

endfor

parameter.particle.pitch_angle_range.low=''

parameter.particle.pitch_angle_range.high=''

parameter.particle.pitch_angle_range.units=''

for bin_loop=0,31 do begin

    parameter.particle.pitch_angle_range.bin(bin_loop).band_name=''

    parameter.particle.pitch_angle_range.bin(bin_loop).low=''

    parameter.particle.pitch_angle_range.bin(bin_loop).high=''

endfor

parameter.particle.chemical_formula=''

parameter.particle.population=''

parameter.particle.population_mass_number=''

parameter.particle.population_charge_state=''

parameter.wave.wave_type=''

for qualifier_loop=0,4 do parameter.wave.qualifier(qualifier_loop)=''

parameter.wave.wave_quantity=''

parameter.wave.energy_range.low=''

parameter.wave.energy_range.high=''

parameter.wave.energy_range.units=''

for bin_loop=0,31 do begin

    parameter.wave.energy_range.bin(bin_loop).band_name=''

    parameter.wave.energy_range.bin(bin_loop).low=''

    parameter.wave.energy_range.bin(bin_loop).high=''

endfor

parameter.wave.frequency_range.spectral_range=''

parameter.wave.frequency_range.low=''

parameter.wave.frequency_range.high=''

parameter.wave.frequency_range.units=''

for bin_loop=0,31 do begin

    parameter.wave.frequency_range.bin(bin_loop).band_name=''

    parameter.wave.frequency_range.bin(bin_loop).low=''

    parameter.wave.frequency_range.bin(bin_loop).high=''

endfor

parameter.wave.wavelength_range.spectral_range=''

parameter.wave.wavelength_range.low=''

parameter.wave.wavelength_range.high=''

parameter.wave.wavelength_range.units=''

for bin_loop=0,31 do begin

    parameter.wave.wavelength_range.bin(bin_loop).band_name=''

    parameter.wave.wavelength_range.bin(bin_loop).low=''

    parameter.wave.wavelength_range.bin(bin_loop).high=''

endfor

parameter.mixed.mixed_quantity=''

for particle_type_loop=0,4 do parameter.mixed.particle_type(particle_type_loop)=''

for qualifier_loop=0,4 do parameter.mixed.qualifier(qualifier_loop)=''

for qualifier_loop=0,4 do parameter.support.qualifier(qualifier_loop)=''

parameter.support.support_quantity=''

return,parameter

end

