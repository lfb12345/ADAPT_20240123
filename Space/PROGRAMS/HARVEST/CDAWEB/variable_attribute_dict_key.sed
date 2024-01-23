
s/^\ *//

s/\ *$//

s/\ \ /\ /g

s/__/_/g

s/>>/>/g

s/>$//

s/>\ */>/g

s/^\.$//

#

s/bulkflow_ion/ion_bulk_flow/

s/ion_bulkflow/ion_bulk_flow/

#

s/^q$/particle_flux>electron_heat_flux/

#

s/c_ionization_temp/carbon_ionization_temp/

s/o_ionization_temp/oxygen_ionization_temp/

s/average_c\/o_abundance_ratio/average_carbon_oxygen_abundance_ratio/

#

s/helium_++/helium_plus_plus/

s/helium_+/helium_plus/

s/helium_ion_plus/helium_plus/

s/helium_plus_2_total/helium_plus_plus_total/

s/helium_2plus_mean_vector_gse/helium_plus_plus_mean_vector_gse/

s/helium_doubly_charged_partial_number/helium_plus_plus_partial_number/

s/helium_singly_charged/helium_plus/

s/he3_to_he4/helium_3_to_helium_4/

#

s/flag, label/flag>label/

s/flag>status number/flag>status_number/

s/flag_quality/flag>quality/

#

s/_mf$//

s/^b_/magnetic_field>/

s/_b_/_magnetic_field_/

s/magnetic_l$/magnetic_l_value/

s/lvalue/l_value/

#

s/particles>/particle>/

s/particle_flux>uncertainty.fractional/particle_flux>uncertainty>fractional/

#

s/position>local time/position>local_time/

s/position>spacecraft gse/position>spacecraft_gse/

#

s/s\/c/spacecraft/

s/_sc$/_spacecraft/

s/_sc_/_spacecraft_/

s/^sc_/spacecraft_/

#

s/vector_gse/gse_vector/

s/vector_gsm/gsm_vector/

#

s/velocity>velocity>solar wind/velocity>solar_wind/

s/velocity>spacecraft gse/velocity>spacecraft_gse/

#

s/pb5 start/pb5_start/

s/time>pb5 start/time>pb5_start/

s/timw/time/

#########################################################################################################################################################################################################

s/^angle\ drift/angle>drift/

s/center pitch angles note in the sothern hemisphere 0 dgreess is upward/angle>pitch_center/

s/pitch angle quality/angle>pitch_quality/

s/anisotropy>anisotropy>/anisotropy>/

s/coord$/coordinates/

s/log density/density/

s/energy_id/energy>id/

s/gamma\ ray/gamma_ray/

s/inv_latitude/invariant_latitude/

s/instr_status/instrument_status/

s/istp>//

s/magnitide/magnitude/

s/mass step/species>mass_step/

s/mlt_/magnetic_local_time_/

s/number>alpha particles/particle_flux>alpha/

s/orbit data quality/orbit_data_quality/

s/postgap/post_gap/

s/quality_particl_flux/quality_particle_flux/

s/sw_/software_/

#########################################################################################################################################################################################################

#
#  What to do with these?
#

s/q/q/

#
#  Repair First Field of Dictionary Keys
#

s/energy\ description/energy>description/

s/electric_field\ sigma/electric_field>sigma/

s/magnetic_field\ sigma/magnetic_field>sigma/

#
#  Repair Second Field of Dictionary Keys
#

s/solar_wind_//

s/label>format_time/label>time_format/

s/label>time_units/label>unit_time/

s/position>magnetic>local_time/position>magnetic_local_time/

s/time>epoch_accumulation_cneter/time>epoch_accumulation_center/

s/particle_counts>species/particle_flux>species>number/

s/magnetic_field>magnetic/magnetic_field>/

s/magnetic_field>tsy_/magnetic_field>tsyganenko_/

