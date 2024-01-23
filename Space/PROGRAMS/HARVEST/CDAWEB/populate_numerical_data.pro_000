
function populate_numerical_data, $
   spase_ontology,station_info,resource_info,instrument_num, $
   data_product_name,date_style,data_product_cdf_info,cdf_file_name, $
   access_url,project_program_dir,verbose=verbose, $
   keyword_stop_date=keyword_stop_date, $
   keyword_relative_stop_date=keyword_relative_stop_date, $
   keyword_field=keyword_field,keyword_mixed=keyword_mixed, $
   keyword_particle=keyword_particle,keyword_support=keyword_support, $
   keyword_wave=keyword_wave

print,spase_ontology

print,'OPOPO',format='(/a/)'

stars=strjoin(replicate('*',275))

dashes='+'+strjoin(replicate('-',273))+'+'

print,stars,format='(a/)'

print,'POPULATE_NUMERICAL_DATA Start',format='(a/)'

print,stars,format='(a/)'

;rint,'Help me !!!',format='(a/)'

;
;-------------------------------------------------------------------------------
;
; NUMERICAL_DATA List Num:        24
;
;-------------------------------------------------------------------------------
;

access_rights_list=['','Open','PartiallyRestricted','Restricted']

association_type_list= $
   ['','ChildEventOf','DerivedFrom','ObservedBy','Other','PartOf','RevisionOf']

availability_list=['','Offline','Online']

coordinate_representation_list=['','Cartesian','Cylindrical','Spherical']

coordinate_system_name_list= $
   ['','CGM','CSO','Carrington','DM','ECD','ECEF','ENP','GEI','GEO','GPHIO', $
    'GSE','GSEQ','GSM','HAE','HCC','HCI','HCR','HEE','HEEQ','HERTN','HG', $
    'HGI','HGRTN','HPC','HPR','HSM','J2000','JSM','JSO','KSM','KSO','LGM', $
    'MAG','MFA','MSO','RTN','SC','SE','SM','SR','SR2','SSE','SSE_L', $
    'SpacecraftOrbitPlane','TIIS','VSO','WGS84']

display_type_list= $
   ['','Image','Plasmagram','Spectrogram','StackPlot','TimeSeries','WaveForm']

encoding_list= $
   ['','ASCII','BZIP2','Base64','GZIP','None','S3_BUCKET','TAR','Unicode','ZIP']

field_quantity_list= $
   ['','Current','Electric','Electromagnetic','Gyrofrequency','Magnetic', $
    'PlasmaFrequency','Potential','PoyntingFlux']

format_list= $
   ['','AVI','Binary','CDF','CEF','CEF1','CEF2','CSV','Excel','FITS','GIF', $
    'HDF','HDF4','HDF5','HTML','Hardcopy','Hardcopy.Film', $
    'Hardcopy.Microfiche','Hardcopy.Microfilm','Hardcopy.Photograph', $
    'Hardcopy.PhotographicPlate','Hardcopy.Print','IDFS','IDL','JPEG','JSON', $
    'MATLAB_4','MATLAB_6','MATLAB_7','MPEG','NCAR','NetCDF','PDF','PDS3', $
    'PDS4','PNG','Postscript','QuickTime','TIFF','Text','Text.ASCII', $
    'Text.Unicode','UDF','VOTable','XML']

measurement_type_list= $
   ['','ActivityIndex','Dopplergram','Dust','ElectricField', $
    'EnergeticParticles','Ephemeris','ImageIntensity','InstrumentStatus', $
    'IonComposition','Irradiance','MagneticField','Magnetogram', $
    'NeutralAtomImages','NeutralGas','Profile','Radiance','SPICE','Spectrum', $
    'ThermalPlasma','Waves','Waves.Active','Waves.Passive']

mixed_quantity_list= $
   ['','AkasofuEpsilon','AlfvenMachNumber','AlfvenVelocity', $
    'FrequencyToGyrofrequencyRatio','IMFClockAngle','MagnetosonicMachNumber', $
    'Other','PlasmaBeta','SolarUVFlux','TotalPressure','VCrossB']

observed_region_list= $
   ['','Asteroid','Comet','Earth','Earth.Magnetosheath','Earth.Magnetosphere', $
    'Earth.Magnetosphere.Magnetotail','Earth.Magnetosphere.Main', $
    'Earth.Magnetosphere.Plasmasphere','Earth.Magnetosphere.Polar', $
    'Earth.Magnetosphere.RadiationBelt','Earth.Magnetosphere.RingCurrent', $
    'Earth.Moon','Earth.NearSurface','Earth.NearSurface.Atmosphere', $
    'Earth.NearSurface.AuroralRegion','Earth.NearSurface.EquatorialRegion', $
    'Earth.NearSurface.Ionosphere','Earth.NearSurface.Ionosphere.DRegion', $
    'Earth.NearSurface.Ionosphere.ERegion', $
    'Earth.NearSurface.Ionosphere.FRegion', $
    'Earth.NearSurface.Ionosphere.Topside','Earth.NearSurface.Mesosphere', $
    'Earth.NearSurface.MidLatitudeRegion','Earth.NearSurface.Plasmasphere', $
    'Earth.NearSurface.PolarCap', $
    'Earth.NearSurface.SouthAtlanticAnomalyRegion', $
    'Earth.NearSurface.Stratosphere','Earth.NearSurface.SubAuroralRegion', $
    'Earth.NearSurface.Thermosphere','Earth.NearSurface.Troposphere', $
    'Earth.Surface','Heliosphere','Heliosphere.Heliosheath', $
    'Heliosphere.Inner','Heliosphere.NearEarth','Heliosphere.Outer', $
    'Heliosphere.Remote1AU','Interstellar','Jupiter','Jupiter.Callisto', $
    'Jupiter.Europa','Jupiter.Ganymede','Jupiter.Io','Jupiter.Magnetosphere', $
    'Jupiter.Magnetosphere.Magnetotail','Jupiter.Magnetosphere.Main', $
    'Jupiter.Magnetosphere.Plasmasphere','Jupiter.Magnetosphere.Polar', $
    'Jupiter.Magnetosphere.RadiationBelt','Jupiter.Magnetosphere.RingCurrent', $
    'Mars','Mars.Deimos','Mars.Magnetosphere', $
    'Mars.Magnetosphere.Magnetotail','Mars.Magnetosphere.Main', $
    'Mars.Magnetosphere.Plasmasphere','Mars.Magnetosphere.Polar', $
    'Mars.Magnetosphere.RadiationBelt','Mars.Magnetosphere.RingCurrent', $
    'Mars.Phobos','Mercury','Mercury.Magnetosphere', $
    'Mercury.Magnetosphere.Magnetotail','Mercury.Magnetosphere.Main', $
    'Mercury.Magnetosphere.Plasmasphere','Mercury.Magnetosphere.Polar', $
    'Mercury.Magnetosphere.RadiationBelt','Mercury.Magnetosphere.RingCurrent', $
    'Neptune','Neptune.Magnetosphere','Neptune.Magnetosphere.Magnetotail', $
    'Neptune.Magnetosphere.Main','Neptune.Magnetosphere.Plasmasphere', $
    'Neptune.Magnetosphere.Polar','Neptune.Magnetosphere.RadiationBelt', $
    'Neptune.Magnetosphere.RingCurrent','Neptune.Proteus','Neptune.Triton', $
    'Pluto','Saturn','Saturn.Dione','Saturn.Enceladus','Saturn.Iapetus', $
    'Saturn.Magnetosphere','Saturn.Magnetosphere.Magnetotail', $
    'Saturn.Magnetosphere.Main','Saturn.Magnetosphere.Plasmasphere', $
    'Saturn.Magnetosphere.Polar','Saturn.Magnetosphere.RadiationBelt', $
    'Saturn.Magnetosphere.RingCurrent','Saturn.Mimas','Saturn.Rhea', $
    'Saturn.Tethys','Saturn.Titan','Sun','Sun.Chromosphere','Sun.Corona', $
    'Sun.Interior','Sun.Photosphere','Sun.TransitionRegion','Uranus', $
    'Uranus.Ariel','Uranus.Magnetosphere','Uranus.Magnetosphere.Magnetotail', $
    'Uranus.Magnetosphere.Main','Uranus.Magnetosphere.Plasmasphere', $
    'Uranus.Magnetosphere.Polar','Uranus.Magnetosphere.RadiationBelt', $
    'Uranus.Magnetosphere.RingCurrent','Uranus.Miranda','Uranus.Oberon', $
    'Uranus.Puck','Uranus.Titania','Uranus.Umbriel','Venus', $
    'Venus.Magnetosphere','Venus.Magnetosphere.Magnetotail', $
    'Venus.Magnetosphere.Main','Venus.Magnetosphere.Plasmasphere', $
    'Venus.Magnetosphere.Polar','Venus.Magnetosphere.RadiationBelt', $
    'Venus.Magnetosphere.RingCurrent']

particle_quantity_list= $
   ['','AdiabaticInvariant','AdiabaticInvariant.BounceMotion', $
    'AdiabaticInvariant.DriftMotion','AdiabaticInvariant.MagneticMoment', $
    'ArrivalDirection','AtomicNumberDetected','AverageChargeState', $
    'ChargeFlux','ChargeState','CountRate','Counts','DynamicPressure', $
    'Energy','EnergyDensity','EnergyFlux','EnergyPerCharge','Entropy', $
    'FlowSpeed','FlowVelocity','Fluence','GeometricFactor','Gyrofrequency', $
    'HeatFlux','LShell','Mass','MassDensity','MassNumber','MassPerCharge', $
    'NumberDensity','NumberFlux','ParticleRadius','ParticleRigidity', $
    'PhaseSpaceDensity','PlasmaFrequency','Pressure','SonicMachNumber', $
    'SoundSpeed','Temperature','ThermalSpeed','Velocity']

particle_type_list= $
   ['','Aerosol','AlphaParticle','Atom','Dust','Electron','Ion','Molecule', $
    'Neutron','Positron','Proton']

processing_level_list=['','Calibrated','Raw','Uncalibrated']

qualifier_list= $
   ['','Anisotropy','Array','AutoSpectrum','Average','Characteristic', $
    'Circular','Coherence','Column','Component','Component.I','Component.J', $
    'Component.K','Confidence','Core','CrossSpectrum','Deviation', $
    'Differential','Direction','DirectionAngle','DirectionAngle.AzimuthAngle', $
    'DirectionAngle.ElevationAngle','DirectionAngle.PolarAngle', $
    'DirectionCosine','DirectionCosine.I','DirectionCosine.J', $
    'DirectionCosine.K','Directional','EncodedParameter','FieldAligned','Fit', $
    'Group','Halo','ImaginaryPart','Integral','Integral.Area', $
    'Integral.Bandwidth','Integral.SolidAngle','LineOfSight','Linear', $
    'Magnitude','Maximum','Median','Minimum','Moment','Parallel','Peak', $
    'Perpendicular','Perturbation','Phase','PhaseAngle', $
    'PowerSpectralDensity','Projection','Projection.IJ','Projection.IK', $
    'Projection.JK','Pseudo','Ratio','RealPart','Scalar','Spectral', $
    'StandardDeviation','StokesParameters','Strahl','Superhalo','Symmetric', $
    'Tensor','Total','Trace','Uncertainty','Variance','Vector']

rendering_axis_list=['','ColorBar','Horizontal','Vertical']

role_list= $
   ['','ArchiveSpecialist','CoInvestigator','Contributor','CoPI', $
    'DataProducer','DeputyPI','Developer','FormerPI','GeneralContact', $
    'HostContact','InstrumentLead','MetadataContact','MissionManager', $
    'MissionPrincipalInvestigator','PrincipalInvestigator','ProgramManager', $
    'ProgramScientist','ProjectEngineer','ProjectManager','ProjectScientist', $
    'Publisher','Scientist','TeamLeader','TeamMember','TechnicalContact', $
    'User']

scale_type_list=['','LinearScale','LogScale']

spectral_range_list= $
   ['','CaK','ExtremeUltraviolet','FarUltraviolet','GammaRays','Halpha', $
    'HardXRays','He10830','He304','Infrared','K7699','LBHBand','Microwave', $
    'NaD','Ni6768','Optical','RadioFrequency','SoftXRays','Ultraviolet', $
    'WhiteLight','XRays']

style_list= $
   ['','File','HAPI','Listing','Overview','Search','Template','WebService']

support_quantity_list= $
   ['','DataQuality','Housekeeping','InstrumentMode','Orientation','Other', $
    'Positional','RotationMatrix','SpinPeriod','SpinPhase','SpinRate', $
    'Telemetry','Temporal','Velocity']

wave_quantity_list= $
   ['','ACElectricField','ACMagneticField','Absorption','Albedo', $
    'DopplerFrequency','Emissivity','EnergyFlux','EquivalentWidth', $
    'Frequency','Gyrofrequency','Intensity','LineDepth','MagneticField', $
    'ModeAmplitude','PlasmaFrequency','Polarization','PoyntingFlux', $
    'PropagationTime','StokesParameters','Velocity','Wavelength']

wave_type_list= $
   ['','Electromagnetic','Electrostatic','Hydrodynamic','MHD','Photon', $
    'PlasmaWaves']

;
;  Get CDAWEB Master Clean Information
;

cdaweb_master_notes_file_name=project_program_dir+'cdaweb_master_clean.tab'

cdaweb_master_notes=read_tab_table(cdaweb_master_notes_file_name,exist_flag,/verbose,/compress)

cdaweb_master_notes=cdaweb_master_notes.table

numerical_data_parameter_all_file_name=project_program_dir+'numerical_data_parameter_all.tab'

numerical_data_parameter_all=read_tab_table(numerical_data_parameter_all_file_name,exist_flag,/verbose,/compress)

data_product_name_mask=where(data_product_name eq numerical_data_parameter_all.table.data_product_name,data_product_name_mask_num)

data_product_name_upper=strupcase(data_product_name)

data_product_name_lower=strlowcase(data_product_name)

data_product_name_upper_mask=where(cdaweb_master_notes.data_product_id eq data_product_name_upper)

if (data_product_name_upper_mask ne -1) then begin

   cdaweb_master_notes=cdaweb_master_notes(data_product_name_upper_mask)

   if (cdaweb_master_notes.relative_stop_date eq '') then begin

      keyword_stop_date=1

      keyword_relative_stop_date=0

   endif else begin

      keyword_stop_date=0

      keyword_relative_stop_date=1

   endelse

endif

;
;  Create a SPASE Numerical Data Structure
;

numerical_data= $
   spase_model_create(spase_ontology,'numerical_data',verbose=verbose, $
      keyword_relative_stop_date=keyword_relative_stop_date, $
      keyword_stop_date=keyword_stop_date)

help,numerical_data.resource_header,/structure

print,'OOPS',format='(/a/)'

;                                        ,keyword_field=keyword_field, $
;     keyword_mixed=keyword_mixed,keyword_particle=keyword_particle, $
;     keyword_support=keyword_support,keyword_wave=keyword_wave)

;
;  Start the CDAWEB CDF to SPASE Translation Process
;
;  Compile Global Attribute metadata information for easy use.
;

global_attribute_list=strlowcase(data_product_cdf_info.global_attribute_info.name)

global_attribute_list_num=n_elements(global_attribute_list)

print,'POPULATE_NUMERICAL_DATA Data_Product_Name:',data_product_name,format='(a-73,a/)'

print,'POPULATE_NUMERICAL_DATA Number of Global Attributes:',strtrim(string(global_attribute_list_num),2),format='(a-73,a/)'

for global_attribute_list_loop=0,global_attribute_list_num-1 do begin

    join_text='JOIN'

    delimiter_text=''

    if (global_attribute_list(global_attribute_list_loop) eq 'discipline') then join_text=''

    if (global_attribute_list(global_attribute_list_loop) eq 'mission_group') then join_text=''

    if (global_attribute_list(global_attribute_list_loop) eq 'mods') then join_text=''

    if (global_attribute_list(global_attribute_list_loop) eq 'text') then join_text=''

    if (global_attribute_list(global_attribute_list_loop) eq 'title') then join_text='JOIN'

    if (global_attribute_list(global_attribute_list_loop) eq 'title') then delimiter_text=', '

    if (global_attribute_list(global_attribute_list_loop) eq 'project') then join_text=''

    if (global_attribute_list(global_attribute_list_loop) eq 'http_link') then join_text=''

    if (global_attribute_list(global_attribute_list_loop) eq 'link_text') then join_text=''

    if (global_attribute_list(global_attribute_list_loop) eq 'link_title') then join_text=''

;   if (global_attribute_list(global_attribute_list_loop) eq 'pi_name') then delimiter_text=' & '

    command=global_attribute_list(global_attribute_list_loop)+"=global_attribute_grep(data_product_cdf_info.global_attribute_info,'"+ $
            global_attribute_list(global_attribute_list_loop)+"','ALL','"+join_text+"','"+delimiter_text+"','COMPRESS')"

    command_error=execute(command)

    if (command_error ne 1) then print,'Command Error:',command,format='(a-73,a/)'

endfor

acknowledgement=global_attribute_grep(data_product_cdf_info.global_attribute_info,'acknowledgement','ALL','JOIN',' ','COMPRESS')

caveats=global_attribute_grep(data_product_cdf_info.global_attribute_info,'caveats','ALL','','','COMPRESS')

title=global_attribute_grep(data_product_cdf_info.global_attribute_info,'title','ALL','JOIN',', ','COMPRESS')

nssdc_id=global_attribute_grep(data_product_cdf_info.global_attribute_info,'nssdc_id','ALL','','','COMPRESS')

text_supplement_1=global_attribute_grep(data_product_cdf_info.global_attribute_info,'text_supplement_1','ALL','JOIN',' ','COMPRESS')

software_version=global_attribute_grep(data_product_cdf_info.global_attribute_info,'software_version','ALL','JOIN',' ','COMPRESS')

mods=global_attribute_grep(data_product_cdf_info.global_attribute_info,'mods','ALL','','','COMPRESS')

adid_ref=global_attribute_grep(data_product_cdf_info.global_attribute_info,'adid_ref','ALL','JOIN','','COMPRESS')

data_type=global_attribute_grep(data_product_cdf_info.global_attribute_info,'data_type','ALL','JOIN','','COMPRESS')

data_version=global_attribute_grep(data_product_cdf_info.global_attribute_info,'data_version','ALL','JOIN','','COMPRESS')

descriptor=global_attribute_grep(data_product_cdf_info.global_attribute_info,'descriptor','ALL','JOIN','','COMPRESS')

discipline=global_attribute_grep(data_product_cdf_info.global_attribute_info,'discipline','ALL','','','COMPRESS')

generated_by=global_attribute_grep(data_product_cdf_info.global_attribute_info,'generated_by','ALL','JOIN','','COMPRESS')

generation_date=global_attribute_grep(data_product_cdf_info.global_attribute_info,'generation_date','ALL','JOIN','','COMPRESS')

http_link=global_attribute_grep(data_product_cdf_info.global_attribute_info,'http_link','ALL','','','COMPRESS')

instrument_type=global_attribute_grep(data_product_cdf_info.global_attribute_info,'instrument_type','ALL','','','COMPRESS')

link_text=global_attribute_grep(data_product_cdf_info.global_attribute_info,'link_text','ALL','','','COMPRESS')

link_title=global_attribute_grep(data_product_cdf_info.global_attribute_info,'link_title','ALL','','','COMPRESS')

logical_file_id=global_attribute_grep(data_product_cdf_info.global_attribute_info,'logical_file_id','ALL','JOIN','','COMPRESS')

logical_source=global_attribute_grep(data_product_cdf_info.global_attribute_info,'logical_source','ALL','JOIN','','COMPRESS')

logical_source_description=global_attribute_grep(data_product_cdf_info.global_attribute_info,'logical_source_description','ALL','JOIN','','COMPRESS')

mission_group=global_attribute_grep(data_product_cdf_info.global_attribute_info,'mission_group','ALL','','','COMPRESS')

pi_affiliation=global_attribute_grep(data_product_cdf_info.global_attribute_info,'pi_affiliation','ALL','JOIN','','COMPRESS')

pi_name=global_attribute_grep(data_product_cdf_info.global_attribute_info,'pi_name','ALL','JOIN','','COMPRESS')

project=global_attribute_grep(data_product_cdf_info.global_attribute_info,'project','ALL','','','COMPRESS')

rules_of_use=global_attribute_grep(data_product_cdf_info.global_attribute_info,'rules_of_use','ALL','','','COMPRESS')

text=global_attribute_grep(data_product_cdf_info.global_attribute_info,'text','ALL','','','')

rules_of_use_full_text=rules_of_use.text(0)

if (rules_of_use.record_num gt 1) then $
   for loop=1,rules_of_use.record_num-1 do $
       rules_of_use_full_text=rules_of_use_full_text+string(10B)+rules_of_use.text(loop)

if (data_product_name_upper_mask ne -1) then begin

   cadence_raw=strtrim(strcompress(cdaweb_master_notes.time_resolution),2)

   command='echo "'+cadence_raw+'" | sed -f '+project_program_dir+'cdf_global_variable_list_time_resolution.sed'

   spawn,command,cadence,error

   command='echo "'+cadence+'" | sed -f '+project_program_dir+'cdf_global_variable_list_time_resolution.sed | sed -f '+project_program_dir+'resource_name_time_resolution.sed'

   spawn,command,cadence_final,error

   if (strtrim(strcompress(cdaweb_master_notes.processing_level)) ne '') then begin

      resource_name_text= $
         strtrim(strcompress(cdaweb_master_notes.mission_name_acronym+' '+ $
                             cdaweb_master_notes.instrument+' ('+ $
                             cdaweb_master_notes.instrument_acronym+') '+ $
                             cdaweb_master_notes.instrument_detail+', '+ $
                             strtrim(strcompress(cdaweb_master_notes.processing_level))+' '+ $
                             strtrim(strcompress(cdaweb_master_notes.processing_level_acronym))+', '+ $
                             cadence_final+' Data'),2)

   endif else begin

      if (strtrim(strcompress(cdaweb_master_notes.processing_level_acronym)) ne '') then begin

         level=strsplit(strtrim(strcompress(cdaweb_master_notes.processing_level_acronym)),'()',/extract)

         resource_name_text= $
            strtrim(strcompress(cdaweb_master_notes.mission_name_acronym+' '+ $
                                cdaweb_master_notes.instrument+' ('+ $
                                cdaweb_master_notes.instrument_acronym+') '+ $
                                cdaweb_master_notes.instrument_detail+', '+ $
                                'Level '+level+', '+ $
                                cadence_final+' Data'),2)

      endif else begin

         resource_name_text= $
            strtrim(strcompress(cdaweb_master_notes.mission_name_acronym+' '+ $
                                cdaweb_master_notes.instrument+' ('+ $
                                cdaweb_master_notes.instrument_acronym+') '+ $
                                cdaweb_master_notes.instrument_detail+', '+ $
                                cadence_final+' Data'),2)

      endelse

   endelse

       
   if (strmid(data_product_name,24,strlen(data_product_name),/reverse_offset) eq 'coho1hr_merged_mag_plasma') then $
      resource_name_text=strtrim(strcompress(cdaweb_master_notes.mission_name+' ('+cdaweb_master_notes.mission_name_acronym+') '+cdaweb_master_notes.instrument+', Hourly Data'),2)

   if (cdaweb_master_notes.mission_name_acronym eq '') then resource_name_text=cdaweb_master_notes.mission_name+' '+resource_name_text

   resource_name_text=strjoin(strsplit(resource_name_text,', ,',/regex,/extract),',')

   resource_name_text=strjoin(strsplit(resource_name_text,' , ',/regex,/extract),', ')

   if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then $
      resource_name_text=strtrim(strcompress(cdaweb_master_notes.mission_name_acronym))+' ('+ $
                         strtrim(strcompress(cdaweb_master_notes.instrument_acronym))+ $
                         ') Ground-based Vector Magnetic Field '+ $
                         strtrim(strcompress(cdaweb_master_notes.processing_level_acronym))+' '+ $
                         strtrim(strcompress(cdaweb_master_notes.time_resolution))+ $
                         ' Data'

   if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then $
      acknowledgement_text='Please acknowledge the Principal Investigator '+strtrim(strcompress(cdaweb_master_notes.pi_name))+', '+strtrim(strcompress(cdaweb_master_notes.pi_institution))

   instrument_split=strsplit(cdaweb_master_notes.instrument,'()',/EXTRACT)

   instrument_split_num=n_elements(strsplit(cdaweb_master_notes.instrument,'()',/EXTRACT))

   if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then $
      location_text='Station Location: (GEO '+ $
                    instrument_split(instrument_split_num-2)+')'+ $
                    instrument_split(instrument_split_num-1)

endif

;
;  Get Mission Name
;

if (n_elements(logical_source) gt 0) then begin

   print,'POPULATE_NUMERICAL_DATA Logical_Source:',logical_source(0).text,format='(a-73,a/)'

   if (logical_source.text eq '') then logical_source.text=data_product_name

   logical_source_split=strsplit(logical_source.text,'_',/extract)

   logical_source_mission_code=strlowcase(logical_source_split(0))

   print,'POPULATE_NUMERICAL_DATA Logical_Source_Mission_Code:',logical_source_mission_code,format='(a-73,a/)'

   command='grep ^"'+logical_source_mission_code+'\	" /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/cdaweb_sc_list.tab'+" | sed 's/^.*\	//'"

   spawn,command,cdaweb_mission_name_logical_source,error

endif else begin

   logical_source_mission_code=''

   cdaweb_mission_name_logical_source=''

endelse

print,'POPULATE_NUMERICAL_DATA CDAWEB_Mission_Name_Logical_Source:',cdaweb_mission_name_logical_source,format='(a-73,a/)'

if (cdaweb_mission_name_logical_source ne '') then begin

   print,'POPULATE_NUMERICAL_DATA CDAWEB_Mission_Name_Logical_Source:',cdaweb_mission_name_logical_source,format='(a-73,a/)'

;

   command='echo "'+mission_group.text(0)+'\ " | sed -f '+project_program_dir+'global_attribute_mission_group.sed'

   spawn,command,cdaweb_mission_name_mission_group,error

;

   command='grep -i ^"'+cdaweb_mission_name_mission_group+'\ " /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/cdaweb_sc_list.tab'+" | sed 's/^.*\	//'"

   spawn,command,cdaweb_mission_name_mission_group,error

;  command='find /Users/admin/Desktop/HOFFMAN/130103_VXO_NO_GIT/DRAFT/SMWG/Observatory -depth'+ $

   command='find /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/VXO/SMWG/Observatory -depth'+ $
           ' | grep -i '+cdaweb_mission_name_mission_group+' | grep xml'+ $
           " | sed 's/^.*SMWG\/Observatory\///' | sed 's/\.xml//'"

   spawn,command,cdaweb_mission_name_smwg_mission_group,error

;  command='find /Users/admin/Desktop/HOFFMAN/130103_VXO_NO_GIT/DRAFT/SMWG/Observatory -depth'+ $

   command='find /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/VXO/SMWG/Observatory -depth'+ $
        ' | grep -i '+cdaweb_mission_name_logical_source+' | grep xml'+ $
        " | sed 's/^.*SMWG\/Observatory\///' | sed 's/\.xml//'"

   spawn,command,cdaweb_mission_name_smwg_logical_source,error

   cdaweb_mission_name_smwg_logical_source=cdaweb_mission_name_smwg_logical_source(0)

endif else begin

   cdaweb_mission_name_mission_group=''

   cdaweb_mission_name_smwg_logical_source=''

   cdaweb_mission_name_logical_source=''

endelse

if (cdaweb_mission_name_mission_group eq '') then begin

   cdaweb_mission_name_smwg=cdaweb_mission_name_logical_source

endif else begin

   cdaweb_mission_name_smwg=cdaweb_mission_name_mission_group

endelse

if (strlen(cdaweb_mission_name_logical_source) gt strlen(cdaweb_mission_name_mission_group)) then $
   cdaweb_mission_name_smwg=cdaweb_mission_name_logical_source

print,'POPULATE_NUMERICAL_DATA CDAWEB_MISSION_NAME_SMWG RAW:',cdaweb_mission_name_smwg,format='(a-73,a/)'

if (cdaweb_mission_name_smwg ne '') then begin

;  command='find /Users/admin/Desktop/HOFFMAN/130103_VXO_NO_GIT/DRAFT/SMWG/Instrument -depth | grep '+ $

   command='find /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/VXO/SMWG/Instrument -depth | grep "/'+ $
           cdaweb_mission_name_smwg+'/"'+" | grep xml | sed 's/^.*SMWG/spase:\/\/SMWG/' | sed 's/\.xml//'"

   if (strmatch(strmid(data_product_name,0,5),'mms[1-4]_',/fold_case) eq 1) then begin

      command_mms='echo '+data_product_name+" | awk '"+'BEGIN { FS="_" } ; { print $2 }'+"' | tr 'a-z' 'A-Z' | sed 's/-/\//g' | sed 's/MEC/Ephemeris/' | sort | uniq"

      spawn,command_mms,cdaweb_mission_instrument_name_list_mms,error

   endif else begin

      if (data_product_name_upper_mask ne -1) then begin

         if (cdaweb_master_notes.instrument_acronym eq 'Attitude') then begin

            command=command+' | grep "/Ephemeris"'

         endif else begin

            command=command+' | grep "/'+cdaweb_master_notes.instrument_acronym+'"$'

         endelse

      endif

   endelse

   if (data_product_name eq 'thg_l1_ask') then command=command+' | grep "\/ASI"'

   spawn,command,cdaweb_mission_instrument_id_list,error

   if (cdaweb_mission_instrument_id_list(0) ne '') then begin

;     command='find /Users/astropooch/Desktop/HOFFMAN/130103_VXO_NO_GIT/DRAFT/SMWG/Instrument -depth'+ $

      command='find /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/VXO/SMWG/Instrument -depth | grep "/'+ $
              cdaweb_mission_name_smwg+'/"'+" | grep xml | sed 's/^.*SMWG\/Instrument\/"+ $
              cdaweb_mission_name_smwg+"\///' | sed 's/\.xml//'"

      if (data_product_name_upper_mask ne -1) then begin

         if (cdaweb_master_notes.instrument_acronym eq 'Attitude') then begin

            command=command+' | grep ^"Ephemeris"$'

         endif else begin

            command=command+' | grep ^"'+cdaweb_master_notes.instrument_acronym+'"'

         endelse

      endif

      if (data_product_name eq 'thg_l1_ask') then command=command+' | grep "\/ASI"'

      if (strmatch(strmid(data_product_name,0,5),'mms[1-4]_',/fold_case) eq 1) then $
         command=command+' | grep ^"\/*'+cdaweb_mission_instrument_name_list_mms+'"'

      spawn,command,cdaweb_mission_instrument_name_list,error

;
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;
;     grep ^'rbsp[ab]' spdf_analyze_data_product_list.tab | sed '/rbsp[ab]_rel0[23]_/s/_rel0[23]//' | sed 's/^rbsp[ab]_//' | sed 's/^l2_//' | sed 's/-.*$//' | sed 's/^psbr.*$/rps/' | sort | uniq -c
;
;          26 ect
;          16 efw
;           1 rps
;
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;

      if (strmatch(strmid(data_product_name,0,5),'rbsp[ab]',/fold_case) eq 1) then begin

         command='echo '+data_product_name+" | "+ $
                 "sed '/rbsp[ab]_rel0[23]_/s/_rel0[23]//' | "+ $
                 "sed 's/^rbsp[ab]_//' | sed 's/^l2_//' | sed 's/-.*$//' | "+ $
                 "sed 's/^psbr.*$/rps/'"

         spawn,command,instrument_name_list_check,error

      endif

;
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;
;     grep ^'rbsp-[ab]-' spdf_analyze_data_product_list_170101.tab | grep ^'rbsp-[ab]-' | sed 's/^rbsp-[ab]-//' | sed 's/_lev-[1-3].*$//' | sort | uniq -c
;
;          77 rbspice
;
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;

      if (strmatch(strmid(data_product_name,0,7),'rbsp-[ab]-',/fold_case) eq 1) then begin

         command='echo '+data_product_name+" | sed 's/^rbsp-[ab]-//' | "+ $
                 "sed 's/_lev-[1-3].*$//'"

         spawn,command,instrument_name_list_check,error

      endif

;
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;
;     grep ^rbsp spdf_analyze_data_product_list_170101.tab | grep ^'rbsp-[ab]_' | sed 's/^rbsp-[ab]_//' | sed '/emfisis/s/^.*$/emfisis/' | sed '/magnetometer/s/^.*$/emfisis/' | sort | uniq -c
;
;          84 emfisis
;
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;

      if (strmatch(strmid(data_product_name,0,7),'rbsp-[ab]_',/fold_case) eq 1) then begin

         command='echo '+data_product_name+" | sed 's/^rbsp-[ab]_//' | "+ $
                 "sed '/emfisis/s/^.*$/emfisis/' | "+ $
                 "sed '/magnetometer/s/^.*$/emfisis/'"

         spawn,command,instrument_name_list_check,error

      endif

;
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;

      if (strmatch(strmid(data_product_name,0,4),'rbsp',/fold_case) eq 1) then begin

         instrument_name_list_check=instrument_name_list_check(0)

         instrument_name_list_mask=where(strmatch(cdaweb_mission_instrument_name_list,instrument_name_list_check,/fold_case) eq 1,instrument_name_list_mask_num)

         if (instrument_name_list_mask_num eq 1) then cdaweb_mission_instrument_name_list=cdaweb_mission_instrument_name_list(instrument_name_list_mask)

         instrument_id_list_mask=where(strmatch(cdaweb_mission_instrument_id_list,'/'+instrument_name_list_check+'.xml',/fold_case) eq 1,instrument_id_list_mask_num)

         if (instrument_id_list_mask_num eq 1) then cdaweb_mission_instrument_id_list=cdaweb_mission_instrument_id_list(instrument_id_list_mask)

      endif

