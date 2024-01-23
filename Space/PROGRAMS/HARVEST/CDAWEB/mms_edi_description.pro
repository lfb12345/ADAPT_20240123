
function mms_edi_description,data_product_name

data_product_name_split=strsplit(data_product_name,'_',/extract)

mms_spacecraft=data_product_name_split(0)

mms_spacecraft_num=strmid(data_product_name_split(0),3,1)

survey_type=data_product_name_split(2)

data_type=data_product_name_split(4)

common_text='The EDI instrument paper can be found at: '+ $
            'http://link.springer.com/article/10.1007%2Fs11214-015-0182-7. '+ $
            'The EDI instrument data products guide can be found at '+ $
            'https://lasp.colorado.edu/mms/sdc/public/datasets/fields/.'

;
;  mms1_edi_brst_l2_amb     0.0009765625
;  mms1_edi_brst_l2_amb-pm2 0.0009765625
;  mms1_edi_brst_l2_efield  0.0009765625
;  mms1_edi_brst_l2_q0      0.0078125
;  mms1_edi_srvy_l2_amb     0.03125
;  mms1_edi_srvy_l2_amb-pm2 0.03125
;  mms1_edi_srvy_l2_efield  5
;  mms1_edi_srvy_l2_q0      0.125
;

edi_text_000= $
   'EDI has two scientific data acquisition modes, called electric field '+ $
   'mode and ambient mode. In electric field mode, two coded electron beams '+ $
   'are emitted such that they return to the detectors after one or more '+ $
   'gyrations in the ambient magnetic and electric field. The firing '+ $
   'directions and times-of-flight allow the derivation of the drift '+ $
   'velocity and electric field. In ambient mode, the electron beams are '+ $
   'not used. The detectors with their large geometric factors and their '+ $
   'ability to adjust the field of view quickly allow continuous sampling '+ $
   'of ambient electrons at a selected pitch angle and fixed but selectable '+ $
   'energy. '

edi_text_001= $
   'To find the beam directions that will hit the detector, EDI sweeps each '+ $
   'beam in the plane perpendicular to B at a fixed angular rate of 0.22 '+ $
   '&#176;/ms until a signal has been acquired by the detector. Once signal '+ $
   'has been acquired, the beams are swept back and forth to stay on '+ $
   'target. Beam detection is not determined from the changes in the '+ $
   'count-rates directly, but from the square of the beam counts divided by '+ $
   'the background counts from ambient electrons, i.e., from the square of '+ $
   'the instantaneous signal-to-noise ratio (SNR). This quantity is '+ $
   'computed from data provided by the correlator in the Gun-Detector '+ $
   'Electronics that also generates the coding pattern imposed on the '+ $
   'outgoing beams. If the squared SNR ratio exceeds a threshold, this is '+ $
   'taken as evidence that the beam is returning to the detector. The '+ $
   'thresholds for SNR are chosen dependent on background fluxes. They '+ $
   'represent a compromise between getting false hits (induced by strong '+ $
   'variations in background electron fluxes) and missing true beam hits. '+ $
   'The basic software loop that controls EDI operations is executed every '+ $
   '2 ms. As the times when the beams hit their detectors are neither '+ $
   'synchronized with the telemetry nor equidistant, EDI data have no fixed '+ $
   'time-resolution. Data are reported in telemetry slots. In Survey, using '+ $
   'the standard packing mode 0, there are eight telemetry slots per second '+ $
   'and Gyn Detector Unit (GDU). The last beam detected during the previous '+ $
   'slot will be reported in the current slot. If no beam has been '+ $
   'detected, the data quality will be set to zero. In Burst telemetry '+ $
   'there are 128 slots per second and GDU. The data in each slot consists '+ $
   'of information regarding the beam firing directions (stored in the form '+ $
   'of analytic gun deflection voltages), times-of-flight (if successfully '+ $
   'measured), quality indicators, time stamps of the beam hits, and some '+ $
   'auxiliary correlator-related information. '

edi_text_002= $
   'Whenever EDI is not in electron drift mode, it uses its ambient '+ $
   'electron mode. The mode has the capability to sample at either 90 '+ $
   'degrees pitch angle or at 0/180 degrees (field aligned), or to '+ $
   'alternate between 90 degrees and field aligned with selectable dwell '+ $
   'times. While all options have been demonstrated during the '+ $
   'commissioning phase, only the field aligned mode has been used in the '+ $
   'routine operations phase. The choices for energy are 250 eV, 500 eV, '+ $
   'and 1 keV. The two detectors, which are facing opposite hemispheres, '+ $
   'are looking strictly into opposite directions, so while one detector is '+ $
   'looking along B the other is looking antiparallel to B (corresponding '+ $
   'to pitch angles of 180 and 0 degrees, respectively). The two detectors '+ $
   'switch roles every half spin of the spacecraft as the tip of the '+ $
   'magnetic field vector spins outside the field of view of one detector '+ $
   'and into the field of view of the other detector. '

if (survey_type eq 'brst' and data_type eq 'amb') then $
   description= $
      'Electron Drift Instrument (EDI) Ambient Burst Survey, Level 2, '+ $
      '0.0009765625 s Data (1024 samples/s). '+edi_text_000+edi_text_001+ $
      edi_text_002+ $
      'Up until January 4, 2016 the anodes were chosen such that the '+ $
      'magnetic field vector projected into the plane of the micro-channel '+ $
      'plate entry surface was best aligned with the center of the four '+ $
      'anodes ( that is, with the gap between the inner two of the four '+ $
      'anodes). Data taken in this configuration are using the term '+ $
      '&quot;amb&quot; in the data product names. In the burst data where '+ $
      'four channels (corresponding to the four adjacent sensor anode pads) '+ $
      'are sampled per GDU, the average (or sum) of the center two channels '+ $
      '(channels 2 and 3) represents best the pitch angle of 0 degrees (or '+ $
      '180 degrees). '

