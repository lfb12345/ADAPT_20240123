
function mms_fpi_description,data_product_name

data_product_name_split=strsplit(data_product_name,'_',/extract)

mms_spacecraft=data_product_name_split(0)

mms_spacecraft_num=strmid(data_product_name_split(0),3,1)

survey_type=data_product_name_split(2)

data_type=data_product_name_split(4)

description='Empty'

if (strmatch(data_product_name,'mms?_fpi_brst_l2_des-dist') eq 1) then $
   description='The Fast Plasma Instrument (FPI) usually Operates in Fast '+ $
               'Survey (FS) Mode in the MMS Region Of Interest (ROI) for '+ $
               'the current Mission Phase. Data are taken at Burst (30/150 '+ $
               'ms for DES/DIS) Resolution in this Mode. Data are also made '+ $
               'available at Survey (4.5 s, etc.) Resolution. Per Mission '+ $
               'Design, not all Burst Resolution Data are downlinked, but '+ $
               'all Survey Data are downlinked. This Product contains Phase '+ $
               'Space Distribution Maps of those Burst Resolution Data '+ $
               'selected for downlink. In particular, the (highest possible '+ $
               'Quality at the Time of Release) corrected/converted '+ $
               '&quot;Burst Sky Map&quot; Distributions are reported with '+ $
               'Time Stamps and other Annotation characterizing the State '+ $
               'of the Instrument System at the indicated Time.

if (strmatch(data_product_name,'mms?_fpi_brst_l2_des-moms') eq 1) then $
   description='The Fast Plasma Instrument (FPI) usually Operates in Fast '+ $
               'Survey (FS) Mode in the MMS Region Of Interest (ROI) for '+ $
               'the current Mission Phase. Data are taken at Burst (30/150 '+ $
               'ms for DES/DIS) Resolution in this Mode. Data are also made '+ $
               'available at Survey (4.5 s, etc.) Resolution. Per Mission '+ $
               'Design, not all Burst Resolution Data are downlinked, but '+ $
               'all Survey Data are downlinked. Planning around Calibration '+ $
               'Activities, avoidance of Earth Radiation Belts, etc., when '+ $
               'possible, FPI usually Operates in Slow Survey (SS) Mode '+ $
               'outside of ROI, and then only the 60 s Resolution Survey '+ $
               'Data are available. This Product contains Results from '+ $
               'integrating the standard Moments of Phase Space '+ $
               'Distributions formed from the indicated Data Type (DES/DIS '+ $
               'Burst, FS or SS). For Convenience, some additional '+ $
               'Parameters are included to augment those most commonly '+ $
               'found in a Moments Product of this sort, plus Time Stamps '+ $
               'and other Annotation characterizing the State of the '+ $
               'Instrument System at the indicated Time.

if (strmatch(data_product_name,'mms?_fpi_brst_l2_dis-dist') eq 1) then $
   description='The Fast Plasma Instrument (FPI) usually Operates in Fast '+ $
               'Survey (FS) Mode in the MMS Region Of Interest (ROI) for '+ $
               'the current Mission Phase. Data are taken at Burst (30/150 '+ $
               'ms for DES/DIS) Resolution in this Mode. Data are also made '+ $
               'available at Survey (4.5 s, etc.) Resolution. Per Mission '+ $
               'Design, not all Burst Resolution Data are downlinked, but '+ $
               'all Survey Data are downlinked. This Product contains Phase '+ $
               'Space Distribution Maps of those Burst Resolution Data '+ $
               'selected for downlink. In particular, the (highest possible '+ $
               'Quality at the Time of Release) corrected/converted '+ $
               '&quot;Burst Sky Map&quot; Distributions are reported with '+ $
               'Time Stamps and other Annotation characterizing the State '+ $
               'of the Instrument System at the indicated Time.

if (strmatch(data_product_name,'mms?_fpi_brst_l2_dis-moms') eq 1) then $
   description='The Fast Plasma Instrument (FPI) usually Operates in Fast '+ $
               'Survey (FS) Mode in the MMS Region Of Interest (ROI) for '+ $
               'the current Mission Phase. Data are taken at Burst (30/150 '+ $
               'ms for DES/DIS) Resolution in this Mode. Data are also made '+ $
               'available at Survey (4.5 s, etc.) Resolution. Per Mission '+ $
               'Design, not all Burst Resolution Data are downlinked, but '+ $
               'all Survey Data are downlinked. Planning around Calibration '+ $
               'Activities, avoidance of Earth Radiation Belts, etc., when '+ $
               'possible, FPI usually Operates in Slow Survey (SS) Mode '+ $
               'outside of ROI, and then only the 60 s Resolution Survey '+ $
               'Data are available. This Product contains Results from '+ $
               'integrating the standard Moments of Phase Space '+ $
               'Distributions formed from the indicated Data Type (DES/DIS '+ $
               'Burst, FS or SS). For Convenience, some additional '+ $
               'Parameters are included to augment those most commonly '+ $
               'found in a Moments Product of this sort, plus Time Stamps '+ $
               'and other Annotation characterizing the State of the '+ $
               'Instrument System at the indicated Time.