;
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;

      if (cdaweb_mission_instrument_name_list(0) eq '') then cdaweb_mission_instrument_name_list='InstrumentUnknown'

      if (strmatch(strmid(data_product_name,0,4),'th[a-e]_',/fold_case) eq 1) then begin

         instrument_name_check=strupcase(logical_source_split(2))

         instrument_match=where(strmatch(cdaweb_mission_instrument_name_list,instrument_name_check) eq 1,instrument_match_num)

         if (instrument_match_num eq 0) then begin

            cdaweb_mission_instrument_name_list='InstrumentUnknown'

            if (strmatch(data_product_name,'th[a-e]_l1_state') eq 1) then cdaweb_mission_instrument_name_list='Ephemeris'

            if (strmatch(data_product_name,'th[a-e]_or_ssc') eq 1) then cdaweb_mission_instrument_name_list='Ephemeris'

         endif else begin

            cdaweb_mission_instrument_name_list=cdaweb_mission_instrument_name_list(instrument_match(0))

         endelse

      endif

      if (data_product_name eq 'fast_hr_dcb') then cdaweb_mission_instrument_name_list="Magnetometer"

   endif else begin

      cdaweb_mission_instrument_name_list='InstrumentUnknown'

   endelse

   cdaweb_mission_instrument_id_list= $
      'spase://SMWG/Instrument/'+strjoin(strsplit(cdaweb_mission_name_smwg,'\',/extract))+'/'+cdaweb_mission_instrument_name_list

endif else begin

   cdaweb_mission_name_smwg='MissionUnknown'

   cdaweb_mission_instrument_name_list='InstrumentUnknown'

   cdaweb_mission_instrument_id_list='spase://SMWG/MissionUnknown/InstrumentUnknown'

endelse

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then cdaweb_mission_name_smwg="THEMIS\/Ground"

print,'POPULATE_NUMERICAL_DATA CDAWEB_Mission_Name_SMWG Final:',cdaweb_mission_name_smwg,format='(a-73,a/)'

if (n_elements(logical_source) gt 0) then cadence=cdaweb_spase_map_cadence(logical_source.text,data_product_cdf_info,project_program_dir)

if (strmatch(data_product_name,'th[a-e]_l2_esa') eq 1) then cadence='PT3S'

if (strmatch(data_product_name,'th[a-e]_l2_fbk') eq 1) then cadence='PT4S'

if (strmatch(data_product_name,'th[a-e]_l2_fft') eq 1) then cadence='PT0.0556S'

if (strmatch(data_product_name,'th[a-e]_l2_fit') eq 1) then cadence='PT3S'

if (strmatch(data_product_name,'th[a-e]_l2_mom') eq 1) then cadence='PT3S'

if (strmatch(data_product_name,'th[a-e]_l2_sst') eq 1) then cadence='PT3S'

if (strmatch(data_product_name,'ge_h0_epi') eq 1) then cadence='PT3S'

if (strmatch(strmid(data_product_name,0,21),'mms[1-4]_dsp_fast_l2_[eb]psd',/fold_case) eq 1) then cadence='PT2S'

if (strmatch(strmid(data_product_name,0,21),'mms[1-4]_dsp_slow_l2_[eb]psd',/fold_case) eq 1) then cadence='PT16S'

if (strmatch(strmid(data_product_name,0,20),'mms[1-4]_dsp_fast_l2_swd',/fold_case) eq 1) then cadence='PT1S'

if (strmatch(strmid(data_product_name,0,20),'mms[1-4]_edi_brst_l2_amb',/fold_case) eq 1) then cadence='PT0.0009765625S'

if (strmatch(strmid(data_product_name,0,24),'mms[1-4]_edi_brst_l2_amb-pm2',/fold_case) eq 1) then cadence='PT0.0009765625S'

if (strmatch(strmid(data_product_name,0,23),'mms[1-4]_edi_brst_l2_efield',/fold_case) eq 1) then cadence='PT0.0009765625S'

if (strmatch(strmid(data_product_name,0,19),'mms[1-4]_edi_brst_l2_q0',/fold_case) eq 1) then cadence='PT0.0078125S'

if (strmatch(strmid(data_product_name,0,20),'mms[1-4]_edi_srvy_l2_amb',/fold_case) eq 1) then cadence='PT0.03125S'

if (strmatch(strmid(data_product_name,0,24),'mms[1-4]_edi_srvy_l2_amb-pm2',/fold_case) eq 1) then cadence='PT0.03125S'

if (strmatch(strmid(data_product_name,0,23),'mms[1-4]_edi_srvy_l2_efield',/fold_case) eq 1) then cadence='PT5S'

if (strmatch(strmid(data_product_name,0,19),'mms[1-4]_edi_srvy_l2_q0',/fold_case) eq 1) then cadence='PT0.125S'

if (strmatch(strmid(data_product_name,0,20),'mms[1-4]_edp_brst_l2_dce',/fold_case) eq 1) then cadence='PT0.0001220703125S'

if (strmatch(strmid(data_product_name,0,21),'mms[1-4]_edp_brst_l2_hmfe',/fold_case) eq 1) then cadence='PT0.00001525878906S'

if (strmatch(strmid(data_product_name,0,22),'mms[1-4]_edp_brst_l2_scpot',/fold_case) eq 1) then cadence='PT0.0001220703125S'

if (strmatch(strmid(data_product_name,0,20),'mms[1-4]_edp_fast_l2_dce',/fold_case) eq 1) then cadence='PT0.03125S'

if (strmatch(strmid(data_product_name,0,22),'mms[1-4]_edp_fast_l2_scpot',/fold_case) eq 1) then cadence='PT0.03125S'

if (strmatch(strmid(data_product_name,0,23),'mms[1-4]_edp_fast_l2a_dce2d',/fold_case) eq 1) then cadence='PT0.03125S'

;f (strmatch(strmid(data_product_name,0,23),'mms[1-4]_edp_fast_l2a_dce2d',/fold_case) eq 1) then cadence='PT5S'

if (strmatch(strmid(data_product_name,0,20),'mms[1-4]_edp_slow_l2_dce',/fold_case) eq 1) then cadence='PT0.125S'

if (strmatch(strmid(data_product_name,0,22),'mms[1-4]_edp_slow_l2_scpot',/fold_case) eq 1) then cadence='PT0.125S'

if (strmatch(strmid(data_product_name,0,23),'mms[1-4]_edp_slow_l2a_dce2d',/fold_case) eq 1) then cadence='PT0.125S'

;f (strmatch(strmid(data_product_name,0,23),'mms[1-4]_edp_slow_l2a_dce2d',/fold_case) eq 1) then cadence='PT5S'

if (strmatch(strmid(data_product_name,0,22),'mms[1-4]_edp_srvy_l2_hfesp',/fold_case) eq 1) then cadence='PT16S'

if (strmatch(strmid(data_product_name,0,20),'mms[1-4]_scm_brst_l2_scb',/fold_case) eq 1) then cadence='PT0.0001220703125S'

if (strmatch(strmid(data_product_name,0,21),'mms[1-4]_scm_brst_l2_schb',/fold_case) eq 1) then cadence='PT0.0000610151563S'

if (strmatch(strmid(data_product_name,0,20),'mms[1-4]_scm_fast_l2_scf',/fold_case) eq 1) then cadence='PT0.03125S'

if (strmatch(strmid(data_product_name,0,20),'mms[1-4]_scm_slow_l2_scs',/fold_case) eq 1) then cadence='PT0.03125S'

if (strmatch(strmid(data_product_name,0,23),'mms[1-4]_scm_srvy_l2_scsrvy',/fold_case) eq 1) then cadence='PT0.03125S'

if (strmatch(strmid(data_product_name,0,20),'mms[1-4]_epd-eis_brst_l2',/fold_case) eq 1) then cadence='PT0.605S'

if (strmatch(strmid(data_product_name,0,20),'mms[1-4]_epd-eis_srvy_l2',/fold_case) eq 1) then cadence='PT2.42S'

if (strmatch(strmid(data_product_name,0,18),'mms[1-4]_feeps_brst_l2',/fold_case) eq 1) then cadence='PT0.3025S'

if (strmatch(strmid(data_product_name,0,17),'mms[1-4]_feeps_raw_l2',/fold_case) eq 1) then cadence='PT0.3025S'

if (strmatch(strmid(data_product_name,0,18),'mms[1-4]_feeps_srvy_l2',/fold_case) eq 1) then cadence='PT2.42S'

if (data_product_name eq 'fast_hr_dcb') then cadence='PT0.0078125S'

stop_date_time='23:59:59.999'

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

   if (cadence eq 'PT0.5S') then cadence_resource_name='0.5 s'

   if (cadence eq 'PT1S') then cadence_resource_name='1.0 s'

   if (cadence eq 'PT10S') then cadence_resource_name='10.0 s'

   if (cadence eq 'PT20S') then cadence_resource_name='20.0 s'

   if (cadence eq 'PT60S') then cadence_resource_name='1.0 min'

   if (cadence eq 'PT1M') then cadence_resource_name='1.0 min'

   if (cadence eq 'PT0.5S') then stop_date_time='23:59:59.500'

   if (cadence eq 'PT1S') then stop_date_time='23:59:59.000'

   if (cadence eq 'PT10S') then stop_date_time='23:59:50.000'

   if (cadence eq 'PT20S') then stop_date_time='23:59:40.000'

   if (cadence eq 'PT60S') then stop_date_time='23:59:00.000'

   if (cadence eq 'PT1M') then stop_date_time='23:59:00.000'

endif

if (n_elements(cadence) eq 0) then cadence=''

if (data_product_name_upper_mask ne -1) then begin

   cadence_raw=strtrim(strcompress(cdaweb_master_notes.time_resolution),2)

   command='echo "'+cadence_raw+'" | sed -f '+project_program_dir+'cdf_global_variable_list_time_resolution.sed'

   spawn,command,cadence,error

endif

print,'POPULATE_NUMERICAL_DATA Cadence:',cadence,format='(a-73,a/)'

;
;  THEMIS Ground Magnetometer Metadata Error Check
;

station_code=''

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

   split=strsplit(data_product_name,'_',/extract)

   station_code=strupcase(split(3))

   command='echo "'+descriptor.text+'"'+" | sed 's/&gt;/>/g' | sed -f '+project_program_dir+'global_attribute_descriptor.sed | sed 's/>/\&gt;/g'"

   spawn,command,cdaweb_descriptor,error

   descriptor.text=cdaweb_descriptor

   split=strsplit(descriptor.text,'&gt;',/extract,/regex)

   station_code_check=split(0)

   if (station_code ne station_code_check) then $
      print,'Warning, possible Station Code mismatch:'+station_code+' <---> '+station_code_check,format='(a-73,a/)'

   split=strsplit(split(1),',',/extract)

   cdaweb_mission_instrument_name_list=strtrim(split(0)+'/Magnetometer',2)

   command='echo "'+cdaweb_mission_instrument_name_list+'" | sed -f '+project_program_dir+'global_attribute_thg_l2_mag.sed'

   spawn,command,cdaweb_mission_instrument_name_list,error

   cdaweb_mission_instrument_name_list=string_condition(cdaweb_mission_instrument_name_list,' ','.')

   cdaweb_mission_instrument_id_list='spase://SMWG/Instrument/Ground/'+cdaweb_mission_instrument_name_list

endif

print,'POPULATE_NUMERICAL_DATA CDAWEB_Mission_Instrument_Name_List:',cdaweb_mission_instrument_name_list,format='(a-73,a/)'

print,'POPULATE_NUMERICAL_DATA CDAWEB_Mission_Instrument_ID_List:',cdaweb_mission_instrument_id_list,format='(a-73,a/)'

numerical_data.resource_id='spase://NASA/NumericalData/'+strjoin(strsplit(cdaweb_mission_name_smwg,'\',/extract))+'/'+cdaweb_mission_instrument_name_list(0)+'/'+cadence

if (data_product_name eq 'thg_l1_ask') then $
   numerical_data.resource_id='spase://NASA/NumericalData/THEMIS/Ground/ASK/PT3S'

;f (data_product_name eq 'thg_l2_mag_pg1') then $
;  numerical_data.resource_id='spase://NASA/NumericalData/THEMIS/Ground/PENGUIn.1/Magnetometer/PT1S'

;f (data_product_name eq 'thg_l2_mag_pg2') then $
;  numerical_data.resource_id='spase://NASA/NumericalData/THEMIS/Ground/PENGUIn.2/Magnetometer/PT1S'

if (strmatch(strmid(data_product_name,0,7),"th[a-g]_l1_",/fold_case) eq 1) then begin

   themis_l1_info_file_name=project_program_dir+'themis_level_one.tab'

   themis_l1_info_exist_flag=0

   themis_l1_info=read_tab_table(themis_l1_info_file_name,themis_l1_info_exist_flag,/verbose)

   themis_l1_info_mask=where(themis_l1_info.table.data_product eq data_product_name,themis_l1_info_mask_num)

   if (themis_l1_info_mask(0) ne -1) then $
      numerical_data.resource_id='spase://NASA/NumericalData/'+themis_l1_info.table(themis_l1_info_mask).resource_id

endif else begin

   themis_l1_info_mask=-1

endelse

print,'POPULATE_NUMERICAL_DATA Numerical_Data.Resource_ID Unknown Match Count:',strtrim(string(fix(strmatch(numerical_data.resource_id,'*Unknown*'))),2),format='(a-73,a/)'

if (strmatch(numerical_data.resource_id,'*Unknown*') eq 1) then $
   numerical_data.resource_id='spase://NASA/NumericalData/'+strjoin(strsplit(cdaweb_mission_name_smwg,'\',/extract))+'/'+cdaweb_mission_instrument_name_list(0)+'/'+cadence

print,'POPULATE_NUMERICAL_DATA Numerical_Data.Resource_ID Raw:',numerical_data.resource_id,format='(a-73,a/)'

command='numerical_data_info.com '+project_program_dir+' '+data_product_name+' '+date_style+' RESOURCE_ID'

spawn,command,resource_id,error

help,resource_id

print,''

numerical_data.resource_id=resource_id

if (data_product_name eq 'co_rpws_hfr_qtn') then numerical_data.resource_id='spase://ESA/NumericalData/Cassini/RPWS/HFR/QuasiThermalNoise/PT16S'

command='numerical_data_info.com '+project_program_dir+' '+data_product_name+' '+date_style+' START_DATE'

spawn,command,start_date,error

command='numerical_data_info.com '+project_program_dir+' '+data_product_name+' '+date_style+' STOP_DATE'

spawn,command,stop_date,error

command='numerical_data_info.com '+project_program_dir+' '+data_product_name+' '+date_style+' ACCESS_URL'

spawn,command,access_url,error

print,'POPULATE_NUMERICAL_DATA Numerical_Data.Resource_ID Final:',numerical_data.resource_id,format='(a-73,a/)'

;
;  CDAWEB CDF to SPASE Resource Name Mapping
;

if (n_elements(logical_source_description) gt 0) then begin

   if (logical_source_description.text ne '') then begin

      cdaweb_resource_name=logical_source_description.text

   endif else begin

      if (title.text ne '') then begin

         cdaweb_resource_name=title.text

      endif else begin

         cdaweb_resource_name='No Information in Logical_source_description'   ;  HELP

      endelse

   endelse

endif else begin

   cdaweb_resource_name=''

endelse

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then cdaweb_resource_name=strtrim(descriptor.text,2)

numerical_data.resource_header.resource_name=cdaweb_resource_name

if (data_product_name_upper_mask ne -1) then numerical_data.resource_header.resource_name=resource_name_text

print,'POPULATE_NUMERICAL_DATA Numerical_Data.Resource_Header.Resource_Name:',numerical_data.resource_header.resource_name,format='(a//a/)'

numerical_data.resource_header.alternate_name=''

numerical_data.resource_header.doi=''

numerical_data.resource_header.release_date=resource_info.release_date

numerical_data.resource_header.expiration_date=''

full_text=text.text(0)

for loop=1,text.record_num-1 do begin

    full_text=full_text+string(10B)+text.text(loop)

;   print,'Full Text: ',text.text(loop)

endfor

;or loop=1,text.record_num-1 do full_text=full_text+string(10B)+'                      '+text.text(loop)

full_text_barrel=full_text

;ull_text=string_condition(full_text,'&','and')

if (n_elements(descriptor) gt 0) then begin

   descriptor_char_num=strlen(descriptor.text)

   if (descriptor_char_num gt 0) then begin

      if (data_product_name ne 'fast_hr_dcb') then begin

         numerical_data.resource_header.description=full_text

;        numerical_data.resource_header.description=descriptor.text+string(10B)+'                      '+full_text

      endif else begin

         numerical_data.resource_header.description=full_text

      endelse

   endif else begin

      numerical_data.resource_header.description=full_text

   endelse

endif

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

   split=strsplit(descriptor.text,'&gt;',/extract,/regex)

   split=strsplit(split(1),',',/extract)

   command='echo "'+split(0)+'" | sed -f '+project_program_dir+'global_attribute_thg_l2_mag.sed'

   spawn,command,cdaweb_descriptor,error

;  numerical_data.resource_header.resource_name=strtrim(cdaweb_descriptor+' Vector Magnetic Field '+cadence_resource_name+' Data',2)

;  if (data_product_name eq 'thg_l2_mag_pg1') then $
;     numerical_data.resource_header.resource_name='PENGUIn-1 Vector Magnetic Field Data'

;  if (data_product_name eq 'thg_l2_mag_pg2') then $
;     numerical_data.resource_header.resource_name='PENGUIn-2 Vector Magnetic Field Data'

   command='echo "'+logical_source_description.text+'" | sed -f '+project_program_dir+'global_attribute_logical_source_description.sed'

   spawn,command,cdaweb_logical_source_description,error

;  if (data_product_name eq 'thg_l2_mag_amk') then $
;     cdaweb_logical_source_description='Higher latitude chain (Lat 70.4, Long 338.0), Ground-based vector magnetic field at Tasiilaq, Greenland, 1 min, DTU Network'

;  if (data_product_name eq 'thg_l2_mag_ykc') then $
;     cdaweb_logical_source_description='Higher latitude chain (Lat 62.5, Long 245.5), Ground-based vector magnetic field at Yellowknife, Canada, 1 s'

   string_match_index=strpos(cdaweb_logical_source_description,'Ground')

   string_length=strlen(cdaweb_logical_source_description)

   cdaweb_logical_source_description= $
      strmid(cdaweb_logical_source_description,string_match_index,string_length-string_match_index+1)+', '+ $
      strmid(cdaweb_logical_source_description,0,string_match_index-2)+'. Station Code: '+station_code+'.'

   if (station_code eq 'PG1') then begin

      command='echo "'+cdaweb_logical_source_description+'" | sed '+"'s/Ground-based vector magnetic field in Antarctica,/Ground-based vector magnetic field at PENGUIn-1, Antarctica, 1 sec,/'"

      spawn,command,cdaweb_logical_source_description,error

   endif

   if (station_code eq 'PG2') then begin

      command='echo "'+cdaweb_logical_source_description+'" | sed '+"'s/Ground-based vector magnetic field in Antarctica,/Ground-based vector magnetic field at PENGUIn-2, Antarctica, 1 sec,/'"

      spawn,command,cdaweb_logical_source_description,error

   endif

   command='echo "'+cdaweb_logical_source_description+'" | sed '+"'s/ min,/ min, Level-2 data,/' | sed ' s/ sec,/ sec, Level-2 data,/' | sed '/Red Deer/s/Lat 54.7, Long 246.7/Lat 52.1, Long 246.2/' | sed '/Tasiilaq/s/Lat 70.4, Long 338.0/Lat 65.6, Long 322.4/' | sed '/data, Higher/s/data,/data, CANMON Network,/' | sed 's/ sec,/ s,/'"

   spawn,command,cdaweb_logical_source_description,error

   cdaweb_logical_source_description=strjoin(strsplit(cdaweb_logical_source_description,'\.\,\ \.\ ',/regex,/extract),'. ')

   numerical_data.resource_header.description=cdaweb_logical_source_description

   split=strsplit(cdaweb_logical_source_description,',',/extract)

   split=strsplit(split(0),'()',/extract)

   split_num=n_elements(split)

   if (split_num eq 2) then numerical_data.resource_header.alternate_name=split(1)+' Vector Magnetic Field '+cadence_resource_name+' Data'

endif

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then $
   numerical_data.resource_header.description= $
      strtrim(strcompress(cdaweb_master_notes.mission_name))+ $
      ', Ground-based Vector Magnetic Field '+ $
      strtrim(strcompress(cdaweb_master_notes.processing_level))+' Data, '+ $
      strtrim(strcompress(cdaweb_master_notes.time_resolution))+ $
      ' Time Resolution, Station Code: ('+ $
      strtrim(strcompress(cdaweb_master_notes.instrument_acronym))+'), '+ $
      location_text

if (strmatch(strmid(data_product_name,0,11),'mms[1-4]_aspoc_',/fold_case) eq 1) then $
   numerical_data.resource_header.description=mms_aspoc_description(data_product_name)

if (strmatch(strmid(data_product_name,0,9),'mms[1-4]_dsp_',/fold_case) eq 1) then $
   numerical_data.resource_header.description=mms_dsp_description(data_product_name)

if (strmatch(strmid(data_product_name,0,9),'mms[1-4]_fgm_',/fold_case) eq 1) then $
   numerical_data.resource_header.description=mms_fgm_description(data_product_name)

if (strmatch(strmid(data_product_name,0,9),'mms[1-4]_mec_',/fold_case) eq 1) then $
   numerical_data.resource_header.description=mms_mec_description(data_product_name)

if (strmatch(strmid(data_product_name,0,9),'mms[1-4]_scm_',/fold_case) eq 1) then $
   numerical_data.resource_header.description=mms_scm_description(data_product_name)

if (strmatch(strmid(data_product_name,0,10),'mms[1-4]_hpca_',/fold_case) eq 1) then $
   numerical_data.resource_header.description=mms_hpca_description(data_product_name)

if (strmatch(strmid(data_product_name,0,9),'mms[1-4]_edi_',/fold_case) eq 1) then $
   numerical_data.resource_header.description=mms_edi_description(data_product_name)

if (strmatch(strmid(data_product_name,0,9),'mms[1-4]_edp_',/fold_case) eq 1) then $
   numerical_data.resource_header.description=mms_edp_description(data_product_name)

if (strmatch(strmid(data_product_name,0,13),'mms[1-4]_epd-eis_',/fold_case) eq 1) then $
   numerical_data.resource_header.description=mms_epd_eis_description(data_product_name)

if (strmatch(strmid(data_product_name,0,11),'mms[1-4]_feeps_',/fold_case) eq 1) then $
   numerical_data.resource_header.description=mms_feeps_description(data_product_name)

if (strmatch(strmid(data_product_name,0,9),'mms[1-4]_fpi_',/fold_case) eq 1 and $
    strmatch(data_product_name,'mms[1-4]_fpi_[bf][ar]st_l2_d[ei]s-partmoms',/fold_case) ne 1) then $
   numerical_data.resource_header.description=mms_fpi_description(data_product_name)

;f (strmatch(strmid(data_product_name,0,4),'rbsp',/fold_case) eq 1) then $
;  numerical_data.resource_header.description=numerical_data.resource_header.resource_name

if (strmatch(strmid(data_product_name,0,3),'bar',/fold_case) eq 1) then $
   numerical_data.resource_header.description=full_text_barrel

numerical_data.resource_header.resource_name=strjoin(strsplit(numerical_data.resource_header.resource_name,' \(\) ',/extract,/regex),', ')

print,'POPULATE_NUMERICAL_DATA Numerical_Data.Resource_Header.Description:',numerical_data.resource_header.description,format='(a//a/)'

;
;  CDAWEB CDF to SPASE Person Name Mapping
;

if (data_product_name_upper_mask ne -1) then $
   pi_name.text=strtrim(strcompress(cdaweb_master_notes.pi_name),2)

if (n_elements(pi_name) gt 0) then begin

   pi_name.text=strjoin(strtrim(strsplit(pi_name.text,' and ',/extract,/regex),2),', ')

   pi_name.text=strjoin(strtrim(strsplit(pi_name.text,'/',/extract,/regex),2),', ')

   help,pi_name.text

   print,'OOPS',format='(/a/)'

   pi_name_split=strtrim(strsplit(pi_name.text,',&',/extract),2)

   pi_name_split_num=n_elements(pi_name_split)

   help,pi_name.text

   help,pi_name_split_num

   print,'OOPS',format='(/a/)'

   cdaweb_person_resource_id_list_save=make_array(pi_name_split_num,/string,value='')

   for loop=0,pi_name_split_num-1 do begin

       print,pi_name_split(loop)

       print,project_program_dir

       command="echo '"+pi_name_split(loop)+"' | sed -f "+project_program_dir+"global_attribute_pi_name_to_person_resource_id.sed | grep SMWG"

       if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then $
          command=command+' | sed -f '+project_program_dir+'thg_l2_mag_pi_name.sed'

       spawn,command,pi_name_split_temp,error

       print,pi_name_split_temp

       cdaweb_person_resource_id_list_save(loop)=pi_name_split_temp

   endfor

   print,''

   pi_name.text=string_condition(pi_name.text,'&','and')

   cdaweb_person_resource_id_list=cdaweb_person_resource_id_list_save

   cdaweb_person_resource_id_list_num=n_elements(cdaweb_person_resource_id_list)

   cdaweb_person_resource_id_list_mask=make_array(cdaweb_person_resource_id_list_num,/integer,/index)

   cdaweb_person_name_list=pi_name_split

   cdaweb_person_name_list_num=n_elements(cdaweb_person_name_list)

   cdaweb_person_name_list_mask=make_array(cdaweb_person_name_list_num,/integer,/index)

endif else begin

   cdaweb_person_resource_id_list=''

   cdaweb_person_name_list_num=0

   cdaweb_person_resource_id_list_mask=0

   cdaweb_person_resource_id_list_num=1

endelse

print,'POPULATE_NUMERICAL_DATA CDAWEB_Person_Resource_ID_List:',cdaweb_person_resource_id_list,format='(a-73,a/)'

command=''

if (strmatch(data_product_name,'fast_hr_dcb',/fold_case) eq 1) then $
   command='echo "'+acknowledgement.text+'" | sed -f '+project_program_dir+'global_attribute_acknowledgement.sed'

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then $
   command=command+' | sed -f '+project_program_dir+'global_attribute_thg_l2_mag_acknowledgement.sed'

if (command ne '') then begin

   spawn,command,cdaweb_acknowledgement,error

endif else begin

   cdaweb_acknowledgement=''

endelse

cdaweb_acknowledgement=strtrim(cdaweb_acknowledgement,2)

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

   numerical_data.resource_header.acknowledgement=cdaweb_acknowledgement

   if (data_product_name_upper_mask ne -1) then numerical_data.resource_header.acknowledgement=acknowledgement_text

;  command='find /Users/astropooch/Desktop/HOFFMAN/130103_VXO_NO_GIT/DRAFT/NASA/NumericalData/THEMIS/Ground | grep '+station_code+' | grep -v ASI | grep xml'

;  spawn,command,prior_file_name,error

;  if (prior_file_name ne '') then begin

;     command='grep -hr "<Acknowledgement>" '+prior_file_name+' | head -1 | '+ $
;             "sed 's/\ *<Acknowledgement>//' | sed 's/<\/Acknowledgement>//' | sed 's/:S/: S/' | sed 's/^We /Please /' | sed 's/Erik S. Steinmetz, Dr. Erik Steinmetz/Erik S. Steinmetz/'"

;     spawn,command,prior_acknowledgement,error

;     if (prior_acknowledgement ne '') then numerical_data.resource_header.acknowledgement=prior_acknowledgement

;  endif else begin

     prior_acknowledgement=''

;  endelse

   command='echo "'+pi_affiliation.text+'" | sed -f '+project_program_dir+'global_attribute_thg_l2_mag.sed'

   spawn,command,cdaweb_pi_affiliation,error

endif

if (n_elements(rules_of_use) gt 0) then begin

   rules_of_use.text=rules_of_use.text+'.'

   command='echo "'+rules_of_use.text+'" | sed -f '+project_program_dir+'global_attribute_rules_of_use.sed'

   spawn,command,cdaweb_rules_of_use,error

endif

if (cdaweb_person_name_list_num gt 0) then begin

   if (numerical_data.resource_header.acknowledgement ne '') then begin

      cdaweb_person_name_list_concat=strjoin(cdaweb_person_name_list,', ')

      cdaweb_person_name_list_concat_char_num=strlen(cdaweb_person_name_list_concat)-2

      print,'CDAWEB_PERSON_NAME_LIST:'

      print,''

      print,cdaweb_person_name_list

      print,''

      if (strmid(cdaweb_person_name_list_concat,0,cdaweb_person_name_list_concat_char_num) ne $
          strmid(numerical_data.resource_header.acknowledgement,0,cdaweb_person_name_list_concat_char_num) and $
          prior_acknowledgement eq '') then $
            if (strmatch(numerical_data.resource_header.acknowledgement,'*Erik Steinmetz',/fold_case) ne 1) then $
               numerical_data.resource_header.acknowledgement= $
                  'Please acknowledge the Principal Investigator '+strjoin(cdaweb_person_name_list,': ')+', '+numerical_data.resource_header.acknowledgement

   endif else begin

      if (data_product_name ne 'fast_hr_dcb') then begin

         if (cdaweb_acknowledgement eq '' and acknowledgement.text ne '') then cdaweb_acknowledgement=acknowledgement.text

         cdaweb_person_name_list_concat=strjoin(strsplit(strjoin(cdaweb_person_name_list,', '),' & ',/extract,/regex),' and ')

         cdaweb_person_name_list_num=n_elements(cdaweb_person_name_list)

         if (cdaweb_person_name_list_num eq 1) then begin

            cdaweb_person_name_list_concat=cdaweb_person_name_list

         endif else begin

            if (cdaweb_person_name_list_num eq 2) then begin

               cdaweb_person_name_list_concat=strjoin(cdaweb_person_name_list,' and ')

            endif else begin

               cdaweb_person_name_list_concat=strjoin(cdaweb_person_name_list(0:cdaweb_person_name_list_num-2),', ')+ $
                                              ', and '+cdaweb_person_name_list(cdaweb_person_name_list_num-1)

            endelse

         endelse

         cdaweb_person_name_list_concat_char_num=strlen(cdaweb_person_name_list_concat)

         if (cdaweb_acknowledgement eq '') then begin

            if (rules_of_use_full_text eq '') then begin

               numerical_data.resource_header.acknowledgement='Please acknowledge the Principal Investigator '+cdaweb_person_name_list_concat+' for use of the Data'

            endif else begin

               numerical_data.resource_header.acknowledgement='Please acknowledge the Principal Investigator '+cdaweb_person_name_list_concat+' for use of the Data. '+string(10B)+string(10B)+rules_of_use_full_text

            endelse

         endif else begin

            if (strmid(cdaweb_person_name_list_concat,0,cdaweb_person_name_list_concat_char_num) ne $
                strmid(cdaweb_acknowledgement,0,cdaweb_person_name_list_concat_char_num)) then begin

               if (strtrim(cdaweb_rules_of_use,2) ne '') then begin

                  numerical_data.resource_header.acknowledgement=strtrim(cdaweb_acknowledgement+'. '+cdaweb_rules_of_use,2)

               endif else begin

                  numerical_data.resource_header.acknowledgement=strtrim(cdaweb_acknowledgement,2)

               endelse

            endif else begin

               if (strtrim(cdaweb_rules_of_use,2) ne '') then begin

                  numerical_data.resource_header.acknowledgement=strtrim(cdaweb_acknowledgement+' '+cdaweb_rules_of_use+' XXX why XXX',2)

               endif else begin

                  numerical_data.resource_header.acknowledgement=strtrim(cdaweb_acknowledgement+'.',2)

               endelse

            endelse

         endelse

      endif else begin

        numerical_data.resource_header.acknowledgement=strtrim(cdaweb_acknowledgement+' '+cdaweb_rules_of_use,2)

      endelse

   endelse

endif

numerical_data.resource_header.acknowledgement=strtrim(numerical_data.resource_header.acknowledgement,2)

if (numerical_data.resource_header.acknowledgement eq 'D. Baker') then $
   numerical_data.resource_header.acknowledgement= $
      'Please acknowledge the Principal Investigator, Daniel N. Baker, from the Laboratory of Atmospheric and Space Physics, Science Data Center (LASP, SDC), University of Colorado, Boulder for providing the Data.'

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then $
   numerical_data.resource_header.acknowledgement=acknowledgement_text

print,'POPULATE_NUMERICAL_DATA Numerical_Data.Resource_Header.Acknowledgement:',numerical_data.resource_header.acknowledgement,format='(a-73,a/)'

numerical_data.resource_header.publication_info.authors=''

numerical_data.resource_header.publication_info.publication_date=''

numerical_data.resource_header.publication_info.published_by=''

if (strmatch(strmid(data_product_name,0,4),'bar_') eq 1) then begin

   doi_lookup_barrel_file_name=project_program_dir+'doi_lookup_barrel.tab'

   doi_lookup_barrel=read_tab_table(doi_lookup_barrel_file_name,exist_flag,/verbose,/compress)

   doi_lookup_barrel=doi_lookup_barrel.table

   data_product_name_mask=where(data_product_name_lower eq doi_lookup_barrel.data_product_name,data_product_name_mask_num)

   if (data_product_name_mask ne -1) then begin

      doi_lookup_barrel=doi_lookup_barrel(data_product_name_mask)

      numerical_data.resource_header.doi=doi_lookup_barrel.doi

      numerical_data.resource_header.publication_info.authors=doi_lookup_barrel.authors

      numerical_data.resource_header.publication_info.publication_date=doi_lookup_barrel.publication_date

      numerical_data.resource_header.publication_info.published_by=doi_lookup_barrel.published_by

   endif

endif

numerical_data.resource_header.funding.agency=''

numerical_data.resource_header.funding.project=''

numerical_data.resource_header.funding.award_number=''

numerical_data.resource_header.contact(cdaweb_person_resource_id_list_mask).person_id='spase://'+cdaweb_person_resource_id_list

if (strmatch(data_product_name,"goes*_ephemeris_ssc",/fold_case) eq 1) then begin

   numerical_data.resource_header.contact(cdaweb_person_resource_id_list_mask).role(0)=role_list(9)

   numerical_data.resource_header.contact(cdaweb_person_resource_id_list_mask).role(1)=role_list(12)

endif else begin

   numerical_data.resource_header.contact(cdaweb_person_resource_id_list_mask).role(0)=role_list(15)

endelse

if (strmatch(strmid(data_product_name,0,8),"erg_orb_",/fold_case) eq 1) then begin

   numerical_data.resource_header.contact(0).role(0)=role_list(19)

   numerical_data.resource_header.contact(1).role(0)=role_list(20)

   numerical_data.resource_header.contact(2).role(0)=role_list(10)

   numerical_data.resource_header.contact(2).note='ERG Science Center, ERG SC, Point of Contact for Arase (ERG) Satellite Ephemeris Data'

endif

numerical_data.resource_header.contact(cdaweb_person_resource_id_list_mask).start_date=''

numerical_data.resource_header.contact(cdaweb_person_resource_id_list_mask).stop_date=''

numerical_data.resource_header.contact(cdaweb_person_resource_id_list_mask).note=''

if (strmatch(data_product_name,"goes*_ephemeris_ssc",/fold_case) eq 1) then begin

   numerical_data.resource_header.contact(1).person_id='spase://SMWG/Person/Leslie.Anita.Woodger'

   numerical_data.resource_header.contact(2).person_id='spase://SMWG/Person/Michael.P.McCarthy'

   numerical_data.resource_header.contact(3).person_id='spase://SMWG/Person/John.G.Sample'

   numerical_data.resource_header.contact(4).person_id='spase://SMWG/Person/David.M.Smith'

   numerical_data.resource_header.contact(5).person_id='spase://SMWG/Person/Warren.Z.Rexroad'

   numerical_data.resource_header.contact(1:4).role(0)=role_list(4)

   numerical_data.resource_header.contact(5).role(0)=role_list(25)

   numerical_data.resource_header.contact(1:5).start_date=''

   numerical_data.resource_header.contact(1:5).stop_date=''

   numerical_data.resource_header.contact(1:5).note=''

   cdaweb_person_resource_id_list_num=6

endif

if (strmatch(data_product_name,"goes*_ephemeris_ssc",/fold_case) eq 1) then begin

   numerical_data.resource_header.contact(cdaweb_person_resource_id_list_num).person_id='spase://SMWG/Person/Robert.M.Candey'

   numerical_data.resource_header.contact(cdaweb_person_resource_id_list_num).role(0)=role_list(12)

   numerical_data.resource_header.contact(cdaweb_person_resource_id_list_num).start_date=''

   numerical_data.resource_header.contact(cdaweb_person_resource_id_list_num).stop_date=''

   numerical_data.resource_header.contact(cdaweb_person_resource_id_list_num).note=''

endif

;f (data_product_name eq 'co_rpws_hfr_qtn' and numerical_data.resource_header.contact(1).person_id eq 'spase://SMWG/Person/Baptiste.Cecconi') then $
;  numerical_data.resource_header.contact(1).role(0)=role_list(5)

;
;  James M. Weygand for NOAA NGDC GOES
;

;umerical_data.resource_header.contact(cdaweb_person_resource_id_list_num).person_id='spase://SMWG/Person/James.M.Weygand'

;umerical_data.resource_header.contact(cdaweb_person_resource_id_list_num).role(0)=role_list(12)

;umerical_data.resource_header.contact(cdaweb_person_resource_id_list_num).start_date=''

;umerical_data.resource_header.contact(cdaweb_person_resource_id_list_num).stop_date=''

;umerical_data.resource_header.contact(cdaweb_person_resource_id_list_num).note=''

help,cdaweb_person_resource_id_list_num

print,''

help,numerical_data.resource_header,/structure

print,''

help,numerical_data.resource_header.contact,/structure

print,''

help,cdaweb_person_resource_id_list_num,/structure

print,''

numerical_data.resource_header.contact(0).person_id='spase://SMWG/Person/David.J.McComas'

numerical_data.resource_header.contact(cdaweb_person_resource_id_list_num+1).person_id='spase://SMWG/Person/Lee.Frost.Bargatze'

numerical_data.resource_header.contact(cdaweb_person_resource_id_list_num+1).role(0)=role_list(12)

numerical_data.resource_header.contact(cdaweb_person_resource_id_list_num+1).start_date=''

numerical_data.resource_header.contact(cdaweb_person_resource_id_list_num+1).stop_date=''

numerical_data.resource_header.contact(cdaweb_person_resource_id_list_num+1).note=''

if (strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) then begin

   numerical_data.resource_header.contact(1:2).role(0)=role_list(9)

   numerical_data.resource_header.contact(1:2).start_date=''

   numerical_data.resource_header.contact(1:2).stop_date=''

   numerical_data.resource_header.contact(1:2).note=''

   numerical_data.resource_header.contact(3).role(0)=role_list(12)

   numerical_data.resource_header.contact(3).start_date=''

   numerical_data.resource_header.contact(3).stop_date=''

   numerical_data.resource_header.contact(3).note=''

endif

if (strmatch(data_product_name,"*_helio1day_position",/fold_case) eq 1) then numerical_data.resource_header.contact(0).role(0)=role_list(9)

;
;  THEMIS Ground Magnetometer Metadata Error Correction
;
;  if (strmatch(strmid(data_product_name,0,14),'thg_l2_mag_amk',/fold_case) eq 1) then link_text.text='Main menu: data access'
;
;  if (strmatch(strmid(data_product_name,0,14),'thg_l2_mag_amk',/fold_case) eq 1) then cdaweb_link_title='Tromso Geophysical Observatory'
;
;  if (strmatch(strmid(data_product_name,0,14),'thg_l2_mag_sco',/fold_case) eq 1) then cdaweb_link_title='Tromso Geophysical Observatory'
;

if (n_elements(link_title) gt 0) then begin

   for information_url_loop=0,link_title.record_num-1 do begin

       command='echo "'+link_title.text(information_url_loop)+'" | sed -f '+project_program_dir+'global_attribute_link_title.sed'

       spawn,command,cdaweb_link_title,error

       numerical_data.resource_header.information_url(information_url_loop).name=strtrim(cdaweb_link_title,2)

       command='echo "'+http_link.text(information_url_loop)+'"'
;              +' | sed -f '+project_program_dir+'global_attribute_http_link.sed'

       spawn,command,cdaweb_http_link,error

       string_length=strlen(cdaweb_http_link)

       if (strmid(cdaweb_http_link,string_length-1,1) eq '/') then $
          cdaweb_http_link=strmid(cdaweb_http_link,0,string_length-1)

       spawn,command,cdaweb_http_link,error

       numerical_data.resource_header.information_url(information_url_loop).url=strtrim(cdaweb_http_link,2)

       command='echo "'+link_text.text(information_url_loop)+'" | sed -f '+project_program_dir+'global_attribute_link_text.sed'

       spawn,command,cdaweb_link_text,error

       numerical_data.resource_header.information_url(information_url_loop).description=strtrim(cdaweb_link_text,2)

       if (numerical_data.resource_header.information_url(information_url_loop).url eq 'http://themis.ssl.berkeley.edu/gmag_desc.shtml') then $
          numerical_data.resource_header.information_url(information_url_loop).name='THEMIS Ground-based Observatory (GBO) Network Information Web Site'

       if (numerical_data.resource_header.information_url(information_url_loop).name eq 'THEMIS Ground-based Observatory (GBO) Magnetic Field Data Portal') then $
          numerical_data.resource_header.information_url(information_url_loop).description='THEMIS Ground-based Observatory (GBO) MAGnetometers (GMAGs)'

       print,'Info URL Name: '+numerical_data.resource_header.information_url(information_url_loop).name,format='(a/)'

       numerical_data.resource_header.information_url(information_url_loop).language='en'

   endfor

endif

numerical_data.resource_header.association.association_id=''

numerical_data.resource_header.association.association_type=''

numerical_data.resource_header.association.note=''

prior_id=''

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

   command='grep -hr PriorID /Users/astropooch/Desktop/HOFFMAN/130103_VXO_NO_GIT/DRAFT/NASA/NumericalData/THEMIS/Ground | grep '+station_code+" | sed 's/\ *<PriorID>//' | sed 's/<\/PriorID>//'"

   spawn,command,prior_id,error

endif

if (data_product_name eq 'ac_k1_swe') then prior_id='spase://NASA/NumericalData/ACE/SWEPAM/PT1H'

if (data_product_name eq 'cl_jp_pcy') then prior_id='spase://NASA/NumericalData/Cluster/Ephemeris/JP-PGP/PT1M'

vxo_directory=project_program_dir+'VXO/20200519'

command='/Users/astropooch/bin/spase_xml_prior_id.com '+data_product_name+' '+vxo_directory+' '+numerical_data.resource_id

print,'Command:       '+command,format='(a/)'

spawn,command,prior_id,error

prior_id_mask=where(prior_id ne '',prior_id_mask_num)

print,'Prior ID Num:  '+strtrim(string(prior_id_mask_num),2),format='(a/)'

if (prior_id_mask_num gt 0) then begin

   prior_id=prior_id(prior_id_mask)

   numerical_data.resource_header.prior_id(0:prior_id_mask_num-1)='spase://'+prior_id

   for loop=0,prior_id_mask_num-1 do print,'Prior ID:      '+prior_id(loop)

   print,''

endif

if (strmatch(strmid(data_product_name,0,4),'erg_',/fold_case) ne 1) then begin

   access_information_spdf_num=0

endif else begin

   access_information_spdf_num=1

endelse

numerical_data.access_information(access_information_spdf_num).repository_id='spase://SMWG/Repository/NASA/GSFC/SPDF'

numerical_data.access_information(access_information_spdf_num).availability=availability_list(2)

numerical_data.access_information(access_information_spdf_num).access_rights=access_rights_list(1)

if (strmatch(strmid(data_product_name,0,14),'thg_l2_mag_dnb',/fold_case) eq 1) then $
   access_url=strsplit(access_url,'/2007',/extract,/regex)

command='grep "'+strlowcase(data_product_name)+'	'+date_style+'	" '+project_program_dir+"/data_product_access_url_map_all.tab | awk '{ print $3 }'"

help,project_program_dir

print,''

spawn,command,access_url,error

if (access_url eq '') then access_url='UNKNOWN'

numerical_data.access_information(access_information_spdf_num).access_url(0).name='FTPS from SPDF (not with most browsers)'

numerical_data.access_information(access_information_spdf_num).access_url(0).url='ftps://spdf.gsfc.nasa.gov/'+access_url

numerical_data.access_information(access_information_spdf_num).access_url(0).style=''

numerical_data.access_information(access_information_spdf_num).access_url(0).product_key=''

numerical_data.access_information(access_information_spdf_num).access_url(0).description='Access to Data in CDF Format via ftps from SPDF'

numerical_data.access_information(access_information_spdf_num).access_url(1).name='HTTPS from SPDF'

numerical_data.access_information(access_information_spdf_num).access_url(1).url='https://spdf.gsfc.nasa.gov/'+access_url

numerical_data.access_information(access_information_spdf_num).access_url(1).style=''

numerical_data.access_information(access_information_spdf_num).access_url(1).product_key=''

numerical_data.access_information(access_information_spdf_num).access_url(1).description='Access to Data in CDF Format via https from SPDF'

numerical_data.access_information(access_information_spdf_num).access_url(2).name='CDAWeb'

numerical_data.access_information(access_information_spdf_num).access_url(2).url='https://cdaweb.gsfc.nasa.gov/cgi-bin/eval2.cgi?dataset='+data_product_name_upper+'&amp;index=sp_phys'

numerical_data.access_information(access_information_spdf_num).access_url(2).style=''

numerical_data.access_information(access_information_spdf_num).access_url(2).product_key=data_product_name_upper

numerical_data.access_information(access_information_spdf_num).access_url(2).description='Access to ASCII, CDF, and Plots via NASA/GSFC CDAWeb'

numerical_data.access_information(access_information_spdf_num).access_url.language=''

numerical_data.access_information(access_information_spdf_num).format=format_list(3)

numerical_data.access_information(access_information_spdf_num).encoding=encoding_list(5)

if (strmatch(strmid(data_product_name,0,4),'psp_') eq 1) then begin

   numerical_data.access_information(1).repository_id='spase://SMWG/Repository/NASA/GSFC/SPDF'

   numerical_data.access_information(1).availability=availability_list(2)

   numerical_data.access_information(1).access_rights=access_rights_list(1)

   numerical_data.access_information(1).access_url(0).name='CDAWeb HAPI Server'

   numerical_data.access_information(1).access_url(0).url='https://cdaweb.gsfc.nasa.gov/hapi'

   numerical_data.access_information(1).access_url(0).style=style_list(2)

   numerical_data.access_information(1).access_url(0).product_key=data_product_name_upper

   numerical_data.access_information(1).access_url(0).description='Web Service to this product using the HAPI interface.'

   numerical_data.access_information(1).format=format_list(7)

   numerical_data.access_information(1).acknowledgement= $
      strjoin(strsplit('Please acknowledge the Principal Investigator '+cdaweb_person_name_list_concat+'. Please acknowledge the Data Providers and CDAWeb when using these Data.','\.\.',/extract,/regex),'.')

endif

if (strmatch(data_product_name,'isee-3-return_helio1day_position',/fold_case) eq 1) then begin

   numerical_data.access_information(access_information_spdf_num).access_url(2).name=''

   numerical_data.access_information(access_information_spdf_num).access_url(2).url=''

   numerical_data.access_information(access_information_spdf_num).access_url(2).style=''

   numerical_data.access_information(access_information_spdf_num).access_url(2).product_key=''

   numerical_data.access_information(access_information_spdf_num).access_url(2).description=''

endif

if (strmatch(data_product_name,'ge_h0_epi',/fold_case) eq 1) then $
   numerical_data.access_information(access_information_spdf_num).encoding=encoding_list(4)

numerical_data.access_information(access_information_spdf_num).data_extent.quantity=''

numerical_data.access_information(access_information_spdf_num).data_extent.units=''

numerical_data.access_information(access_information_spdf_num).data_extent.per=''

numerical_data.access_information(access_information_spdf_num).acknowledgement= $
   strjoin(strsplit('Please acknowledge the Principal Investigator '+cdaweb_person_name_list_concat+'. Please acknowledge the Data Providers and CDAWeb when using these Data.','\.\.',/extract,/regex),'.')

if (strmatch(strmid(data_product_name,0,4),'erg_') eq 1) then $
   numerical_data.access_information(access_information_spdf_num).acknowledgement= $
   strjoin(strsplit('Please acknowledge the Principal Investigator '+cdaweb_person_name_list_concat+'. Please acknowledge the Data Providers, the ERG Science Center, and CDAWeb when using these Data.','\.\.',/extract,/regex),'.')

if (strmatch(strmid(data_product_name,0,4),'erg_') eq 1) then begin

   arase_metadata_update_file_name=project_program_dir+'DELIVERY/ARASE/arase_metadata_update.tab'

   arase_metadata_update=read_tab_table(arase_metadata_update_file_name,exist_flag,/verbose,/compress)

   arase_metadata_update=arase_metadata_update.table

   data_product_name_lower_mask=where(arase_metadata_update.data_product_id eq data_product_name_lower)

   if (data_product_name_lower_mask ne -1) then begin

      arase_metadata_update=arase_metadata_update(data_product_name_lower_mask)

      if (arase_metadata_update.access_url ne '') then begin

         access_url_erg=arase_metadata_update.access_url

      endif else begin

         access_url_erg='UNKNOWN'

      endelse

   endif

   numerical_data.access_information(0).repository_id='spase://SMWG/Repository/ERG-SC'

   numerical_data.access_information(0).availability=availability_list(2)

   numerical_data.access_information(0).access_rights=access_rights_list(1)

   numerical_data.access_information(0).access_url(0).name='ERG Science Center'

   numerical_data.access_information(0).access_url(0).url='https://ergsc.isee.nagoya-u.ac.jp/data/ergsc/satellite/erg/'+access_url_erg

   numerical_data.access_information(0).access_url(0).style=''

   numerical_data.access_information(0).access_url(0).product_key=data_product_name_upper

   numerical_data.access_information(0).access_url(0).description='Access to ASCII, CDF, and Plots via the ERG Science Center'

   numerical_data.access_information(0).access_url(0).language='en'

   numerical_data.access_information(0).format=format_list(3)

   numerical_data.access_information(0).encoding=encoding_list(5)

   numerical_data.access_information(0).data_extent.quantity=''

   numerical_data.access_information(0).data_extent.units=''

   numerical_data.access_information(0).data_extent.per=''

   numerical_data.access_information(0).acknowledgement= $
      'Please acknowledge the ERG Science Center, ERG-SC, the Institute of '+ $
      'Space and Astronautical Science, ISAS, the Japan Aerospace '+ $
      'Exploration Agency, JAXA, and the Institute for Space-Earth '+ $
      'Environmental Research, ISEE, Nagoya University in presentations or '+ $
      'publications when using data, data analysis software, plug-ins for '+ $
      'data analysis, integrated analysis tools, or any other services '+ $
      'provided by the ERG-SC.'

endif

if (strmatch(strmid(data_product_name,0,9),'mms?_fpi_') eq 1) then begin

   numerical_data.access_information(1).repository_id='spase://SMWG/Repository/UCOLO/LASP/MMS_SDC'

   numerical_data.access_information(1).availability=availability_list(2)

   numerical_data.access_information(1).access_rights=access_rights_list(1)

   numerical_data.access_information(1).access_url(0).name= $
      'HTTPS access to files at the MMS Science Data Center, SDC, at the Laboratory for Atmospheric and Space Physics, LASP, University of Colorado, Boulder'

   numerical_data.access_information(1).access_url(0).url='https://lasp.colorado.edu/mms/sdc/public/data/'

   numerical_data.access_information(1).access_url(0).style=''

   numerical_data.access_information(1).access_url(0).product_key=''

   numerical_data.access_information(1).access_url(0).description='Access to MMS Data in CDF Format via http from the MMS SDC'

   numerical_data.access_information(1).access_url.language=''

   numerical_data.access_information(1).format=format_list(3)

   numerical_data.access_information(1).encoding=encoding_list(5)

   numerical_data.access_information(1).data_extent.quantity=''

   numerical_data.access_information(1).data_extent.units=''

   numerical_data.access_information(1).data_extent.per=''

   numerical_data.access_information(1).acknowledgement= $
      strjoin(strsplit(numerical_data.resource_header.acknowledgement+'. Please acknowledge the Data Providers and the MMS SDC when using these Data.','\.\.',/extract,/regex),'.')

endif

if (data_product_name eq 'co_rpws_hfr_qtn') then begin

   numerical_data.access_information(0).access_url(*).name=''

   numerical_data.access_information(0).access_url(*).url=''

   numerical_data.access_information(0).access_url(*).description=''

   numerical_data.access_information(0).access_url(*).language=''

   numerical_data.access_information(0).repository_id='spase://SMWG/Repository/Cassini/RPWS/HFR-Kronos'

   numerical_data.access_information(0).availability=availability_list(2)

   numerical_data.access_information(0).access_rights=access_rights_list(1)

   numerical_data.access_information(0).access_url(0).name='HTTP access to Cassini QTN CDF files at Lesia-Meudon'

   numerical_data.access_information(0).access_url(0).url='https://lesia.obspm.fr/kronos/data/qtn/data/'

   numerical_data.access_information(0).access_url(0).style=''

   numerical_data.access_information(0).access_url(0).product_key=''

   numerical_data.access_information(0).access_url(0).description='HTTP access to Cassini Quasi Thermal Noise Spectroscopy CDF Files at Lesia-Meudon'

   numerical_data.access_information(0).access_url(0).language=''

   numerical_data.access_information(0).format=format_list(3)

   numerical_data.access_information(0).encoding=encoding_list(5)

   numerical_data.access_information(0).data_extent.quantity=''

   numerical_data.access_information(0).data_extent.units=''

   numerical_data.access_information(0).data_extent.per=''

   numerical_data.access_information(0).acknowledgement= $
      strjoin(strsplit(numerical_data.resource_header.acknowledgement+'. Please acknowledge the Centre de Donnees de Physique des Plasmas, CDPP, when using these Data.','\.\.',/extract,/regex),'.')

endif

numerical_data.processing_level=processing_level_list(1)

if (data_product_name eq 'ac_k1_swe') then numerical_data.processing_level=processing_level_list(3)

numerical_data.provider_name=''

numerical_data.provider_resource_name=''

numerical_data.provider_processing_level=''

split=strsplit(data_product_name,'_',/extract)

level=split(1)

if (level eq 'l2') then numerical_data.provider_processing_level='Level 2'

numerical_data.provider_version=''

instrument_id_mask_num=n_elements(cdaweb_mission_instrument_id_list)

cdaweb_mission_instrument_id_mask=make_array(instrument_id_mask_num,/integer,/index)

numerical_data.instrument_id(cdaweb_mission_instrument_id_mask)=cdaweb_mission_instrument_id_list

for loop=0,instrument_id_mask_num do begin

    numerical_data.instrument_id(loop)=strjoin(strsplit(numerical_data.instrument_id(loop),'&apos;',/regex,/extract))

    numerical_data.instrument_id(loop)=strjoin(strsplit(numerical_data.instrument_id(loop),'..',/extract),'.')

;   numerical_data.instrument_id(loop)=strjoin(strsplit(numerical_data.instrument_id(loop),'-',/extract),'.')

endfor

if (strmatch(numerical_data.instrument_id(0),'*/InstrumentUnknown') eq 1) then begin

   registry_dir=project_program_dir+'VXO'

   instrument_id_list=cdaweb_instrument_id_list(data_product_name,numerical_data_parameter_all,registry_dir)

   numerical_data.instrument_id(indgen(n_elements(instrument_id_list)))='spase://SMWG/Instrument/'+instrument_id_list

endif

if (strmatch(strmid(data_product_name,0,6),'ac_[hk][0-5]_',/fold_case) eq 1) then begin

   registry_dir=project_program_dir+'VXO'

   instrument_id_list=cdaweb_instrument_id_list(data_product_name,numerical_data_parameter_all,registry_dir)

   numerical_data.instrument_id(indgen(n_elements(instrument_id_list)))='spase://SMWG/Instrument/'+instrument_id_list

endif

if (strmatch(strmid(data_product_name,0,3),'bar',/fold_case) eq 1) then begin

   registry_dir=project_program_dir+'VXO'

   instrument_id_list=cdaweb_instrument_id_list(data_product_name,numerical_data_parameter_all,registry_dir)

   numerical_data.instrument_id(indgen(n_elements(instrument_id_list)))='spase://SMWG/Instrument/'+instrument_id_list

endif

if (strmatch(strmid(data_product_name,0,5),'mms[1-4]_',/fold_case) eq 1) then begin

   registry_dir=project_program_dir+'VXO'

   instrument_id_list=cdaweb_instrument_id_list(data_product_name,numerical_data_parameter_all,registry_dir)

   numerical_data.instrument_id(indgen(n_elements(instrument_id_list)))='spase://SMWG/Instrument/'+instrument_id_list

endif

if (strmatch(strmid(data_product_name,0,4),'mvn_',/fold_case) eq 1) then begin

   registry_dir=project_program_dir+'VXO'

   instrument_id_list=cdaweb_instrument_id_list(data_product_name,numerical_data_parameter_all,registry_dir)

   numerical_data.instrument_id(indgen(n_elements(instrument_id_list)))='spase://SMWG/Instrument/'+instrument_id_list

endif

if (strmatch(strmid(data_product_name,0,4),'psp_',/fold_case) eq 1) then begin

   registry_dir=project_program_dir+'VXO'

   instrument_id_list=cdaweb_instrument_id_list(data_product_name,numerical_data_parameter_all,registry_dir)

   numerical_data.instrument_id=''

   numerical_data.instrument_id(indgen(n_elements(instrument_id_list)))='spase://SMWG/Instrument/'+instrument_id_list

endif

if (strmatch(strmid(data_product_name,0,4),'rbsp',/fold_case) eq 1) then begin

   registry_dir=project_program_dir+'VXO'

   instrument_id_list=cdaweb_instrument_id_list(data_product_name,numerical_data_parameter_all,registry_dir)

   numerical_data.instrument_id(indgen(n_elements(instrument_id_list)))='spase://SMWG/Instrument/'+instrument_id_list

endif

if (data_product_name eq 'sta_lb_mag_rtn') then begin

   registry_dir=project_program_dir+'VXO'

   instrument_id_list=cdaweb_instrument_id_list(data_product_name,numerical_data_parameter_all,registry_dir)

   instrument_id_list_num=n_elements(instrument_id_list)

   if (instrument_id_list_num gt 0) then numerical_data.instrument_id(*)=''

   numerical_data.instrument_id(indgen(n_elements(instrument_id_list)))='spase://SMWG/Instrument/'+instrument_id_list

endif

;f (strmatch(strmid(data_product_name,0,8),'voyager[12]',/fold_case) eq 1) then begin

;  registry_dir=project_program_dir+'VXO'

;  instrument_id_list=cdaweb_instrument_id_list(data_product_name,numerical_data_parameter_all,registry_dir)

;  numerical_data.instrument_id(*)=''

;  numerical_data.instrument_id(indgen(n_elements(instrument_id_list)))='spase://SMWG/Instrument/'+instrument_id_list

;ndif

if (strmatch(strmid(data_product_name,0,9),'mms[1-4]_edp_',/fold_case) eq 1) then $
   numerical_data.instrument_id(1)='spase://SMWG/Instrument/MMS/1/FIELDS/SDP'

if (strmatch(strmid(data_product_name,0,9),'mms2_edp_',/fold_case) eq 1) then $
   numerical_data.instrument_id(1)='spase://SMWG/Instrument/MMS/2/FIELDS/SDP'

if (strmatch(strmid(data_product_name,0,9),'mms3_edp_',/fold_case) eq 1) then $
   numerical_data.instrument_id(1)='spase://SMWG/Instrument/MMS/3/FIELDS/SDP'

if (strmatch(strmid(data_product_name,0,9),'mms4_edp_',/fold_case) eq 1) then $
   numerical_data.instrument_id(1)='spase://SMWG/Instrument/MMS/4/FIELDS/SDP'

if (strmatch(strmid(data_product_name,0,6),'dn_k0_',/fold_case) eq 1) then $
   numerical_data.instrument_id(0)='spase://SMWG/Instrument/SuperDARN/Radars'

;f (data_product_name eq 'thg_l2_mag_pg1') then $
;  numerical_data.instrument_id(0)='spase://SMWG/Instrument/Ground/PENGUIn.1/Magnetometer'

;f (data_product_name eq 'thg_l2_mag_pg2') then $
;  numerical_data.instrument_id(0)='spase://SMWG/Instrument/Ground/PENGUIn.2/Magnetometer'

;f (data_product_name eq 'thg_l2_mag_pg3') then $
;  numerical_data.instrument_id(0)='spase://SMWG/Instrument/Ground/PENGUIn.3/Magnetometer'

;f (data_product_name eq 'thg_l2_mag_pg4') then $
;  numerical_data.instrument_id(0)='spase://SMWG/Instrument/Ground/PENGUIn.4/Magnetometer'

if (data_product_name eq 'fm_k0_kilp') then $
   numerical_data.instrument_id(0)='spase://SMWG/Instrument/Ground/Kilpisjarvi/AllSkyCamera'

if (data_product_name eq 'goes13_eps-pitch-angles_1min') then $
   numerical_data.instrument_id(0)='spase://SMWG/Instrument/GOES/13/SEM'

if (data_product_name eq 'goes14_eps-pitch-angles_1min') then $
   numerical_data.instrument_id(0)='spase://SMWG/Instrument/GOES/14/SEM'

if (data_product_name eq 'goes15_eps-pitch-angles_1min') then $
   numerical_data.instrument_id(0)='spase://SMWG/Instrument/GOES/15/SEM'

if (data_product_name eq 'gps_roti15min_jpl') then $
   numerical_data.instrument_id(0)='spase://SMWG/Instrument/IGS/GPS_Receiver'

if (data_product_name eq 'ig_k0_pci') then begin

   numerical_data.instrument_id(0)='spase://SMWG/Instrument/Ground/Thule.Air.Base/Magnetometer'

   numerical_data.instrument_id(1)='spase://SMWG/Instrument/Ground/Vostok/Magnetometer'

endif

if (data_product_name eq 'sta_l2_magplasma_1m') then begin

   numerical_data.instrument_id(0)='spase://SMWG/Instrument/STEREO-A/IMPACT'

   numerical_data.instrument_id(1)='spase://SMWG/Instrument/STEREO-A/PLASTIC'

endif

if (data_product_name eq 'stb_l2_magplasma_1m') then begin

   numerical_data.instrument_id(0)='spase://SMWG/Instrument/STEREO-B/IMPACT'

   numerical_data.instrument_id(1)='spase://SMWG/Instrument/STEREO-B/PLASTIC'

endif

if (data_product_name eq 'omni_coho1hr_merged_mag_plasma') then $
   numerical_data.instrument_id(0)='spase://SMWG/Instrument/OMNI'

if (data_product_name eq 'de2_neutral8s_fpi') then $
   numerical_data.instrument_id(0)='spase://SMWG/Instrument/DynamicsExplorer2/WATS'

if (data_product_name eq 'uy_m1_bai') then $
   numerical_data.instrument_id(0)='spase://SMWG/Instrument/Ulysses/SWOOPS'

if (data_product_name eq 'uy_h0_glg') then $
   numerical_data.instrument_id(0)='spase://SMWG/Instrument/Ulysses/SWICS'

if (strmatch(data_product_name,"*_helio1day_position",/fold_case) eq 1) then numerical_data.instrument_id(*)=''

;
;  CDAWEB CDF to SPASE Measurement Type Mapping
;

if (n_elements(instrument_type) gt 0) then begin

   cdaweb_instrument_type=strtrim(instrument_type.text,2)

endif else begin

   cdaweb_instrument_type=''

endelse

print,'POPULATE_NUMERICAL_DATA Instrument_Type.Text:',instrument_type.text,format='(a-73,a/)'

print,'POPULATE_NUMERICAL_DATA CDAWEB_Instrument_Type:',cdaweb_instrument_type,format='(a-73,a/)'

spase_measurement_type=cdaweb_spase_map_measurement_type(cdaweb_instrument_type,data_product_name,numerical_data_parameter_all)

;
;  BARREL Instrument_type:
;
;  ephm "Ephemeris"
;  fspc "Electron Precipitation Bremsstrahlung"
;  hkpg "Housekeeping"
;  magn "Magnetic Fields (Balloon)"
;  misc "Miscellaneous"
;  mspc "Electron Precipitation Bremsstrahlung"
;  rcnt "Electron Precipitation Bremsstrahlung"
;  sspc "Electron Precipitation Bremsstrahlung"
;

if (data_product_name eq 'bar118_1a_2_l2_ephm') then spase_measurement_type=measurement_type_list(6)

if (data_product_name eq 'bar118_1a_2_l2_misc') then spase_measurement_type=measurement_type_list(8)

if (strmatch(strmid(data_product_name,0,14),'bar_[12][a-z]_l2_fspc',/fold_case) eq 1) then $
   spase_measurement_type=measurement_type_list(10)

if (strmatch(strmid(data_product_name,0,14),'bar_[12][a-z]_l2_magn',/fold_case) eq 1) then $
   spase_measurement_type=measurement_type_list(11)

if (strmatch(strmid(data_product_name,0,14),'bar_[12][a-z]_l2_misc',/fold_case) eq 1) then $
   spase_measurement_type=measurement_type_list(8)

if (strmatch(strmid(data_product_name,0,14),'bar_[12][a-z]_l2_mspc',/fold_case) eq 1) then $
   spase_measurement_type=measurement_type_list(10)

if (strmatch(strmid(data_product_name,0,14),'bar_[12][a-z]_l2_rcnt',/fold_case) eq 1) then $
   spase_measurement_type=measurement_type_list(10)

if (strmatch(strmid(data_product_name,0,14),'bar_[12][a-z]_l2_sspc',/fold_case) eq 1) then $
   spase_measurement_type=measurement_type_list(10)

if (data_product_name eq 'de1_sai_uv') then spase_measurement_type=measurement_type_list(7)

if (strmatch(strmid(data_product_name,0,10),'s[39]_c9_sa[23][79]',/fold_case) eq 1) then  $
   spase_measurement_type=measurement_type_list(5)

if (strmatch(strmid(data_product_name,0,11),'th[a-e]_l1_spin',/fold_case) eq 1) then  $
   spase_measurement_type=measurement_type_list(8)

if (data_product_name eq 'thg_l1_ask') then spase_measurement_type=measurement_type_list(7)

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then $
   spase_measurement_type=spase_measurement_type(0)

if (strmatch(strmid(data_product_name,0,11),'mms[1-4]_aspoc_',/fold_case) eq 1) then $
   spase_measurement_type=measurement_type_list(8)

measurement_type_full_mask=make_array(n_elements(spase_measurement_type),/integer,/index)

cdaweb_instrument_type_mask=make_array(n_elements(cdaweb_instrument_type),/integer,/index)

print,'POPULATE_NUMERICAL_DATA SPASE_Measurement_Type:',strjoin(spase_measurement_type(cdaweb_instrument_type_mask),', '),format='(a-73,a/)'

numerical_data.measurement_type(measurement_type_full_mask)=spase_measurement_type

if (strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) then begin

   numerical_data.measurement_type(0)=measurement_type_list(17)

   numerical_data.measurement_type(1)=measurement_type_list(21)

endif

if (data_product_name eq 'cl_jp_pcy') then begin

   numerical_data.measurement_type(0)=measurement_type_list(11)

   numerical_data.measurement_type(1)=measurement_type_list(19)

endif

;f (data_product_name eq 'iss_sp_fpmu') then $
;  numerical_data.measurement_type(0)=measurement_type_list(19)

;
;+-----+--------------------------------------------------+----+---------------------------------+
;| ### | CDAWEB Instrument Type                           | ## | SPASE Measurement Type          |
;+-----+--------------------------------------------------+----+---------------------------------+
;|   2 | Activity Indices                                 | 01 | ActivityIndex                   |
;|  54 | Electric Fields (space)                          | 02 | ElectricField                   |
;|  14 | Engineering                                      | 03 | InstrumentStatus                |
;| 106 | Ephemeris                                        | 04 | Ephemeris                       |
;|   1 | Gamma and X-Rays                                 | 05 | Irradiance                      |
;|  15 | Ground-Based HF-Radars                           | 06 | Irradiance                      |
;|   5 | Ground-Based Imagers                             | 07 | ImageIntensity                  |
;|   1 | Ground-Based Incoherent-Scatter Radar            | 08 | Irradiance                      |
;|   1 | Ground-Based Incoherent-Scatter Radar            | 09 | Irradiance                      |
;|  77 | Ground-Based Magnetometers, Riometers, Sounders  | 10 | MagneticField, Profile, Profile |
;|   7 | Ground-Based VLF/ELF/ULF, Photometers            | 11 | Waves, Irradiance               |
;|  12 | Housekeeping                                     | 12 | InstrumentStatus                |
;|   1 | Imager                                           | 13 | ImageIntensity                  |
;|  24 | Imager (space)                                   | 14 | ImageIntensity                  |
;|   1 | Imagers (space)                                  | 15 | ImageIntensity                  |
;| 118 | Imaging and Remote Sensing (ITM/Earth)           | 16 | ImageIntensity                  |
;|  17 | Imaging and Remote Sensing (Magnetosphere/Earth) | 17 | ImageIntensity                  |
;|   2 | Imaging and Remote Sensing (Sun and Earth)       | 18 | ImageIntensity                  |
;|   4 | Imaging and Remote Sensing (Sun)                 | 19 | ImageIntensity                  |
;| 171 | Magnetic Fields (space)                          | 20 | MagneticField                   |
;|   2 | Neutral Imager                                   | 21 | NeutralAtomImages               |
;|   1 | Particle Spectrometer                            | 22 | IonComposition                  |
;|   1 | Particles                                        | 23 | EnergeticParticles              |
;| 286 | Particles (space)                                | 24 | EnergeticParticles              |
;|   2 | Particles (space)                                | 25 | EnergeticParticles              |
;| 170 | Plasma and Solar Wind                            | 26 | EnergeticParticles              |
;|  67 | Radio and Plasma Waves (space)                   | 27 | Waves                           |
;|   3 | Test                                             | 28 | InstrumentStatus                |
;+-----+--------------------------------------------------+----+---------------------------------+
;
;  0   '' - blank
;  1   Activity Index
;  2   Dopplergram
;  3   Dust
;  4   Electric Field
;  5   Energetic Particles
;  6   Ephemeris
;  7   Image Intensity
;  8   Instrument Status
;  9   Ion Composition
; 10   Irradiance
; 11   Magnetic Field
; 12   Magnetogram
; 13   Neutral Atom Images
; 14   Neutral Gas
; 15   Profile
; 16   Radiance
; 17   Spectrum
; 18   Thermal Plasma
; 19   Waves
; 10   Waves.Active
; 21   Waves.Passive
;

numerical_data.temporal_description.time_span.start_date=resource_info.time_span_start_date

numerical_data.temporal_description.time_span.start_date=start_date

split=strsplit(resource_info.time_span_stop_date,'T',/extract)

time_span_stop_date=split(0)+'T'+stop_date_time

if keyword_set(keyword_stop_date) then $
   numerical_data.temporal_description.time_span.stop_date=time_span_stop_date

if keyword_set(keyword_relative_stop_date) then $
   numerical_data.temporal_description.time_span.relative_stop_date=cdaweb_master_notes.relative_stop_date

if keyword_set(keyword_stop_date) then $
   numerical_data.temporal_description.time_span.stop_date=stop_date

if (data_product_name eq 'co_rpws_hfr_qtn') then begin

   numerical_data.temporal_description.time_span.start_date='2004-06-30T16:42:00'

   numerical_data.temporal_description.time_span.stop_date='2012-04-15T05:52:00'

endif

if (strmatch(data_product_name,"goes*_ephemeris_ssc",/fold_case) eq 1) then begin

   cdaweb_start_stop_dates_file_name=project_program_dir+'cdaweb_start_stop_dates_table_all.tab'

   cdaweb_start_stop_dates=read_tab_table(cdaweb_start_stop_dates_file_name,exist_flag,/verbose,/compress)

endif else begin

   cdaweb_start_stop_dates_mask=-1

endelse

if (strmatch(strmid(data_product_name,0,4),"rbsp",/fold_case) eq 1) then begin

   cdaweb_start_stop_dates_file_name=project_program_dir+'cdaweb_start_stop_dates_table_all.tab'

   cdaweb_start_stop_dates=read_tab_table(cdaweb_start_stop_dates_file_name,exist_flag,/verbose,/compress)

endif else begin

   cdaweb_start_stop_dates_mask=-1

endelse

if (strmatch(data_product_name,'c[1-4lt]_jp_p[gms][ep]',/fold_case) eq 1) then begin

   cdaweb_start_stop_dates_file_name=project_program_dir+'cdaweb_start_stop_dates_table_all.tab'

   cdaweb_start_stop_dates=read_tab_table(cdaweb_start_stop_dates_file_name,exist_flag,/verbose,/compress)

endif else begin

   cdaweb_start_stop_dates_mask=-1

endelse

if (strmatch(data_product_name,'fa_k0_tms',/fold_case) eq 1) then begin

   cdaweb_start_stop_dates_file_name=project_program_dir+'cdaweb_start_stop_dates_table_all.tab'

   cdaweb_start_stop_dates=read_tab_table(cdaweb_start_stop_dates_file_name,exist_flag,/verbose,/compress)

endif else begin

   cdaweb_start_stop_dates_mask=-1

endelse

if (strmatch(data_product_name,'fast_hr_dcb',/fold_case) eq 1) then begin

   cdaweb_start_stop_dates_file_name=project_program_dir+'cdaweb_start_stop_dates_table_all.tab'

   cdaweb_start_stop_dates=read_tab_table(cdaweb_start_stop_dates_file_name,exist_flag,/verbose,/compress)

endif else begin

   cdaweb_start_stop_dates_mask=-1

endelse

cdaweb_start_stop_dates_file_name=project_program_dir+'cdaweb_start_stop_dates_table_all.tab'

cdaweb_start_stop_dates=read_tab_table(cdaweb_start_stop_dates_file_name,exist_flag,/verbose,/compress)

cdaweb_start_stop_dates_mask=where(data_product_name_upper eq cdaweb_start_stop_dates.table.data_product_name,cdaweb_start_stop_dates_mask_num)

if (cdaweb_start_stop_dates_mask_num eq 0) then cdaweb_start_stop_dates_mask=-1

if (cdaweb_start_stop_dates_mask ne -1) then begin

   cdaweb_start_stop_dates=cdaweb_start_stop_dates.table(cdaweb_start_stop_dates_mask)

   numerical_data.temporal_description.time_span.start_date=strtrim(strcompress(cdaweb_start_stop_dates.start_date),2)

   if keyword_set(keyword_stop_date) then numerical_data.temporal_description.time_span.stop_date=strtrim(strcompress(cdaweb_start_stop_dates.stop_date),2)

endif

if (strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) then begin

   numerical_data.temporal_description.time_span.note='The Cadence is 31 s between Ionograms. The Alouette 2 Ionograms have the slowest Sweep Rate of any of the Alouette/ISIS Topside Sounders sweeping from 0.12 to 14.5 MHz in about 28 s with a Frequency Sweep Rate of 0.13 MHz/s below 2.0 MHz, providing the highest Frequency Resolution of any of the ISIS Program Sounders. The Alouette 2 Frequency Sweep Rate above 2 MHz was 1 MHz/s. Alouette 2 did not have a Fixed Frequency Operation.'

endif else begin

   numerical_data.temporal_description.time_span.note=''

endelse

numerical_data.temporal_description.cadence=cadence

if (themis_l1_info_mask(0) ne -1) then $
   if (strmatch(strmid(data_product_name,0,7),"th[a-g]_l1_",/fold_case) eq 1) then $
      numerical_data.temporal_description.cadence=themis_l1_info.table(themis_l1_info_mask).cadence

if (strmatch(strmid(data_product_name,0,4),"rbsp",/fold_case) eq 1 and $
    numerical_data.temporal_description.cadence eq '') then numerical_data.temporal_description.cadence='PT0.02S'

if (strmatch(strmid(data_product_name,0,4),"rbsp",/fold_case) eq 1 and $
    numerical_data.temporal_description.cadence eq 'PT99999.999S') then numerical_data.temporal_description.cadence='PT0.020S'

if (strmatch(strmid(data_product_name,0,3),'bar',/fold_case) eq 1) then begin

   if (strmatch(strmid(data_product_name,strlen(data_product_name-4),4),'ephm')) then numerical_data.temporal_description.cadence='PT4S'

   if (strmatch(strmid(data_product_name,strlen(data_product_name-4),4),'fspc')) then numerical_data.temporal_description.cadence='PT0.05S'

   if (strmatch(strmid(data_product_name,strlen(data_product_name-4),4),'hkpg')) then numerical_data.temporal_description.cadence='PT40S'

   if (strmatch(strmid(data_product_name,strlen(data_product_name-4),4),'magn')) then numerical_data.temporal_description.cadence='PT0.25S'

   if (strmatch(strmid(data_product_name,strlen(data_product_name-4),4),'misc')) then numerical_data.temporal_description.cadence='PT1S'

   if (strmatch(strmid(data_product_name,strlen(data_product_name-4),4),'mspc')) then numerical_data.temporal_description.cadence='PT4S'

   if (strmatch(strmid(data_product_name,strlen(data_product_name-4),4),'rcnt')) then numerical_data.temporal_description.cadence='PT4S'

   if (strmatch(strmid(data_product_name,strlen(data_product_name-4),4),'sspc')) then numerical_data.temporal_description.cadence='PT32S'

endif

if (numerical_data.temporal_description.cadence eq '') then numerical_data.temporal_description.cadence='PT99999.999S'

numerical_data.temporal_description.cadence_min=''

numerical_data.temporal_description.cadence_max=''

numerical_data.temporal_description.exposure=''

numerical_data.temporal_description.exposure_min=''

numerical_data.temporal_description.exposure_max=''

if (strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) then begin

   numerical_data.spectral_range=spectral_range_list(16)

endif else begin

   if (strmatch(strmid(data_product_name,0,6),"timed_",/fold_case) eq 1) then begin

      numerical_data.spectral_range=spectral_range_list(9)

   endif else begin

      numerical_data.spectral_range(*)=''

   endelse

endelse

;
;   27   Heliosphere                              Cassini
;   30   Heliosphere.NearEarth                    Cassini
;   31   Heliosphere.Outer                        Cassini
;
;   27   Heliosphere                              DSCOVR
;   29   Heliosphere.Inner                        DSCOVR
;   30   Heliosphere.NearEarth                    DSCOVR
;
;   27   Heliosphere                              Helios
;   29   Heliosphere.Inner                        Helios
;   30   Heliosphere.NearEarth                    Helios
;
;    5   Earth.Magnetosphere                      MetOP NOAA Alouette ISIS
;    8   Earth.Magnetosphere.Polar                MetOP NOAA Alouette ISIS
;   10   Earth.NearSurface                        MetOP NOAA Alouette ISIS
;   12   Earth.NearSurface.AuroralRegion          MetOP NOAA Alouette ISIS
;   13   Earth.NearSurface.EquatorialRegion       MetOP NOAA Alouette ISIS
;   14   Earth.NearSurface.Ionosphere             MetOP NOAA Alouette ISIS
;   21   Earth.NearSurface.PolarCap               MetOP NOAA Alouette ISIS
;
;   27   Heliosphere                              New Horizons
;   30   Heliosphere.NearEarth                    New Horizons
;   31   Heliosphere.Outer                        New Horizons
;
;    5   Earth.Magnetosphere                      THEMIS
;    6   Earth.Magnetosphere.Magnetotail          THEMIS
;    7   Earth.Magnetosphere.Main                 THEMIS
;    9   Earth.Magnetosphere.RadiationBelt        THEMIS
;    4   Earth.Magnetosheath                      THEMIS
;   30   Heliosphere.NearEarth                    THEMIS
;
;   12   Earth.NearSurface.AuroralRegion          TIMED
;   13   Earth.NearSurface.EquatorialRegion       TIMED
;   14   Earth.NearSurface.Ionosphere             TIMED
;   15   Earth.NearSurface.Ionosphere.D-Region    TIMED
;   16   Earth.NearSurface.Ionosphere.E-Region    TIMED
;   17   Earth.NearSurface.Ionosphere.F-Region    TIMED
;   21   Earth.NearSurface.PolarCap               TIMED
;   22   Earth.NearSurface.SouthAtlanticAnomaly   TIMED
;   24   Earth.NearSurface.Thermosphere           TIMED

if (strmatch(strmid(data_product_name,0,4),'mvn_',/fold_case) eq 1) then numerical_data.observed_region(0)=observed_region_list(51) ; Mars

if (strmatch(strmid(data_product_name,0,5),'ibex_',/fold_case) eq 1) then numerical_data.observed_region(0)=observed_region_list(34) ; Heliosphere.Inner

if (strmatch(strmid(data_product_name,0,4),'psp_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(32) ; Heliosphere

   numerical_data.observed_region(1)=observed_region_list(34) ; Heliosphere.Inner

   numerical_data.observed_region(2)=observed_region_list(35) ; Heliosphere.NearEarth

   numerical_data.observed_region(3)=observed_region_list(97) ; Sun.Corona

endif

if (strmatch(strmid(data_product_name,0,6),'renu2_',/fold_case) eq 1) then begin

;  numerical_data.observed_region(0)=observed_region_list(15) ; Earth.NearSurface.AuroralRegion

   numerical_data.observed_region(1)=observed_region_list(17) ; Earth.NearSurface.Ionosphere

   numerical_data.observed_region(2)=observed_region_list(18) ; Earth.NearSurface.Ionosphere.DRegion

   numerical_data.observed_region(3)=observed_region_list(19) ; Earth.NearSurface.Ionosphere.ERegion

   numerical_data.observed_region(4)=observed_region_list(20) ; Earth.NearSurface.Ionosphere.FRegion

   numerical_data.observed_region(5)=observed_region_list(21) ; Earth.NearSurface.Ionosphere.Topside

   numerical_data.observed_region(6)=observed_region_list(25) ; Earth.NearSurface.PolarCap

   numerical_data.observed_region(7)=observed_region_list(29) ; Earth.NearSurface.Thermosphere

endif

if (strmatch(strmid(data_product_name,0,13),'alouette[12]_av_',/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,4),"de[12]_",/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,4),"el[ab]_",/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,3),"fa_",/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,3),"po_",/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(5) ; Earth.Magnetosphere

   numerical_data.observed_region(1)=observed_region_list(9) ; Earth.Magnetosphere.Polar

   numerical_data.observed_region(2)=observed_region_list(13) ; Earth.NearSurface

   numerical_data.observed_region(3)=observed_region_list(15) ; Earth.NearSurface.AuroralRegion

   numerical_data.observed_region(4)=observed_region_list(14) ; Earth.NearSurface.EquatorialRegion

   numerical_data.observed_region(5)=observed_region_list(17) ; Earth.NearSurface.Ionosphere

   numerical_data.observed_region(6)=observed_region_list(25) ; Earth.NearSurface.PolarCap

endif

if (strmatch(strmid(data_product_name,0,3),"cn_",/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,3),"fa_",/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(15) ; Earth.NearSurface.AuroralRegion

   numerical_data.observed_region(1)=observed_region_list(17) ; Earth.NearSurface.Ionosphere

endif

if (strmatch(strmid(data_product_name,0,7),'twins[12]_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(5) ; Earth.Magnetosphere

   numerical_data.observed_region(1)=observed_region_list(6) ; Earth.Magnetosphere.Magnetotail

   numerical_data.observed_region(2)=observed_region_list(7) ; Earth.Magnetosphere.Main

   numerical_data.observed_region(3)=observed_region_list(10) ; Earth.Magnetosphere.RadiationBelt

   numerical_data.observed_region(4)=observed_region_list(4) ; Earth.Magnetosheath

endif

if (strmatch(data_product_name,'th[a-e]_l2_efi',/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,3),'cl_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(5) ; Earth.Magnetosphere

   numerical_data.observed_region(1)=observed_region_list(6) ; Earth.Magnetosphere.Magnetotail

   numerical_data.observed_region(2)=observed_region_list(7) ; Earth.Magnetosphere.Main

   numerical_data.observed_region(3)=observed_region_list(10) ; Earth.Magnetosphere.RadiationBelt

   numerical_data.observed_region(4)=observed_region_list(4) ; Earth.Magnetosheath

   numerical_data.observed_region(5)=observed_region_list(35) ; Heliosphere.NearEarth

endif

if (data_product_name eq 'fm_k0_kilp') then begin

   numerical_data.observed_region(0)=observed_region_list(15) ; Earth.NearSurface.AuroralRegion

   numerical_data.observed_region(1)=observed_region_list(17) ; Earth.NearSurface.Ionosphere

   numerical_data.observed_region(2)=observed_region_list(18) ; Earth.NearSurface.Ionosphere.DRegion

   numerical_data.observed_region(3)=observed_region_list(19) ; Earth.NearSurface.Ionosphere.ERegion

   numerical_data.observed_region(4)=observed_region_list(20) ; Earth.NearSurface.Ionosphere.FRegion

endif

if (strmatch(strmid(data_product_name,0,6),'timed_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(14) ; Earth.NearSurface.Atmosphere

   numerical_data.observed_region(1)=observed_region_list(15) ; Earth.NearSurface.AuroralRegion

   numerical_data.observed_region(2)=observed_region_list(14) ; Earth.NearSurface.EquatorialRegion

   numerical_data.observed_region(3)=observed_region_list(22) ; Earth.NearSurface.Mesosphere

   numerical_data.observed_region(4)=observed_region_list(25) ; Earth.NearSurface.PolarCap

   numerical_data.observed_region(5)=observed_region_list(27) ; Earth.NearSurface.Stratosphere

   numerical_data.observed_region(6)=observed_region_list(29) ; Earth.NearSurface.Thermosphere

endif

if (strmatch(strmid(data_product_name,0,8),'cassini_',/fold_case) or $
    strmatch(strmid(data_product_name,0,7),'isee-3_',/fold_case) or $
    strmatch(strmid(data_product_name,0,10),'pioneer1[01]_',/fold_case) or $
    strmatch(strmid(data_product_name,0,4),'vg[12]_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(32) ; Heliosphere

   numerical_data.observed_region(1)=observed_region_list(35) ; Heliosphere.NearEarth

   numerical_data.observed_region(2)=observed_region_list(36) ; Heliosphere.Outer

endif

if (strmatch(strmid(data_product_name,0,3),'ac_',/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,5),'omni_',/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,3),'so_',/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,3),'wi_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(32) ; Heliosphere

   numerical_data.observed_region(1)=observed_region_list(34) ; Heliosphere.Inner

   numerical_data.observed_region(2)=observed_region_list(35) ; Heliosphere.NearEarth

endif

if (strmatch(data_product_name_lower,'voyager[12]_pls_composition',/fold_case) eq 1 or $
    strmatch(data_product_name,'voyager[12]_pls_electrons_e[12]',/fold_case) eq 1 or $
    strmatch(data_product_name,'voyager[12]_pls_ions_[lm]',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)='Jupiter.Magnetosphere'

endif

if (strmatch(strmid(data_product_name,0,3),'uy_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(32) ; Heliosphere

   numerical_data.observed_region(1)=observed_region_list(34) ; Heliosphere.Inner

   numerical_data.observed_region(2)=observed_region_list(35) ; Heliosphere.NearEarth

   numerical_data.observed_region(3)=observed_region_list(36) ; Heliosphere.Outer

endif

if (strmatch(strmid(data_product_name,0,7),'dscovr_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(32) ; Heliosphere

   numerical_data.observed_region(1)=observed_region_list(34) ; Heliosphere.Inner

   numerical_data.observed_region(2)=observed_region_list(35) ; Heliosphere.NearEarth

endif

if (strmatch(strmid(data_product_name,0,8),'helios[12]_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(32) ; Heliosphere

   numerical_data.observed_region(1)=observed_region_list(34) ; Heliosphere.Inner

   numerical_data.observed_region(2)=observed_region_list(35) ; Heliosphere.NearEarth

endif

if (strmatch(strmid(data_product_name,0,13),'new_horizons_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(32) ; Heliosphere

   numerical_data.observed_region(1)=observed_region_list(35) ; Heliosphere.NearEarth

   numerical_data.observed_region(2)=observed_region_list(36) ; Heliosphere.Outer

endif

if (strmatch(strmid(data_product_name,0,7),'metop[12]_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(5) ; Earth.Magnetosphere

   numerical_data.observed_region(1)=observed_region_list(9) ; Earth.Magnetosphere.Polar

   numerical_data.observed_region(2)=observed_region_list(13) ; Earth.NearSurface

   numerical_data.observed_region(3)=observed_region_list(15) ; Earth.NearSurface.AuroralRegion

   numerical_data.observed_region(4)=observed_region_list(14) ; Earth.NearSurface.EquatorialRegion

   numerical_data.observed_region(5)=observed_region_list(17) ; Earth.NearSurface.Ionosphere

   numerical_data.observed_region(6)=observed_region_list(25) ; Earth.NearSurface.PolarCap

endif

if (strmatch(strmid(data_product_name,0,9),'dmsp-[fs][12][0-9]_',/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,7),'noaa1[5689]_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(5) ; Earth.Magnetosphere

   numerical_data.observed_region(1)=observed_region_list(9) ; Earth.Magnetosphere.Polar

   numerical_data.observed_region(2)=observed_region_list(13) ; Earth.NearSurface

   numerical_data.observed_region(3)=observed_region_list(15) ; Earth.NearSurface.AuroralRegion

   numerical_data.observed_region(4)=observed_region_list(16) ; Earth.NearSurface.EquatorialRegion

   numerical_data.observed_region(5)=observed_region_list(17) ; Earth.NearSurface.Ionosphere

   numerical_data.observed_region(6)=observed_region_list(25) ; Earth.NearSurface.PolarCap

endif

if (strmatch(strmid(data_product_name,0,5),'mms[1-4]_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(4) ; Earth.Magnetosheath

   numerical_data.observed_region(1)=observed_region_list(5) ; Earth.Magnetosphere

   numerical_data.observed_region(2)=observed_region_list(6) ; Earth.Magnetosphere.Magnetotail

   numerical_data.observed_region(3)=observed_region_list(7) ; Earth.Magnetosphere.Main

   numerical_data.observed_region(4)=observed_region_list(10) ; Earth.Magnetosphere.RadiationBelt

   numerical_data.observed_region(5)=observed_region_list(14) ; Earth.NearSurface.EquatorialRegion

   numerical_data.observed_region(6)=observed_region_list(24) ; Earth.NearSurface.Plasmasphere

   numerical_data.observed_region(7)=observed_region_list(35) ; Heliosphere.NearEarth

endif

if (strmatch(strmid(data_product_name,0,4),'rbsp',/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,4),'erg_',/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,3),'eq_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(5) ; Earth.Magnetosphere

   numerical_data.observed_region(1)=observed_region_list(7) ; Earth.Magnetosphere.Main

   numerical_data.observed_region(2)=observed_region_list(8) ; Earth.Magnetosphere.Plasmasphere

   numerical_data.observed_region(3)=observed_region_list(10) ; Earth.Magnetosphere.RadiationBelt

   numerical_data.observed_region(4)=observed_region_list(11) ; Earth.Magnetosphere.RingCurrent

   numerical_data.observed_region(5)=observed_region_list(23) ; Earth.NearSurface.MidLatitudeRegion

endif

if (strmatch(strmid(data_product_name,0,3),'bar',/fold_case) eq 1) then begin

   numerical_data.observed_region(1)=observed_region_list(15) ; Earth.NearSurface.AuroralRegion

   numerical_data.observed_region(2)=observed_region_list(22) ; Earth.NearSurface.Mesosphere

   numerical_data.observed_region(3)=observed_region_list(25) ; Earth.NearSurface.PolarCap

   numerical_data.observed_region(4)=observed_region_list(27) ; Earth.NearSurface.Stratosphere

endif

if (strmatch(strmid(data_product_name,0,6),'dn_k0_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(17) ; Earth.NearSurface.Ionosphere

endif

if (strmatch(strmid(data_product_name,0,6),'g[5-8]_[ck][019]_',/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,6),'goes[89]_',/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,7),'goes1[0-7]_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(5) ; Earth.Magnetosphere

   numerical_data.observed_region(1)=observed_region_list(7) ; Earth.Magnetosphere.Main

   numerical_data.observed_region(2)=observed_region_list(10) ; Earth.Magnetosphere.RadiationBelt

endif

if (data_product_name eq 'ig_k0_pci') then $
   numerical_data.observed_region(0)=observed_region_list(25) ; Earth.NearSurface.PolarCap

if (strmatch(strmid(data_product_name,0,4),'st[ab]_',/fold_case) eq 1) then $
   numerical_data.observed_region(0)=observed_region_list(37) ; Heliosphere.Remote1AU

if (data_product_name eq 'de2_neutral8s_fpi') then begin

   numerical_data.observed_region(0)=observed_region_list(17) ; Earth.NearSurface.Ionosphere

   numerical_data.observed_region(1)=observed_region_list(29) ; Earth.NearSurface.Thermosphere

endif

if (strmatch(strmid(data_product_name,0,9),'amptecce_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(5) ; Earth.Magnetosphere

   numerical_data.observed_region(1)=observed_region_list(7) ; Earth.Magnetosphere.Main

   numerical_data.observed_region(2)=observed_region_list(10) ; Earth.Magnetosphere.RadiationBelt

endif

if (strmatch(strmid(data_product_name,0,4),'gps_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(5) ; Earth.Magnetosphere

   numerical_data.observed_region(1)=observed_region_list(7) ; Earth.Magnetosphere.Main

   numerical_data.observed_region(2)=observed_region_list(10) ; Earth.Magnetosphere.RadiationBelt

   numerical_data.observed_region(3)=observed_region_list(17) ; Earth.NearSurface.Ionosphere

endif

if (strmatch(strmid(data_product_name,0,4),'iss_',/fold_case) eq 1) then begin

   numerical_data.observed_region(0)=observed_region_list(20) ; Earth.NearSurface.Ionosphere.FRegion

   numerical_data.observed_region(1)=observed_region_list(29) ; Earth.NearSurface.Thermosphere

endif

if (data_product_name eq 'co_rpws_hfr_qtn') then $
   numerical_data.observed_region(0)='Saturn.Magnetosphere'

;ommand='echo "'+caveats.text+'" | sed -f '+project_program_dir+'global_attribute_caveats.sed'

;pawn,command,cdaweb_caveats,error

full_caveats=caveats.text(0)

for loop=1,caveats.record_num-1 do full_caveats=full_caveats+string(10B)+'               '+caveats.text(loop)

numerical_data.caveats=full_caveats

;umerical_data.caveats=strtrim(strjoin(strsplit(cdaweb_caveats,/extract),' '),2)

if (strmatch(data_product_name,'th[a-e]_l2_efi',/fold_case) eq 1) then numerical_data.caveats='Measurements on the Axial booms, 5 &amp; 6, may have large Errors due to their Proximity to the Spacecraft as the Axial Booms are much shorter than other Booms. The Spin Plane Booms for THEMIS were not deployed until January 14, 2008 at 1700 UT. Any EFI Measurements obtained prior to this Date and Time should not be used. See the THEMIS Website for more Information.'

if (strmatch(strmid(data_product_name,0,9),'mms?_fpi_') eq 1 and strmatch(data_product_name,'mms[1-4]_fpi_[bf][ar]st_l2_d[ei]s-partmoms',/fold_case) ne 1) then begin

   generation_date_spase=cdf_date_to_spase_date(strtrim(strjoin(strsplit(generation_date.text,/extract),' '),2))

   skeleton_version_split=strsplit(skeleton_version.text,/extract)

   skeleton_version_spase=skeleton_version_split(1)

   skeleton_revision_date_split=strsplit(skeleton_revdate.text,/extract)

   skeleton_revision_date_spase=skeleton_revision_date_split(1)+'T'+skeleton_revision_date_split(2)

   numerical_data.caveats='This SPASE Numerical Data Description is for the '+strupcase(strtrim(strjoin(strsplit(logical_source.text,/extract),' '),2))+' Data Product. '+ $
                          'This Numerical Data Description has been written by utilizing the ADAPT Software Package. ADAPT can harvest Metadata that are embedded in Data Files '+ $
                          'stored in Common Data File Format that are then leveraged to populate corresponding SPASE Schema Text Fields. Typically, the CDF embedded Metadata are '+ $
                          'harvested from CDF Master Files, which contain no actual Data, in order to populate SPASE Documents. In this case, the Metadata were harvested from a '+ $
                          '&quot;Data&quot; CDF, which contains actual Data Observations from one of the four MMS FPI Instruments. The &quot;Data&quot; CDF used by ADAPT has the following '+ $
                          'Specifications: Data Product Version Number: '+strtrim(strjoin(strsplit(data_version.text,/extract),' '),2)+', CDF Generation Date: '+generation_date_spase+', '+ $
                          'CDF Skeleton Version Revision Number: '+skeleton_version_spase+', and CDF Skeleton Version Revision Date: '+skeleton_revision_date_spase+'.'

endif

if (data_product_name eq 'co_rpws_hfr_qtn') then begin

   numerical_data.caveats='Confidence Level Overview'+ $
                          string(10B)+'               '+'The Data in this Data Set are Thermal Plasma Parameters derived from HFR Spectra using the Thermal Noise Spectroscopy Theory. Every Data Set has been reviewed by a Scientist to ensure that all Data included in this Data Set is scientifically consistent. When the Data can not be provided during the selected Intervals, the Values are replaced by "NaN" (Not a Number) Flags.'+ $
                          string(10B)+'               '+'Limitations'+ $
                          string(10B)+'               '+'* The Quasi Thermal Noise Spectroscopy Analysis is using the Upper-Hybrid Resonance Frequency for the Determination of the Electron Core Density. This Determination depends on:'+ $
                          string(10B)+'               '+'- The Ability to identify the Resonance among the other Lines and Noises present in the Data at the same Time '+ $
                          string(10B)+'               '+'- The operating Spectral Resolution, which defines the Accuracy the the Determination of the Upper-Hybrid Frequency. Concerning the First Item, the Scientific Evaluation Step is ensuring that the detected Upper-Hybrid Frequency Line is not another Emission or a spurious Detection'+ $
                          string(10B)+'               '+'* The Electron Core Temperature is dependent on the Thermal Plateau Level below the Upper-Hybrid Resonance Peak. The Accuracy of the Temperature Determination depends on the Integration Time (the longer reducing the statistical Noise on the Data). The Core Electron Temperature Determination is also highly dependent on the Shot Noise Contamination induced by the Impact of the charged Particles on the Antennas (proportional to f-2).'+ $
                          string(10B)+'               '+'* The Shot Noise is dominant in the lowest Part of the HFR Frequency Band and may artificially increase the minimum QTN Level, inducing an Overestimate of the Core Temperature. For this Reason, we rejected the Spectra where the Contribution of the Shot Noise is larger than 20% of the Thermal Plateau Level below Upper-Hybrid Frequency in the provided Data Set.'+ $
                          string(10B)+'               '+'* The Quality Flag on Temperature QF is equal to one when the Shot Noise Ratio is lower than 10%, and zero when the Ratio is comprised between 10% and 20%. For best quality Data, we recommend to the User to use the Data with QF=1. Note that the Estimate of the Core Temperature is dependent on the Calibration in V^2/Hz of the RPWS/HFR Receiver. Calibration may evolve with Time and influence the Thermal Plateau Level.'+ $
                          string(10B)+'               '+'* The Value of the Temperature finally also depends on the absolute Flux Calibration of the HFR, and thus may change in the Future in when a new Calibration is available.'

endif

keyword_index=0

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

   numerical_data.keyword(keyword_index)='Station Code:  '+station_code

   keyword_index=1

endif

if (title.text ne '') then begin

   numerical_data.keyword(keyword_index)=string('CDF Global Attribute TITLE:  ',format='(a-49)')+title.text

   keyword_index=keyword_index+1

endif

if (n_elements(mission_group) gt 0) then begin

   if (mission_group.record_num eq 2) then begin

      prefix_string=string('CDF Global Attribute MISSION_GROUP:  ',format='(a-49)')

      merge_string=string(10B)+'               '+prefix_string

      numerical_data.keyword(keyword_index)=prefix_string+strjoin([mission_group.text(0),strsplit(mission_group.text(1),'!___',/regex,/extract)],merge_string)   ;   +string(10B)+'      '

      keyword_index=keyword_index+1

   endif

endif

numerical_data.input_resource_id=''

if (n_elements(project) gt 0) then begin

   cdaweb_project=make_array(project.record_num,/string,value='')

   for loop=0,project.record_num-1 do begin

       command='echo "'+project.text(loop)+'" | sed -f '+project_program_dir+'global_attribute_project.sed'

       spawn,command,project_temp,error

       cdaweb_project(loop)=string('CDF Global Attribute PROJECT:  ',format='(a-49)')+project_temp

   endfor

   keyword_structure=keyword_populate(numerical_data.keyword,keyword_index,cdaweb_project)

   numerical_data.keyword=keyword_structure.keyword

   keyword_index=keyword_structure.index

endif

if (n_elements(logical_file_id) gt 0) then begin

   command='echo "'+logical_file_id.text+'" | sed -f '+project_program_dir+'global_attribute_logical_file_id.sed'

   spawn,command,logical_file_id_temp,error

   logical_file_id_temp=strlowcase(logical_file_id_temp)

   if (data_product_name ne logical_file_id_temp(0)) then begin

      print,'POPULATE_NUMERICAL_DATA Logical_File_ID TEMP:','Mismatch Warning',format='(a-73,a/)'

   endif else begin

      print,'POPULATE_NUMERICAL_DATA Logical_File_ID TEMP:','Match found, no Warning',format='(a-73,a/)'

   endelse

endif

if (n_elements(data_version) gt 0) then begin

   command='echo "'+data_version.text+'" | sed -f '+project_program_dir+'global_attribute_data_version.sed'

   spawn,command,cdaweb_data_version,error

   if (cdaweb_data_version ne '') then begin

      cdaweb_data_version=string('CDF Global Attribute DATA_VERSION:  ',format='(a-49)')+cdaweb_data_version

      keyword_structure=keyword_populate(numerical_data.keyword,keyword_index,cdaweb_data_version)

      numerical_data.keyword=keyword_structure.keyword

      keyword_index=keyword_structure.index

   endif

endif

if (n_elements(discipline) gt 0) then begin

   cdaweb_discipline=make_array(discipline.record_num,/string,value='')

   for loop=0,discipline.record_num-1 do begin

       command='echo "'+discipline.text(loop)+'" | sed -f '+project_program_dir+'global_attribute_discipline.sed'

       spawn,command,discipline_temp,error

       cdaweb_discipline(loop)=string("CDF Global Attribute DISCIPLINE:  ",format='(a-49)')+discipline_temp

   endfor

   keyword_structure=keyword_populate(numerical_data.keyword,keyword_index,cdaweb_discipline)

   numerical_data.keyword=keyword_structure.keyword

   keyword_index=keyword_structure.index

;  if (discipline.record_num gt 1) then $
;     numerical_data.keyword(keyword_structure.index-1)=numerical_data.keyword(keyword_structure.index-1)+string(10B)+'      '

endif

if (n_elements(data_type) gt 0) then begin

   command='echo "'+data_type.text+'" | sed -f '+project_program_dir+'global_attribute_data_type.sed'

   spawn,command,cdaweb_data_type,error

   cdaweb_data_type=string('CDF Global Attribute DATA_TYPE:  ',format='(a-49)')+strjoin(strsplit(cdaweb_data_type,'>',/extract,/regex),'&gt;')

   keyword_structure=keyword_populate(numerical_data.keyword,keyword_index,cdaweb_data_type)

   numerical_data.keyword=keyword_structure.keyword

   keyword_index=keyword_structure.index

endif

if (n_elements(adid_ref) gt 0) then begin

   command='echo "'+adid_ref.text+'" | sed -f '+project_program_dir+'global_attribute_adid_ref.sed'

   spawn,command,cdaweb_adid_ref,error

   cdaweb_adid_ref=string('CDF Global Attribute ADID_REF:  ',format='(a-49)')+cdaweb_adid_ref

   keyword_structure=keyword_populate(numerical_data.keyword,keyword_index,cdaweb_adid_ref)

   numerical_data.keyword=keyword_structure.keyword

   keyword_index=keyword_structure.index

endif

if (n_elements(generation_date) gt 0) then begin

   command='echo "'+generation_date.text+'" | sed -f '+project_program_dir+'global_attribute_generation_date.sed'

   spawn,command,cdaweb_generation_date,error

   if (cdaweb_generation_date ne '') then begin

      cdaweb_generation_date=string('CDF Global Attribute GENERATION_DATE:  ',format='(a-49)')+cdaweb_generation_date

      keyword_structure=keyword_populate(numerical_data.keyword,keyword_index,cdaweb_generation_date)

      numerical_data.keyword=keyword_structure.keyword

      keyword_index=keyword_structure.index

   endif

endif

command='echo "'+nssdc_id.text+'" | sed -f '+project_program_dir+'global_attribute_nssdc_id.sed'

spawn,command,cdaweb_nssdc_id,error

if (cdaweb_nssdc_id ne '') then begin

   cdaweb_nssdc_id=string('CDF Global Attribute NSSDC_ID:  ',format='(a-49)')+cdaweb_nssdc_id

   keyword_structure=keyword_populate(numerical_data.keyword,keyword_index,cdaweb_nssdc_id)

   numerical_data.keyword=keyword_structure.keyword

   keyword_index=keyword_structure.index

endif

cdaweb_mods=make_array(mods.record_num,/string,value='')

for loop=0,mods.record_num-1 do begin

    command='echo "'+mods.text(loop)+'" | sed -f '+project_program_dir+'global_attribute_mods.sed'

    spawn,command,cdaweb_mods_temp,error

    if (cdaweb_mods_temp ne '') then cdaweb_mods(loop)=string('CDF Global Attribute MODS:  ',format='(a-49)')+cdaweb_mods_temp

    if (loop gt 0) then cdaweb_mods(loop)='               '+cdaweb_mods(loop)

endfor

if (cdaweb_mods(0) ne '') then begin

   cdaweb_mods=strjoin(cdaweb_mods,string(10B))

   keyword_structure=keyword_populate(numerical_data.keyword,keyword_index,cdaweb_mods)

   numerical_data.keyword=keyword_structure.keyword

   keyword_index=keyword_structure.index

endif

if (n_elements(rules_of_use) gt 0) then begin

   rules_of_use.text=rules_of_use.text+'.'

   command='echo "'+rules_of_use.text+'" | sed -f '+project_program_dir+'global_attribute_rules_of_use.sed'

   spawn,command,cdaweb_rules_of_use,error

   print,'POPULATE_NUMERICAL_DATA Rules_of_Use:',cdaweb_rules_of_use,format='(a-73,a/)'

   if (cdaweb_rules_of_use ne '') then begin

      cdaweb_rules_of_use=string('CDF Global Attribute RULES_OF_USE:',format='(a-49)')+cdaweb_rules_of_use

      keyword_structure=keyword_populate(numerical_data.keyword,keyword_index,cdaweb_rules_of_use)

      numerical_data.keyword=keyword_structure.keyword

      keyword_index=keyword_structure.index

   endif

endif

command='echo "'+software_version.text+'" | sed -f '+project_program_dir+'global_attribute_software_version.sed'

spawn,command,cdaweb_software_version,error

if (cdaweb_software_version ne '') then begin

   cdaweb_software_version=string('CDF Global Attribute SOFTWARE_VERSION:  ',format='(a-49)')+cdaweb_software_version

   keyword_structure=keyword_populate(numerical_data.keyword,keyword_index,cdaweb_software_version)

   numerical_data.keyword=keyword_structure.keyword

   keyword_index=keyword_structure.index

endif

if (n_elements(generated_by) gt 0) then begin

   command='echo "'+generated_by.text+'" | sed -f '+project_program_dir+'global_attribute_generated_by.sed'

   spawn,command,cdaweb_generated_by,error

   if (cdaweb_generated_by ne '') then begin

      cdaweb_generated_by=string('CDF Global Attribute GENERATED_BY:  ',format='(a-49)')+cdaweb_generated_by

      keyword_structure=keyword_populate(numerical_data.keyword,keyword_index,cdaweb_generated_by)

      numerical_data.keyword=keyword_structure.keyword

      keyword_index=keyword_structure.index

   endif

endif

command='echo "'+text_supplement_1.text+'" | sed -f '+project_program_dir+'global_attribute_text_supplement_1.sed'

spawn,command,cdaweb_text_supplement_1,error

if (cdaweb_text_supplement_1 ne '') then begin

   cdaweb_text_supplement_1=string('CDF Global Attribute TEXT_SUPPLEMENT_1:  ',format='(a-49)')+cdaweb_text_supplement_1

   keyword_structure=keyword_populate(numerical_data.keyword,keyword_index,cdaweb_text_supplement_1)

   numerical_data.keyword=keyword_structure.keyword

   keyword_index=keyword_structure.index

endif

print,stars,format='(a/)'

numerical_data.keyword(*)=''

if (strmatch(strmid(data_product_name,0,13),'alouette[12]_av_',/fold_case) eq 1 or $
    strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) then begin

   numerical_data.keyword(0)='Ionogram'
   numerical_data.keyword(1)='Topside Sounder'
   numerical_data.keyword(2)='Swept Frequency Sounder'
   numerical_data.keyword(3)='Topside Ionosphere'
   numerical_data.keyword(4)='Ionospheric Reflections'
   numerical_data.keyword(5)='Ground Reflections'
   numerical_data.keyword(6)='Ionospheric Echoes'
   numerical_data.keyword(7)='Ground Echoes'
   numerical_data.keyword(8)='Ducted Echoes'
   numerical_data.keyword(9)='Wave Scattering'
   numerical_data.keyword(10)='Field-Aligned Irregularities, FAI'
   numerical_data.keyword(11)='Plasma Resonance'
   numerical_data.keyword(12)='Plasma Waves'
   numerical_data.keyword(13)='Auroral Kilometric Radiation, AKR'
   numerical_data.keyword(14)='Solar Type III Bursts'
   numerical_data.keyword(15)='Upper Hybrid Noise Band'

endif

;
;  CDF Global Attribute to SPASE Mapping Done
;
;  Start Parameter Variable Attribute to SPASE Mapping
;

variable_num=n_elements(data_product_cdf_info.variable_info)

variable_attribute_num=n_elements(data_product_cdf_info.variable_attribute_info)

for variable_loop=0,variable_num-1 do begin

    print,'Variable Metadata:  ',variable_loop, $
          data_product_cdf_info.variable_info(variable_loop).name, $
          data_product_cdf_info.variable_info(variable_loop).type, $
          data_product_cdf_info.variable_info(variable_loop).type_num, $
          data_product_cdf_info.variable_info(variable_loop).structure, $
          data_product_cdf_info.variable_info(variable_loop).data_type_flag, $
          format='(a20,i3.3,2x,5a-25/)'

    for attribute_loop=0,variable_attribute_num-1 do begin

        print,'Variable Metadata:  ',attribute_loop, $
              data_product_cdf_info.variable_info(variable_loop).name, $
              data_product_cdf_info.variable_info(variable_loop).attribute.(attribute_loop).name, $
              data_product_cdf_info.variable_info(variable_loop).attribute.(attribute_loop).data_type, $
              data_product_cdf_info.variable_info(variable_loop).attribute.(attribute_loop).data_bytes, $
              data_product_cdf_info.variable_info(variable_loop).attribute.(attribute_loop).text, $
              format='(a20,i3.3,2x,4a-25,a-72)'

    endfor

    print,''

endfor

print,stars,format='(a/)'

;etadata_variable_mask=where(strmid(data_product_cdf_info.variable_info.data_type_flag,0,2) eq 'F/',metadata_variable_mask_num)

;ata_variable_mask=where(strmid(data_product_cdf_info.variable_info.data_type_flag,0,2) eq 'T/',data_variable_mask_num)

;eyword_field=0

if (strmatch(data_product_name,"fast_hr_dcb",/fold_case) eq 1) then begin

   exist_flag=0

   time_cadence_info_file_name=project_program_dir+'cdaweb_time_cadence.tab'

   time_cadence_info=read_tab_table(time_cadence_info_file_name,exist_flag,/verbose)

endif

exist_flag=0

;daweb_parameter_info_file_name=project_program_dir+'cdaweb_parameter_info.tab'

;daweb_parameter_info_file_name=project_program_dir+'variable_attribute_list_all.tab'

cdaweb_parameter_info_file_name=project_program_dir+'cdaweb_customize.tab'

cdaweb_parameter_info=read_tab_table(cdaweb_parameter_info_file_name,exist_flag,/verbose)

if (strmatch(strmid(data_product_name,0,7),"th[a-g]_l1_",/fold_case) eq 1) then begin

   exist_flag=0

;  time_cadence_info_file_name='/Users/astropooch/Space/DATA/CDAWEB/MASTERS/CDF_THEMIS_LEVEL_1/themis_level_1_time_cadence_check_all.tab'

   time_cadence_info_file_name=project_program_dir+'cdaweb_time_cadence.tab'

   time_cadence_info=read_tab_table(time_cadence_info_file_name,exist_flag,/verbose)

endif

;
;   CDF Variable Attribute to SPASE Parameter translation processing begin in earnest from here.
;

print,'Start Variable Attribute to SPASE Parameter Translation Processing:',data_product_name,format='(a-73,a/)'

print,'Number of Variables:',strtrim(string(variable_num),2),format='(a-73,a/)'

print,stars,format='(a/)'

keyword_parameter_type=make_array(variable_num,/string,value='')

if (strmid(data_product_name,0,9) eq 'psp_isois') then begin

;
;  Get PSP ISOIS Variable Attribute Information
;

   psp_isois_epoch_cadence_file_name=project_program_dir+'psp_isois_epoch_cadence.tab'

   psp_isois_epoch_cadence=read_tab_table(psp_isois_epoch_cadence_file_name,exist_flag,/verbose,/compress)

   psp_isois_epoch_cadence=psp_isois_epoch_cadence.table

   data_product_name_mask=where(data_product_name eq psp_isois_epoch_cadence.data_product_name,data_product_name_mask_num)

   psp_isois_epoch_cadence=psp_isois_epoch_cadence(data_product_name_mask)

   psp_isois_l2_variable_attribute_file_name=project_program_dir+'psp_isois_l2_variable_attribute_all.tab'

   psp_isois_l2_variable_attribute=read_tab_table(psp_isois_l2_variable_attribute_file_name,exist_flag,/verbose,/compress)

   psp_isois_l2_variable_attribute=psp_isois_l2_variable_attribute.table

   data_product_name_mask=where(data_product_name eq psp_isois_l2_variable_attribute.data_product_name,data_product_name_mask_num)

   psp_isois_l2_variable_attribute=psp_isois_l2_variable_attribute(data_product_name_mask)

endif

for variable_loop=0,variable_num-1 do begin

    variable_attribute_num=n_elements(data_product_cdf_info.variable_attribute_info)

    cdaweb_avg_ptr_1=''

    cdaweb_avg_type=''

    cdaweb_catdesc=''

    cdaweb_component=''

    cdaweb_component_0=''

    cdaweb_coordinate_system=''

    cdaweb_depend_0=''

    cdaweb_depend_1=''

    cdaweb_depend_2=''

    cdaweb_depend_3=''

    cdaweb_depend_time=''

    cdaweb_dict_key=''

    cdaweb_display_type=''

    cdaweb_fieldnam=''

    cdaweb_fillval=''

    cdaweb_form_ptr=''

    cdaweb_format=''

    cdaweb_frame=''

    cdaweb_funct=''

    cdaweb_funcxion=''

    cdaweb_labl_ptr_1=''

    cdaweb_labl_ptr_2=''

    cdaweb_labl_ptr_3=''

    cdaweb_lablaxis=''

    cdaweb_monoton=''

    cdaweb_property=''

    cdaweb_representation_1=''

    cdaweb_resolution=''

    cdaweb_scalemax=''

    cdaweb_scalemin=''

    cdaweb_scaletyp=''

    cdaweb_si_conversion=''

    cdaweb_time_res=''

    cdaweb_units=''

    cdaweb_units_conversion=''

    cdaweb_validmax=''

    cdaweb_validmin=''

    cdaweb_var_notes=''

    cdaweb_var_type=''

    cdaweb_virtual=''

    for variable_attribute_loop=0,variable_attribute_num-1 do begin

        command='cdaweb_'+ $
                strlowcase(data_product_cdf_info.variable_attribute_info(variable_attribute_loop))+ $
                "=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'"+ $
                strlowcase(data_product_cdf_info.variable_attribute_info(variable_attribute_loop))+"')"

        command_error=execute(command)

    endfor

    cdaweb_scalemin=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'scalemin')

    cdaweb_scalemax=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'scalemax')

    cdaweb_virtual=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'virtual')

    cdaweb_avg_ptr_1=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'avg_ptr_1')

    cdaweb_avg_type=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'avg_type')

    cdaweb_monoton=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'monoton')

    cdaweb_time_res=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'time_res')

    cdaweb_si_conversion=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'si_conversion')

    cdaweb_frame=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'frame')

    cdaweb_coordinate_system=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'coordinate_system')

    cdaweb_frame_to_coordinate_system_representation=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'frame_to_coordinate_system_representation')

    cdaweb_representation_1=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'representation_1')

    cdaweb_property=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'property')

    cdaweb_depend_time=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'depend_time')

;   cdaweb_depend_0=strupcase(cdaweb_depend_0)

    cdaweb_virtual=strlowcase(cdaweb_virtual)

    cdaweb_monoton=strlowcase(cdaweb_monoton)

    cdaweb_property=strlowcase(cdaweb_property)

    if (n_elements(cdaweb_scaletyp) gt 0) then cdaweb_scaletyp=strlowcase(cdaweb_scaletyp)

    cdaweb_parameter_info_data_product_mask=where(cdaweb_parameter_info.table.data_product eq data_product_name,cdaweb_parameter_info_mask_num)

;
;   (0) is a kluge for the range_epoch parameters in:  cdaweb_parameter_info.table(cdaweb_parameter_info_mask(0)).parameter_name
;

    if (cdaweb_parameter_info_data_product_mask(0) ne -1) then begin

       cdaweb_parameter_info_mask=where(cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask).parameter_name eq data_product_cdf_info.variable_info(variable_loop).name, $
                                        cdaweb_parameter_info_mask_num)

    endif else begin

       cdaweb_parameter_info_mask=-1

    endelse

    if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1 or data_product_name eq 'fast_hr_dcb') then begin

       if (themis_l1_info_mask(0) ne -1 and cdaweb_parameter_info_mask(0) ne -1) then begin

          if (strmid(data_product_cdf_info.variable_info(variable_loop).data_type_flag,0,2) ne 'F/') then $
             if (data_product_name ne 'fast_hr_dcb') then $
                numerical_data.parameter(variable_loop).name=cdaweb_parameter_info.table(cdaweb_parameter_info_mask(0)).parameter_name

          cdaweb_parameter_info_column_num=n_elements(cdaweb_parameter_info.header)

          for cdaweb_parameter_info_column_loop=0,cdaweb_parameter_info_column_num-1 do begin

              command='cdaweb_'+cdaweb_parameter_info.header.(0)+'=cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).'+cdaweb_parameter_info.header.(0)

              command_error=execute(command)

              if (command_error ne 1) then print,'Command Error:'+command,format='(a-73,a/)'

          endfor

       endif

    endif

;   if (strmid(data_product_cdf_info.variable_info(variable_loop).data_type_flag,0,2) ne 'F/') then begin

;   print,data_product_cdf_info.variable_info(variable_loop).attribute

    cdaweb_depend_1_metadata=variable_attribute_metadata_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'depend_1',size)

    cdaweb_depend_2_metadata=variable_attribute_metadata_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'depend_2',size)

    cdaweb_depend_3_metadata=variable_attribute_metadata_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'depend_3',size)

    cdaweb_depend_1_metadata_num=n_elements(cdaweb_depend_1_metadata)

    cdaweb_depend_2_metadata_num=n_elements(cdaweb_depend_2_metadata)

    cdaweb_depend_3_metadata_num=n_elements(cdaweb_depend_3_metadata)

;
;   Start using CDF Variable Attribute Metadata information to describe SPASE Parameters
;

;   print,variable_loop,'PARAMETER NAME:           '+data_product_cdf_info.variable_info(variable_loop).name,format='(i5.5,x,a)'

;   print,variable_loop,'PARAMETER VARIABLE TYPE:  '+cdaweb_var_type,format='(i5.5,x,a)'

    data_product_name_mask=where(data_product_name eq numerical_data_parameter_all.table.data_product_name,data_product_name_mask_num)

    if (data_product_name_mask_num ge 1) then begin

       variable_info_mask=where(data_product_cdf_info.variable_info(variable_loop).name eq $
                                numerical_data_parameter_all.table(data_product_name_mask).parameter_key, $
                                variable_info_mask_num)

       if (variable_info_mask_num eq 1) then $
          cdaweb_var_type=numerical_data_parameter_all.table(data_product_name_mask(variable_info_mask)).parameter_keyword

    endif

;   print,variable_loop,'PARAMETER VARIABLE TYPE:  '+cdaweb_var_type,format='(i5.5,x,a)'

    if (cdaweb_var_type ne 'Metadata' and cdaweb_var_type ne 'metadata') then begin

       size=1

;
;      Fix kluge to get SIZE !!!
;

       if (strmid(data_product_cdf_info.variable_info(variable_loop).data_type_flag,2,2) ne 'FF' and cdaweb_scalemin ne '') then $
          size=data_product_cdf_info.variable_info(variable_loop).attribute.scalemin.data_bytes

       structure_temp=cdaweb_dimension_structure(data_product_cdf_info.variable_info(variable_loop).structure,data_product_cdf_info.variable_info(variable_loop).data_type_flag)

       data_product_cdf_info.variable_info(variable_loop).structure=structure_temp

;      print,'DATA_PRODUCT_CDF_INFO.VARIABLE_INFO(VARIABLE_LOOP).STRUCTURE:       '+data_product_cdf_info.variable_info(variable_loop).structure

;      print,'DATA_PRODUCT_CDF_INFO.VARIABLE_INFO(VARIABLE_LOOP).DATA_TYPE_FLAG:  '+data_product_cdf_info.variable_info(variable_loop).data_type_flag

       size_split=strsplit(data_product_cdf_info.variable_info(variable_loop).structure,':',/extract)

       size_save=size_split(1)

       size_split=strsplit(data_product_cdf_info.variable_info(variable_loop).structure,'[',/extract)

       size=string_condition(size_split(1),']','')

       size_split=strsplit(size,',',/extract)

       size_match=where(size_split ne '1',size_match_num)

       if (size_match_num ne 0) then $
          size_split=strjoin(size_split(size_match),',')

       size_split_num=n_elements(size_split)

       if (size_split_num gt 1) then begin

          dimension=[size_split(0),size_split(1)]

       endif else begin

          dimension=size_split(0)

       endelse

       dimension_num=n_elements(strsplit(dimension,','))

       if (size eq '') then size=1

;      if (size eq '2,3') then size=1

;      size=string_condition(size_split,',',' ')

;      print,'DATA_PRODUCT_CDF_INFO.VARIABLE_INFO(VARIABLE_LOOP).STRUCTURE:       '+data_product_cdf_info.variable_info(variable_loop).structure

       if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1 and cdaweb_virtual eq 'true') then $
          size=n_elements(cdaweb_fillval)

;
;      Get Variable Attribute Metadata
;

       cdaweb_form_ptr_metadata=variable_attribute_metadata_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'form_ptr',size)

       cdaweb_form_ptr_metadata_num=n_elements(cdaweb_form_ptr_metadata)

       cdaweb_labl_ptr_1_metadata=variable_attribute_metadata_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'labl_ptr_1',size)

       cdaweb_labl_ptr_1_metadata_num=n_elements(cdaweb_labl_ptr_1_metadata)

       cdaweb_labl_ptr_2_metadata=variable_attribute_metadata_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'labl_ptr_2',size)

       cdaweb_labl_ptr_2_metadata_num=n_elements(cdaweb_labl_ptr_2_metadata)

       cdaweb_labl_ptr_3_metadata=variable_attribute_metadata_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'labl_ptr_3',size)

       cdaweb_labl_ptr_3_metadata_num=n_elements(cdaweb_labl_ptr_3_metadata)

       cdaweb_lablaxis_metadata=variable_attribute_metadata_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'lablaxis',size)

       cdaweb_lablaxis_metadata_num=n_elements(cdaweb_lablaxis_metadata)

       cdaweb_unit_ptr_metadata=variable_attribute_metadata_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'unit_ptr',size)

       cdaweb_unit_ptr_metadata_num=n_elements(cdaweb_unit_ptr_metadata)

       cdaweb_units_metadata=variable_attribute_metadata_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'units',size)

       cdaweb_units_metadata_num=n_elements(cdaweb_units_metadata)

       cdaweb_avg_ptr_1_metadata=variable_attribute_metadata_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'avg_ptr_1',size)

       cdaweb_avg_ptr_1_metadata_num=n_elements(cdaweb_avg_ptr_1_metadata)

;
;      PO_H7_PWI and PO_H8_PWI have metadata with too many elements for the execute command issued by VARIABLE_ATTRIBUTE_METADATA_GREP
;

       if (long(size) ge 31744) then begin

          print,'Warning: Metadata variable array is too large, '+data_product_name+' '+strtrim(string(size),2)

          print,''

          cdaweb_depend_1_metadata=''

       endif else begin

          cdaweb_depend_1_metadata=variable_attribute_metadata_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'depend_1',size)

       endelse

       cdaweb_depend_1_metadata_num=n_elements(cdaweb_depend_1_metadata)

       if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

          command='echo "'+cdaweb_fieldnam+'" | sed -f '+project_program_dir+'variable_attribute_fieldnam.sed'

          spawn,command,cdaweb_fieldnam,error

       endif

       numerical_data.parameter(variable_loop).name=cdaweb_fieldnam

       if (numerical_data.parameter(variable_loop).name eq '') then $
          numerical_data.parameter(variable_loop).name=data_product_cdf_info.variable_info(variable_loop).name

       if (cdaweb_depend_0 ne '') then begin

          if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

             split=strsplit(cdaweb_depend_0,'_',/extract)

             station_code_cdf=strlowcase(split(2))

             command='echo "'+strlowcase(cdaweb_depend_0)+'"'+" | sed 's/"+station_code_cdf+'/'+strlowcase(station_code)+"/'"

             spawn,command,cdaweb_depend_0,error

          endif

          numerical_data.parameter(variable_loop).set='Time series defined by using: '+cdaweb_depend_0

          epoch_mask=where(strmatch(data_product_cdf_info.variable_info.name,cdaweb_depend_0,/fold_case),epoch_mask_num)

       endif

       if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

          split=strsplit(data_product_cdf_info.variable_info(variable_loop).name,'_',/extract)

          if (split(0) eq 'thg') then begin

             station_code_cdf=strlowcase(split(2))

             command='echo "'+data_product_cdf_info.variable_info(variable_loop).name+'"'+" | sed 's/"+station_code_cdf+'/'+strlowcase(station_code)+"/'"

             spawn,command,parameter_key_gloss,error

             data_product_cdf_info.variable_info(variable_loop).name=parameter_key_gloss

          endif

       endif

       numerical_data.parameter(variable_loop).parameter_key=data_product_cdf_info.variable_info(variable_loop).name

       print,dashes,format='(/a/)'

       print,variable_loop,'PARAMETER KEY:            '+numerical_data.parameter(variable_loop).parameter_key,format='(i5.5,x,a)'

       if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

          command='echo "'+cdaweb_catdesc+'" | sed -f '+project_program_dir+'variable_attribute_catdesc.sed'

          spawn,command,cdaweb_catdesc,error

       endif

       numerical_data.parameter(variable_loop).description=cdaweb_catdesc

       data_product_name_mask=where(data_product_name eq numerical_data_parameter_all.table.data_product_name,data_product_name_mask_num)

       if (data_product_name_mask_num ge 1) then begin

          parameter_key_mask= $
             where(numerical_data.parameter(variable_loop).parameter_key eq $
                   numerical_data_parameter_all.table(data_product_name_mask).parameter_key, $
                   parameter_key_mask_num)

          if (parameter_key_mask_num eq 1) then begin

             if (numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).name ne '') then $
                numerical_data.parameter(variable_loop).name= $
                   numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).name

             if (numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).description ne '') then $
                numerical_data.parameter(variable_loop).description= $
                   numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).description

          endif

       endif

       if (cdaweb_monoton eq 'yes') then cdaweb_monoton='true'

       if (cdaweb_monoton ne '' and cdaweb_monoton ne 'false') then begin

          if (cdaweb_monoton eq 'true') then numerical_data.parameter(variable_loop).caveats='This Parameter exhibits a Monotonic Progression'

          if (cdaweb_monoton eq 'false') then numerical_data.parameter(variable_loop).caveats='This Parameter does not exhibit a Monotonic Progression'

          if (cdaweb_monoton eq 'increase') then numerical_data.parameter(variable_loop).caveats='This Parameter exhibits an increasing Monotonic Progression'

          if (cdaweb_monoton eq 'decrease') then numerical_data.parameter(variable_loop).caveats='This Parameter exhibits a decreasing Monotonic Progression'

       endif

       if (cdaweb_avg_type ne '') then begin

          if (numerical_data.parameter(variable_loop).caveats eq '') then begin

             numerical_data.parameter(variable_loop).caveats='Average Type: '+cdaweb_avg_type

          endif else begin

             numerical_data.parameter(variable_loop).caveats=numerical_data.parameter(variable_loop).caveats+string(10B)+'* Average Type: '+cdaweb_avg_type

          endelse

       endif

       if (cdaweb_virtual eq 'true' or cdaweb_virtual eq 'TRUE') then begin

          virtual_text=''

          if (cdaweb_funct ne '') then virtual_function=cdaweb_funct

          if (cdaweb_funcxion ne '') then virtual_function=cdaweb_funcxion

          virtual_text='This parameter is virtual. It is calculated by calling the function '+strupcase(virtual_function)+' with the following input parameters: '

          if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

             split=strsplit(cdaweb_component_0,'_',/extract)

             if (split(0) eq 'thg') then begin

                station_code_cdf=strlowcase(split(2))

                command='echo "'+cdaweb_component_0+'"'+" | sed 's/"+station_code_cdf+'/'+strlowcase(station_code)+"/'"

                spawn,command,cdaweb_component_0,error

             endif

          endif

          if (cdaweb_component_0 ne '') then virtual_text=virtual_text+cdaweb_component_0

          for component_loop=1,14 do begin

              cdaweb_component=variable_attribute_grep(data_product_cdf_info.variable_info(variable_loop).attribute,'component_'+strtrim(string(component_loop),2))

              if (cdaweb_component ne '') then virtual_text=virtual_text+', '+cdaweb_component

          endfor

          virtual_text=virtual_text+'.'

          if (numerical_data.parameter(variable_loop).caveats eq '') then begin

             numerical_data.parameter(variable_loop).caveats=virtual_text

          endif else begin

             numerical_data.parameter(variable_loop).caveats=numerical_data.parameter(variable_loop).caveats+string(10B)+virtual_text

          endelse

       endif

       if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1 and cdaweb_parameter_info_mask(0) ne -1) then begin

          if (numerical_data.parameter(variable_loop).name eq 'range_epoch') then $
             numerical_data.parameter(variable_loop).description= $
                'Range epoch specifies the start and stop times of an individual data file, which is a part of the full set CDFs for the given CDAWEB data product. '+ $
                'THEMIS data products are stored in day files. Thus the range epoch list the start and stop files for observations for respective 24-hr periods.'

          if (cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).var_notes ne '') then $
             numerical_data.parameter(variable_loop).description= $
                numerical_data.parameter(variable_loop).description+', '+cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).var_notes

          if (cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).tdas_sweep_mode ne '') then $
             numerical_data.parameter(variable_loop).description= $
                numerical_data.parameter(variable_loop).description+ $
                string(10B)+'                      THEMIS Science Data Analysis Settings:'+ $
                string(10B)+'                      TDAS_theta_mode: '+cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).tdas_theta_mode+ $
                string(10B)+'                      TDAS_sweep_mode: '+cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).tdas_sweep_mode+ $
                string(10B)+'                      TDAS_phi_mode: '+cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).tdas_phi_mode+ $
                string(10B)+'                      TDAS_energy_table: '+cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).tdas_energy_table+ $
                string(10B)+'                      TDAS_dtheta_mode: '+cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).tdas_dtheta_mode+ $
                string(10B)+'                      TDAS_dphi_mode: '+cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).tdas_dphi_mode+ $
                string(10B)+'                      TDAS_denergy_table: '+cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).tdas_denergy_table+ $
                string(10B)+'                      TDAS_angle_mode: '+cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).tdas_angle_mode

       endif else begin

          if (strmid(data_product_name,0,9) eq 'psp_isois') then begin

