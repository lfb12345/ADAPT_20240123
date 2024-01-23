
function mms_epd_eis_description,data_product_name

data_product_name_split=strsplit(data_product_name,'_',/extract)

mms_spacecraft=data_product_name_split(0)

mms_spacecraft_num=strmid(data_product_name_split(0),3,1)

survey_type=data_product_name_split(2)

data_type=data_product_name_split(4)

if (strmatch(data_product_name,'mms?_epd-eis_brst_l2_electronenergy') eq 1) then $
   description='Energetic Particle Detector (EPD), Energetic Ion '+ $
               'Spectrometer (EIS) Electron Energy Spectra, Level 2, Burst '+ $
               'Survey, '

if (strmatch(data_product_name,'mms?_epd-eis_brst_l2_extof') eq 1) then $
   description='Energetic Particle Detector (EPD), Energetic Ion '+ $
               'Spectrometer (EIS) Energy by Time of Flight, Level 2, Burst '+ $
               'Survey, '

if (strmatch(data_product_name,'mms?_epd-eis_brst_l2_phxtof') eq 1) then $
   description='Energetic Particle Detector (EPD), Energetic Ion '+ $
               'Spectrometer (EIS) Pulse Height by Time of Flight, Level 2, '+ $
               'Burst Survey, '

if (strmatch(data_product_name,'mms?_epd-eis_srvy_l2_electronenergy') eq 1) then $
   description='Energetic Particle Detector (EPD), Energetic Ion '+ $
               'Spectrometer (EIS) Electron Energy Spectra, Level 2, '+ $
               'Quick-Look Survey, '

if (strmatch(data_product_name,'mms?_epd-eis_srvy_l2_extof') eq 1) then $
   description='Energetic Particle Detector (EPD), Energetic Ion '+ $
               'Spectrometer (EIS) Energy by Time of Flight, Level 2, '+ $
               'Quick-Look Survey, '

if (strmatch(data_product_name,'mms?_epd-eis_srvy_l2_partenergy') eq 1) then $
   description='Energetic Particle Detector (EPD), Energetic Ion '+ $
               'Spectrometer (EIS) Particle Energy Spectra, Level 2, '+ $
               'Quick-Look Survey, '

if (strmatch(data_product_name,'mms?_epd-eis_srvy_l2_phxtof') eq 1) then $
   description='Energetic Particle Detector (EPD), Energetic Ion '+ $
               'Spectrometer (EPD EIS) Pulse Height by Time of Flight, '+ $
               'Level 2, Quick-Look Survey, '

if (strmatch(strmid(data_product_name,0,21),'mms?_epd-eis_brst_l2_',/fold_case) eq 1) then $
   cadence='0.605 s Data. '

if (strmatch(strmid(data_product_name,0,21),'mms?_epd-eis_srvy_l2_',/fold_case) eq 1) then $
   cadence='2.42 s Data. '

common_text='The EIS provides ion composition measurements (protons versus '+ $
            'oxygen ions) and angular distributions over the energy range '+ $
            'from approximately 45 to 500 keV.'

description=description+cadence+common_text

return,description

end

;
;  mms1_epd-eis_brst_l2_electronenergy   Epoch   1.653748206   0.604691757   0.605
;  mms1_epd-eis_brst_l2_extof            Epoch   1.653319269   0.604878737   0.605
;  mms1_epd-eis_brst_l2_phxtof           Epoch   1.653319269   0.604878823   0.605
;  mms1_epd-eis_srvy_l2_electronenergy   Epoch   0.413186619   2.420213901   2.42
;  mms1_epd-eis_srvy_l2_extof            Epoch   0.413128654   2.420553475   2.42
;  mms1_epd-eis_srvy_l2_partenergy       Epoch   0.413344693   2.419288350   2.42
;  mms1_epd-eis_srvy_l2_phxtof           Epoch   0.413128654   2.420553475   2.42
;

