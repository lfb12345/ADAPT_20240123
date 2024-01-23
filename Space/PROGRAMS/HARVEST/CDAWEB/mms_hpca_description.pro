
function mms_hpca_description,data_product_name

data_product_name_split=strsplit(data_product_name,'_',/extract)

mms_spacecraft=data_product_name_split(0)

mms_spacecraft_num=strmid(data_product_name_split(0),3,1)

survey_type=data_product_name_split(2)

data_type=data_product_name_split(4)

if (data_type eq 'ion') then $
   description='Hot Plasma Composition Analyzer (HPCA) Ions, Level 2, '

if (data_type eq 'moments') then $
   description='Hot Plasma Composition Analyzer (HPCA) Moments, Level 2, '

if (data_type eq 'tof-counts') then $
   description='Hot Plasma Composition Analyzer (HPCA) Time of Flight, TOF, Counts, Level 2, '

if (survey_type eq 'brst') then begin

   survey_text='Burst Survey 0.625 s '

   ending_text= $
      'Data. The MMS HPCA instruments measure the energy and composition '+ $
      'of magnetospheric plasmas in the energy range from 1 eV to 40 keV. '+ $
      'An electrostatic energy analyzer (ESA) that is optically coupled to '+ $
      'a carbon-foil based Time-of-Flight (TOF) section comprises each '+ $
      'HPCA. The basic HPCA data product is an array of counts for 5 ion '+ $
      'species, at 63 energies, for each of 16 elevation anodes. Sixteen '+ $
      'basic products, also called azimuths, are acquired every 0.625 s; '+ $
      'half a spacecraft spin period nominally has 16 azimuths. The five '+ $
      'ion species are protons (H+), alpha particles (He++), helium ions '+ $
      '(He+), singly charged Oxygen (O+), and background counts.'

endif

if (survey_type eq 'srvy') then begin

   survey_text='Survey 10 s '

   ending_text= $
      'Data. The MMS HPCA instruments measure the energy and composition '+ $
      'of magnetospheric plasmas in the energy range from 1 eV to 40 keV. '+ $
      'An electrostatic energy analyzer (ESA) that is optically coupled to '+ $
      'a carbon-foil based Time-of-Flight (TOF) section comprises each '+ $
      'HPCA. The basic HPCA data product is an array of counts for 5 ion '+ $
      'species, at 63 energies, for each of 16 elevation anodes. Sixteen '+ $
      'basic products, also called azimuths, are acquired every 10 s; half '+ $
      'a spacecraft spin period nominally has 16 azimuths. The five ion '+ $
      'species are protons (H+), alpha particles (He++), helium ions (He+), '+ $
      'singly charged Oxygen (O+), and background counts.'

endif

description=description+survey_text+ending_text

return,description

end