;
;            Use the PSP ISOIS modified VAR_NOTES Information to update the Parameter Caveats Metadata
;

             print,'Variable Notes: '+numerical_data.parameter(variable_loop).caveats

             parameter_key_mask=where(numerical_data.parameter(variable_loop).parameter_key eq psp_isois_l2_variable_attribute.parameter_key,parameter_key_mask_num)

             if (psp_isois_l2_variable_attribute(parameter_key_mask).display_type eq 'no_plot') then numerical_data.parameter(variable_loop).caveats='Warning: CDAWeb plots not supported'

             print,numerical_data.parameter(variable_loop).caveats,format='(a/)'

             if (psp_isois_l2_variable_attribute(parameter_key_mask).var_notes ne '') then begin

                if (numerical_data.parameter(variable_loop).caveats eq '') then begin

                   numerical_data.parameter(variable_loop).caveats=psp_isois_l2_variable_attribute(parameter_key_mask).var_notes

                endif else begin

                   numerical_data.parameter(variable_loop).caveats= $
                      numerical_data.parameter(variable_loop).caveats+string(10B)+'* '+psp_isois_l2_variable_attribute(parameter_key_mask).var_notes

                endelse

             endif

             print,numerical_data.parameter(variable_loop).caveats,format='(a/)'

             if (psp_isois_l2_variable_attribute(parameter_key_mask).mnemonic ne '') then begin

                if (numerical_data.parameter(variable_loop).caveats eq '') then begin

                   numerical_data.parameter(variable_loop).caveats='Mnemonic Pattern: '+psp_isois_l2_variable_attribute(parameter_key_mask).mnemonic

                endif else begin

                   numerical_data.parameter(variable_loop).caveats= $
                      numerical_data.parameter(variable_loop).caveats+string(10B)+'* Mnemonic Pattern: '+psp_isois_l2_variable_attribute(parameter_key_mask).mnemonic

                endelse

             endif

             print,numerical_data.parameter(variable_loop).caveats,format='(a/)'

             if (psp_isois_l2_variable_attribute(parameter_key_mask).variable_purpose ne '') then begin

                if (numerical_data.parameter(variable_loop).caveats eq '') then begin

                   numerical_data.parameter(variable_loop).caveats='Variable Purpose: '+psp_isois_l2_variable_attribute(parameter_key_mask).variable_purpose

                endif else begin

                   numerical_data.parameter(variable_loop).caveats= $
                      numerical_data.parameter(variable_loop).caveats+string(10B)+'* Variable Purpose: '+psp_isois_l2_variable_attribute(parameter_key_mask).variable_purpose

                endelse

             endif

             print,numerical_data.parameter(variable_loop).caveats,format='(a/)'

             if (psp_isois_l2_variable_attribute(parameter_key_mask).v_parent ne '') then begin

                if (numerical_data.parameter(variable_loop).caveats eq '') then begin

                   numerical_data.parameter(variable_loop).caveats='Variable Parent: '+psp_isois_l2_variable_attribute(parameter_key_mask).v_parent

                endif else begin

                   numerical_data.parameter(variable_loop).caveats= $
                      numerical_data.parameter(variable_loop).caveats+string(10B)+'* Variable Parent: '+psp_isois_l2_variable_attribute(parameter_key_mask).v_parent

                endelse

             endif

             print,numerical_data.parameter(variable_loop).caveats,format='(a/)'

             print,stars,format='(/a/)'

             multi_line_test=strsplit(numerical_data.parameter(variable_loop).caveats,string(10B),count=multi_line_test_num)

             help,multi_line_test_num

             print,''

             if(multi_line_test_num gt 1) then numerical_data.parameter(variable_loop).caveats='* '+numerical_data.parameter(variable_loop).caveats

             print,numerical_data.parameter(variable_loop).caveats

             print,stars,format='(/a/)'

          endif else begin

             if (strmatch(strmid(data_product_name,0,7),'psp_swp',/fold_case) eq 1) then begin

                if (data_product_name_mask_num ge 1) then begin

                   parameter_key_mask=where(numerical_data.parameter(variable_loop).parameter_key eq $
                                            numerical_data_parameter_all.table(data_product_name_mask).parameter_key, $
                                            parameter_key_mask_num)

                   if (parameter_key_mask_num eq 1) then begin

                      var_notes=numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).element__name_3

                      if (var_notes ne '') then begin

                         if (numerical_data.parameter(variable_loop).caveats eq '') then begin

                            numerical_data.parameter(variable_loop).caveats=strtrim(strjoin(strsplit(var_notes,/extract),' '),2)

                         endif else begin

                            numerical_data.parameter(variable_loop).caveats='* '+strtrim(strjoin(strsplit(cdaweb_var_notes,/extract),' '),2)+ $
                                                                            string(10B)+numerical_data.parameter(variable_loop).caveats

                         endelse

                      endif

                   endif

                endif

             endif else begin

                if (n_elements(cdaweb_var_notes) gt 0) then begin

                   if (cdaweb_var_notes ne '') then begin

                      if (numerical_data.parameter(variable_loop).caveats eq '') then begin

                         numerical_data.parameter(variable_loop).caveats=strtrim(strjoin(strsplit(cdaweb_var_notes,/extract),' '),2)

                      endif else begin

                         numerical_data.parameter(variable_loop).caveats='* '+strtrim(strjoin(strsplit(cdaweb_var_notes,/extract),' '),2)+ $
                                                                         string(10B)+numerical_data.parameter(variable_loop).caveats

                      endelse

                   endif

                endif

             endelse

          endelse

       endelse

       numerical_data.parameter(variable_loop).caveats=strjoin(strsplit(numerical_data.parameter(variable_loop).caveats,'\. \. ',/extract,/regex),' ')

       numerical_data.parameter(variable_loop).ucd=''

       if (cdaweb_avg_ptr_1 ne '') then begin

          for pointer_loop=0,variable_num-1 do $
              if (data_product_cdf_info.variable_info(pointer_loop).name eq cdaweb_avg_ptr_1) then $
                 avg_ptr_1_mask=pointer_loop

