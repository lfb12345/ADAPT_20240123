
function read_ack,station_info,project_dir,exist_flag

!EXCEPT=2

exist_flag=0

stars=strjoin(replicate('*',275))

;
;    Create the WDC Acknowledgement Input Data Storage Structure
;

ack_filename=project_dir+'ACKNOWLEDGE/'+strlowcase(station_info.code)+'.ack'

printf,80,'Station Acknowledgement Input File Name:',ack_filename, $
          format='(a,2x,a/)'

printf,80,stars,format='(a/)'

record_count=0L

total_record_count=0L

record=''

ack_text=make_array(100,/string,value='')

openr,30,ack_filename,error=error

if (error eq 0) then begin

   while not eof(30) do begin

         readf,30,record

         if (record ne '') then begin

            printf,80,total_record_count,record_count,strlen(record), $
                      record,format='(3i5,x,a)'

            ack_text(record_count)=record

            record_count=record_count+1L

         endif

         total_record_count=total_record_count+1L

   endwhile

   close,30

   ack_text=ack_text(indgen(record_count))

   printf,80,''

   colon_index=string_position(ack_text(0),':')

   open_paren_index=string_position(ack_text(0),'(')

   close_paren_index=string_position(ack_text(0),')')

   line_length=strlen(ack_text(0))

   if (open_paren_index(0) eq -1) then begin

      station_name=strjoin(strsplit(strmid(ack_text(0),0,colon_index(0)), $
                                    /extract),' ')

      station_alternate_name=''

   endif else begin

      station_name=strjoin(strsplit(strmid(ack_text(0),0, $
                                           open_paren_index(0)-1),/extract),' ')

      station_alternate_name= $
         strjoin(strsplit(strmid(ack_text(0),open_paren_index(0)+1, $
                                 close_paren_index(0)-open_paren_index(0)-1), $
                          /extract),' ')

   endelse

   station_info.name=station_name

   station_info.alternate_name=station_alternate_name

   station_info.name_conditioned=string_condition(station_info.name,' ','.')

   station_info.alternate_name_conditioned= $
      string_condition(station_info.alternate_name,' ','.')

   station_info.observatory_name=station_info.name

   station_info.observatory_name_conditioned=station_info.name_conditioned

   station_info.alternate_observatory_name=station_info.alternate_name

   station_info.alternate_observatory_name_conditioned= $
      station_info.alternate_name_conditioned

   station_info.observatory_resource_id= $
      'spase://SMWG/Observatory/'+station_info.observatory_name_conditioned

;     station_info.repository_acronym+'/'+station_info.observatory_name_conditioned

   printf,80,'Station Name:              ',station_name,format='(2a/)'

   printf,80,'Station Alternate Name:    ',station_alternate_name,format='(2a/)'

   iaga_code_line=where('IAGA code:' eq strmid(ack_text,0,10), $
                        iaga_code_line_count)

   if (iaga_code_line_count eq 1) then begin

      temp=strsplit(ack_text(iaga_code_line),/extract)

      station_code=temp(2)

      station_info.latitude=string(temp(4),format=format_float(temp(4),3))

      station_info.longitude=string(temp(6),format=format_float(temp(6),3))

      if (n_elements(temp) ge 9) then $
         if (strmatch(ack_text(iaga_code_line),'*elev:*',/fold_case) eq 1) $
            then $
            station_info.elevation= $
               string(temp(8),format=format_float(temp(8),1))

      printf,80,'Station Code:              ',station_code,format='(2a/)'

      printf,80,'Station Latitude:          ',station_info.latitude, $
                format='(a,f7.3/)'

      printf,80,'Station Longitude:         ',station_info.longitude, $
                format='(a,f7.3/)'

      printf,80,'Station Elevation:      ',station_info.elevation, $
                format='(a,f10.3/)'

   endif else begin

      printf,80,'WARNING:  WDC Ack File Format is Not Standard',format='(a/)'

   endelse

   ack_line=where('If the data are used in a publication kindly acknowledge:' $
                  eq strmid(ack_text,0,57),ack_line_count)

   match_text='If you have any questions regarding the data please contact:'

   contact_line=where(match_text eq strmid(ack_text,0,60),contact_line_count)

   e_mail_line=where('E-mail:' eq strmid(ack_text,0,7),e_mail_line_count)

   if (ack_line_count eq 1 and contact_line_count eq 1 and $
       e_mail_line_count eq 2) then begin

      printf,80,'Acknowledgement:',format='(a/)'

      for loop=contact_line(0)+1,e_mail_line(0)-1 do printf,80,ack_text(loop)

      ack_temp_num=e_mail_line(0)-contact_line(0)-1

      ack_temp=make_array(ack_temp_num,/string,value='')

