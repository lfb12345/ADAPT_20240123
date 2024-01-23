
function voyager_pls_energy_channel,data_product_name

if (strmatch(data_product_name,'voyager[12]_pls_electrons_e1',/fold_case) eq 1) then begin

   scale_factor=1.07470114D0

   channel_num=16

endif

if (strmatch(data_product_name,'voyager[12]_pls_electrons_e2',/fold_case) eq 1) then begin

   scale_factor=1.33352143D0

   channel_num=16

endif

if (strmatch(data_product_name,'voyager[12]_pls_ions_l',/fold_case) eq 1) then begin

   scale_factor=1.33352143D0

   channel_num=16

endif

if (strmatch(data_product_name,'voyager[12]_pls_ions_m',/fold_case) eq 1) then begin

   scale_factor=1.03663293D0

   channel_num=128

endif

energy_channel_limits=strtrim(string((60*(scale_factor^indgen(channel_num+1))-50),format='(f7.2)'),2)

print,data_product_name,channel_num,scale_factor

return,energy_channel_limits

end