;         command='/Applications/CDF/cdf33_0-dist/src/tools/cdfdump -dump data -vars '+ $
;                 cdaweb_avg_ptr_1+' '+cdf_file_name+' | grep ^'+ $
;                 '"\ \ Record\ #\ "'+" | sed 's/^.*:\ //' | sed 's/"+'"'+"//g'"

;         spawn,command,cdaweb_avg_ptr_1_metadata,error_avg_ptr_1_metadata

;         cdaweb_avg_ptr_1_metadata=strtrim(cdaweb_avg_ptr_1_metadata,2)

       endif

       if (n_elements(cdaweb_fillval) gt 0) then begin

          command='echo "'+cdaweb_fillval+'" | sed -f '+project_program_dir+'variable_attribute_fillval.sed'

          spawn,command,cdaweb_fillval,error

       endif

       command='echo "'+cdaweb_avg_type+'" | sed -f '+project_program_dir+'variable_attribute_avg_type.sed'

       spawn,command,cdaweb_avg_type,error

;      if (strmid(data_product_name,0,9) ne 'psp_isois') then begin

;         caveats_text=strtrim(strjoin(strsplit(strjoin(numerical_data.parameter(variable_loop).caveats,' '),/extract),' '),2)

;         numerical_data.parameter(variable_loop).caveats=''