;
;     String Conditioning
;

      for loop=0,ack_temp_num-1 do begin

          ack_temp(loop)= $
             string_condition(ack_text(contact_line(0)+loop+1),',',', ')

          ack_temp(loop)= $
             string_condition(ack_text(contact_line(0)+loop+1),'  ',' ')

      endfor

      station_info.acknowledgement= $
         'Please acknowledge '+strjoin(strtrim(ack_temp,2),', ')+' for '+ $
         'providing access to '+station_info.name+' data resources.'

;        'providing access to '+station_info.name+' data resources via the '+ $
;        'data repository hosted by the WDC for Geomagnetism, Edinburgh '+ $
;        'whenever data are used in publication.'

      printf,80,'Acknowledgement Concatenated:',format='(/a/)'

      printf,80,station_info.acknowledgement

      printf,80,'Contact Name:',format='(/a/)'

      contact_name=strtrim(strsplit(ack_text(contact_line(0)+1),',',/extract),2)

      contact_num=n_elements(contact_name)

      for loop=0,contact_num-1 do begin

          station_info.contact(loop).name=contact_name(loop)

          contact_name_temp=string_condition(contact_name(loop),'.','')

          station_info.contact(loop).resource_id= $
             'spase://SMWG/Person/'+string_condition(contact_name_temp,' ','.')

          printf,80,loop,contact_name(loop),format='(i3,2x,a)'

          station_info.contact(loop).organization_name= $
             ack_text(contact_line(0)+2)

      endfor

      printf,80,'E-mail:',format='(/a/)'

      e_mail_string_length=strlen(ack_text(e_mail_line(0)))

      e_mail=strtrim(strsplit(strmid(ack_text(e_mail_line(0)),7, $
                                     e_mail_string_length-7),',',/extract),2)

      e_mail_num=n_elements(e_mail)

      for loop=0,e_mail_num-1 do begin

          if (e_mail(loop) eq '') then e_mail(loop)='Unknown'

          station_info.contact(loop).email=e_mail(loop)

          printf,80,loop,station_info.contact(loop).email,format='(i3,2x,a)'

      endfor

      printf,80,'Contact Address:',format='(/a/)'

      for loop=contact_line(0)+2,e_mail_line(0)-1 do printf,80,ack_text(loop)

      printf,80,'Contact Address Concatenated:',format='(/a/)'

      contact_mask=indgen(contact_num)

      mask=indgen(e_mail_line(0)-contact_line(0)-2)+contact_line(0)+2

      station_info.contact(contact_mask).address= $
         strjoin(strtrim(ack_text(mask)),', ')

      printf,80,station_info.contact(0).address,format='(a/)'

   endif else begin

      printf,80,'WARNING:  WDC Ack File Format is Not Standard',format='(a/)'

   endelse

   phone_line=where('Phone:' eq strmid(ack_text,0,6),phone_line_count)

   if (phone_line_count gt 0) then begin

      phone_string_length=strlen(ack_text(phone_line(0)))

      phone=strtrim(strsplit(strmid(ack_text(phone_line(0)),6, $
                                    phone_string_length-6),',',/extract),2)

      phone_num=n_elements(phone)

      printf,80,'Phone:',format='(a/)'

      contact_num=n_elements(contact_name)

      contact_mask=indgen(contact_num)

      for loop=0,phone_num-1 do begin

          if (phone(loop) eq '-') then phone(loop)='Unknown'

          station_info.contact(contact_mask).phone_number=phone(loop)

          printf,80,loop,station_info.contact(loop).phone_number, $
                    format='(i3,2x,a)'

      endfor

   endif else begin

      printf,80,'WARNING:  WDC Ack File Format is Not Standard',format='(a/)'

   endelse

   fax_line=where('Fax:' eq strmid(ack_text,0,4),fax_line_count)

   if (fax_line_count gt 0) then begin

      fax_string_length=strlen(ack_text(fax_line(0)))

      fax=strtrim(strsplit(strmid(ack_text(fax_line(0)),4, $
                                  fax_string_length-4),',',/extract),2)

      fax_num=n_elements(fax)

      printf,80,'Fax:',format='(/a/)'

      for loop=0,fax_num-1 do begin

          if (fax(loop) eq '') then fax(loop)='Unknown'

          station_info.contact(loop).fax=fax(loop)

          printf,80,loop,fax(loop),format='(i3,2x,a)'

      endfor

      printf,80,''

   endif else begin

      printf,80,'WARNING:  WDC Ack File Format is Not Standard',format='(a/)'

   endelse

   instrument_type_list=['','Antenna','Channeltron','Coronograph', $
                         'DoubleSphere','ElectronDriftInstrument', $
                         'ElectrostaticAnalyser', $
                         'EnergeticParticleInstrument','Ephemeris', $
                         'FaradayCup','FluxFeedback','FourierTransform', $
                         'Spectrograph','Geiger-MuellerTube','Imager', $
                         'ImagingSpectrometer','Interferometer', $
                         'LangmuirProbe','LongWire','Magnetometer', $
                         'MassSpectrometer','MicrochannelPlate', $
                         'MultispectralImager','NeutralAtomImager', $
                         'ParticleCorrelator','ParticleDetector','Photometer', $
                         'Photopolarimeter','ProportionalCounter', $
                         'QuadrisphericalAnalyser','Radar','Radiometer', $
                         'ResonanceSounder','RetardingPotentialAnalyser', $
                         'Riometer','Scintillation','Detector','SearchCoil', $
                         'Sounder','SpacecraftPotentialControl', $
                         'SpectralPowerReceiver','Spectrometer', $
                         'Time-of-flight','Unspecified','WaveformReceiver']

   measurement_type_list= $
      ['','Activity_Index','Charged_Particle_Flux','Dopplergram', $
       'Electric_Field','Energetic_Particles','Ephemeris','Image_Intensity', $
       'Instrument_Status','Ion_Composition','Irradiance','Magnetic_Field', $
       'Magnetogram','Neutral_Atom_Images','Neutral_Gas','Profile','Radiance', $
       'Radio_and_PlasmaWaves','Radio_Soundings','Spectrum','Thermal_Plasma']

   instrument_type_index=[where(instrument_type_list eq 'Magnetometer'), $
                          where(instrument_type_list eq 'SearchCoil'), $
                          where(instrument_type_list eq 'Riometer'), $
                          where(instrument_type_list eq 'Photometer'), $
                          where(instrument_type_list eq 'Antenna')]

   measurement_type_index=[where(measurement_type_list eq 'Magnetic_Field'), $
                           where(measurement_type_list eq 'Magnetic_Field'), $
                           where(measurement_type_list eq 'Radio_Soundings'), $
                           where(measurement_type_list eq 'Irradiance'), $
                           where(measurement_type_list eq 'Radio_Soundings')]

   instrument_list= $
      string_condition(instrument_type_list(instrument_type_index),'_','')

   measurement_type_list= $
      string_condition(measurement_type_list(measurement_type_index),'_','')

   instrument_num=n_elements(instrument_list)

   instrument_count=0

   for instrument_loop=0,instrument_num-1 do begin

       instrument_line= $
          where(instrument_list(instrument_loop)+':  ' eq $
                strmid(ack_text,0,strlen(instrument_list(instrument_loop))+3), $
                instrument_line_count)

       if (instrument_line_count gt 0) then begin

          instrument_info=make_array(instrument_line_count,/string,value='')

          for line_loop=0L,instrument_line_count-1L do $
              instrument_info(line_loop)= $
                 strmid(ack_text(instrument_line(line_loop)), $
                        strlen(instrument_list(instrument_loop))+3, $
                        strlen(ack_text(instrument_line(line_loop)))- $
                        strlen(instrument_list(instrument_loop))-3)

          station_info.instrument(instrument_loop).name= $
             instrument_list(instrument_loop)

          station_info.instrument(instrument_loop).type= $
             instrument_list(instrument_loop)

          station_info.instrument(instrument_loop).measurement_type_num= $
             measurement_type_index(instrument_loop)

          station_info.instrument(instrument_loop).resource_id= $
             'spase://SMWG/Instrument/'+station_info.name_conditioned+'/'+ $
             instrument_list(instrument_loop)