s/particle_flux>flux>/particle_flux>/

s/uncertainty>particle_flux/particle_flux>uncertainty/

s/position>spacecraft>cartesian/position>spacecraft_cartesian/

s/spacecraft_geocentric_celestial_inertial_x_y_z/spacecraft_gci_cartesian/

s/velocity>oxygen_field_aligned_coordinates/velocity>oxygen_field_aligned/

s/velocity>proton_field_aligned_coordinates/velocity>proton_field_aligned/

s/^flag>quality_helium_doubly_charged/flag>quality_helium_plus_plus/

s/^density>number_ion/density>ion_number/

s/^uncertainty>accum_time/uncertainty>accumulation_time/

s/^position>geomagnetic_coordinates/position>geomagnetic/

s/^velocity>velocity>thermal/velocity>thermal/

s/^label>label/label>/

s/^gap$/flag>gap/

s/^counts/particle_flux>count/

s/^flux/particle_flux/

s/^particle>flux$/particle_flux/

s/^particle>rate$/particle_flux>rate/

s/^configuration>/position>configuration_/

s/^charge_state>average/species>charge_state_average/

s/^charge_state>ratio/species>charge_state_ratio/

s/^elemental_abundance>ratio/species>elemental_abundance_ratio/

s/^gyrotropy>electron/species>gyrotropy_electron/

s/^name>position/position>name/

s/^height/position>height/

#
#   The change "range>absolute" to "energy>range>absolute" BAD for sn_k1_gisr_00000000_v01 that contains radar-related range of sight data
#

s/^range>absolute/energy>range_absolute/

#

s/^event>energy_incident/energy>incident/

s/^event>code/time>energy>code/

s/^field>standard_deviation/magnetic_field>standard_deviation/

s/^fit_parameter>reduced_chi_sq/uncertainty>fit_parameter_reduced_chi_sq/

s/^format>analog_telemetry/label>format_analog_telemetry/

s/^image>counts/photon_flux>integral/

#
#   The change "index" to "absolute" BAD for cn_k0_mari_00000000_v01.metadata that contains AE Indices
#
#   The change "index" to "absolute" BAD for cn_k0_mari_00000000_v01.metadata that contains AE Indices
#

s/^index/number>array_index/

#

s/^information>number/number>column/

s/^instrument>health_status/number>instrument_health_status/

s/^instrument>health_status_digital/number>instrument_health_status_digital/

s/^instrument>time_live/time>elapsed_exposure/

s/^mode/number>mode_antenna/

s/^null/energy>bandwidth/

s/^speed/velocity/

s/^string/time>processing_date/

s/^telemetry>invalid_slots/number>event_telemetry_invalid_slots/

s/^telemetry>nonzero_slots/number>event_telemetry_nonzero_slots/

s/^telemetry>valid_slots/number>event_telemetry_valid_slots/

s/^valid/flag>quality/

s/^vc/number>compression_diagnostic/

s/^vector>angle/label>vector_angle/

s/^vector>cartesian/label>vector_cartesian/

s/^vector>polar/label>vector_polar/

s/^number>number/number/

s/^energy>energy_channels/energy>channel/

s/^ratio>alpha_proton_ratio/ratio>alpha_proton/

s/^temperature>electron_temperature_tensor_gse/temperature>electron_tensor_gse/

s/^temperature>ion_temperature_tensor_gse/temperature>ion_tensor_gse/

s/^temperature>oxygen_plus_temperature_tensor_gse/temperature>oxygen_plus_tensor_gse/

s/^temperature>proton_temperature_tensor_gse/temperature>proton_tensor_gse/

s/pos_sm/position_sm/

s/spacrcraft/spacecraft/

#
#  Finishing Edits
#

s/>>/>/

s/>*$//

s/cartesian>/cartesian_/

s/latitude>/latitude_/

s/longitude>/longitude_/

s/vector>/vector_/

s/footprint/footpoint/