;      endif else begin

;         caveats_text=''

;      endelse

;      numerical_data.parameter(variable_loop).caveats=numerical_data.parameter(variable_loop).caveats+strtrim(strjoin(strsplit(caveats_text,/extract),' '),2)

       numerical_data.parameter(variable_loop).cadence=cadence

;      print,'CADENCE 000',numerical_data.parameter(variable_loop).name,numerical_data.parameter(variable_loop).cadence,strlowcase(cdaweb_depend_0),format='(a-15,a-125,a-30,a-30)'

       if (strmatch(strmid(data_product_name,0,7),"th[a-g]_l1_",/fold_case) eq 1 or data_product_name eq 'fast_hr_dcb') then begin

          time_cadence_info_mask=where(strlowcase(time_cadence_info.table.parameter_key) eq strlowcase(data_product_cdf_info.variable_info(variable_loop).name),time_cadence_info_mask_num)

          if (time_cadence_info_mask_num gt 0) then begin

             numerical_data.parameter(variable_loop).cadence=time_cadence_info.table(time_cadence_info_mask).cadence

;            print,'CADENCE 111',numerical_data.parameter(variable_loop).name,numerical_data.parameter(variable_loop).cadence,strlowcase(cdaweb_depend_0),format='(a-15,a-125,a-30,a-30)'

          endif else begin

             time_cadence_info_mask=where(time_cadence_info.table.parameter_key eq strlowcase(cdaweb_depend_0),time_cadence_info_mask_num)

             if (time_cadence_info_mask_num gt 0) then begin

                numerical_data.parameter(variable_loop).cadence=time_cadence_info.table(time_cadence_info_mask).cadence

;               print,'CADENCE 222',numerical_data.parameter(variable_loop).name,numerical_data.parameter(variable_loop).cadence,strlowcase(cdaweb_depend_0),format='(a-15,a-125,a-30,a-30)'

             endif

          endelse

       endif

       if (strmatch(strmid(data_product_name,0,7),"th[a-g]_l1_",/fold_case) eq 1 and $
           data_product_cdf_info.variable_info(variable_loop).name eq 'range_epoch') then begin

          if (themis_l1_info_mask(0) ne -1) then numerical_data.parameter(variable_loop).cadence=themis_l1_info.table(themis_l1_info_mask).cadence

;         print,'CADENCE 333',numerical_data.parameter(variable_loop).name,numerical_data.parameter(variable_loop).cadence,strlowcase(cdaweb_depend_0),format='(a-15,a-125,a-30,a-30)'

       endif

       if (strmatch(strmid(data_product_name,0,7),"th[a-g]_l1_",/fold_case) eq 1 or data_product_name eq 'fast_hr_dcb') then begin

          if (strmid(data_product_cdf_info.variable_info(variable_loop).name,strlen(data_product_cdf_info.variable_info(variable_loop).name)-6,6) eq '_epoch') then begin

             cadence_time_column_name= $
                strmid(data_product_cdf_info.variable_info(variable_loop).name,0,strlen(data_product_cdf_info.variable_info(variable_loop).name)-6)+'_time'

             time_cadence_info_mask=where(time_cadence_info.table.parameter_key eq cadence_time_column_name,time_cadence_info_mask_num)

             if (time_cadence_info_mask_num gt 0) then begin

                numerical_data.parameter(variable_loop).cadence=time_cadence_info.table(time_cadence_info_mask).cadence

;               print,'CADENCE 444',numerical_data.parameter(variable_loop).name,numerical_data.parameter(variable_loop).cadence,strlowcase(cdaweb_depend_0),format='(a-15,a-125,a-30,a-30)'

;               print,'PARAMETER INFO:  EPOCH  ',time_cadence_info.table(time_cadence_info_mask),format='(a/)'

             endif

          endif

          if ((strmatch(strmid(data_product_name,0,7),"th[a-e]_l1_",/fold_case) eq 1 or data_product_name eq 'fast_hr_dcb') and $
              strmid(data_product_cdf_info.variable_info(variable_loop).name,strlen(data_product_cdf_info.variable_info(variable_loop).name)-5,5) eq '_time') then begin

             time_cadence_info_mask=where(time_cadence_info.table.parameter_key eq data_product_cdf_info.variable_info(variable_loop).name,time_cadence_info_mask_num)

             if (time_cadence_info_mask_num gt 0) then begin

                numerical_data.parameter(variable_loop).cadence=time_cadence_info.table(time_cadence_info_mask).cadence

;               print,'CADENCE 555',numerical_data.parameter(variable_loop).name,numerical_data.parameter(variable_loop).cadence,strlowcase(cdaweb_depend_0),format='(a-15,a-125,a-30,a-30)'

;               print,'PARAMETER INFO:  TIME   ',time_cadence_info.table(time_cadence_info_mask),format='(a/)'

             endif

          endif

       endif

;      if (cdaweb_resolution ne '') then $
;         numerical_data.parameter(variable_loop).cadence=cdaweb_resolution

       command='echo "'+cdaweb_time_res+'" | sed -f '+project_program_dir+'variable_attribute_time_res_to_cadence.sed'

       spawn,command,cdaweb_time_res,error

       if (cdaweb_time_res ne '') then $
          numerical_data.parameter(variable_loop).cadence=cdaweb_time_res

       if (n_elements(cdaweb_resolution) gt 0) then $
          if (cdaweb_resolution eq '60') then numerical_data.parameter(variable_loop).cadence='PT1M'

;      print,'CADENCE 666',numerical_data.parameter(variable_loop).name,numerical_data.parameter(variable_loop).cadence,strlowcase(cdaweb_depend_0),format='(a-15,a-125,a-30,a-30)'

       if (cdaweb_depend_time ne '') then begin

          if (strmatch(strmid(data_product_name,0,7),"th[a-g]_l1_",/fold_case) eq 1 or data_product_name eq 'fast_hr_dcb') then begin

             time_cadence_info_mask=where(time_cadence_info.table.parameter_key eq cdaweb_depend_time,time_cadence_info_mask_num)

             if (time_cadence_info_mask_num gt 0) then begin

                numerical_data.parameter(variable_loop).cadence=time_cadence_info.table(time_cadence_info_mask).cadence

;               print,'CADENCE 777',numerical_data.parameter(variable_loop).name,numerical_data.parameter(variable_loop).cadence,strlowcase(cdaweb_depend_0),format='(/a-15,a-125,a-30,a-30)'

             endif

          endif

       endif

       if (numerical_data.parameter(variable_loop).cadence eq '') then $
          numerical_data.parameter(variable_loop).cadence='PT99999.999S'

       if (data_product_name eq 'thg_l1_ask' and $
           numerical_data.parameter(variable_loop).cadence eq 'PT99999.999S') then $
          numerical_data.parameter(variable_loop).cadence= $
             numerical_data.temporal_description.cadence

;      if (numerical_data.parameter(variable_loop).name eq 'range_epoch') then $
;         numerical_data.parameter(variable_loop).cadence='P1D'

