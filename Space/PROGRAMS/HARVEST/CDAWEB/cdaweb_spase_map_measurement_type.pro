
function cdaweb_spase_map_measurement_type, $
   cdaweb_measurement_type,data_product_name,numerical_data_parameter_all

measurement_type_list= $
   ['','ActivityIndex','Dopplergram','Dust','ElectricField', $
    'EnergeticParticles','Ephemeris','ImageIntensity','InstrumentStatus', $
    'IonComposition','Irradiance','MagneticField','Magnetogram', $
    'NeutralAtomImages','NeutralGas','Profile','Radiance','Spectrum', $
    'ThermalPlasma','Waves','Waves.Active','Waves.Passive']

cdaweb_measurement_type_num=n_elements(cdaweb_measurement_type)

spase_measurement_type=make_array(99,/string,value='')

spase_measurement_tab=0

for loop=0,cdaweb_measurement_type_num-1 do begin

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Activity Indices") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(1)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Electric Fields (space)") $
       then spase_measurement_type(spase_measurement_tab)=measurement_type_list(4)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Engineering") then $
       spase_measurement_type=measurement_type_list(8)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Ephemeris") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(6)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Ephemeris/Attitude/Ancillary") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(6)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Gamma and X-Rays") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(10)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Ground-Based HF-Radars") $
       then spase_measurement_type(spase_measurement_tab)=measurement_type_list(10)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Ground-Based Imagers") $
       then spase_measurement_type(spase_measurement_tab)=measurement_type_list(7)

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Ground-Based Incoherent-Scatter Radar") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(10)

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Ground-Based VLF/ELF/ULF, Photometers") then $
           spase_measurement_type(spase_measurement_tab)=measurement_type_list(8)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Housekeeping") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(8)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Imager (space)") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(7)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Imager") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(7)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Imagers (space)") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(7)

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Imaging and Remote Sensing (ITM/Earth)") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(7)

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Imaging and Remote Sensing (Magnetosphere/Earth)") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(7)

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Imaging and Remote Sensing (Sun and Earth)") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(7)

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Imaging and Remote Sensing (Sun)") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(7)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Magnetic Fields (space)") $
       then spase_measurement_type(spase_measurement_tab)=measurement_type_list(11)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Neutral Imager") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(13)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Particle Spectrometer") $
       then spase_measurement_type(spase_measurement_tab)=measurement_type_list(9)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Particles (Space)") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(5)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Particles (space)") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(5)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Particles") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(5)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Particle flux (space)") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(5)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Plasma and Solar Wind") $
       then spase_measurement_type(spase_measurement_tab)=measurement_type_list(18)

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Electrostatic Analyzer Particle Detector") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(5)

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Radio and Plasma Waves (space)") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(19)

    if (strtrim(cdaweb_measurement_type(loop),2) eq "Test") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(8)

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Ground-Based Ionosondes") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(21)

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Ground-Based Magnetometers") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(11)

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Ground-Based Riometers") then $
       spase_measurement_type(spase_measurement_tab)=measurement_type_list(21)

    spase_measurement_tab=spase_measurement_tab+1

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Ground-Based Magnetometers, Riometers, Sounders") then begin

       spase_measurement_tab=spase_measurement_tab-1

       spase_measurement_type(spase_measurement_tab)=measurement_type_list(11)

       spase_measurement_type(spase_measurement_tab+1)=measurement_type_list(21)

       spase_measurement_type(spase_measurement_tab+2)=measurement_type_list(15)

       spase_measurement_tab=spase_measurement_tab+3

    endif

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Ground-Based Magnetometers, Photometers, Riometers, Sounders") then begin

       spase_measurement_tab=spase_measurement_tab-1

       spase_measurement_type(spase_measurement_tab)=measurement_type_list(11)

       spase_measurement_type(spase_measurement_tab+1)=measurement_type_list(10)

       spase_measurement_type(spase_measurement_tab+2)=measurement_type_list(21)

       spase_measurement_type(spase_measurement_tab+3)=measurement_type_list(15)

       spase_measurement_tab=spase_measurement_tab+4

    endif

    if (strtrim(cdaweb_measurement_type(loop),2) eq $
        "Ground-Based Magnetometers, Photometers, Riometers, VLF, Micropulsation") then begin

       spase_measurement_tab=spase_measurement_tab-1

       spase_measurement_type(spase_measurement_tab)=measurement_type_list(11)

       spase_measurement_type(spase_measurement_tab+1)=measurement_type_list(10)

       spase_measurement_type(spase_measurement_tab+2)=measurement_type_list(21)

       spase_measurement_type(spase_measurement_tab+3)=measurement_type_list(19)

       spase_measurement_tab=spase_measurement_tab+4

    endif

endfor

mask=where(numerical_data_parameter_all.table.data_product_name eq $
           data_product_name,mask_num)

if (mask_num ne 0) then begin

   measurement_type_list= $
      numerical_data_parameter_all.table(mask).measurement_type

   measurement_type_list_uniq= $
      measurement_type_list(uniq(measurement_type_list, $
                            sort(measurement_type_list)))

   measurement_type_list_uniq_mask=where(measurement_type_list_uniq ne '', $
                                         measurement_type_list_uniq_mask_num)

   help,measurement_type_list_uniq_mask

   print,''

   help,measurement_type_list_uniq_mask_num

   print,''

   if (measurement_type_list_uniq_mask_num ne 0) then begin

      measurement_type_list= $
         measurement_type_list_uniq(measurement_type_list_uniq_mask)

      measurement_type_list=strsplit(strjoin(measurement_type_list_uniq,' '),/extract)

      measurement_type_list_uniq= $
         measurement_type_list(uniq(measurement_type_list, $
                               sort(measurement_type_list)))

      measurement_type_list_uniq_mask=where(measurement_type_list_uniq ne '', $
                                            measurement_type_list_uniq_mask_num)

      measurement_type_list_uniq= $
         measurement_type_list_uniq(measurement_type_list_uniq_mask)

      spase_measurement_type=make_array(measurement_type_list_uniq_mask_num,/string,value='')

      spase_measurement_type_loop=0

      for loop=0L,measurement_type_list_uniq_mask_num-1L do begin

          measurement_type_list_uniq_split= $
             strsplit(measurement_type_list_uniq(loop),/extract)

          measurement_type_list_uniq_split_num= $
             n_elements(measurement_type_list_uniq_split)

          for split_loop=0L,measurement_type_list_uniq_split_num-1L do begin

              spase_measurement_type(spase_measurement_type_loop)= $
                 measurement_type_list_uniq_split(split_loop)

              spase_measurement_type_loop=spase_measurement_type_loop+1

          endfor

      endfor

   endif

endif

spase_measurement_type= $
   spase_measurement_type(uniq(spase_measurement_type,sort(spase_measurement_type)))

mask=where(spase_measurement_type ne '',mask_num)

if (mask_num gt 0) then begin

   spase_measurement_type=spase_measurement_type(mask)

   for loop=0,mask_num-1L do print,'Variable Metadata SPASE Measurement Type:                                '+spase_measurement_type(loop)

   print,''

endif else begin

   spase_measurement_type=''

endelse

return,spase_measurement_type

end