if (survey_type eq 'brst' and data_type eq 'amb-pm2') then $ 
   description= $
      'Electron Drift Instrument (EDI) Ambient Burst Survey, Level 2, '+ $
      '0.0009765625 s Data (1024 samples/s). '+edi_text_000+edi_text_001+ $
      edi_text_002+ $
      'Starting January 4, 2016, the anodes were chosen such that the '+ $
      'projection of the magnetic field vector was best aligned with the '+ $
      'center of the first (that is, outer) of the four anodes.  This '+ $
      'provides coverage of a larger range of pitch angles in general. Data '+ $
      'taken in this configuration are identified by the term '+ $
      '&quot;amb-pm2&quot; in the data product names. In the burst data '+ $
      'where four channels (corresponding to the four adjacent sensor anode '+ $
      'pads) are sampled per GDU, channel 1 represents best the pitch angle '+ $
      'of 0 degrees (or 180 degrees). '

if (survey_type eq 'brst' and data_type eq 'efield') then $ 
   description= $
      'Electron Drift Instrument (EDI) Electric Field Burst Survey, Level '+ $
      '2, 0.0009765625 s Data (1024 samples/s). '+edi_text_000+edi_text_001+ $
      edi_text_002+ $
      'This is the primary data product generated from data collected in '+ $
      'electric field mode. The science data generated are drift velocity '+ $
      'and electric field data in various coordinate systems. They are '+ $
      'derived from triangulation and/or time-of-flight analysis. Where '+ $
      'both methods are applicable, their results will be combined using a '+ $
      'weighting approach based on their relative errors. '

if (survey_type eq 'brst' and data_type eq 'q0') then $ 
   description= $
      'Electron Drift Instrument (EDI) Q0 Burst Survey, Level 2, 0.0078125 '+ $
      's Data (128 samples/s). '+edi_text_000+edi_text_001+edi_text_002+ $
      'These data are a by-product generated from data collected in '+ $
      'electric field mode. Whenever no return beam is found in a '+ $
      'particular time slot by the flight software to be reported will be '+ $
      'flagged with the lowest quality level (quality zero). The ground '+ $
      'processing generates a separate data product from these counts data. '

if (survey_type eq 'srvy' and data_type eq 'amb') then $ 
   description= $
      'Electron Drift Instrument (EDI) Ambient Survey, Level 2, 0.03125 s '+ $
      'Data. (32 samples/s)'+edi_text_000+edi_text_001+edi_text_002+ $
      'Up until January 4, 2016 the anodes were chosen such that the '+ $
      'magnetic field vector projected into the plane of the micro-channel '+ $
      'plate entry surface was best aligned with the center of the four '+ $
      'anodes ( that is, with the gap between the inner two of the four '+ $
      'anodes). Data taken in this configuration are using the term '+ $
      '&quot;amb&quot; in the data product names. In the burst data where '+ $
      'four channels (corresponding to the four adjacent sensor anode pads) '+ $
      'are sampled per GDU, the average (or sum) of the center two channels '+ $
      '(channels 2 and 3) represents best the pitch angle of 0 degrees (or '+ $
      '180 degrees). '

if (survey_type eq 'srvy' and data_type eq 'amb-pm2') then $ 
   description= $
      'Electron Drift Instrument (EDI) Ambient Survey, Level 2, 0.03125 s '+ $
      'Data (32 samples/s). '+edi_text_000+edi_text_001+edi_text_002+ $
      'Starting January 4, 2016, the anodes were chosen such that the '+ $
      'projection of the magnetic field vector was best aligned with the '+ $
      'center of the first (that is, outer) of the four anodes.  This '+ $
      'provides coverage of a larger range of pitch angles in general. Data '+ $
      'taken in this configuration are identified by the term '+ $
      '&quot;amb-pm2&quot; in the data product names. In the burst data '+ $
      'where four channels (corresponding to the four adjacent sensor anode '+ $
      'pads) are sampled per GDU, channel 1 represents best the pitch angle '+ $
      'of 0 degrees (or 180 degrees). '

if (survey_type eq 'srvy' and data_type eq 'efield') then $ 
   description= $
      'Electron Drift Instrument (EDI) Electric Field Survey, Level 2, 5 s '+ $
      'Data. '+edi_text_000+edi_text_001+edi_text_002+ $
      'This is the primary data product generated from data collected in '+ $
      'electric field mode. The science data generated are drift velocity '+ $
      'and electric field data in various coordinate systems. They are '+ $
      'derived from triangulation and/or time-of-flight analysis. Where '+ $
      'both methods are applicable, their results will be combined using a '+ $
      'weighting approach based on their relative errors. '

if (survey_type eq 'srvy' and data_type eq 'q0') then $ 
   description= $
      'Electron Drift Instrument (EDI) Q0 Survey, Level 2, 0.125 s Data (8 '+ $
      'samples/s). '+edi_text_000+edi_text_001+edi_text_002+ $
      'These data are a by-product generated from data collected in '+ $
      'electric field mode. Whenever no return beam is found in a '+ $
      'particular time slot by the flight software to be reported will be '+ $
      'flagged with the lowest quality level (quality zero). The ground '+ $
      'processing generates a separate data product from these counts data. '

description=description+common_text

return,description

end