;      if (data_product_name eq 'fast_hr_dcb' and numerical_data.parameter(variable_loop).name eq 'range_epoch') then $
;         numerical_data.parameter(variable_loop).cadence='P100M'

;      print,'CADENCE 888',numerical_data.parameter(variable_loop).name,numerical_data.parameter(variable_loop).cadence,strlowcase(cdaweb_depend_0),format='(a-15,a-125,a-30,a-30)'

       if (numerical_data.parameter(variable_loop).cadence eq '' or $
          numerical_data.parameter(variable_loop).cadence eq 'Variable') then $
             numerical_data.parameter(variable_loop).cadence='PT99999.999S'

       if (strmatch(strmid(data_product_name,0,9),'mms[1-4]_scm_',/fold_case) eq 1) then $
          if (numerical_data.parameter(variable_loop).parameter_key eq 'Epoch_delta') then $
             numerical_data.parameter(variable_loop).cadence=''

       if (strmatch(strmid(data_product_name,0,4),'g[01][0-9]_',/fold_case) eq 1) then $
          if (numerical_data.parameter(variable_loop).parameter_key eq 'time_tag_orbit' or $
              numerical_data.parameter(variable_loop).parameter_key eq 'inclination' or $
              numerical_data.parameter(variable_loop).parameter_key eq 'west_longitude') then $
             numerical_data.parameter(variable_loop).cadence='P1D'

       if (cdaweb_depend_0 eq '') then numerical_data.parameter(variable_loop).cadence=''

;
;      Get PSP ISOIS Variable Attribute Information
;

       if (strmid(data_product_name,0,9) eq 'psp_isois') then begin

          if (strmatch(numerical_data.parameter(variable_loop).parameter_key,'*epoch*',/fold_case) eq 1) then begin

             epoch_parameter_key=strsplit(numerical_data.parameter(variable_loop).parameter_key,'_DELTA',/extract,/fold_case,/regex)

          endif else begin

             epoch_parameter_key=cdaweb_depend_0

          endelse

          epoch_parameter_key=epoch_parameter_key(0)

          help,epoch_parameter_key

          print,'XXX___'+epoch_parameter_key+'___XXX',format='(a/)'

          epoch_mask=where(epoch_parameter_key eq psp_isois_epoch_cadence.epoch_parameter_key,epoch_mask_num)

          if (epoch_mask_num eq 1) then begin

             numerical_data.parameter(variable_loop).cadence=psp_isois_epoch_cadence(epoch_mask).cadence

             if (numerical_data.parameter(variable_loop).parameter_key ne epoch_parameter_key) then numerical_data.parameter(variable_loop).set='Time series defined by using: '+epoch_parameter_key

          endif

          print,'Parameter Key:'+string(9B)+numerical_data.parameter(variable_loop).parameter_key,format='(a/)'

          print,'Epoch Parameter Key:'+string(9B)+epoch_parameter_key,format='(a/)'

          print,psp_isois_epoch_cadence(epoch_mask)

          print,'Epoch Mask:'+string(9B)+strtrim(string(epoch_mask),2),format='(/a/)'

          print,'Epoch Mask Num:'+string(9B)+strtrim(string(epoch_mask_num),2),format='(a/)'

          print,'Epoch Name, Cadence:'+string(9B)+epoch_parameter_key+', '+numerical_data.parameter(variable_loop).cadence,format='(a/)'

       endif

       numerical_data.parameter(variable_loop).cadence_min=''

       numerical_data.parameter(variable_loop).cadence_max=''

;      print,'CADENCE 999',numerical_data.parameter(variable_loop).name,numerical_data.parameter(variable_loop).cadence,strlowcase(cdaweb_depend_0),format='(a-15,a-125,a-30,a-30/)'

;      command='echo "'+cdaweb_units+'" | sed -f '+project_program_dir+'variable_attribute_units.sed'

       numerical_data.parameter(variable_loop).units=cdaweb_units

       cdaweb_units_conversion=''

       if (cdaweb_si_conversion ne '') then begin

          command='echo "'+cdaweb_si_conversion+'" | sed -f '+project_program_dir+'variable_attribute_si_conversion.sed'

          spawn,command,cdaweb_units_conversion,error

       endif else begin

          if (cdaweb_units eq 'ms') then cdaweb_units_conversion='1.0e-3&gt;s'

          if (cdaweb_units eq 'ns') then cdaweb_units_conversion='1.0e-9&gt;s'

       endelse

       numerical_data.parameter(variable_loop).units_conversion=cdaweb_units_conversion

       if ((strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1 or $
           strmatch(strmid(data_product_name,0,10),'thg_l2_mag',/fold_case) eq 1) and $
           numerical_data.parameter(variable_loop).units ne '') then begin

          command='echo "'+numerical_data.parameter(variable_loop).units+ $
                  '" | sed -f '+project_program_dir+'units_to_units_conversion.sed'

          spawn,command,units_conversion,error

          numerical_data.parameter(variable_loop).units_conversion=units_conversion

       endif

       if (n_elements(cdaweb_dict_key) gt 0) then begin

          command='echo "'+strlowcase(cdaweb_dict_key)+'" | sed -f '+project_program_dir+'variable_attribute_dict_key.sed'

          spawn,command,cdaweb_dict_key,error

       endif

       coordinate_representation_list_num=n_elements(coordinate_representation_list)

       coordinate_system_name_list_num=n_elements(coordinate_system_name_list)

       cdaweb_dict_key_num=n_elements(cdaweb_dict_key)

       coordinate_system_name_list_mask=0

       coordinate_representation_list_mask=0

       if (cdaweb_dict_key_num gt 0) then begin

          if (cdaweb_dict_key ne '') then begin

             dict_key_split=strsplit(strjoin(strsplit(cdaweb_dict_key,'&gt;',/regex,/extract),'_'),'_',/extract)

             dict_key_split_num=n_elements(dict_key_split)

             coordinate_representation_list_mask=0

             coordinate_system_name_list_mask=0

             for split_loop=0,dict_key_split_num-1 do begin

                 for list_loop=1,coordinate_representation_list_num-1 do $
                     if (strmatch(dict_key_split(split_loop),coordinate_representation_list(list_loop),/fold_case) eq 1) then $
                        coordinate_representation_list_mask=list_loop

                 for list_loop=1,coordinate_system_name_list_num-1 do $
                     if (strmatch(dict_key_split(split_loop),coordinate_system_name_list(list_loop),/fold_case) eq 1) then $
                        coordinate_system_name_list_mask=list_loop

                 if (strmatch(cdaweb_dict_key,'*sc_status',/fold_case) eq 1) then coordinate_system_name_list_mask=0

             endfor

             numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation= $
                coordinate_representation_list(coordinate_representation_list_mask)

             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name= $
                coordinate_system_name_list(coordinate_system_name_list_mask)

          endif

       endif

       command='echo "'+cdaweb_frame+'" | sed -f '+project_program_dir+'variable_attribute_frame_to_coordinate_system_name.sed'

       spawn,command,cdaweb_frame_to_coordinate_system_name,error

       for list_loop=0,coordinate_system_name_list_num-1 do $
           if (strmatch(cdaweb_frame_to_coordinate_system_name,coordinate_system_name_list(list_loop),/fold_case) eq 1) then $
              coordinate_system_name_list_mask=list_loop

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq '') then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name= $
             coordinate_system_name_list(coordinate_system_name_list_mask)

       command='echo "'+cdaweb_frame+'" | sed -f '+project_program_dir+'variable_attribute_frame_to_coordinate_system_representation.sed'

       spawn,command,cdaweb_frame_to_coordinate_system_representation,error

       for list_loop=0,coordinate_representation_list_num-1 do $
           if (strmatch(cdaweb_frame_to_coordinate_system_representation,coordinate_representation_list(list_loop),/fold_case) eq 1) then $
              coordinate_representation_list_mask=list_loop

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '') then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation= $
             coordinate_representation_list(coordinate_representation_list_mask)

       command='echo "'+cdaweb_frame+'" | sed -f '+project_program_dir+'variable_attribute_frame_to_data_rank.sed'

       spawn,command,cdaweb_frame_to_data_rank,error

       qualifier_list_mask=0

       qualifier_list_num=n_elements(qualifier_list)

       for list_loop=0,qualifier_list_num-1 do $
           if (strmatch(cdaweb_frame_to_data_rank,qualifier_list(list_loop),/fold_case) eq 1) then $
              qualifier_list_mask=list_loop

       cdaweb_frame_to_qualifier=qualifier_list(qualifier_list_mask)

       for list_loop=1,coordinate_system_name_list_num-1 do $
           if (strmatch(cdaweb_coordinate_system,coordinate_system_name_list(list_loop),/fold_case) eq 1) then $
              coordinate_system_name_list_mask=list_loop

       if (coordinate_system_name_list_mask ne 0) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name= $
             coordinate_system_name_list(coordinate_system_name_list_mask)

       if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1 and size eq 3) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name= $
             coordinate_system_name_list(9)

       coordinate_representation_list_mask=0

       for list_loop=1,coordinate_representation_list_num-1 do $
           if (strmatch(cdaweb_representation_1,coordinate_representation_list(list_loop),/fold_case) eq 1) then $
              coordinate_representation_list_mask=list_loop

       if (coordinate_representation_list_mask ne 0) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation= $
             coordinate_representation_list(coordinate_representation_list_mask)

       if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1 and size eq 3) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation= $
             coordinate_representation_list(1)

       if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1 and $
           numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name ne '') then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation=coordinate_representation_list(1)

       if (cdaweb_parameter_info_mask(0) ne -1) then begin

          if (cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).coordinate_system ne '') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name= $
                cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).coordinate_system

          if (cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).representation_1 ne '') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation= $
                cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).representation_1

       endif

       coordinate_representation_test=numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation

       coordinate_representation_test_mask=where(coordinate_representation_test eq coordinate_representation_list)

       if (coordinate_representation_test_mask eq -1) then begin

          coordinate_representation_test_split=strsplit(coordinate_representation_test,'__',/extract,/regex)

          coordinate_representation_test=coordinate_representation_test_split(0)

          coordinate_representation_test_split=strsplit(coordinate_representation_test,'_',/extract)

          coordinate_representation_test_split_num=n_elements(coordinate_representation_test_split)

          if (coordinate_representation_test_split_num le 3) then begin

             vector_name=coordinate_representation_test_split(0)

          endif else begin

             vector_name=coordinate_representation_test_split(0)+'_'+coordinate_representation_test_split(1)

          endelse

          if (coordinate_representation_test_split_num le 3) then begin

             vector_element_list=strupcase(coordinate_representation_test_split(1))

          endif else begin

             vector_element_list=strupcase(coordinate_representation_test_split(2))

          endelse

          if (coordinate_representation_test_split_num ge 3) then begin

             coordinate_system_name_info=strupcase(coordinate_representation_test_split(coordinate_representation_test_split_num-1))

          endif else begin

             coordinate_system_name_info=''

          endelse

          if (vector_element_list eq 'XYZ') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation= $
                coordinate_representation_list(1)

       endif

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq 'GCI') then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(8)

       coordinate_system_name_test=numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name

       coordinate_system_name_test_mask=where(coordinate_system_name_test eq coordinate_system_name_list)

       if (coordinate_system_name_test_mask eq -1) then begin

          if (coordinate_system_name_test eq 'DSL') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(41)

          if (coordinate_system_name_test eq 'DSL (Despun Spacecraft)') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(41)

          if (coordinate_system_name_test eq 'DSL>Despun Spacecraft') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(41)

          if (coordinate_system_name_test eq 'FA') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(34)

          if (coordinate_system_name_test eq 'GSE>Geocentric Solar Ecliptic') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(11)

          if (coordinate_system_name_test eq 'GSM>Geocentric Solar Magnetic') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(13)

          if (coordinate_system_name_test eq 'SSL>Spinning Spacecraft') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(37)

          if (coordinate_system_name_test eq 'ENP') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(44)

          if (coordinate_system_name_test eq 'GCI') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(8)

          if (coordinate_system_name_test eq 'NA') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(0)

          if (coordinate_system_name_test eq 'SEL') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(0)

          if (coordinate_system_name_test eq 'sensor') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(0)

       endif

;
;      1           2    3   4    5    6    7     8    9    10   11   12   13   14    15  16   17   18   19     20   21   22   23   24  25  26  27                    28  29  30    31     32     33
;
;      Carrington, CGM, DM, GEI, GEO, GSE, GSEQ, GSM, HAE, HCC, HCI, HCR, HEE, HEEQ, HG, HGI, HPC, HPR, J2000, LGM, MAG, MFA, RTN, SC, SE, SM, SpacecraftOrbitPlane, SR, SR2, SSE, SSE_L, WGS84, GCI
;
;       90 cvc-type.3.1.3: The value 'DSL (Despun Spacecraft)' of element 'CoordinateSystemName' is not valid.           SC
;      510 cvc-type.3.1.3: The value 'DSL' of element 'CoordinateSystemName' is not valid.                               SC
;       35 cvc-type.3.1.3: The value 'DSL>Despun Spacecraft' of element 'CoordinateSystemName' is not valid.             SC
;        3 cvc-type.3.1.3: The value 'ENP' of element 'CoordinateSystemName' is not valid.                               SpacecraftOrbitPlane
;      180 cvc-type.3.1.3: The value 'FA' of element 'CoordinateSystemName' is not valid.                                MFA
;       24 cvc-type.3.1.3: The value 'GCI' of element 'CoordinateSystemName' is not valid.                               GEI
;       45 cvc-type.3.1.3: The value 'GSE>Geocentric Solar Ecliptic' of element 'CoordinateSystemName' is not valid.     GSE
;       35 cvc-type.3.1.3: The value 'GSM>Geocentric Solar Magnetic' of element 'CoordinateSystemName' is not valid.     GSM
;       20 cvc-type.3.1.3: The value 'NA' of element 'CoordinateSystemName' is not valid.                                Not applicable; reset 'NA' to ''
;       10 cvc-type.3.1.3: The value 'SEL' of element 'CoordinateSystemName' is not valid.                               Selenographic Corrdinates. Not in the Coordinate System Name List
;       15 cvc-type.3.1.3: The value 'SSL>Spinning Spacecraft' of element 'CoordinateSystemName' is not valid.           SC
;      855 cvc-type.3.1.3: The value 'sensor' of element 'CoordinateSystemName' is not valid.                            Not applicable; reset 'sensor' to ''
;

;
;      hmm
;

       if (cdaweb_property ne '') then begin

          qualifier_list_mask=0

          for list_loop=0,qualifier_list_num-1 do $
              if (strmatch(cdaweb_property,qualifier_list(list_loop),/fold_case) eq 1) then $
                 qualifier_list_mask=list_loop

          cdaweb_property_to_qualifier=qualifier_list(qualifier_list_mask)

          if (cdaweb_property_to_qualifier eq 'magnitude') then variable_size=1

          if (cdaweb_property_to_qualifier eq 'scalar') then variable_size=1

          if (cdaweb_property_to_qualifier eq 'spectrogram') then variable_size=999

          if (cdaweb_property_to_qualifier eq 'vector') then variable_size=3

       endif

       if (n_elements(cdaweb_display_type) gt 0) then begin

          if (strmatch(strmid(cdaweb_display_type,0,11),'time_series',/fold_case) eq 1) then $
             numerical_data.parameter(variable_loop).rendering_hints.display_type=display_type_list(5)

          if (strmatch(strmid(cdaweb_display_type,0,11),'spectrogram',/fold_case) eq 1) then $
             numerical_data.parameter(variable_loop).rendering_hints.display_type=display_type_list(3)

       endif

       if (size eq 1) then begin

          if (n_elements(cdaweb_lablaxis) gt 0) then $
             if (cdaweb_lablaxis ne '') then $
                numerical_data.parameter(variable_loop).rendering_hints.axis_label=strtrim(strjoin(strsplit(cdaweb_lablaxis,'[]',/extract)),2)

          numerical_data.parameter(variable_loop).rendering_hints.rendering_axis=''

          numerical_data.parameter(variable_loop).rendering_hints.index=''

          numerical_data.parameter(variable_loop).rendering_hints.scale_min=strjoin(strsplit(cdaweb_scalemin,', ',/regex,/extract),',')

          numerical_data.parameter(variable_loop).rendering_hints.scale_max=strjoin(strsplit(cdaweb_scalemax,', ',/regex,/extract),',')

          scale_min=numerical_data.parameter(variable_loop).rendering_hints.scale_min

          scale_max=numerical_data.parameter(variable_loop).rendering_hints.scale_max

          numerical_data.parameter(variable_loop).rendering_hints.scale_min=date_to_scale_min_max(scale_min)

          numerical_data.parameter(variable_loop).rendering_hints.scale_max=date_to_scale_min_max(scale_max)

       endif

       numerical_data.parameter(variable_loop).rendering_hints.axis_label=strtrim(cdaweb_lablaxis,2)

       if (data_product_name eq 'fast_hr_dcb') then $
          numerical_data.parameter(variable_loop).rendering_hints.axis_label=strtrim(cdaweb_lablaxis,2)

       if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1 and size eq 3) then $
          numerical_data.parameter(variable_loop).rendering_hints.axis_label=strtrim(cdaweb_fieldnam,2)

       if (data_product_name eq 'thg_l1_ask') then $
          numerical_data.parameter(variable_loop).rendering_hints.axis_label=strtrim(strjoin(strsplit(cdaweb_lablaxis,'[]',/extract)),2)

       if (n_elements(cdaweb_scaletyp) gt 0) then begin

          if (cdaweb_scaletyp ne '') then begin

             if (cdaweb_scaletyp eq 'lin') then cdaweb_scaletyp='linear'

             if (cdaweb_scaletyp eq 'log') then cdaweb_scaletyp='logarithmic'

             if (cdaweb_scaletyp eq 'linear') then numerical_data.parameter(variable_loop).rendering_hints.scale_type='LinearScale'

             if (cdaweb_scaletyp eq 'logarithmic') then numerical_data.parameter(variable_loop).rendering_hints.scale_type='LogScale'

          endif

       endif

       if (cdaweb_format ne '') then begin

          value_format=cdaweb_format

;         if (size gt 1) then value_format=strjoin(make_array(size,/string,value=value_format),',')

;         if (size eq 1) then numerical_data.parameter(variable_loop).rendering_hints.value_format=strupcase(value_format)

          numerical_data.parameter(variable_loop).rendering_hints.value_format=strupcase(value_format)

          if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1 and size eq 3) then $
             numerical_data.parameter(variable_loop).rendering_hints.value_format=strupcase(value_format)

       endif else begin

          value_format=cdaweb_form_ptr_metadata

          value_format_num=n_elements(value_format)

          if (size eq 1) then numerical_data.parameter(variable_loop).rendering_hints.value_format=strupcase(value_format)

          if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1 and size eq 3) then $
             numerical_data.parameter(variable_loop).rendering_hints.value_format=strupcase(value_format)

       endelse

       if (numerical_data.parameter(variable_loop).rendering_hints.value_format eq '%13.6e') then $
          numerical_data.parameter(variable_loop).rendering_hints.value_format='E13.6'

       if (size gt 1) then begin

          numerical_data.parameter(variable_loop).structure.size=string_condition(size_split,',',' ')

          numerical_data.parameter(variable_loop).structure.description=''

;LLLLL    if (strtrim(cdaweb_depend_1_metadata,2) ne '') then $
;LLLLL       name_name=strtrim(strsplit(cdaweb_depend_1_metadata,'[,]',/extract),2)

;LLLLL    if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1 and strtrim(cdaweb_labl_ptr_1_metadata,2) ne '') then $
;LLLLL       name_name=strsplit(cdaweb_labl_ptr_1_metadata,'[,]',/extract)

          value_format=cdaweb_form_ptr_metadata

          value_format_num=n_elements(value_format)

;         parameter_key=make_array(size,/string,value='UNKNOWN_PARAMETER_KEY')

          parameter_key=make_array(size,/string,value='')

;         if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then $
;            cdaweb_labl_ptr_1_metadata=strjoin(strsplit(cdaweb_labl_ptr_1_metadata,', local',/regex,/extract))

          if (strjoin(strtrim(cdaweb_labl_ptr_1_metadata,2)) ne '') then $
             parameter_key=cdaweb_labl_ptr_1_metadata

          if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1) then begin

             for element_loop=0L,size-1L do begin

                 command='echo "'+parameter_key(element_loop)+'" | sed -f '+project_program_dir+'themis_level_one_label.sed'

                 spawn,command,parameter_key_gloss,error

                 parameter_key(element_loop)=parameter_key_gloss

             endfor

          endif

          parameter_key_num=n_elements(parameter_key)

          if (parameter_key_num ne size) then parameter_key=make_array(size,/string,value=parameter_key(0))

          if (strjoin(cdaweb_unit_ptr_metadata) ne '') then begin

             units=make_array(n_elements(cdaweb_unit_ptr_metadata),/string,value='')

             units=cdaweb_unit_ptr_metadata

          endif

          if (strjoin(cdaweb_units_metadata) ne '') then begin

             units=make_array(n_elements(cdaweb_units_metadata),/string,value='')

             units=cdaweb_units_metadata

          endif

          if (n_elements(units) eq 0) then units=cdaweb_units

          units_num=n_elements(units)

          valid_min=make_array(size,/string,value='UNKNOWN_VALID_MIN')

          valid_max=make_array(size,/string,value='UNKNOWN_VALID_MAX')

          if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

             command='echo "'+cdaweb_validmax+'" | sed -f '+project_program_dir+'variable_attribute_validmax.sed'

             spawn,command,cdaweb_validmax,error

          endif

          if (strtrim(cdaweb_validmin,2) ne '') then valid_min=strsplit(cdaweb_validmin,', ',/extract)

          if (strtrim(cdaweb_validmax,2) ne '') then valid_max=strsplit(cdaweb_validmax,', ',/extract)

          valid_min_num=n_elements(valid_min)

          if (valid_min_num ne size) then valid_min=make_array(size,/string,value=valid_min(0))

          valid_max_num=n_elements(valid_max)

          if (valid_max_num ne size) then valid_max=make_array(size,/string,value=valid_max(0))

          if (size le 222) then begin

                if (dimension_num eq 1) then begin

                   for element_loop=0L,size-1L do begin

                       if (cdaweb_labl_ptr_1_metadata_num eq size) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).name= $
                             strtrim(cdaweb_labl_ptr_1_metadata(element_loop),2)

;
;                      Voyager PLS Faraday Cup Currents
;

                       if (strmatch(data_product_name,'voyager[12]_pls_electrons_e[12]') eq 1 or $
                           strmatch(data_product_name,'voyager[12]_pls_ions_[lm]') eq 1) then begin

                          energy_channel_number=strtrim(string(element_loop+1,format='(i3)'),2)

                          energy_channel_limits=voyager_pls_energy_channel(data_product_name)

                          if (cdaweb_labl_ptr_1_metadata_num eq size) then $
                             numerical_data.parameter(variable_loop).structure.element(element_loop).name= $
                                'Channel #'+energy_channel_number+' Energy Min - Max: '+energy_channel_limits(element_loop)+' eV - '+energy_channel_limits(element_loop+1)+' eV'

;                         if (cdaweb_labl_ptr_1_metadata_num eq size) then $
;                            numerical_data.parameter(variable_loop).structure.element(element_loop).name= $
;                               'Energy Channel Min - Max: '+strtrim(strjoin(strsplit(strjoin(strsplit(strjoin(strsplit(strcompress(cdaweb_labl_ptr_1_metadata(element_loop)),'\.\.\.*',/extract,/regex)), $
;                                                                                                      ',',/extract),'.'),'-',/extract),'eV -'),2)+' eV'

                       endif

;   LLLLL              if (data_product_name eq 'thg_l1_ask' and strjoin(strtrim(indgen(name_name_num),2),',') ne strjoin(name_name,',')) then $
;   LLLLL                 numerical_data.parameter(variable_loop).structure.element(element_loop).name=name_name(element_loop)

;                      if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1) then $
;                         numerical_data.parameter(variable_loop).structure.element(element_loop).name=parameter_key(element_loop)

                       qualifier_index=0

                       if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1 or data_product_name eq 'fast_hr_dcb') then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).name=strtrim(parameter_key(element_loop),2)

                       if (strmatch(strmid(data_product_name,0,13),'mms[1-4]_mec_srvy',/fold_case) eq 1) then begin

                          if (data_product_name_mask_num ge 1) then begin

                             parameter_key_mask= $
                                where(numerical_data.parameter(variable_loop).parameter_key eq $
                                      numerical_data_parameter_all.table(data_product_name_mask).parameter_key, $
                                      parameter_key_mask_num)

                             if (parameter_key_mask_num eq 1) then begin

                                if (element_loop eq 0) then $
                                   if (numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).element__name_0 ne '') then $
                                      numerical_data.parameter(variable_loop).structure.element(0).name= $
                                         numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).element__name_0

                                if (element_loop eq 1) then $
                                   if (numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).element__name_1 ne '') then $
                                      numerical_data.parameter(variable_loop).structure.element(1).name= $
                                         numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).element__name_1

                                if (element_loop eq 2) then $
                                   if (numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).element__name_2 ne '') then $
                                      numerical_data.parameter(variable_loop).structure.element(2).name= $
                                         numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).element__name_2

                                if (element_loop eq 3) then $
                                   if (numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).element__name_3 ne '') then $
                                      numerical_data.parameter(variable_loop).structure.element(3).name= $
                                         numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).element__name_3

                             endif

                          endif

                       endif

                       if (data_product_name ne 'thg_l1_ask') then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).qualifier(0)=qualifier_list(qualifier_index)

;   LLLLL              if (data_product_name eq 'thg_l1_ask' and strjoin(strtrim(indgen(name_name_num),2),',') ne strjoin(name_name,',')) then $
;   LLLLL                 numerical_data.parameter(variable_loop).structure.element(element_loop).index=strtrim(string(element_loop+1),2)

                       if (data_product_name eq 'fast_hr_dcb') then begin

;   LLLLL                 numerical_data.parameter(variable_loop).structure.element(element_loop).index=name_name(element_loop)

                          if (size eq 3 ) then numerical_data.parameter(variable_loop).structure.element(element_loop).qualifier(0)=qualifier_list(element_loop+10)

                       endif

;                      if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) ne 1 and $
;                          strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) ne 1 and $
;                          data_product_name ne 'thg_l1_ask' and data_product_name ne 'fast_hr_dcb') then $
;                         numerical_data.parameter(variable_loop).structure.element(element_loop).parameter_key=parameter_key(element_loop)

                       if (numerical_data.parameter(variable_loop).structure.element(element_loop).name eq '' and $
                           numerical_data.parameter(variable_loop).structure.element(element_loop).parameter_key eq 'UNKNOWN_PARAMETER_KEY') then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).parameter_key=''

                       if (data_product_name ne 'thg_l1_ask') then begin

                          if (units_num eq 1) then begin

                             command='echo "'+units+'" | sed -f '+project_program_dir+'variable_attribute_units.sed'

                             spawn,command,units,error

                             numerical_data.parameter(variable_loop).structure.element(element_loop).units=units

                          endif else begin

                             units_temp=units(element_loop)

                             command='echo "'+units_temp+'" | sed -f '+project_program_dir+'variable_attribute_units.sed'

                             spawn,command,units_temp,error

                             numerical_data.parameter(variable_loop).structure.element(element_loop).units=units_temp

                          endelse

                       endif

                       if (data_product_name_mask_num ge 1) then begin

                          variable_info_mask=where(data_product_cdf_info.variable_info(variable_loop).name eq $
                                                   numerical_data_parameter_all.table(data_product_name_mask).parameter_key, $
                                                   variable_info_mask_num)

                          if (variable_info_mask_num eq 1) then begin

                             units_temp=strsplit(numerical_data_parameter_all.table(data_product_name_mask(variable_info_mask)).units,'|',/extract,count=units_temp_num)

                             if (units_temp_num gt 1) then begin

                                numerical_data.parameter(variable_loop).structure.element(element_loop).units=units_temp(element_loop)

                                element_name_list_temp=strsplit(numerical_data_parameter_all.table(data_product_name_mask(variable_info_mask)).description,'[]',/extract,count=element_name_list_temp_num)

                                if (element_name_list_temp_num eq 3) then begin

                                   element_name_list=strtrim(strsplit(element_name_list_temp(1),',',/extract,count=element_name_list_num))

                                   if (element_name_list_num eq units_temp_num) then $
                                      numerical_data.parameter(variable_loop).structure.element(element_loop).name=element_name_list(element_loop)

                                endif

                             endif

                             units_conversion_temp=strsplit(numerical_data_parameter_all.table(data_product_name_mask(variable_info_mask)).units_conversion,'|',/extract,count=units_conversion_temp_num)

                             if (units_conversion_temp_num gt 1) then $
                                numerical_data.parameter(variable_loop).structure.element(element_loop).units_conversion=units_conversion_temp(element_loop)

                          endif

                       endif

                       if (cdaweb_parameter_info_mask(0) ne -1) then begin

                          if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1 or data_product_name eq 'fast_hr_dcb') then begin

                             units_temp=cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).units

                             command='echo "'+units_temp+'" | sed -f '+project_program_dir+'variable_attribute_units.sed'

                             spawn,command,units_temp,error

                             numerical_data.parameter(variable_loop).structure.element(element_loop).units=units_temp

                          endif

                       endif

;
;                      unit_LMT                                          ["hrs","min"]
;                      unit_geo                                          ["deg","deg","km"]
;

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'LMT' and element_loop eq 0) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units='h'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                            numerical_data.parameter(variable_loop).parameter_key eq 'LMT' and element_loop eq 0) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units_conversion='60&gt;s'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'LMT' and element_loop eq 1) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units='min'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'LMT' and element_loop eq 1) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units_conversion='3600&gt;s'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'GMLMT' and element_loop eq 0) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units='h'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'GMLMT' and element_loop eq 0) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units_conversion='60&gt;s'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'GMLMT' and element_loop eq 1) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units='min'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'GMLMT' and element_loop eq 1) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units_conversion='3600&gt;s'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'geo_coord' and element_loop eq 0) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units='&#176;'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'geo_coord' and element_loop eq 0) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units_conversion='0.0174532925&gt;rad'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'geo_coord' and element_loop eq 1) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units='&#176;'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'geo_coord' and element_loop eq 1) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units_conversion='0.0174532925&gt;rad'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'geo_coord' and element_loop eq 2) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units='km'

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                            strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                           numerical_data.parameter(variable_loop).parameter_key eq 'geo_coord' and element_loop eq 2) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).units_conversion='1e3&gt;m'

                       if (data_product_cdf_info.variable_info(variable_loop).name ne 'thg_mag_'+strlowcase(station_code)+'_compno') then $
                          if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then $
                             if (numerical_data.parameter(variable_loop).structure.element(element_loop).units eq 'nT') then cdaweb_units_conversion='1e-9&gt;T'

;                      if (data_product_name ne 'thg_l1_ask') then $
;                         numerical_data.parameter(variable_loop).structure.element(element_loop).units_conversion=cdaweb_units_conversion

                       if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1) then begin

                          command='echo "'+numerical_data.parameter(variable_loop).structure.element(element_loop).units+ $
                                  '" | sed -f '+project_program_dir+'units_to_units_conversion.sed'

                          spawn,command,units_conversion,error

                          numerical_data.parameter(variable_loop).structure.element(element_loop).units_conversion=units_conversion

                       endif

;                      if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1 or data_product_name eq 'fast_hr_dcb') then begin

                          numerical_data.parameter(variable_loop).structure.element(element_loop).valid_min=valid_min(element_loop)

                          numerical_data.parameter(variable_loop).structure.element(element_loop).valid_max=valid_max(element_loop)

;                      endif

                       cdaweb_fillval_num=n_elements(cdaweb_fillval)

                       if (cdaweb_fillval_num eq size) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).fill_value=strtrim(cdaweb_fillval,2)

                       if (size eq 1 and strmatch(cdaweb_display_type,'time_series',/fold_case) eq 1) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).rendering_hints.display_type=display_type_list(5)

;
;                      label_LMT                                         ["LMT(hh)","LMT(mm)"]
;                      label_geo                                         ["latitude","longitude","height"]
;                      label_GMLMT                                       ["GMLMT(hh)","GMLMT(mm)"]
;

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                           strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                          numerical_data.parameter(variable_loop).parameter_key eq 'LMT') then cdaweb_depend_1_metadata=["LMT(hh)","LMT(mm)"]

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                           strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                          numerical_data.parameter(variable_loop).parameter_key eq 'GMLMT') then cdaweb_depend_1_metadata=["GMLMT(hh)","GMLMT(mm)"]

                       if ((strmatch(strmid(data_product_name,0,13),"alouette[12]_av_",/fold_case) eq 1 or $
                           strmatch(strmid(data_product_name,0,5),"i[12]_av",/fold_case) eq 1) and $
                          numerical_data.parameter(variable_loop).parameter_key eq 'geo_coord') then cdaweb_depend_1_metadata=["latitude","longitude","height"]

                       cdaweb_depend_1_metadata_num=n_elements(cdaweb_depend_1_metadata)

                       if (cdaweb_depend_1_metadata_num eq size) then $
                          numerical_data.parameter(variable_loop).structure.element(element_loop).rendering_hints.axis_label= $
                             strtrim(strjoin(strsplit(strcompress(cdaweb_depend_1_metadata(element_loop)),'\.000*',/extract,/regex)),2)

                       if (n_elements(cdaweb_labl_ptr_1) gt 0) then begin

                          if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1 and cdaweb_labl_ptr_1 ne '') then begin

                             labl_ptr_1=cdaweb_labl_ptr_1_metadata

                             labl_ptr_1_num=n_elements(labl_ptr_1)

;
;                            Axis Label Special Condition Kluged or not?
;

                             if (labl_ptr_1_num ne size) then begin

                             remainder=labl_ptr_1_num mod size

                             if (remainder eq 0) then begin

                                concatenation_num=labl_ptr_1_num/size

                                concatenation_mask=indgen(concatenation_num)

                                concatenation_name=make_array(size,/string,value='UNKNOWN_NAME')

                                for concatenation_loop=0,size-1 do $
                                    concatenation_name(concatenation_loop)=string_condition(strjoin(labl_ptr_1(concatenation_loop*concatenation_num+concatenation_mask),' '),'  ',' ')

                                labl_ptr_1=concatenation_name

                                labl_ptr_1_num=size

                             endif else begin

                                labl_ptr_1=make_array(size,/string,value='WARNING '+labl_ptr_1(0))

                             endelse

                          endif

                          numerical_data.parameter(variable_loop).structure.element(element_loop).rendering_hints.axis_label=strtrim(labl_ptr_1(element_loop),2)

                       endif

                    endif

                    if (cdaweb_scalemin ne '') then begin

                       scalemin=strsplit(cdaweb_scalemin,', ',/regex,/extract)

                       scalemin_num=n_elements(scalemin)

                       if (scalemin_num eq 1) then begin

                          numerical_data.parameter(variable_loop).structure.element(element_loop).rendering_hints.scale_min=date_to_scale_min_max(scalemin)

                       endif else begin

                          if (element_loop lt scalemin_num) then $
                                numerical_data.parameter(variable_loop).structure.element(element_loop).rendering_hints.scale_min=date_to_scale_min_max(scalemin(element_loop))

                       endelse

                    endif

                    if (cdaweb_scalemax ne '') then begin

                       scalemax=strsplit(cdaweb_scalemax,', ',/regex,/extract)

                       scalemax_num=n_elements(scalemax)

                       if (scalemax_num eq 1) then begin

                          numerical_data.parameter(variable_loop).structure.element(element_loop).rendering_hints.scale_max=date_to_scale_min_max(scalemax)

                       endif else begin

                          if (element_loop lt scalemax_num) then $
                             numerical_data.parameter(variable_loop).structure.element(element_loop).rendering_hints.scale_max=date_to_scale_min_max(scalemax(element_loop))

                       endelse

                    endif

                    if (numerical_data.parameter(variable_loop).rendering_hints.value_format eq '') then begin

                       value_format=cdaweb_form_ptr_metadata

                       value_format_num=n_elements(value_format)

