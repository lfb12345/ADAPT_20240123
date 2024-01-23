
function mms_mec_description,data_product_name

data_product_name_split=strsplit(data_product_name,'_',/extract)

mms_spacecraft=data_product_name_split(0)

survey_type=data_product_name_split(2)

if (survey_type eq 'brst') then begin

   survey_type='Burst (30 ms)'

   quaternion_num='11'

endif

if (survey_type eq 'srvy') then begin

   survey_type='Quick-Look (30 s)'

   quaternion_num='6'

endif

magnetic_field_model=data_product_name_split(4)

mms_spacecraft_num=strmid(data_product_name_split(0),3,1)

tsyganenko_year=strmid(magnetic_field_model,strlen(magnetic_field_model)-3,2)

if (tsyganenko_year eq '89') then tsyganenko_year='1989'

if (tsyganenko_year eq '04') then tsyganenko_year='2004'

magnetospheric_condition= $
   strmid(magnetic_field_model,strlen(magnetic_field_model)-1,1)

if (magnetospheric_condition eq 'd') then magnetospheric_condition='disturbed'

if (magnetospheric_condition eq 'q') then magnetospheric_condition='quiet

description='Magnetospheric Multiscale '+mms_spacecraft_num+' (MMS '+ $
            mms_spacecraft_num+') spacecraft position, velocity, attitude, '+ $

            'angular momentum vector, and magnetic ephemeris and '+ $
            'coordinates (MEC), Level-2 science data at '+survey_type+ $
            ' time resolution. The Magnetic ephemeris data are calculated '+ $
            'by using the Tsyganenko '+tsyganenko_year+' magnetic field '+ $
            'model for '+magnetospheric_condition+' magnetospheric '+ $
            'conditions. Many variables are included in this data product '+ $
            'including the magnetic field measured at the spacecraft. If '+ $
            'possible, the northern and southern hemisphere footpoints of '+ $
            'the spacecraft are found by tracing along the magnetic field '+ $
            'line threading through the spacecraft per the given Tsyganenko '+ $
            'and internal magnetic field models. The northern and southern '+ $
            'hemisphere loss cone angles are also given. The magnetic field '+ $
            'strength at the footpoints and the minimum magnetic field '+ $
            'strength along the field line are also calculated by using the '+ $
            'field models. Other variables list the spacecraft L-shell, the '+ $
            'magnetic local time, the magnetic latitude and longitude, and '+ $
            'whether the threading field line is open, closed, etc. '+ $
            'Rotational quaternions are provided to allow coordinate '+ $
            'transformation from GEI into '+quaternion_num+' other '+ $
            'coordinate systems including BSC, GEO, GSE, GSE2000, GSE, and '+ $
            'SM. The list of ancillary variables includes the dipole tilt '+ $
            'angle, the Dst and Kp actvity indices, and separate flags that '+ $
            'denote satellite eclipse by the Earth and Moon.'

return,description

end