;            station_info.repository_acronym+'/'+station_info.name_conditioned+'/'+ $
;            instrument_list(instrument_loop)

          station_info.instrument(instrument_loop).acknowledgement= $
             'Please acknowledge '+instrument_info(0)+', '+ $
             instrument_info(1)+' ('+instrument_info(2)+') for use of data '+ $
             'from the '+station_info.name+' '+ $
             station_info.instrument(instrument_loop).name+' instrument.'

          station_info.instrument(instrument_loop).url= $
             strtrim(strmid(instrument_info(6),strlen('URL:'), $
                     strlen(instrument_info(6))-strlen('URL:')),2)

          contact_name=strtrim(strsplit(instrument_info(0),',',/extract),2)

          email_line=where(strmid(instrument_info,0,7) eq 'E-mail:')

          email=strtrim(strsplit(strmid(instrument_info(email_line),9, $
                                 strlen(instrument_info(email_line))-9), $
                        ',',/extract),2)

          contact_num=n_elements(contact_name)

          for contact_loop=0,contact_num-1 do begin

              contact_name_temp=string_condition(contact_name(contact_loop),'.','')

              station_info.instrument(instrument_loop).contact(contact_loop).resource_id= $
                  'spase://SMWG/Person/'+string_condition(contact_name_temp,' ','.')

              station_info.instrument(instrument_loop).contact(contact_loop).name= $
                  contact_name(contact_loop)