;                      if (value_format_num eq size and strjoin(value_format) ne '') then $
;                         numerical_data.parameter(variable_loop).structure.element(element_loop).rendering_hints.value_format=strupcase(value_format(element_loop))

                    endif

                    blank_test=spase_model_blank_check(numerical_data.parameter(variable_loop).structure.element(element_loop))

                    if (blank_test ne '') then $
                       numerical_data.parameter(variable_loop).structure.element(element_loop).index=strtrim(element_loop+1,2)

                    if (numerical_data.parameter(variable_loop).structure.element(element_loop).name eq '') then begin

                       if (strmatch(data_product_name,'voyager[12]_pls_electrons_e[12]') eq 1 or $
                           strmatch(data_product_name,'voyager[12]_pls_ions_[lm]') eq 1 and $
                           numerical_data.parameter(variable_loop).parameter_key ne 'Channel') then begin

;
;                         Voyager PLS Faraday Cup Currents
;

                          energy_channel_number=strtrim(string(element_loop+1,format='(i3)'),2)

                          energy_channel_limits=voyager_pls_energy_channel(data_product_name)

                          numerical_data.parameter(variable_loop).structure.element(element_loop).name= $
                             'Channel #'+energy_channel_number+' Energy Min - Max: '+energy_channel_limits(element_loop)+' eV - '+energy_channel_limits(element_loop+1)+' eV'

                          numerical_data.parameter(variable_loop).structure.element(element_loop).rendering_hints.axis_label=energy_channel_number

;                         if (cdaweb_labl_ptr_1_metadata_num eq size) then $
;                            numerical_data.parameter(variable_loop).structure.element(element_loop).name= $
;                               'Energy Channel Min - Max: '+strtrim(strjoin(strsplit(strjoin(strsplit(strjoin(strsplit(strcompress(cdaweb_labl_ptr_1_metadata(element_loop)),'\.\.\.*',/extract,/regex)), $
;                                                                                                      ',',/extract),'.'),'-',/extract),'eV -'),2)+' eV'

                       endif else begin

                          numerical_data.parameter(variable_loop).structure.element(element_loop).name='Element '+strtrim(string(element_loop+1),2)

                       endelse

                    endif

;                   numerical_data.parameter(variable_loop).structure.element(element_loop).index

                    if (numerical_data.parameter(variable_loop).structure.element(element_loop).name eq 'UNKNOWN_PARAMETER_KEY') then $
                       numerical_data.parameter(variable_loop).structure.element(element_loop).name=strmid(numerical_data.parameter(variable_loop).name,element_loop,1)

                    if (strmatch(strmid(data_product_name,0,10),'mms[1-4]_hpca_',/fold_case) eq 1 and size ge 3 and size le 4) then begin

                       element_name_mms_hpca=['X','Y','Z','Magnitude']

                       numerical_data.parameter(variable_loop).structure.element(element_loop).name=element_name_mms_hpca(element_loop)

                    endif

                endfor

             endif else begin

                size_text=strsplit(size,',',count=size_text_num,/extract)

                dimension=strsplit(size,',',count=size_text_num,/extract)

                dimension_long=long(strsplit(size,',',/extract))

                if (size_text_num eq 2) then begin

                   element_num=dimension_long(0)*dimension_long(1)

                   numerical_data.parameter(variable_loop).structure.size=strtrim(string(size_text(0)),2)+' '+strtrim(string(size_text(1)),2)

                endif

                if (size_text_num eq 3) then begin

                   element_num=dimension_long(0)*dimension_long(1)*dimension_long(2)

                   numerical_data.parameter(variable_loop).structure.size=strtrim(string(size_text(0)),2)+' '+ $
                                                                          strtrim(string(size_text(1)),2)+' '+ $
                                                                          strtrim(string(size_text(2)),2)

                endif

                if (size_text_num eq 4) then begin

                   element_num=dimension_long(0)*dimension_long(1)*dimension_long(2)*dimension_long(3)

                   numerical_data.parameter(variable_loop).structure.size=strtrim(string(size_text(0)),2)+' '+ $
                                                                          strtrim(string(size_text(1)),2)+' '+ $
                                                                          strtrim(string(size_text(2)),2)+' '+ $
                                                                          strtrim(string(size_text(3)),2)

                endif

;
;LLLLL          if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1) then $
;LLLLL             cdaweb_labl_ptr_1_metadata=strsplit(cdaweb_labl_ptr_1_metadata,',',/regex,/extract)
;
;LLLLL          if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1) then $
;LLLLL             cdaweb_labl_ptr_2_metadata=strsplit(cdaweb_labl_ptr_2_metadata,',',/regex,/extract)
;


                if (strjoin(cdaweb_labl_ptr_1_metadata,'') ne '') then begin

                   numerical_data.parameter(variable_loop).description= $
                      numerical_data.parameter(variable_loop).description+'.'+string(10B)+string(10B)+ $
                      '* Column 1 Labels from '+strupcase(cdaweb_depend_1)+': ["'+strjoin(cdaweb_labl_ptr_1_metadata,'","')+'"]'

                endif else begin

                   if (strcompress(strjoin(cdaweb_depend_1_metadata,',')) ne '') then $
                      numerical_data.parameter(variable_loop).description= $
                         numerical_data.parameter(variable_loop).description+'.'+string(10B)+string(10B)+ $
                         '* Column 1 Labels from '+strupcase(cdaweb_depend_1)+': ['+strcompress(strjoin(cdaweb_depend_1_metadata,','))+']'

                endelse

                if (strjoin(cdaweb_labl_ptr_2_metadata,'') ne '') then begin

                   numerical_data.parameter(variable_loop).description= $
                      numerical_data.parameter(variable_loop).description+'.'+string(10B)+ $
                      '* Column 2 Labels from '+strupcase(cdaweb_depend_2)+': ["'+strjoin(cdaweb_labl_ptr_2_metadata,'","')+'"].'

                endif else begin

                   if (strcompress(strjoin(cdaweb_depend_2_metadata,',')) ne '') then $
                      numerical_data.parameter(variable_loop).description= $
                         numerical_data.parameter(variable_loop).description+'.'+string(10B)+ $
                         '* Column 2 Labels from '+strupcase(cdaweb_depend_2)+': ['+strcompress(strjoin(cdaweb_depend_2_metadata,','))+'].'

                endelse

                if (strjoin(cdaweb_labl_ptr_3_metadata,'') ne '') then begin

                   numerical_data.parameter(variable_loop).description= $
                      numerical_data.parameter(variable_loop).description+string(10B)+ $
                      ' * Column 3 Labels from '+strupcase(cdaweb_depend_3)+': ["'+strjoin(cdaweb_labl_ptr_3_metadata,'","')+'"].'

                endif else begin

                   if (strcompress(strjoin(cdaweb_depend_3_metadata,',')) ne '') then $
                      numerical_data.parameter(variable_loop).description= $
                         numerical_data.parameter(variable_loop).description+string(10B)+ $
                         '* Column 3 Labels from '+strupcase(cdaweb_depend_3)+': ['+strcompress(strjoin(cdaweb_depend_3_metadata,','))+'].'

                endelse

                if (dimension_num eq 999 and element_num le 256) then begin

                   for element_loop_000=0L,dimension(0)-1L do begin

                       for element_loop_001=0L,dimension(1)-1L do begin

                           index_num=element_loop_001*dimension(0)+element_loop_000

                           numerical_data.parameter(variable_loop).structure.element(index_num).name='Element '+strtrim(string(element_loop_000+1),2)+' '+strtrim(string(element_loop_001+1),2)

                           if (n_elements(cdaweb_labl_ptr_1_metadata) gt 0 and n_elements(cdaweb_labl_ptr_2_metadata) gt 0 and cdaweb_labl_ptr_2_metadata(0) ne '') then $
                              numerical_data.parameter(variable_loop).structure.element(index_num).name=cdaweb_labl_ptr_1_metadata(element_loop_000)+', '+cdaweb_labl_ptr_2_metadata(element_loop_001)

                           qualifier_index=0

                           numerical_data.parameter(variable_loop).structure.element(index_num).qualifier(0)=qualifier_list(qualifier_index)

                           numerical_data.parameter(variable_loop).structure.element(index_num).index=strtrim(string(index_num+1),2)

                           if (strmatch(strmid(data_product_name,0,10),'mms[1-4]_hpca_',/fold_case) eq 1 and element_num eq 9) then begin

                              element_name_mms_hpca=['xx','yx','zx','xy','yy','zy','xz','yz','zz']

                              numerical_data.parameter(variable_loop).structure.element(index_num).name=element_name_mms_hpca(index_num)

                           endif

                           if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) ne 1) then $
                              numerical_data.parameter(variable_loop).structure.element(index_num).parameter_key=parameter_key(element_loop_000)

                           if (units_num eq element_num) then begin

                              units_temp=units(element_loop_000)

                              command='echo "'+units_temp+'" | sed -f '+project_program_dir+'variable_attribute_units.sed'

                              spawn,command,units_temp,error

                              numerical_data.parameter(variable_loop).structure.element(index_num).units=units_temp

                           endif

                           if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1) then begin

                              units_temp=cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).units

                              command='echo "'+units_temp+'" | sed -f '+project_program_dir+'variable_attribute_units.sed'

                              spawn,command,units_temp,error

                              numerical_data.parameter(variable_loop).structure.element(element_loop_000).units=units_temp

                           endif

;                          numerical_data.parameter(variable_loop).structure.element(index_num).units_conversion=cdaweb_units_conversion

                           if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1) then begin

                              units_num=n_elements(numerical_data.parameter(variable_loop).structure.element(element_loop_000).units)

;                             command='echo "'+numerical_data.parameter(variable_loop).structure.element(element_loop_000).units+ $
;                                     '" | sed -f '+project_program_dir+'units_to_units_conversion.sed'

                              if (element_loop_000 lt units_num) then $
                                 command='echo "'+numerical_data.parameter(variable_loop).structure.element(element_loop_000).units(element_loop_000)+ $
                                         '" | sed -f '+project_program_dir+'units_to_units_conversion.sed'

                              spawn,command,units_conversion,error

                              numerical_data.parameter(variable_loop).structure.element(index_num).units_conversion=units_conversion

                           endif

                           if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) ne 1) then $
                              numerical_data.parameter(variable_loop).structure.element(index_num).valid_min=valid_min(element_loop_000)

                           if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) ne 1) then $
                              numerical_data.parameter(variable_loop).structure.element(index_num).valid_max=valid_max(element_loop_000)

                           cdaweb_fillval_num=n_elements(cdaweb_fillval)

                           if (cdaweb_fillval_num eq size) then $
                              numerical_data.parameter(variable_loop).structure.element(index_num).fill_value=strtrim(cdaweb_fillval,2)

                           if (size eq element_num and strmatch(cdaweb_display_type,'time_series',/fold_case) eq 1) then $
                              numerical_data.parameter(variable_loop).structure.element(index_num).rendering_hints.display_type=display_type_list(5)

                           if (n_elements(cdaweb_labl_ptr_1_metadata) gt 0 and n_elements(cdaweb_labl_ptr_2_metadata) gt 0 and cdaweb_labl_ptr_2_metadata(0) ne '') then $
                              numerical_data.parameter(variable_loop).structure.element(index_num).rendering_hints.axis_label= $
                                 strtrim(cdaweb_labl_ptr_1_metadata(element_loop_000)+', '+cdaweb_labl_ptr_2_metadata(element_loop_001),2)

                           if (cdaweb_scalemin ne '') then begin

                              scalemin=strsplit(cdaweb_scalemin,', ',/regex,/extract)

                              scalemin_num=n_elements(scalemin)

                              if (scalemin_num eq element_num) then $
                                 numerical_data.parameter(variable_loop).structure.element(index_num).rendering_hints.scale_min=date_to_scale_min_max(scalemin(element_loop_000))

                           endif

                           if (cdaweb_scalemax ne '') then begin

                              scalemax=strsplit(cdaweb_scalemax,', ',/regex,/extract)

                              scalemax_num=n_elements(scalemax)

                              if (scalemax_num eq 1) then $
                                 numerical_data.parameter(variable_loop).structure.element(index_num).rendering_hints.scale_max=date_to_scale_min_max(scalemax(element_loop_000))

                           endif

;                          if (cdaweb_format ne '') then begin

                           if (numerical_data.parameter(variable_loop).rendering_hints.value_format ne '') then begin

                              value_format=cdaweb_form_ptr_metadata

                              value_format_num=n_elements(value_format)

                              if (value_format_num eq element_num) then $
                                 numerical_data.parameter(variable_loop).structure.element(index_num).rendering_hints.value_format=strupcase(value_format(element_loop_000))

                           endif

                       endfor

                   endfor

                   numerical_data.parameter(variable_loop).structure.element(*).valid_min=''

                   numerical_data.parameter(variable_loop).structure.element(*).valid_max=''

                endif

             endelse

          endif

;
;         Collapse if all Elements have the same Units, Units Conversion, Valid Min, Valid Max, Scale Min, Scale Max, etc.
;

          if (size le 256) then begin

             element_units=numerical_data.parameter(variable_loop).structure.element(0:size-1).units

             element_units_uniq=element_units(uniq(element_units,sort(element_units)))

             if (size gt 1 and numerical_data.parameter(variable_loop).units eq '' and n_elements(element_units_uniq) eq 1 and strjoin(element_units_uniq) ne '') then begin

                units_temp=element_units_uniq

                command='echo "'+units_temp+'" | sed -f '+project_program_dir+'variable_attribute_units.sed'

                spawn,command,units_temp,error

                numerical_data.parameter(variable_loop).units=units_temp

                numerical_data.parameter(variable_loop).structure.element(0:size-1).units=''

;               if (element_units_uniq eq 'nT') then $
;                  numerical_data.parameter(variable_loop).units_conversion='1e-9&gt;T'

             endif

             element_units_conversion=numerical_data.parameter(variable_loop).structure.element(0:size-1).units_conversion

             element_units_conversion_uniq=element_units_conversion(uniq(element_units_conversion,sort(element_units_conversion)))

;            if (size gt 1 and numerical_data.parameter(variable_loop).units_conversion eq '' and n_elements(element_units_conversion_uniq) eq 1 and $

             if (size gt 1 and n_elements(element_units_conversion_uniq) eq 1 and strjoin(element_units_conversion_uniq) ne '') then begin

                numerical_data.parameter(variable_loop).units_conversion=element_units_conversion_uniq

                numerical_data.parameter(variable_loop).structure.element(0:size-1).units_conversion=''

             endif

             if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1 and $
                 numerical_data.parameter(variable_loop).units eq 'nT') then $
                numerical_data.parameter(variable_loop).units_conversion='1e-9&gt;T'

             if (n_elements(element_units_uniq) eq 1) then begin

                element_valid_min=numerical_data.parameter(variable_loop).structure.element(0:size-1).valid_min

                element_valid_min_uniq=element_valid_min(uniq(element_valid_min,sort(element_valid_min)))

                if (size gt 1 and numerical_data.parameter(variable_loop).valid_min eq '' and $
                    n_elements(element_valid_min_uniq) eq 1 and strjoin(element_valid_min_uniq) ne '') then begin

                   numerical_data.parameter(variable_loop).valid_min=element_valid_min_uniq

                   numerical_data.parameter(variable_loop).structure.element(0:size-1).valid_min=''

                endif

                element_valid_max=numerical_data.parameter(variable_loop).structure.element(0:size-1).valid_max

                element_valid_max_uniq=element_valid_max(uniq(element_valid_max,sort(element_valid_max)))

                if (size gt 1 and numerical_data.parameter(variable_loop).valid_max eq '' and $
                    n_elements(element_valid_max_uniq) eq 1 and strjoin(element_valid_max_uniq) ne '') then begin

                   numerical_data.parameter(variable_loop).valid_max=element_valid_max_uniq

                   numerical_data.parameter(variable_loop).structure.element(0:size-1).valid_max=''

                endif

                element_scale_min=numerical_data.parameter(variable_loop).structure.element(0:size-1).rendering_hints.scale_min

                element_scale_min_uniq=element_scale_min(uniq(element_scale_min,sort(element_scale_min)))

                if (size gt 1 and numerical_data.parameter(variable_loop).rendering_hints.scale_min eq '' and $
                    n_elements(element_scale_min_uniq) eq 1 and strjoin(element_scale_min_uniq) ne '') then begin

                   numerical_data.parameter(variable_loop).rendering_hints.scale_min=date_to_scale_min_max(element_scale_min_uniq)

                   numerical_data.parameter(variable_loop).structure.element(0:size-1).rendering_hints.scale_min=''

                endif

                element_scale_max=numerical_data.parameter(variable_loop).structure.element(0:size-1).rendering_hints.scale_max

                element_scale_max_uniq=element_scale_max(uniq(element_scale_max,sort(element_scale_max)))

                if (size gt 1 and numerical_data.parameter(variable_loop).rendering_hints.scale_max eq '' and $
                    n_elements(element_scale_max_uniq) eq 1 and strjoin(element_scale_max_uniq) ne '') then begin

                   numerical_data.parameter(variable_loop).rendering_hints.scale_max=date_to_scale_min_max(element_scale_max_uniq)

                   numerical_data.parameter(variable_loop).structure.element(0:size-1).rendering_hints.scale_max=''

                endif

             endif

          endif

;
;         25353 VAR_TYPE        XXX   Parameter   keyword_parameter_type(variable_loop)
;
;          9742 VAR_NOTES       XXX   Parameter   numerical_data.parameter(variable_loop).caveats
;
;         24894 FIELDNAM        XXX   Parameter   numerical_data.parameter(variable_loop).name
;
;         15420 DEPEND_0        XXX   Parameter   numerical_data.parameter(variable_loop).set
;
;               Variable Name   XXX   Parameter   numerical_data.parameter(variable_loop).structure.element(element_loop).parameter_key
;
;         15286 DEPEND_1        XXX   Element     numerical_data.parameter(variable_loop).structure.element(element_loop).name
;
;         24687 CATDESC         XXX   Parameter   numerical_data.parameter(variable_loop).set
;                               XXX   Parameter   numerical_data.parameter(variable_loop).description
;
;         21319 FORMAT          XXX   Parameter   numerical_data.parameter(variable_loop).rendering_hints.value_format
;           307 FORM_PTR        XXX   Element     numerical_data.parameter(variable_loop).rendering_hints.value_format
;
;         21042 VALIDMIN        XXX   Parameter   numerical_data.parameter(variable_loop).valid_min
;                               XXX   Element     numerical_data.parameter(variable_loop).structure.element(element_loop).valid_min
;
;         20836 VALIDMAX        XXX   Parameter   numerical_data.parameter(variable_loop).valid_max
;                               XXX   Element     numerical_data.parameter(variable_loop).structure.element(element_loop).valid_max
;
;         20882 FILLVAL         XXX   Parameter   numerical_data.parameter(variable_loop).fill_value
;                               XXX   Element     numerical_data.parameter(variable_loop).structure.element(element_loop).fill_value
;
;         18904 UNITS           XXX   Parameter   numerical_data.parameter(variable_loop).units
;                               XXX   Element     numerical_data.parameter(variable_loop).structure.element(element_loop).units
;           627 UNIT_PTR        XXX   Element     numerical_data.parameter(variable_loop).structure.element(element_loop).units
;
;          2939 SI_CONVERSION   ---   Parameter   numerical_data.parameter(variable_loop).units_conversion
;
;         16921 LABLAXIS        XXX   Parameter   numerical_data.parameter(variable_loop).rendering_hints.axis_label
;          4103 LABL_PTR_1      XXX   Parameter   numerical_data.parameter(variable_loop).rendering_hints.axis_label
;          4103 LABL_PTR_1      XXX   Element     numerical_data.parameter(variable_loop).structure.element(element_loop).parameter_key
;
;           121 LABL_PTR_2      ---
;             6 LABL_PTR_3      ---
;            23 LABEL_1         ---
;
;         16707 DISPLAY_TYPE    XXX   Parameter   numerical_data.parameter(variable_loop).rendering_hints.display_type
;
;         13427 DICT_KEY        ---
;
;         10854 SCALEMAX        XXX   Parameter   data_product_cdf_info.variable_info(variable_loop).attribute.scalemin.text
;         10595 SCALEMIN        XXX   Parameter   data_product_cdf_info.variable_info(variable_loop).attribute.scalemax.text
;
;          6465 SCALETYP        ---
;            95 SCALE_TYP       ---
;            16 SCAL_PTR        ---
;
;          8155 AVG_TYPE        ---
;
;          3228 MONOTON         ---
;
;          2344 SC_ID           ---
;

       endif else begin

          split=strsplit(cdaweb_validmin,',',/extract)

          numerical_data.parameter(variable_loop).valid_min=split(0)

          split=strsplit(cdaweb_validmax,',',/extract)

          numerical_data.parameter(variable_loop).valid_max=split(0)

          if (cdaweb_parameter_info_mask(0) ne -1 and strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1) then $
             numerical_data.parameter(variable_loop).valid_min=cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).validmin

          if (cdaweb_parameter_info_mask(0) ne -1 and strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1) then $
             numerical_data.parameter(variable_loop).valid_max=cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).validmax

       endelse

       if (data_product_name eq 'thg_l1_ask') then $
          numerical_data.parameter(variable_loop).valid_min=cdaweb_validmin

       if (data_product_name eq 'thg_l1_ask') then $
          numerical_data.parameter(variable_loop).valid_max=cdaweb_validmax

       cdaweb_fillval_num=n_elements(cdaweb_fillval)

       if (cdaweb_fillval_num eq 1) then $
          numerical_data.parameter(variable_loop).fill_value=cdaweb_fillval

       keyword_field=0

       keyword_particle=0

       keyword_wave=0

       keyword_mixed=0

       keyword_support=0

       qualifier=''

       quantity=''

       particle_type_list_index_loop_num=0

       mixed_quantity_list_index=0

       mixed_quantity=''

       qualifier_list_index_loop_num=0

       if (data_product_name_mask_num ge 1) then begin

          parameter_key_mask=where(numerical_data.parameter(variable_loop).parameter_key eq $
                                   numerical_data_parameter_all.table(data_product_name_mask).parameter_key,parameter_key_mask_num)

          if (parameter_key_mask_num eq 1) then begin

             parameter_keyword=strlowcase(numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).parameter_keyword)

             keyword_parameter_type(variable_loop)=parameter_keyword

             command='keyword_'+parameter_keyword+'=1'

             command_error=execute(command)

             if (parameter_keyword eq 'support') then begin

                support_quantity=numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).quantity

                support_quantity_list_index=where(support_quantity eq support_quantity_list,support_quantity_list_index_num)

                if (support_quantity_list_index_num eq 1) then begin

                   support_quantity=support_quantity_list(support_quantity_list_index)

                endif else begin

                   support_quantity=support_quantity_list(0)

                endelse

             endif

             if (parameter_keyword eq 'field') then begin

                field_quantity=numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).quantity

                field_quantity_list_index=where(field_quantity eq field_quantity_list,field_quantity_list_index_num)

                if (field_quantity_list_index_num eq 1) then begin

                   field_quantity=field_quantity_list(field_quantity_list_index)

                endif else begin

                   field_quantity=field_quantity_list(field_quantity_list_index)

                endelse

             endif

             if (parameter_keyword eq 'mixed') then begin

                mixed_quantity=numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).quantity

                mixed_quantity_list_index=where(mixed_quantity eq mixed_quantity_list,mixed_quantity_list_index_num)

                if (mixed_quantity_list_index_num eq 1) then begin

                   mixed_quantity=mixed_quantity_list(mixed_quantity_list_index)

                endif else begin

                   mixed_quantity=mixed_quantity_list(0)

                endelse

                particle_type=strsplit(numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).type,/extract)

                particle_type_list_index_loop_num=n_elements(particle_type)

                particle_type_list_index=make_array(particle_type_list_index_loop_num,/int,value=0)

                for particle_type_list_index_loop=0,particle_type_list_index_loop_num-1 do begin

                    particle_type_list_index(particle_type_list_index_loop)= $
                       where(particle_type(particle_type_list_index_loop) eq particle_type_list,particle_type_list_index_num)

                    if (particle_type_list_index_num eq 0) then $
                       particle_type_list_index(particle_type_list_index_loop)=0

                endfor

             endif

             if (parameter_keyword eq 'particle') then begin

                particle_quantity=numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).quantity

                particle_quantity_list_index=where(particle_quantity eq particle_quantity_list,particle_quantity_list_index_num)

                if (particle_quantity_list_index_num eq 1) then begin

                   particle_quantity=particle_quantity_list(particle_quantity_list_index)

                endif else begin

                   particle_quantity=particle_quantity_list(0)

                endelse

                particle_type=strsplit(numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).type,/extract)

                particle_type_list_index_loop_num=n_elements(particle_type)

                particle_type_list_index=make_array(particle_type_list_index_loop_num,/int,value=0)

                for particle_type_list_index_loop=0,particle_type_list_index_loop_num-1 do begin

                    particle_type_list_index(particle_type_list_index_loop)= $
                       where(particle_type(particle_type_list_index_loop) eq particle_type_list,particle_type_list_index_num)

                    if (particle_type_list_index_num eq 0) then $
                       particle_type_list_index(particle_type_list_index_loop)=0

                endfor

             endif

             if (parameter_keyword eq 'wave') then begin

                wave_quantity=numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).quantity

                wave_quantity_list_index=where(wave_quantity eq wave_quantity_list,wave_quantity_list_index_num)

                if (wave_quantity_list_index_num eq 1) then begin

                   wave_quantity=wave_quantity_list(wave_quantity_list_index)

                endif else begin

                   wave_quantity=wave_quantity_list(0)

                endelse

                wave_type=strsplit(numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).type,/extract)

                wave_type_list_index_loop_num=n_elements(wave_type)

                wave_type_list_index=make_array(wave_type_list_index_loop_num,/int,value=0)

                for wave_type_list_index_loop=0,wave_type_list_index_loop_num-1 do begin

                    wave_type_list_index(wave_type_list_index_loop)= $
                       where(wave_type(wave_type_list_index_loop) eq wave_type_list,wave_type_list_index_num)

                    if (wave_type_list_index_num eq 1) then begin

                       numerical_data.parameter(variable_loop).wave.wave_type(wave_type_list_index_loop)=wave_type_list(wave_type_list_index(wave_type_list_index_loop))

                    endif else begin

                       wave_type_list_index(wave_type_list_index_loop)=0

                    endelse

                endfor

             endif

             qualifier=strsplit(numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).qualifier,/extract)

             qualifier_list_index_loop_num=n_elements(qualifier)

             qualifier_list_index=make_array(qualifier_list_index_loop_num,/int,value=0)

             for qualifier_list_index_loop=0,qualifier_list_index_loop_num-1 do begin

                 qualifier_list_index(qualifier_list_index_loop)=where(qualifier(qualifier_list_index_loop) eq qualifier_list,qualifier_list_index_num)

                 if (qualifier_list_index_num eq 0) then $
                    qualifier_list_index(qualifier_list_index_loop)=0

             endfor

          endif

       endif else begin

          parameter_key_mask_num=0

          if (n_elements(cdaweb_var_type) gt 0) then begin

             if (cdaweb_var_type eq 'support_data') then begin

                support_quantity_list_index=2

                if (strmatch(cdaweb_fieldnam,'*_time',/fold_case) eq 1) then support_quantity_list_index=4

                if (strmatch(cdaweb_fieldnam,'*_epoch',/fold_case) eq 1) then support_quantity_list_index=4

                if (strmatch(cdaweb_fieldnam,'epoch',/fold_case) eq 1) then support_quantity_list_index=4

                if (strmatch(cdaweb_fieldnam,'time *',/fold_case) eq 1) then support_quantity_list_index=4

                keyword_parameter_type(variable_loop)='support'

                keyword_support=1

             endif

             if (cdaweb_var_type eq 'ignore_data' or cdaweb_var_type eq 'data') then begin

                if (strmatch(strmid(data_product_cdf_info.variable_info(variable_loop).name,0,6),'sc_pos',/fold_case) eq 1) then begin

                   keyword_parameter_type(variable_loop)='support'

                   keyword_support=1

                   support_quantity_list_index=3

                endif else begin

;                  keyword_parameter_type(variable_loop)='particle'

;                  particle_type_list_index=5

;                  keyword_particle=1

;                  if (cdaweb_units eq 'nT') then begin

;                     keyword_parameter_type(variable_loop)='field'

;                     keyword_field=1

;                     field_type_list_index=5

;                     keyword_particle=0

;                  endif

                   if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

                      keyword_parameter_type(variable_loop)='field'

                      keyword_field=1

                      field_type_list_index=5

                      keyword_particle=0

                   endif

                   if (numerical_data.parameter(variable_loop).units eq 'nT' and numerical_data.measurement_type(0) eq 'ActivityIndex') then begin

                      keyword_parameter_type(variable_loop)='field'

                      keyword_field=1

                      field_type_list_index=5

                      keyword_particle=0

                   endif

                endelse

             endif

          endif

          if (cdaweb_parameter_info_mask(0) ne -1 and parameter_key_mask_num ne 1) then begin

             if (strmatch(strmid(data_product_name,0,7),'th[a-g]_l1_',/fold_case) eq 1 or data_product_name eq 'fast_hr_dcb') then begin

                keyword_particle=0

                if (cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).parameter_type eq 'Support') then keyword_support=1

                if (cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).parameter_type eq 'Field') then keyword_field=1

                if (cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).parameter_type eq 'Mixed') then keyword_mixed=1

                if (cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).parameter_type eq 'Particle') then keyword_particle=1

                if (cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).parameter_type eq 'Wave') then keyword_wave=1

                qualifier=cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).qualifier

                quantity=cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).quantity

                type=cdaweb_parameter_info.table(cdaweb_parameter_info_data_product_mask(cdaweb_parameter_info_mask(0))).type

             endif

          endif

       endelse

       keyword_test=keyword_field+keyword_mixed+keyword_particle+keyword_support+keyword_wave

       if (keyword_test eq 0) then keyword_mixed=1

       if keyword_set(keyword_field) then begin

          if (parameter_key_mask_num eq 1) then begin

             for qualifier_list_index_loop=0,qualifier_list_index_loop_num-1 do $
                 numerical_data.parameter(variable_loop).field.qualifier(qualifier_list_index_loop)=qualifier_list(qualifier_list_index(qualifier_list_index_loop))

             numerical_data.parameter(variable_loop).field.field_quantity=field_quantity

          endif else begin

             numerical_data.parameter(variable_loop).field.qualifier(0)=qualifier_list(71)

             numerical_data.parameter(variable_loop).field.field_quantity=field_quantity_list(5)

             if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1 and size eq 1) then begin

                if (numerical_data.parameter(variable_loop).name eq 'H component of B') then $
                   numerical_data.parameter(variable_loop).field.qualifier(0)=qualifier_list(10)

                if (numerical_data.parameter(variable_loop).name eq 'D component of B') then $
                   numerical_data.parameter(variable_loop).field.qualifier(0)=qualifier_list(11)

                if (numerical_data.parameter(variable_loop).name eq 'E component of B') then $
                   numerical_data.parameter(variable_loop).field.qualifier(0)=qualifier_list(11)

                if (numerical_data.parameter(variable_loop).name eq 'Z component of B') then $
                   numerical_data.parameter(variable_loop).field.qualifier(0)=qualifier_list(12)

             endif

             if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1) then begin

                numerical_data.parameter(variable_loop).field.qualifier(0)=qualifier

                numerical_data.parameter(variable_loop).field.field_quantity=quantity

             endif

             numerical_data.parameter(variable_loop).field.frequency_range.spectral_range=''

             numerical_data.parameter(variable_loop).field.frequency_range.low=''

             numerical_data.parameter(variable_loop).field.frequency_range.high=''

             numerical_data.parameter(variable_loop).field.frequency_range.units=''

             numerical_data.parameter(variable_loop).field.frequency_range.bin.band_name=''

             numerical_data.parameter(variable_loop).field.frequency_range.bin.low=''

             numerical_data.parameter(variable_loop).field.frequency_range.bin.high=''

          endelse

       endif

       if keyword_set(keyword_particle) then begin

          for particle_type_list_index_loop=0,particle_type_list_index_loop_num-1 do begin

              numerical_data.parameter(variable_loop).particle.particle_type(particle_type_list_index_loop)=particle_type_list(particle_type_list_index(particle_type_list_index_loop))

              if (numerical_data.parameter(variable_loop).particle.particle_type(particle_type_list_index_loop) eq 'Proton') then $
                 numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_index_loop)='1'

              if (numerical_data.parameter(variable_loop).particle.particle_type(particle_type_list_index_loop) eq 'AlphaParticle') then $
                 numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_index_loop)='2'

              if (numerical_data.parameter(variable_loop).particle.particle_type(particle_type_list_index_loop) eq 'Atom') then begin

                 if (strmatch(numerical_data.parameter(variable_loop).name,'*[ /][Hh]elium *') eq 1) then $
                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_index_loop)='2'

                 if (strmatch(strmid(numerical_data.parameter(variable_loop).name,0,7),'[Hh]elium ',/fold_case) eq 1) then $
                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_index_loop)='2'

                 if (strmatch(numerical_data.parameter(variable_loop).name,'*[ /][Ii]ron *') eq 1) then $
                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_index_loop)='26'

                 if (strmatch(strmid(numerical_data.parameter(variable_loop).name,0,5),'[Ii]ron ',/fold_case) eq 1) then $
                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_index_loop)='26'

              endif

              particle_type_list_ion_index=particle_type_list_index_loop

              if (numerical_data.parameter(variable_loop).particle.particle_type(particle_type_list_index_loop) eq 'Ion') then begin

                 if (strmatch(numerical_data.parameter(variable_loop).description,'*[Hh]ydrogen*',/fold_case) eq 1) then begin

                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_ion_index)='1'

                    particle_type_list_ion_index=particle_type_list_ion_index+1

                 endif

                 if (strmatch(numerical_data.parameter(variable_loop).description,'*[Hh]elium*',/fold_case) eq 1) then begin

                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_ion_index)='2'

                    particle_type_list_ion_index=particle_type_list_ion_index+1

                 endif

                 if (strmatch(numerical_data.parameter(variable_loop).description,'*[Cc]arbon*',/fold_case) eq 1) then begin

                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_ion_index)='6'

                    particle_type_list_ion_index=particle_type_list_ion_index+1

                 endif

                 if (strmatch(numerical_data.parameter(variable_loop).description,'*[Nn]itrogen*',/fold_case) eq 1) then begin

                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_ion_index)='7'

                    particle_type_list_ion_index=particle_type_list_ion_index+1

                 endif

                 if (strmatch(numerical_data.parameter(variable_loop).description,'*[Oo]xygen*',/fold_case) eq 1) then begin

                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_ion_index)='8'

                    particle_type_list_ion_index=particle_type_list_ion_index+1

                 endif

                 if (strmatch(numerical_data.parameter(variable_loop).description,'*[Nn]eon*',/fold_case) eq 1) then begin

                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_ion_index)='10'

                    particle_type_list_ion_index=particle_type_list_ion_index+1

                 endif

                 if (strmatch(numerical_data.parameter(variable_loop).description,'*[Mm]agnesium*',/fold_case) eq 1) then begin

                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_ion_index)='12'

                    particle_type_list_ion_index=particle_type_list_ion_index+1

                 endif

                 if (strmatch(numerical_data.parameter(variable_loop).description,'*[Ss]ilicon*',/fold_case) eq 1) then begin

                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_ion_index)='14'

                    particle_type_list_ion_index=particle_type_list_ion_index+1

                 endif

                 if (strmatch(numerical_data.parameter(variable_loop).description,'*[Ss]ulfur*',/fold_case) eq 1) then begin

                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_ion_index)='16'

                    particle_type_list_ion_index=particle_type_list_ion_index+1

                 endif

                 if (strmatch(numerical_data.parameter(variable_loop).description,'*[Ii]ron*',/fold_case) eq 1) then begin

                    numerical_data.parameter(variable_loop).particle.atomic_number(particle_type_list_ion_index)='26'

                    particle_type_list_ion_index=particle_type_list_ion_index+1

                 endif

              endif

          endfor

          atomic_number_mask=where(numerical_data.parameter(variable_loop).particle.atomic_number ne '',atomic_number_mask_num)

          if (atomic_number_mask_num gt 0) then begin

             atomic_number=numerical_data.parameter(variable_loop).particle.atomic_number(atomic_number_mask)

             atomic_number_uniq=atomic_number(uniq(atomic_number,sort(atomic_number)))

             atomic_number_mask=indgen(n_elements(atomic_number_uniq))

             numerical_data.parameter(variable_loop).particle.atomic_number(atomic_number_mask)=atomic_number_uniq

          endif

          for qualifier_list_index_loop=0,qualifier_list_index_loop_num-1 do $
              numerical_data.parameter(variable_loop).particle.qualifier(qualifier_list_index_loop)=qualifier_list(qualifier_list_index(qualifier_list_index_loop))

          numerical_data.parameter(variable_loop).particle.particle_quantity=particle_quantity

          if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1) then begin

             numerical_data.parameter(variable_loop).particle.particle_type=type

             numerical_data.parameter(variable_loop).particle.qualifier(0)=qualifier

             numerical_data.parameter(variable_loop).particle.particle_quantity=quantity

          endif