if (strmatch(data_product_name,'mms?_fpi_fast_l2_des-dist') eq 1) then $
   description='The Fast Plasma Instrument (FPI) usually Operates in Fast '+ $
               'Survey (FS) Mode in the MMS Region Of Interest (ROI) for '+ $
               'the current Mission Phase. Data are taken at Burst (30/150 '+ $
               'ms for DES/DIS) Resolution are aggregated onboard and made '+ $
               'available at Survey (4.5 s) Resolution in this Mode. This '+ $
               'Product contains Phase Space Distribution Maps of Results '+ $
               'from surveying the High Resolution Observations during each '+ $
               '4.5 s Period. In particular, the (highest possible Quality '+ $
               'at the Time of Release) corrected/converted &quot;Fast '+ $
               'Survey Sky Map&quot; Distributions are reported with Time '+ $
               'Stamps and other Annotation characterizing the State of the '+ $
               'Instrument System at the indicated Time.

if (strmatch(data_product_name,'mms?_fpi_fast_l2_des-moms') eq 1) then $
   description='The Fast Plasma Instrument (FPI) usually Operates in Fast '+ $
               'Survey (FS) Mode in the MMS Region Of Interest (ROI) for '+ $
               'the current Mission Phase. Data are taken at Burst (30/150 '+ $
               'ms for DES/DIS) Resolution are aggregated onboard and made '+ $
               'available at Survey (4.5 s) Resolution in this Mode. '+ $
               'Planning around Calibration Activities, avoidance of Earth '+ $
               'Radiation Belts, etc., when possible, FPI usually Operates '+ $
               'in Slow Survey (SS) Mode outside of ROI, and then only the '+ $
               '60 s Resolution Survey Data are available. This Product '+ $
               'contains Results from integrating the standard Moments of '+ $
               'Phase Space Distributions formed from the indicated Data '+ $
               'Type (DES/DIS Burst, FS or SS). For Convenience, some '+ $
               'additional Parameters are included to augment those most '+ $
               'commonly found in a Moments Product of this sort, plus Time '+ $
               'Stamps and other Annotation characterizing the State of the '+ $
               'Instrument System at the indicated Time.

if (strmatch(data_product_name,'mms?_fpi_fast_l2_dis-dist') eq 1) then $
   description='The Fast Plasma Instrument (FPI) usually Operates in Fast '+ $
               'Survey (FS) Mode in the MMS Region Of Interest (ROI) for '+ $
               'the current Mission Phase. Data are taken at Burst (30/150 '+ $
               'ms for DES/DIS) Resolution are aggregated onboard and made '+ $
               'available at Survey (4.5 s) Resolution in this Mode. This '+ $
               'Product contains Phase Space Distribution Maps of Results '+ $
               'from surveying the High Resolution Observations during each '+ $
               '4.5 s Period. In particular, the (highest possible Quality '+ $
               'at the Time of Release) corrected/converted &quot;Fast '+ $
               'Survey Sky Map&quot; Distributions are reported with Time '+ $
               'Stamps and other Annotation characterizing the State of the '+ $
               'Instrument System at the indicated Time.

if (strmatch(data_product_name,'mms?_fpi_fast_l2_dis-moms') eq 1) then $
   description='The Fast Plasma Instrument (FPI) usually Operates in Fast '+ $
               'Survey (FS) Mode in the MMS Region Of Interest (ROI) for '+ $
               'the current Mission Phase. Data are taken at Burst (30/150 '+ $
               'ms for DES/DIS) Resolution are aggregated onboard and made '+ $
               'available at Survey (4.5 s) Resolution in this Mode. '+ $
               'Planning around Calibration Activities, avoidance of Earth '+ $
               'Radiation Belts, etc., when possible, FPI usually Operates '+ $
               'in Slow Survey (SS) Mode outside of ROI, and then only the '+ $
               '60 s Resolution Survey Data are available. This Product '+ $
               'contains Results from integrating the standard Moments of '+ $
               'Phase Space Distributions formed from the indicated Data '+ $
               'Type (DES/DIS Burst, FS or SS). For Convenience, some '+ $
               'additional Parameters are included to augment those most '+ $
               'commonly found in a Moments Product of this sort, plus Time '+ $
               'Stamps and other Annotation characterizing the State of the '+ $
               'Instrument System at the indicated Time.

return,description

end

