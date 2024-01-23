
function mms_feeps_description,data_product_name

data_product_name_split=strsplit(data_product_name,'_',/extract)

mms_spacecraft=data_product_name_split(0)

mms_spacecraft_num=strmid(data_product_name_split(0),3,1)

survey_type=data_product_name_split(2)

data_type=data_product_name_split(4)

if (survey_type eq 'brst') then $
   description= $
      'Fly&apos;s Eye Electron Proton Spectrometer (FEEPS) Burst Data. '

if (survey_type eq 'raw') then $
   description= $
      'Fly&apos;s Eye Electron Proton Spectrometer (FEEPS) Raw Data. '

if (survey_type eq 'srvy') then $
   description= $
      'Fly&apos;s Eye Electron Proton Spectrometer (FEEPS) Survey Data. '

common_text='The Energetic Particle Detector (EPD) investigation aboard the '+ $
            'four MMS spacecraft consists of two instrument designs, the '+ $
            'FEEPS and the EIS (Energetic Ion Spectrometer). A FEEPS '+ $
            'consists of six Heads, each composed of two Eyes. Each eye is '+ $
            'a particle telescope with a single silicon detector. There are '+ $
            'nine electron eyes and three ion eyes per FEEPS. The energy '+ $
            'coverage is from 25 keV to 650 keV for electrons and 45 keV to '+ $
            '650 keV for ions. Each eye has sixteen energy channels, the '+ $
            'spacing of which can be modified by command. The fields of '+ $
            'view and pointing of each eye are designed to provide a broad, '+ $
            'instantaneous field of view for the twelve eyes per FEEPS.'

description=description+common_text

return,description

end