;                 string_condition(contact_name_temp,' ','.')

              station_info.instrument(instrument_loop).contact(contact_loop).organization_name= $
                  instrument_info(1)

              phone_line=where(strmid(instrument_info,0,6) eq 'Phone:')

              fax_line=where(strmid(instrument_info,0,4) eq 'Fax:')

              e_mail_line=where(strmid(instrument_info,0,7) eq 'E-mail:')

              url_line=where(strmid(instrument_info,0,4) eq 'URL:')

              station_info.instrument(instrument_loop).contact(contact_loop).address= $
                 strjoin(instrument_info(1:phone_line-1),', ')

              station_info.instrument(instrument_loop).contact(contact_loop).phone_number= $
                 strtrim(strmid(instrument_info(phone_line),8, $
                                strlen(instrument_info(phone_line))-8),2)

              station_info.instrument(instrument_loop).contact(contact_loop).fax= $
                 strtrim(strmid(instrument_info(fax_line),6, $
                                strlen(instrument_info(fax_line))-6),2)

              station_info.instrument(instrument_loop).contact(contact_loop).email= $
                 email(contact_loop)

              station_info.instrument(instrument_loop).contact(contact_loop).role_num=7

          endfor

          instrument_count=instrument_count+1

       endif

   endfor

   printf,80,stars,format='(a/)'

endif else begin

   printf,80,'File does not open properly'
   printf,80,'Error #:',error
   printf,80,!ERR_STRING
   printf,80,''

   exist_flag=error

   printf,80,stars,format='(a/)'

endelse

return,station_info

end

