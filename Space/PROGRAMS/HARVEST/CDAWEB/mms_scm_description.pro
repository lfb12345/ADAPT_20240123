
function mms_scm_description,data_product_name

data_product_name_split=strsplit(data_product_name,'_',/extract)

mms_spacecraft=data_product_name_split(0)

mms_spacecraft_num=strmid(data_product_name_split(0),3,1)

data_type=data_product_name_split(4)

if (data_type eq 'scb') then $
   description='Search Coil Magnetometer (SCM) AC Magnetic Field (8192 '+ $
               'samples/s), Level 2, Burst Survey Data. '

if (data_type eq 'schb') then $
   description='Search Coil Magnetometer (SCM) AC Magnetic Field (16384 '+ $
               'samples/s), Level 2, High Burst Survey Data. '

if (data_type eq 'scf') then $
   description='Search Coil Magnetometer (SCM) AC Magnetic Field (32 '+ $
               'samples/s), Level 2, Fast Survey Data. '

if (data_type eq 'scs') then $
   description='Search Coil Magnetometer (SCM) AC Magnetic Field (32 '+ $
               'samples/s), Level 2, Slow Survey Data. '

if (data_type eq 'scsrvy') then $
   description='Search Coil Magnetometer (SCM) AC Magnetic Field (32 '+ $
               'samples/s), Level 2, Quick-Look Survey Data. '

common_text= $
   'The tri-axial Search-Coil Magnetometer with its associated '+ $
   'preamplifier measures three-dimensional magnetic field fluctuations. '+ $
   'The analog magnetic waveforms measured by the SCM are digitized and '+ $
   'processed inside the Digital Signal Processor (DSP), collected and '+ $
   'stored by the Central Instrument Data Processor (CIDP) via the Fields '+ $
   'Central Electronics Box (CEB). Prior to launch, all SCM Flight models '+ $
   'were calibrated by LPP team members at the National Magnetic '+ $
   'Observatory, Chambon-la-Foret (Orleans). Once per orbit, each SCM '+ $
   'transfer function is checked thanks to the onboard calibration signal '+ $
   'provided by the DSP. The SCM is operated for the entire MMS orbit in '+ $
   'survey mode. Within scientific Regions Of Interest (ROI), burst mode '+ $
   'data are also acquired as well as high burst mode data. This SCM data '+ $
   'set corresponds to the AC magnetic field waveforms in nanoTesla and in '+ $
   'the GSE frame. The instrument paper for SCM can be found at '+ $
   'http://link.springer.com/article/10.1007/s11214-014-0096-9.'

description=description+common_text

return,description

end

