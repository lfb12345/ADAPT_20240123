
function cdaweb_spase_map_cadence,logical_source,data_product_cdf_info,project_program_dir

alt_logical_source= $
   global_attribute_grep(data_product_cdf_info.global_attribute_info, $
                         'alt_logical_source','ALL','','','')

cadence_alt_logical_source='PT99999.999S'

if (alt_logical_source.text ne '') then $
   cadence_alt_logical_source=cadence_iso8601(alt_logical_source.text)

time_resolution= $
   global_attribute_grep(data_product_cdf_info.global_attribute_info, $
                         'time_resolution','ALL','','','')

cadence_time_resolution='PT99999.999S'

if (time_resolution.text ne '') then begin

   command="echo '"+time_resolution.text+"' | sed -f "+project_program_dir+"variable_attribute_time_resolution_to_cadence.sed"

   spawn,command,cadence_time_resolution,error

   cadence_time_resolution_num=n_elements(cadence_time_resolution)

   cadence_time_resolution_mask= $
      make_array(cadence_time_resolution_num,/integer,/index)

   cadence_time_resolution=cadence_iso8601(cadence_time_resolution)

endif

timeres=global_attribute_grep(data_product_cdf_info.global_attribute_info, $
                              'timeres','ALL','','','')

cadence_timeres='PT99999.999S'

if (timeres.text ne '') then begin

   command="echo '"+timeres.text+"' | sed -f "+project_program_dir+"variable_attribute_timeres_to_cadence.sed"

   spawn,command,cadence_timeres,error

   cadence_timeres_num=n_elements(cadence_timeres)

   cadence_timeres_mask=make_array(cadence_timeres_num,/integer,/index)

   cadence_timeres=cadence_iso8601(cadence_timeres)

endif

if (logical_source eq 'a1_k0_mpa') then cadence_alt_logical_source='PT87S'

cadence=cadence_alt_logical_source(0)

if (cadence eq 'PT99999.999S') then cadence=cadence_time_resolution(0)

if (cadence eq 'PT99999.999S') then cadence=cadence_timeres(0)

if (cadence eq 'PT60S') then cadence='PT1M'

if (cadence eq 'PT2.5M') then cadence='PT150S'

if (cadence eq 'PT6.4M') then cadence='PT384S'

if (cadence eq 'PT3.5H') then cadence='PT3H30M'

if (cadence eq 'PTmH') then cadence='PT1H'

return,cadence

end

;   TIMERES:   sed 's/(.*$//' | sed 's/\ avg.*$//' | sed 's/,//' | sed 's/min\./min/' | sed 's/1min/1 min/' | sed 's/4s/4 sec/' | sed 's/sec/s/' | sed 's/min/m/' | sed 's/m\ *$/m/' | sed 's/s\ *$/s/' | sed 's/ms/msec/' | sed 's/\ s$/\ sec/' | sed 's/\ m$/\ min/'

