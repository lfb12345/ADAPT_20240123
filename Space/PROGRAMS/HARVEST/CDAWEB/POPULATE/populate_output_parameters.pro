
function populate_output_parameters,spase_ontology,station_info,verbose=verbose,keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter

output_parameters=spase_model_create(spase_ontology,'output_parameters',verbose=verbose,keyword_input_field=keyword_input_field,keyword_input_parameter=keyword_input_parameter,keyword_input_population=keyword_input_population,keyword_input_process=keyword_input_process,keyword_region_parameter=keyword_region_parameter)

;
;-------------------------------------------------------------------------------
;
;  OUTPUT_PARAMETERS List Num:                      6
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

for parameter_loop=0,84 do begin

    output_parameters.parameter(parameter_loop).name=''

    output_parameters.parameter(parameter_loop).set=''

    output_parameters.parameter(parameter_loop).parameter_key=''

    output_parameters.parameter(parameter_loop).description=''

    output_parameters.parameter(parameter_loop).ucd=''

    output_parameters.parameter(parameter_loop).caveats=''

    output_parameters.parameter(parameter_loop).cadence=''

    output_parameters.parameter(parameter_loop).cadence_min=''

    output_parameters.parameter(parameter_loop).cadence_max=''

    output_parameters.parameter(parameter_loop).units=''

    output_parameters.parameter(parameter_loop).units_conversion=''

    output_parameters.parameter(parameter_loop).coordinate_system.coordinate_representation=''

    output_parameters.parameter(parameter_loop).coordinate_system.coordinate_system_name=''

    output_parameters.parameter(parameter_loop).rendering_hints.display_type=''

    output_parameters.parameter(parameter_loop).rendering_hints.axis_label=''

    output_parameters.parameter(parameter_loop).rendering_hints.rendering_axis=''

    output_parameters.parameter(parameter_loop).rendering_hints.index=''

    output_parameters.parameter(parameter_loop).rendering_hints.value_format=''

    output_parameters.parameter(parameter_loop).rendering_hints.scale_min=''

    output_parameters.parameter(parameter_loop).rendering_hints.scale_max=''

    output_parameters.parameter(parameter_loop).rendering_hints.scale_type=''

    output_parameters.parameter(parameter_loop).structure.size=''

    output_parameters.parameter(parameter_loop).structure.description=''

    for element_loop=0,255 do begin

        output_parameters.parameter(parameter_loop).structure.element(element_loop).name=''

        for qualifier_loop=0,4 do output_parameters.parameter(parameter_loop).structure.element(element_loop).qualifier(qualifier_loop)=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).index=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).parameter_key=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).units=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).units_conversion=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).valid_min=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).valid_max=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).fill_value=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.display_type=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.axis_label=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.rendering_axis=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.index=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.value_format=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_min=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_max=''

        output_parameters.parameter(parameter_loop).structure.element(element_loop).rendering_hints.scale_type=''

    endfor

    output_parameters.parameter(parameter_loop).valid_min=''

    output_parameters.parameter(parameter_loop).valid_max=''

    output_parameters.parameter(parameter_loop).fill_value=''

    for qualifier_loop=0,4 do output_parameters.parameter(parameter_loop).field.qualifier(qualifier_loop)=''

    output_parameters.parameter(parameter_loop).field.field_quantity=''

    output_parameters.parameter(parameter_loop).field.frequency_range.spectral_range=''

    output_parameters.parameter(parameter_loop).field.frequency_range.low=''

    output_parameters.parameter(parameter_loop).field.frequency_range.high=''

    output_parameters.parameter(parameter_loop).field.frequency_range.units=''

    for bin_loop=0,31 do begin

        output_parameters.parameter(parameter_loop).field.frequency_range.bin(bin_loop).band_name=''

        output_parameters.parameter(parameter_loop).field.frequency_range.bin(bin_loop).low=''

        output_parameters.parameter(parameter_loop).field.frequency_range.bin(bin_loop).high=''

    endfor

    for particle_type_loop=0,4 do output_parameters.parameter(parameter_loop).particle.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do output_parameters.parameter(parameter_loop).particle.qualifier(qualifier_loop)=''

    output_parameters.parameter(parameter_loop).particle.particle_quantity=''

    for atomic_number_loop=0,4 do output_parameters.parameter(parameter_loop).particle.atomic_number(atomic_number_loop)=''

    output_parameters.parameter(parameter_loop).particle.energy_range.low=''

    output_parameters.parameter(parameter_loop).particle.energy_range.high=''

    output_parameters.parameter(parameter_loop).particle.energy_range.units=''

    for bin_loop=0,31 do begin

        output_parameters.parameter(parameter_loop).particle.energy_range.bin(bin_loop).band_name=''

        output_parameters.parameter(parameter_loop).particle.energy_range.bin(bin_loop).low=''

        output_parameters.parameter(parameter_loop).particle.energy_range.bin(bin_loop).high=''

    endfor

    output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.low=''

    output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.high=''

    output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.units=''

    for bin_loop=0,31 do begin

        output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).band_name=''

        output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).low=''

        output_parameters.parameter(parameter_loop).particle.azimuthal_angle_range.bin(bin_loop).high=''

    endfor

    output_parameters.parameter(parameter_loop).particle.polar_angle_range.low=''

    output_parameters.parameter(parameter_loop).particle.polar_angle_range.high=''

    output_parameters.parameter(parameter_loop).particle.polar_angle_range.units=''

    for bin_loop=0,31 do begin

        output_parameters.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).band_name=''

        output_parameters.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).low=''

        output_parameters.parameter(parameter_loop).particle.polar_angle_range.bin(bin_loop).high=''

    endfor

    output_parameters.parameter(parameter_loop).particle.mass_range.low=''

    output_parameters.parameter(parameter_loop).particle.mass_range.high=''

    output_parameters.parameter(parameter_loop).particle.mass_range.units=''

    for bin_loop=0,31 do begin

        output_parameters.parameter(parameter_loop).particle.mass_range.bin(bin_loop).band_name=''

        output_parameters.parameter(parameter_loop).particle.mass_range.bin(bin_loop).low=''

        output_parameters.parameter(parameter_loop).particle.mass_range.bin(bin_loop).high=''

    endfor

    output_parameters.parameter(parameter_loop).particle.pitch_angle_range.low=''

    output_parameters.parameter(parameter_loop).particle.pitch_angle_range.high=''

    output_parameters.parameter(parameter_loop).particle.pitch_angle_range.units=''

    for bin_loop=0,31 do begin

        output_parameters.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

        output_parameters.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).low=''

        output_parameters.parameter(parameter_loop).particle.pitch_angle_range.bin(bin_loop).high=''

    endfor

    output_parameters.parameter(parameter_loop).particle.chemical_formula=''

    output_parameters.parameter(parameter_loop).particle.population=''

    output_parameters.parameter(parameter_loop).particle.population_mass_number=''

    output_parameters.parameter(parameter_loop).particle.population_charge_state=''

    output_parameters.parameter(parameter_loop).wave.wave_type=''

    for qualifier_loop=0,4 do output_parameters.parameter(parameter_loop).wave.qualifier(qualifier_loop)=''

    output_parameters.parameter(parameter_loop).wave.wave_quantity=''

    output_parameters.parameter(parameter_loop).wave.energy_range.low=''

    output_parameters.parameter(parameter_loop).wave.energy_range.high=''

    output_parameters.parameter(parameter_loop).wave.energy_range.units=''

    for bin_loop=0,31 do begin

        output_parameters.parameter(parameter_loop).wave.energy_range.bin(bin_loop).band_name=''

        output_parameters.parameter(parameter_loop).wave.energy_range.bin(bin_loop).low=''

        output_parameters.parameter(parameter_loop).wave.energy_range.bin(bin_loop).high=''

    endfor

    output_parameters.parameter(parameter_loop).wave.frequency_range.spectral_range=''

    output_parameters.parameter(parameter_loop).wave.frequency_range.low=''

    output_parameters.parameter(parameter_loop).wave.frequency_range.high=''

    output_parameters.parameter(parameter_loop).wave.frequency_range.units=''

    for bin_loop=0,31 do begin

        output_parameters.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).band_name=''

        output_parameters.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).low=''

        output_parameters.parameter(parameter_loop).wave.frequency_range.bin(bin_loop).high=''

    endfor

    output_parameters.parameter(parameter_loop).wave.wavelength_range.spectral_range=''

    output_parameters.parameter(parameter_loop).wave.wavelength_range.low=''

    output_parameters.parameter(parameter_loop).wave.wavelength_range.high=''

    output_parameters.parameter(parameter_loop).wave.wavelength_range.units=''

    for bin_loop=0,31 do begin

        output_parameters.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).band_name=''

        output_parameters.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).low=''

        output_parameters.parameter(parameter_loop).wave.wavelength_range.bin(bin_loop).high=''

    endfor

    output_parameters.parameter(parameter_loop).mixed.mixed_quantity=''

    for particle_type_loop=0,4 do output_parameters.parameter(parameter_loop).mixed.particle_type(particle_type_loop)=''

    for qualifier_loop=0,4 do output_parameters.parameter(parameter_loop).mixed.qualifier(qualifier_loop)=''

    for qualifier_loop=0,4 do output_parameters.parameter(parameter_loop).support.qualifier(qualifier_loop)=''

    output_parameters.parameter(parameter_loop).support.support_quantity=''

endfor

return,output_parameters

end

