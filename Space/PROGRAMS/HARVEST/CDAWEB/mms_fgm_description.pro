
function mms_fgm_description,data_product_name

data_product_name_split=strsplit(data_product_name,'_',/extract)

mms_spacecraft=data_product_name_split(0)

mms_spacecraft_num=strmid(data_product_name_split(0),3,1)

description= $
   'The Fluxgate Magnetometers (FGM) on Magnetospheric Multiscale consist '+ $
   'of a traditional Analog Fluxgate Magnetometer (AFG) and a Digital '+ $
   'Fluxgate magnetometer (DFG). The dual magnetometers are operated as a '+ $
   'single instrument providing a single intercalibrated data product. '+ $
   'Range changes occur at different times on the two instruments so the '+ $
   'gains checked each periapsis can be carried out unambiguously to '+ $
   'apoapsis. Cross correlation of calibration parameters can separate '+ $
   'causes of the any apparent calibration changes. Use of Electron Drift '+ $
   'Instrument (EDI) to determine the field along the rotation axis allows '+ $
   'accurate monitoring of the zero levels along the rotation axis. Prior '+ $
   'to launch the magnetometers were calibrated at the Technical '+ $
   'University, Braunschweig, except for the AFG magnetometers on MMS3 and '+ $
   'MMS4, which were calibrated at UCLA. Both sets of sensors are operated '+ $
   'for the entire MMS orbit, with slow survey (8 samples per second) '+ $
   'outside of the Region of Interest (ROI), and fast survey (16 samples '+ $
   'per second) inside the ROI. Within the ROI, burst mode data (128 '+ $
   'samples per second) are also acquired. A detailed description of the '+ $
   'MMS fluxgate magnetometers, including science objectives, instrument '+ $
   'description, calibration, magnetic cleanliness program, and data flow '+ $
   'can be found at '+ $
   'http://link.springer.com/article/10.1007%2Fs11214-014-0057-3 (DOI '+ $
   '10.1007/s11214-014-0057-3). Additional information can also be found at '+ $
   'http://www-spc.igpp.ucla.edu/ssc/mms (UCLA), and '+ $
   'http://www.iwf.oeaw.ac.at/de/forschung/erdnaher-weltraum/mms/dfg (IWF, '+ $
   'Graz). For the purpose of creating a unified FGM Level 2 data product, '+ $
   'burst mode data is taken from DFG and survey mode data is taken from '+ $
   'AFG. Because AFG and DFG are cross-calibrated on an orbit-averaged '+ $
   'basis, small differences in offset may be observed between Level 2 '+ $
   'burst and survey mode data. Consequently, any differences are within '+ $
   'the error of the measurement. Based on preliminary analysis of the '+ $
   'data, the absolute error within the Region of Interest (ROI) is '+ $
   'estimated to be no more than 0.1 nT in the spin-plane, 0.15 nT along '+ $
   'the spin-axis and 0.2 nT in total magnitude.'

return,description

end

