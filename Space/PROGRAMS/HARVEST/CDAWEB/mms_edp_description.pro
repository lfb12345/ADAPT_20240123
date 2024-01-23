
function mms_edp_description,data_product_name

data_product_name_split=strsplit(data_product_name,'_',/extract)

mms_spacecraft=data_product_name_split(0)

mms_spacecraft_num=strmid(data_product_name_split(0),3,1)

survey_type=data_product_name_split(2)

data_type=data_product_name_split(4)

if (strmatch(data_product_name,'mms?_edp_brst_l2_dce') eq 1) then $
   description='Electric Double Probe, Quick-Look Three-Dimensional '+ $
               'Electric Field, Level 2, Burst Survey Data'

if (strmatch(data_product_name,'mms?_edp_brst_l2_hmfe') eq 1) then $
   description='Electric Double Probe, Three-Dimensional HMFE Electric '+ $
               'Field, Level 2, Burst Survey, Level 1B AC Electric Field Data'

if (strmatch(data_product_name,'mms?_edp_brst_l2_scpot') eq 1) then $
   description='Electric Double Probe, Dual Probe Spacecraft Potential, '+ $
               'Level 2, Burst Survey Data'

if (strmatch(data_product_name,'mms?_edp_fast_l2_dce') eq 1) then $
   description='Electric Double Probe, Quick-Look Three-Dimensional '+ $
               'Electric Field, Level 2, Fast Survey Data'

if (strmatch(data_product_name,'mms?_edp_fast_l2_scpot') eq 1) then $
   description='Electric Double Probe, Dual Probe Spacecraft Potential, '+ $
               'Level 2, Fast Survey Data'

if (strmatch(data_product_name,'mms?_edp_fast_l2a_dce2d') eq 1) then $
   description='Electric Double Probe, Dual Probe Two-Dimensional Electric '+ $
               'Field, Level 2A, Fast Survey Data'

if (strmatch(data_product_name,'mms?_edp_slow_l2_dce') eq 1) then $
   description='Electric Double Probe, Quick-Look Three-Dimensional '+ $
               'Electric Field, Level 2, Slow Survey Data'

if (strmatch(data_product_name,'mms?_edp_slow_l2_scpot') eq 1) then $
   description='Electric Double Probe, Dual Probe Spacecraft Potential, '+ $
               'Level 2, Slow Survey Data'

if (strmatch(data_product_name,'mms?_edp_slow_l2a_dce2d') eq 1) then $
   description='Electric Double Probe, Dual Probe Two-Dimensional Electric '+ $
               'Field, Level 2A, Slow Survey Data'

if (strmatch(data_product_name,'mms?_edp_srvy_l2_hfesp') eq 1) then $
   description='Electric Double Probe, High-Frequency AC Electric Field '+ $
               'Spectra, Level 2, Survey Data, Level 1B AC Electric Field Data'

notes=''

if (data_type eq 'dce2d') then $
   notes='. Level 2A DCE2D is an intermediate product for internal used by '+ $
         'the SDP team. It contains the electric field in the spinning '+ $
         'frame, together with the computed spin fit coefficients, spin '+ $
         'phase, and various offsets. The Level 2A fast files are used as '+ $
         'the input to L2PRE fast processing, as well as one of the input '+ $
         'to the L2PRE burst processing, ensuring the consistency between '+ $
         'the fast and burst data.'

if (data_type eq 'scpot') then $
   notes='. Spacecraft potential is etstimatrd by averaging measurements of '+ $
         'the probe-to-spacecraft potential from several probes.'

common_text=''

description=strtrim(description+notes,2)

return,description

end

;
;  mms1_edp_brst_l2_hmfe     Epoch                              0.0000152587890625   65535        OOO
;  mms1_edp_brst_l2_dce      mms1_edp_epoch_brst_l2             0.0001220703125       8192        OOO
;  mms1_edp_brst_l2_scpot    mms1_edp_epoch_brst_l2             0.0001220703125       8192        OOO
;  mms1_edp_fast_l2_dce      mms1_edp_epoch_fast_l2             0.03125                 32        OOO
;  mms1_edp_fast_l2_scpot    mms1_edp_epoch_fast_l2             0.03125                 32        OOO
;  mms1_edp_fast_l2a_dce2d   mms1_edp_epoch_fast_l2a            0.03125                 32        OOO
;  mms1_edp_fast_l2a_dce2d   mms1_edp_epoch_spinfit_fast_l2a    5                        0.2      OOO
;  mms1_edp_slow_l2_dce      mms1_edp_epoch_slow_l2             0.125                    8        OOO
;  mms1_edp_slow_l2_scpot    mms1_edp_epoch_slow_l2             0.125                    8        OOO
;  mms1_edp_slow_l2a_dce2d   mms1_edp_epoch_slow_l2a            0.125                    8        OOO
;  mms1_edp_slow_l2a_dce2d   mms1_edp_epoch_spinfit_slow_l2a    5                        0.2      OOO
;  mms1_edp_srvy_l2_hfesp    Epoch                             16                        0.0625   OOO
;