;
;         mms1_des_phi_brst
;         -----------------
;         Attribute Entries:
;              CATDESC         (CDF_CHAR/54): "MMS1 FPI/DES Burst Sky Map Instrument Azimuthal Angles"
;              DELTA_PLUS_VAR  (CDF_CHAR/23): "mms1_des_phi_delta_brst"
;              DELTA_MINUS_VAR (CDF_CHAR/23): "mms1_des_phi_delta_brst"
;              FIELDNAM        (CDF_CHAR/16): "MMS1 FPI/DES Phi"
;              LABLAXIS        (CDF_CHAR/3): "Phi"
;              UNITS           (CDF_CHAR/3): "deg"
;              VALIDMIN        (CDF_REAL4/1): 0.0
;              VALIDMAX        (CDF_REAL4/1): 360.0
;              VAR_NOTES       (CDF_CHAR/96): "Azimuth Angles in the Instrument Frame, i.e., the Azimuthal Angle of the Instrument Look Direction"
;              VAR_TYPE        (CDF_CHAR/12): "support_data"
;
;         mms1_des_dist_brst
;         ------------------
;         Attribute Entries:
;              CATDESC         (CDF_CHAR/50): "MMS1 FPI/DES Burst Sky Map Instrument Distribution"
;              DEPEND_1        (CDF_CHAR/17): "mms1_des_phi_brst"
;              DEPEND_2        (CDF_CHAR/19): "mms1_des_theta_brst"
;              DEPEND_3        (CDF_CHAR/20): "mms1_des_energy_brst"
;              FIELDNAM        (CDF_CHAR/28): "MMS1 FPI/DES BrstSky Map Dist"
;              LABL_PTR_1      (CDF_CHAR/26): "mms1_des_sector_label_brst"
;              LABL_PTR_2      (CDF_CHAR/25): "mms1_des_pixel_label_brst"
;              LABL_PTR_3      (CDF_CHAR/26): "mms1_des_energy_label_brst"
;
;         mms1_des_phi_delta_brst                           [    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00,    5.62e+00]
;         mms1_des_sector_label_brst                        ["sector00","sector01","sector02","sector03","sector04","sector05","sector06","sector07","sector08","sector09","sector10","sector11","sector12","sector13","sector14","sector15","sector16","sector17","sector18","sector19","sector20","sector21","sector22","sector23","sector24","sector25","sector26","sector27","sector28","sector29","sector30","sector31"]
;         mms1_des_pixel_label_brst                         ["5.6250 deg","16.875 deg","28.125 deg","39.375 deg","50.625 deg","61.875 deg","73.125 deg","84.375 deg","95.625 deg","106.88 deg","118.13 deg","129.38 deg","140.63 deg","151.88 deg","163.13 deg","174.38 deg"]
;         mms1_des_energy_label_brst                        ["energy00","energy01","energy02","energy03","energy04","energy05","energy06","energy07","energy08","energy09","energy10","energy11","energy12","energy13","energy14","energy15","energy16","energy17","energy18","energy19","energy20","energy21","energy22","energy23","energy24","energy25","energy26","energy27","energy28","energy29","energy30","energy31"]
;         mms1_des_theta_brst                               [    5.62e+00,    1.69e+01,    2.81e+01,    3.94e+01,    5.06e+01,    6.19e+01,    7.31e+01,    8.44e+01,    9.56e+01,    1.07e+02,    1.18e+02,    1.29e+02,    1.41e+02,    1.52e+02,    1.63e+02,    1.74e+02]
;         mms1_des_theta_delta_brst                         [ 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00, 5.625e+00]
;

          numerical_data.parameter(variable_loop).particle.energy_range.low=''

          numerical_data.parameter(variable_loop).particle.energy_range.high=''

          numerical_data.parameter(variable_loop).particle.energy_range.units=''

          if (strmatch(data_product_name,'ac_h2_sep',/fold_case) eq 1) then begin

             if (strmatch(numerical_data.parameter(variable_loop).description,'*[0-9] MeV/n to [0-9]*') eq 1) then begin

                split=strsplit(numerical_data.parameter(variable_loop).description,/extract)

                to_index=where(strmatch(split,'to') eq 1)

                numerical_data.parameter(variable_loop).particle.energy_range.low=split(to_index-2)

                numerical_data.parameter(variable_loop).particle.energy_range.high=split(to_index+1)

                numerical_data.parameter(variable_loop).particle.energy_range.units=split(to_index-1)

             endif

          endif

          if (strmatch(strmid(data_product_name,0,4),'g[01][0-9]_',/fold_case) eq 1) then begin

             if (strmatch(numerical_data.parameter(variable_loop).name,'*[0-9] to [0-9]*') eq 1) then begin

                split=strsplit(numerical_data.parameter(variable_loop).name,/extract)

                to_index=where(strmatch(split,'to') eq 1)

                numerical_data.parameter(variable_loop).particle.energy_range.low=split(to_index-1)

                numerical_data.parameter(variable_loop).particle.energy_range.high=split(to_index+1)

                numerical_data.parameter(variable_loop).particle.energy_range.units=split(to_index+2)

             endif

          endif

          if (strmatch(strmid(data_product_name,0,9),'mms?_fpi_') eq 1 and strmatch(strmid(data_product_name,21,4),'dist') and strjoin(cdaweb_labl_ptr_3_metadata,2) ne '') then begin

             if (strmatch(strmid(data_product_name,0,20),'mms?_fpi_brst_l2_des') or strmatch(strmid(data_product_name,0,20),'mms?_fpi_fast_l2_des')) then $
                mms_energy_range_file_name='mms_fpi_des_energy.tab'

             if (strmatch(strmid(data_product_name,0,20),'mms?_fpi_brst_l2_dis') or strmatch(strmid(data_product_name,0,20),'mms?_fpi_fast_l2_dis')) then $
                mms_energy_range_file_name='mms_fpi_dis_energy.tab'

             energy_range=read_tab_table(mms_energy_range_file_name,exist_flag,/verbose,/compress)

             if (data_product_name_mask_num ge 1) then begin

                depend_3_mask=where(numerical_data_parameter_all.table(data_product_name_mask).parameter_key eq cdaweb_depend_3,depend_3_mask_num)

                if (depend_3_mask_num eq 1) then $
                   if (numerical_data_parameter_all.table(data_product_name_mask(depend_3_mask)).units ne '') then $
                       energy_range_units=numerical_data_parameter_all.table(data_product_name_mask(depend_3_mask)).units

                depend_3_mask=where(data_product_cdf_info.variable_info.name eq cdaweb_depend_3,depend_3_mask_num)

                if (depend_3_mask_num eq 1) then begin

                   energy_range_valid_min=trim_trailing_zeroes(variable_attribute_grep(data_product_cdf_info.variable_info(depend_3_mask).attribute,'validmin'))

                   energy_range_valid_max=trim_trailing_zeroes(variable_attribute_grep(data_product_cdf_info.variable_info(depend_3_mask).attribute,'validmax'))

                endif

             endif

             numerical_data.parameter(variable_loop).particle.energy_range.low=energy_range_valid_min

             numerical_data.parameter(variable_loop).particle.energy_range.high=energy_range_valid_max

             numerical_data.parameter(variable_loop).particle.energy_range.units=energy_range_units

             energy_range_bin_loop_num=n_elements(cdaweb_labl_ptr_3_metadata)

;            energy_range=float(energy_range_valid_max)-float(energy_range_valid_min)

;            energy_range_bin_low=trim_trailing_zeroes(string(findgen(energy_range_bin_loop_num)*(energy_range/energy_range_bin_loop_num),format='(f0)'))

;            energy_range_bin_high=trim_trailing_zeroes(string((findgen(energy_range_bin_loop_num)+1.0)*(energy_range/energy_range_bin_loop_num),format='(f0)'))

             energy_range_bin_band_name='Energy '+string(indgen(32),format='(i02)')+', Bin Center '+energy_range.table.center+' eV'

             energy_range_bin_low=energy_range.table.low

             energy_range_bin_high=energy_range.table.high

             for energy_range_bin_loop=0L,energy_range_bin_loop_num-1L do begin

                numerical_data.parameter(variable_loop).particle.energy_range.bin(energy_range_bin_loop).band_name=energy_range_bin_band_name(energy_range_bin_loop)
;                                                                                                                  cdaweb_labl_ptr_3_metadata(energy_range_bin_loop)

                numerical_data.parameter(variable_loop).particle.energy_range.bin(energy_range_bin_loop).low=energy_range_bin_low(energy_range_bin_loop)

                numerical_data.parameter(variable_loop).particle.energy_range.bin(energy_range_bin_loop).high=energy_range_bin_high(energy_range_bin_loop)

             endfor

          endif

          numerical_data.parameter(variable_loop).particle.azimuthal_angle_range.low=''

          numerical_data.parameter(variable_loop).particle.azimuthal_angle_range.high=''

          numerical_data.parameter(variable_loop).particle.azimuthal_angle_range.units=''

          if (strmatch(strmid(data_product_name,0,9),'mms?_fpi_') eq 1 and strmatch(strmid(data_product_name,21,4),'dist') and strjoin(cdaweb_labl_ptr_1_metadata,2) ne '') then begin

             if (data_product_name_mask_num ge 1) then begin

                depend_1_mask=where(numerical_data_parameter_all.table(data_product_name_mask).parameter_key eq cdaweb_depend_1,depend_1_mask_num)

                if (depend_1_mask_num eq 1) then $
                   if (numerical_data_parameter_all.table(data_product_name_mask(depend_1_mask)).units ne '') then $
                      azimuthal_angle_range_units=numerical_data_parameter_all.table(data_product_name_mask(depend_1_mask)).units

                depend_1_mask=where(data_product_cdf_info.variable_info.name eq cdaweb_depend_1,depend_1_mask_num)

                if (depend_1_mask_num eq 1) then begin

                   azimuthal_angle_range_valid_min=trim_trailing_zeroes(variable_attribute_grep(data_product_cdf_info.variable_info(depend_1_mask).attribute,'validmin'))

                   azimuthal_angle_range_valid_max=trim_trailing_zeroes(variable_attribute_grep(data_product_cdf_info.variable_info(depend_1_mask).attribute,'validmax'))

                endif

             endif

             numerical_data.parameter(variable_loop).particle.azimuthal_angle_range.low=azimuthal_angle_range_valid_min

             numerical_data.parameter(variable_loop).particle.azimuthal_angle_range.high=azimuthal_angle_range_valid_max

             numerical_data.parameter(variable_loop).particle.azimuthal_angle_range.units=azimuthal_angle_range_units

             azimuthal_angle_range_bin_loop_num=n_elements(cdaweb_labl_ptr_1_metadata)

             azimuthal_angle_range=float(azimuthal_angle_range_valid_max)-float(azimuthal_angle_range_valid_min)

             azimuthal_angle_range_bin_band_name= $
                'Sector '+string(indgen(azimuthal_angle_range_bin_loop_num),format='(i02)')+', '+ $
                trim_trailing_zeroes(string((findgen(azimuthal_angle_range_bin_loop_num)+0.5)*(azimuthal_angle_range/azimuthal_angle_range_bin_loop_num),format='(f0)'))+'&#176; Bin Center'

             azimuthal_angle_range_bin_low=trim_trailing_zeroes(string(findgen(azimuthal_angle_range_bin_loop_num)*(azimuthal_angle_range/azimuthal_angle_range_bin_loop_num),format='(f0)'))

             azimuthal_angle_range_bin_high=trim_trailing_zeroes(string((findgen(azimuthal_angle_range_bin_loop_num)+1.0)*(azimuthal_angle_range/azimuthal_angle_range_bin_loop_num),format='(f0)'))

             for azimuthal_angle_range_bin_loop=0L,azimuthal_angle_range_bin_loop_num-1L do begin

                numerical_data.parameter(variable_loop).particle.azimuthal_angle_range.bin(azimuthal_angle_range_bin_loop).band_name=azimuthal_angle_range_bin_band_name(azimuthal_angle_range_bin_loop)

                numerical_data.parameter(variable_loop).particle.azimuthal_angle_range.bin(azimuthal_angle_range_bin_loop).low=azimuthal_angle_range_bin_low(azimuthal_angle_range_bin_loop)

                numerical_data.parameter(variable_loop).particle.azimuthal_angle_range.bin(azimuthal_angle_range_bin_loop).high=azimuthal_angle_range_bin_high(azimuthal_angle_range_bin_loop)

             endfor

          endif

          numerical_data.parameter(variable_loop).particle.polar_angle_range.low=''

          numerical_data.parameter(variable_loop).particle.polar_angle_range.high=''

          numerical_data.parameter(variable_loop).particle.polar_angle_range.units=''

          if (strmatch(strmid(data_product_name,0,9),'mms?_fpi_') eq 1 and strmatch(strmid(data_product_name,21,4),'dist') and strjoin(cdaweb_labl_ptr_2_metadata,2) ne '') then begin

             if (data_product_name_mask_num ge 1) then begin

                depend_2_mask=where(numerical_data_parameter_all.table(data_product_name_mask).parameter_key eq cdaweb_depend_2,depend_2_mask_num)

                if (depend_2_mask_num eq 1) then $
                   if (numerical_data_parameter_all.table(data_product_name_mask(depend_2_mask)).units ne '') then $
                      polar_angle_range_units=numerical_data_parameter_all.table(data_product_name_mask(depend_2_mask)).units

                depend_2_mask=where(data_product_cdf_info.variable_info.name eq cdaweb_depend_2,depend_2_mask_num)

                if (depend_2_mask_num eq 1) then begin
                   polar_angle_range_valid_min=trim_trailing_zeroes(variable_attribute_grep(data_product_cdf_info.variable_info(depend_2_mask).attribute,'validmin'))
                   polar_angle_range_valid_max=trim_trailing_zeroes(variable_attribute_grep(data_product_cdf_info.variable_info(depend_2_mask).attribute,'validmax'))
                endif

             endif

             numerical_data.parameter(variable_loop).particle.polar_angle_range.low=polar_angle_range_valid_min

             numerical_data.parameter(variable_loop).particle.polar_angle_range.high=polar_angle_range_valid_max

             numerical_data.parameter(variable_loop).particle.polar_angle_range.units=polar_angle_range_units

             polar_angle_range_bin_loop_num=n_elements(cdaweb_labl_ptr_2_metadata)

             polar_angle_range=float(polar_angle_range_valid_max)-float(polar_angle_range_valid_min)

             polar_angle_range_bin_band_name= $
                'Pixel '+string(indgen(polar_angle_range_bin_loop_num),format='(i02)')+', '+ $
                trim_trailing_zeroes(string((findgen(polar_angle_range_bin_loop_num)+0.5)*(polar_angle_range/polar_angle_range_bin_loop_num),format='(f0)'))+'&#176; Bin Center'

             polar_angle_range_bin_low=trim_trailing_zeroes(string(findgen(polar_angle_range_bin_loop_num)*(polar_angle_range/polar_angle_range_bin_loop_num),format='(f0)'))

             polar_angle_range_bin_high=trim_trailing_zeroes(string((findgen(polar_angle_range_bin_loop_num)+1.0)*(polar_angle_range/polar_angle_range_bin_loop_num),format='(f0)'))

             for polar_angle_range_bin_loop=0L,polar_angle_range_bin_loop_num-1L do begin

                numerical_data.parameter(variable_loop).particle.polar_angle_range.bin(polar_angle_range_bin_loop).band_name=polar_angle_range_bin_band_name(polar_angle_range_bin_loop)

                numerical_data.parameter(variable_loop).particle.polar_angle_range.bin(polar_angle_range_bin_loop).low=polar_angle_range_bin_low(polar_angle_range_bin_loop)

                numerical_data.parameter(variable_loop).particle.polar_angle_range.bin(polar_angle_range_bin_loop).high=polar_angle_range_bin_high(polar_angle_range_bin_loop)

             endfor

          endif

       endif

       numerical_data.parameter(variable_loop).particle.mass_range.low=''

       numerical_data.parameter(variable_loop).particle.mass_range.high=''

       numerical_data.parameter(variable_loop).particle.mass_range.units=''

       for bin_loop=0,31 do begin

           numerical_data.parameter(variable_loop).particle.mass_range.bin(bin_loop).band_name=''

           numerical_data.parameter(variable_loop).particle.mass_range.bin(bin_loop).low=''

           numerical_data.parameter(variable_loop).particle.mass_range.bin(bin_loop).high=''

       endfor

       numerical_data.parameter(variable_loop).particle.pitch_angle_range.low=''

       numerical_data.parameter(variable_loop).particle.pitch_angle_range.high=''

       numerical_data.parameter(variable_loop).particle.pitch_angle_range.units=''

       for bin_loop=0,31 do begin

           numerical_data.parameter(variable_loop).particle.pitch_angle_range.bin(bin_loop).band_name=''

           numerical_data.parameter(variable_loop).particle.pitch_angle_range.bin(bin_loop).low=''

           numerical_data.parameter(variable_loop).particle.pitch_angle_range.bin(bin_loop).high=''

       endfor

       if keyword_set(keyword_wave) then begin

          for wave_type_list_index_loop=0,wave_type_list_index_loop_num-1 do $
              if (numerical_data.parameter(variable_loop).wave.wave_type(wave_type_list_index_loop) eq '') then $
                 numerical_data.parameter(variable_loop).wave.wave_type(wave_type_list_index_loop)=wave_type_list(wave_type_list_index(wave_type_list_index_loop))

          for qualifier_list_index_loop=0,qualifier_list_index_loop_num-1 do $
              if (numerical_data.parameter(variable_loop).wave.qualifier(qualifier_list_index_loop) eq '') then $
                 numerical_data.parameter(variable_loop).wave.qualifier(qualifier_list_index_loop)=qualifier_list(qualifier_list_index(qualifier_list_index_loop))

          numerical_data.parameter(variable_loop).wave.wave_quantity=wave_quantity

;         numerical_data.parameter(variable_loop).wave.wave_type=''

;         numerical_data.parameter(variable_loop).wave.qualifier(0)=''

;         numerical_data.parameter(variable_loop).wave.wave_quantity=''

          if (strmatch(strmid(data_product_name,0,7),'th[a-g]_l1_',/fold_case) eq 1) then begin

             numerical_data.parameter(variable_loop).wave.wave_type=type

             numerical_data.parameter(variable_loop).wave.qualifier(0)=qualifier

             numerical_data.parameter(variable_loop).wave.wave_quantity=quantity

          endif

          numerical_data.parameter(variable_loop).wave.energy_range.low=''

          numerical_data.parameter(variable_loop).wave.energy_range.high=''

          numerical_data.parameter(variable_loop).wave.energy_range.units=''

          numerical_data.parameter(variable_loop).wave.energy_range.bin.band_name=''

          numerical_data.parameter(variable_loop).wave.energy_range.bin.low=''

          numerical_data.parameter(variable_loop).wave.energy_range.bin.high=''

          numerical_data.parameter(variable_loop).wave.wavelength_range.spectral_range=''

          numerical_data.parameter(variable_loop).wave.wavelength_range.low=''

          numerical_data.parameter(variable_loop).wave.wavelength_range.high=''

          numerical_data.parameter(variable_loop).wave.wavelength_range.units=''

          numerical_data.parameter(variable_loop).wave.wavelength_range.bin.band_name=''

          numerical_data.parameter(variable_loop).wave.wavelength_range.bin.low=''

          numerical_data.parameter(variable_loop).wave.wavelength_range.bin.high=''

          numerical_data.parameter(variable_loop).wave.frequency_range.spectral_range=''

          numerical_data.parameter(variable_loop).wave.frequency_range.low=''

          numerical_data.parameter(variable_loop).wave.frequency_range.high=''

          numerical_data.parameter(variable_loop).wave.frequency_range.units=''

          numerical_data.parameter(variable_loop).wave.frequency_range.bin.band_name=''

          numerical_data.parameter(variable_loop).wave.frequency_range.bin.low=''

          numerical_data.parameter(variable_loop).wave.frequency_range.bin.high=''

       endif

       if keyword_set(keyword_mixed) then begin

          for particle_type_list_index_loop=0,particle_type_list_index_loop_num-1 do $
              numerical_data.parameter(variable_loop).mixed.particle_type(particle_type_list_index_loop)=particle_type_list(particle_type_list_index(particle_type_list_index_loop))

          numerical_data.parameter(variable_loop).mixed.mixed_quantity=mixed_quantity_list(mixed_quantity_list_index)

          for qualifier_list_index_loop=0,qualifier_list_index_loop_num-1 do $
              numerical_data.parameter(variable_loop).mixed.qualifier(qualifier_list_index_loop)=qualifier_list(qualifier_list_index(qualifier_list_index_loop))

          numerical_data.parameter(variable_loop).mixed.mixed_quantity=mixed_quantity

;         numerical_data.parameter(variable_loop).mixed.mixed_quantity='Other'

;         numerical_data.parameter(variable_loop).mixed.particle_type=''

;         numerical_data.parameter(variable_loop).mixed.qualifier(0)=''

;         if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) eq 1) then begin

;            numerical_data.parameter(variable_loop).mixed.mixed_quantity=quantity

;            numerical_data.parameter(variable_loop).mixed.particle_type=type

;            numerical_data.parameter(variable_loop).mixed.qualifier(0)=qualifier

;         endif

       endif

       if keyword_set(keyword_support) then begin

;         if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) ne 1 and data_product_name ne 'fast_hr_dcb') then begin

          if (strmatch(strmid(data_product_name,0,7),'th[a-e]_l1_',/fold_case) ne 1) then begin

             qualifier_list_index_loop_num=n_elements(qualifier)

             for qualifier_list_index_loop=0,qualifier_list_index_loop_num-1 do $
                 numerical_data.parameter(variable_loop).support.qualifier(qualifier_list_index_loop)=qualifier(qualifier_list_index_loop)

             numerical_data.parameter(variable_loop).support.support_quantity=support_quantity_list(support_quantity_list_index)

          endif else begin

             for support_quantity_list_index_loop=0,support_quantity_list_index_loop_num-1 do $
                 numerical_data.parameter(variable_loop).support.support_quantity(support_quantity_list_index_loop)=support_quantity_list(support_quantity_list_index(support_quantity_list_index_loop))

             for qualifier_list_index_loop=0,qualifier_list_index_loop_num-1 do $
                 numerical_data.parameter(variable_loop).support.qualifier(qualifier_list_index_loop)=qualifier_list(qualifier_list_index(qualifier_list_index_loop))

             numerical_data.parameter(variable_loop).support.support_quantity=support_quantity

;            if (quantity eq '') then quantity='Temporal'

;            numerical_data.parameter(variable_loop).support.qualifier(0)=qualifier

;            numerical_data.parameter(variable_loop).support.support_quantity=quantity

          endelse

       endif

    endif

    if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then $
       if (numerical_data.parameter(variable_loop).structure.element(1).name eq 'Magnetic East -') then numerical_data.parameter(variable_loop).structure.element(1).name='Magnetic East - E'

    if (numerical_data.parameter(variable_loop).name eq 'g11_pos_gei') then numerical_data.parameter(variable_loop).structure.element(2).name='G11_z_GEI'

    if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name ne '') then begin

       element_num=numerical_data.parameter(variable_loop).structure.size

       t_check_num=-999

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '' and (element_num eq 3 or element_num eq 6)) then begin

          x_check_num=strmatch(numerical_data.parameter(variable_loop).structure.element(0).name,'*X*',/fold_case)

          y_check_num=strmatch(numerical_data.parameter(variable_loop).structure.element(1).name,'*Y*',/fold_case)

          z_check_num=strmatch(numerical_data.parameter(variable_loop).structure.element(2).name,'*Z*',/fold_case)

          t_check_num=x_check_num+y_check_num+z_check_num

          if (t_check_num eq 3) then numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation=coordinate_representation_list(1)

       endif

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '' and element_num eq 3) then begin

          x_check_num=strmatch(numerical_data.parameter(variable_loop).structure.element(0).units,'km*',/fold_case)

          y_check_num=strmatch(numerical_data.parameter(variable_loop).structure.element(1).units,'km*',/fold_case)

          z_check_num=strmatch(numerical_data.parameter(variable_loop).structure.element(2).units,'km*',/fold_case)

          t_check_num=x_check_num+y_check_num+z_check_num

          if (t_check_num eq 3) then numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation=coordinate_representation_list(3)

       endif

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '' and element_num eq 3) then begin

          x_check_num=strmatch(numerical_data.parameter(variable_loop).structure.element(0).units,'deg*',/fold_case)

          y_check_num=strmatch(numerical_data.parameter(variable_loop).structure.element(1).units,'deg*',/fold_case)

          z_check_num=strmatch(numerical_data.parameter(variable_loop).structure.element(2).units,'deg*',/fold_case)

          t_check_num=x_check_num+y_check_num+z_check_num

          if (t_check_num eq 2) then numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation=coordinate_representation_list(3)

       endif

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq 'RTN') then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation=coordinate_representation_list(1)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           strmatch(numerical_data.parameter(variable_loop).name,'*enp*',/fold_case) eq 1) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation=coordinate_representation_list(1)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           strlowcase(numerical_data.parameter(variable_loop).units) eq 'km') then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation=coordinate_representation_list(1)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           numerical_data.parameter(variable_loop).valid_min eq '-1.0' and $
           numerical_data.parameter(variable_loop).valid_max eq '1.0') then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation=coordinate_representation_list(1)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           strmatch(numerical_data.parameter(variable_loop).description,'*1 parallel and 2 perpendicular * components',/fold_case) eq 1) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation=coordinate_representation_list(1)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '' and $
           numerical_data.parameter(variable_loop).support.support_quantity ne 'Temporal' and $
           strmatch(numerical_data.parameter(variable_loop).name,'*Latitude*',/fold_case) eq 1) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation=coordinate_representation_list(3)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '' and $
           numerical_data.parameter(variable_loop).support.support_quantity ne 'Temporal' and $
           strmatch(numerical_data.parameter(variable_loop).name,'*Longitude*',/fold_case) eq 1) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation=coordinate_representation_list(3)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '' and $
           strmatch(numerical_data.parameter(variable_loop).units,'deg*',/fold_case) eq 1) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation=coordinate_representation_list(3)

    endif

    if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation ne '') then begin

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           strmatch(numerical_data.parameter(variable_loop).description,'*gci*',/fold_case) eq 1) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(8)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           strmatch(numerical_data.parameter(variable_loop).description,'*gse*',/fold_case) eq 1) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(11)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           strmatch(numerical_data.parameter(variable_loop).description,'*gse',/fold_case) eq 1) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(11)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           strmatch(numerical_data.parameter(variable_loop).description,'*gsm*',/fold_case) eq 1) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(13)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           strmatch(numerical_data.parameter(variable_loop).parameter_key,'*gse*',/fold_case) eq 1) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(11)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           strmatch(numerical_data.parameter(variable_loop).parameter_key,'*sel*',/fold_case) eq 1) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name='SEL'

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           strmatch(numerical_data.parameter(variable_loop).parameter_key,'*xyz_scs*',/fold_case) eq 1) then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(11)

       if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq '' and $
           numerical_data.parameter(variable_loop).structure.size gt 1 and $
           cdaweb_coordinate_system(0) eq 'DSL (Despun Spacecraft)') then $
          numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(41)

    endif

    if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq 'SR2' and $
        numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '' and $
        numerical_data.parameter(variable_loop).structure.size ne 3 and $
        numerical_data.parameter(variable_loop).structure.size ne 6) then $
       numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=''

    if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name ne '' and $
        numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation eq '') then begin

       if (data_product_name_mask_num ge 1) then begin

          parameter_key_mask= $
             where(numerical_data.parameter(variable_loop).parameter_key eq $
                   numerical_data_parameter_all.table(data_product_name_mask).parameter_key, $
                   parameter_key_mask_num)

          if (parameter_key_mask_num eq 1) then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation= $
                numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).coordinate_representation

       endif

    endif

    structure=numerical_data.parameter(variable_loop).structure

    structure_element_blank_check=''

    if (numerical_data.parameter(variable_loop).structure.size le 256) then begin

       element_loop_num=n_elements(numerical_data.parameter(variable_loop).structure.element)

    endif else begin

       element_loop_num=256

    endelse

    for element_loop=0L,element_loop_num-1L do begin

        if (numerical_data.parameter(variable_loop).structure.element(element_loop).name eq 'Element '+strtrim(string(element_loop+1),2)) then structure.element(element_loop).name=''

        if (numerical_data.parameter(variable_loop).structure.element(element_loop).index eq strtrim(string(element_loop+1),2)) then structure.element(element_loop).index=''

        structure_element_blank_check=structure_element_blank_check+spase_model_blank_check(structure.element(element_loop))

    endfor

    if (structure_element_blank_check eq '') then begin

       numerical_data.parameter(variable_loop).structure.element(*).name=''

       numerical_data.parameter(variable_loop).structure.element(*).index=''

    endif

    if (data_product_name_mask_num ge 1) then begin

       parameter_key_mask= $
          where(numerical_data.parameter(variable_loop).parameter_key eq $
                numerical_data_parameter_all.table(data_product_name_mask).parameter_key, $
                parameter_key_mask_num)

       if (parameter_key_mask_num eq 1) then begin

          if (numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).units ne '') then $
             numerical_data.parameter(variable_loop).units= $
                numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).units

          if (numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).units_conversion ne '' and $
              strmatch(data_product_name,'mms[1-4]_fpi_[bf][ar]st_l2_d[ei]s-partmoms',/fold_case) ne 1) then $
             numerical_data.parameter(variable_loop).units_conversion= $
                numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).units_conversion

          if (numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).coordinate_system_name ne '') then begin

             numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name= $
                numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).coordinate_system_name

             if (numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name eq 'GSE2000') then $
                numerical_data.parameter(variable_loop).coordinate_system.coordinate_system_name=coordinate_system_name_list(11)

          endif

          if (numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).coordinate_representation ne '') then $
             numerical_data.parameter(variable_loop).coordinate_system.coordinate_representation= $
                numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).coordinate_representation

       endif

    endif

    if (data_product_name_mask_num ge 1) then begin

       variable_info_mask=where(data_product_cdf_info.variable_info(variable_loop).name eq $
                                numerical_data_parameter_all.table(data_product_name_mask).parameter_key, $
                                variable_info_mask_num)

       if (variable_info_mask_num eq 1) then begin

          units_temp=strsplit(numerical_data_parameter_all.table(data_product_name_mask(variable_info_mask)).units,'|',/extract,count=units_temp_num)

          if (units_temp_num eq 1) then begin

             numerical_data.parameter(variable_loop).units=numerical_data_parameter_all.table(data_product_name_mask(variable_info_mask)).units

          endif else begin

             numerical_data.parameter(variable_loop).units=''

          endelse

          print,'NUMERICAL_DATA.PARAMETER(VARIABLE_LOOP).UNITS: ',numerical_data.parameter(variable_loop).units

       endif

    endif

    if (data_product_name_mask_num ge 1) then begin

       variable_info_mask=where(data_product_cdf_info.variable_info(variable_loop).name eq $
                                numerical_data_parameter_all.table(data_product_name_mask).parameter_key, $
                                variable_info_mask_num)

       if (variable_info_mask_num eq 1) then begin

          units_conversion_temp=strsplit(numerical_data_parameter_all.table(data_product_name_mask(variable_info_mask)).units_conversion,'|',/extract,count=units_conversion_temp_num)

          if (units_conversion_temp_num gt 1) then numerical_data.parameter(variable_loop).units_conversion=''

       endif

    endif

    if keyword_set(keyword_support) then begin

       if (data_product_name_mask_num ge 1) then begin

          parameter_key_mask= $
             where(numerical_data.parameter(variable_loop).parameter_key eq $
                   numerical_data_parameter_all.table(data_product_name_mask).parameter_key, $
                   parameter_key_mask_num)

          print,'Numerical Data Parameter All:   Keyword Support: '+ $
                numerical_data.parameter(variable_loop).parameter_key

          if (parameter_key_mask_num eq 1) then begin

             if (numerical_data.parameter(variable_loop).support.qualifier(0) eq '') then $
                   numerical_data.parameter(variable_loop).support.qualifier(0)= $
                      numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).qualifier

             if (numerical_data.parameter(variable_loop).support.support_quantity eq '') then $
                   numerical_data.parameter(variable_loop).support.support_quantity= $
                      numerical_data_parameter_all.table(data_product_name_mask(parameter_key_mask)).type

          endif

       endif

    endif

    if (numerical_data.parameter(variable_loop).rendering_hints.scale_min eq numerical_data.parameter(variable_loop).rendering_hints.scale_max) then begin

       numerical_data.parameter(variable_loop).rendering_hints.scale_min=''

       numerical_data.parameter(variable_loop).rendering_hints.scale_max=''

    endif

    cdaweb_time_res=''

    keyword_field=0

    keyword_particle=0

    keyword_wave=0

    keyword_mixed=0

    keyword_support=0

    size_qualifier=size(qualifier)

    if (size_qualifier[1] ne 0) then qualifier(*)=''

    quantity=''

    type=''

    units=''

    units_num=1

    value_format=''

    value_format_num=1

;   cadence=''

endfor

print,dashes,stars,format='(a/a/)'

print,'POPULATE_NUMERICAL_DATA Extension for Global Attributes',format='(a/)'

print,stars,format='(a/)'

global_attribute_num=n_elements(data_product_cdf_info.global_attribute_info)

extension=''

for loop=0,global_attribute_num-1 do begin

    sub_loop_num=data_product_cdf_info.global_attribute_info(loop).record_num

    for sub_loop=0,sub_loop_num-1 do begin

        blank_test=spase_model_blank_check(data_product_cdf_info.global_attribute_info(loop).attribute(sub_loop))

        if (blank_test ne '') then $
           new_line=string(data_product_cdf_info.global_attribute_info(loop).name, $
                           data_product_cdf_info.global_attribute_info(loop).record_num, $
                           data_product_cdf_info.global_attribute_info(loop).attribute(sub_loop), $
                           format='(a-35,i3,3x,i2.2,3x,a-12,3x,a-12,a)')

        new_line=strtrim(new_line,2)

        new_line=strjoin(strsplit(strjoin(strsplit(new_line,'>',/extract),"&gt;"),'<',/extract),"&lt;")

;       command='echo "'+new_line+" | sed 's/\\\*/\\\\\\*/' | sed -f '+project_program_dir+'global_attribute_thg_l2_mag.sed'

        new_line=strjoin(strsplit(new_line,'`',/extract),"&apos;")

        command='echo "'+new_line+'" | sed -f '+project_program_dir+'global_attribute_thg_l2_mag.sed'

        spawn,command,new_line,error

        if (extension eq '') then begin

           extension=new_line+string(10B)

        endif else begin

           if (loop eq global_attribute_num-1 and sub_loop eq sub_loop_num-1) then begin

              extension=extension+'            '+new_line

           endif else begin

              extension=extension+'            '+new_line+string(10B)

           endelse

        endelse

    endfor

    if (loop ne global_attribute_num-1) then extension=extension+string(10B)

endfor

numerical_data.extension=string(10B)+'         <Note>'+string(10B)+ $
                         '            CDAWEB ISTP CDF Global Attribute Metadata'+string(10B)+string(10B)+ $
                         '            '+extension+string(10B)+'         </Note>'+string(10B)+'      '

;                        '            '+strjoin(strsplit(string_condition(extension,'&','and'),'>',/extract),'&gt;')+string(10B)+'         </Note>'+string(10B)+'      '

numerical_data.extension=''

print,stars,format='(a/)'

print,'POPULATE_NUMERICAL_DATA Stop',format='(a/)'

print,stars,format='(a/)'

return,numerical_data

end

