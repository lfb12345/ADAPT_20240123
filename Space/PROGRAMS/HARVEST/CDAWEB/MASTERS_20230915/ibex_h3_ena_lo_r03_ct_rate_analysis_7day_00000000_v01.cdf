Ќу   €€      8         @                        €€€€€€€€
Common Data Format (CDF)
(C) Copyright 1990-2013 NASA/GSFC
Space Physics Data Facility
NASA/Goddard Space Flight Center
Greenbelt, Maryland 20771 USA
(Internet -- GSFC-CDF-SUPPORT@LISTS.NASA.GOV)
                                                                  T                 s|      Ф      ХЩ       =€€€€                   €€€€€€€€      D         )      Ў                              €€€€€€€€Project                                                                                                                                                                                                                                                                Q                  3                   €€€€€€€€HEX>Heliophysics Explorer      D         »      m                             €€€€€€€€Source_name                                                                                                                                                                                                                                                            [                 3       #            €€€€€€€€IBEX>Interstellar Boundary Explorer      D         f                                   €€€€€€€€Discipline                                                                                                                                                                                                                                                             Z                 3       "            €€€€€€€€Solar Physics>Heliospheric Physics      D         ы      ™                             €€€€€€€€Data_type                                                                                                                                                                                                                                                              Q                 3                   €€€€€€€€H3> Flux Distribution Map      D         	Т      	?                             €€€€€€€€Descriptor                                                                                                                                                                                                                                                             S                 3                   €€€€€€€€ENA> Energetic Neutral Atom      D         1      
÷                             €€€€€€€€File_naming_convention                                                                                                                                                                                                                                                 [                 3       #            €€€€€€€€source_datatype_descriptor_yyyyMMdd      D         ѓ      u                             €€€€€€€€Data_version                                                                                                                                                                                                                                                           :                 3                   €€€€€€€€01      D         ?      у                             €€€€€€€€PI_name                                                                                                                                                                                                                                                                L                 3                   €€€€€€€€Dr. David J. McComas      D         ѕ      Г                             €€€€€€€€PI_affiliation                                                                                                                                                                                                                                                         L                 3                   €€€€€€€€Princeton University      D         'њ            	                      €€€€€€€€TEXT                                                                                                                                                                                                                                                                  Y         l   	   3      !            €€€€€€€€1: The Interstellar Boundary Explorer (IBEX) has operated in space since 2008 updating our knowledge of the outer heliosphere and its interaction with the local interstellar medium. Start-time: 2008-12-25. There are currently 16 releases of IBEX-HI and/or IBEX-LO data covering 2009-2022.       |         и   	   3     D            €€€€€€€€2: This data set is from the Release 3, 7.5 days cadence, IBEX-Lo data for the years 2009 - 2010 contains data used in the publication of Moebius et al., 2012, Interstellar Gas Flow Parameters Derived from IBEX-Lo Observations in 2009 and 2010 Analytical Analysis and Bzowski et al., 2012, Neutral interstellar helium parameters based on IBEX-Lo observations and test particle calculations. The data are the 6 degree resolution corrected histogram data and the observation time periods in one csv file for each orbit for both the angular fit analysis and the count rate analysis.                ы   	   3      џ            €€€€€€€€3: Additional publications: Bzowski et al., 2012, Neutral interstellar helium parameters based on IBEX-Lo observations and test particle calculations; and Hlond et al., 2012, Precision Pointing of IBEX-Lo Observations.                   	   3     ‘            €€€€€€€€4: Data Selection: In order to determine accurately the interstellar gas flow vector, the pointing of IBEX-Lo has to be known to about 0.1 degree accuracy for the observations used in this analysis. It is demonstrated that the pointing of the IBEX-Lo star sensor and of the spacecraft star tracker agree within this prescribed accuracy for time periods of simultaneous good observations (Hlond et al., 2012). The data used from time periods when the IBEX star tracker, which provides precision pointing information for the routine data processing, was operating within its specifications for all analysis that requires exact pointing knowledge, such as the evaluation of the flow distributions in latitude. However, the determination of the ISM flow maximum in ecliptic longitude only requires the use of the count rates, obtained over plus-minus 3 sigma of the angular distribution from the latitude peak position, as a function of longitude, so this requirement can be relaxed.                   	   3     ”            €€€€€€€€5: During the analysis, it was found that the data transfer through the CEU that formats the information for the telemetry slows down because of the total traffic across the interface and the computational load event rates that exceed about 10 counts/s, as observed during the He ISM flow peak. This slow down produces a modulation in the high-resolution data according to the accumulation scheme into 6 deg sectors. Therefore, the only data integrated 6-deg sector for He used in this analysis. In addition, IBEX-Lo detects background electrons, which are identified as invalid events by the TOF spectrometer, but they have to be removed by the CEU, which adds to its load and the slow down when electron rates increase.        <         N   	   3                 €€€€€€€€6: For this analysis, a list of valid time periods was compiled for the ISM flow analysis that is used throughout this paper and also in the analysis by Bzowski et al. (2012). Excluded from this list are time periods, for which the following conditions apply:        г         1   	   3      Ђ            €€€€€€€€7: IBEX is close to the magnetosphere, where IBEX-Lo observes high count rates of magnetospheric ENAs and ions, based on angular ranges outside the ISM flow distribution.        Ѕ         т   	   3      Й            €€€€€€€€8: The Moon is in the IBEX FoV. These times are taken from the ISOC command files, which contain special commanding for the star sensor.       Э         !П   	   3     e            €€€€€€€€9: The electron rates for IBEX-Lo are high. These times are identified in the IBEX-Lo TOF count rates, when the otherwise very stable base count rate outside the ISM flow direction is exceeded by more than a factor of 1.6 (safely above any stochastic fluctuations of the base count rate, but low enough to indicate any significant electron rate increases).        Є         "G   	   3   	   А            €€€€€€€€10: The star tracker function has been impaired. This affects the determination of the ISM peak location and width in latitude.       V         %Э   	   3   
              €€€€€€€€11: No further culling for increased background counts (routinely performed for suprathermal ENA observations (McComas et al. 2009b) is necessary for ISM flow observations because of the concentrated angular distributions at much higher rates. The angular distribution analysis, in general, is performed on much shorter .good. time periods than the count rate analysis because nominal operation of the star tracker is required. Because the rate analysis requires contiguous time sections of fixed length to achieve approximately comparable counting statistics for each data point, very small portions at the beginning or end of the .good. time intervals may be unused, which accounts for the occasional foreshortening of the .good. time intervals for the rate analysis at the beginning or the end.        √         &`   	   3      Л            €€€€€€€€12: McComas, D. J., et al. (2017), Seven Years of Imaging the Global Heliosphere with IBEX, Astrophys. J. Supp. Ser., 229(2), 41 (32 pp.),        `         &ј   	   3      (            €€€€€€€€http://doi.org/10.3847/1538-4365/aa66d8        €              	   3      «            €€€€€€€€This particular data set is denoted in the original ascii files in https://ibex.princeton.edu/DataRelease3 as Interstellar Gas Flow Parameters Accumulated Count Data Used in the Count Rate Analysis.       D         )L      )      
                       €€€€€€€€Instrument_type                                                                                                                                                                                                                                                        I              
   3                   €€€€€€€€Particles (space)      D         *ћ      *Р                             €€€€€€€€Mission_group                                                                                                                                                                                                                                                          <                 3                   €€€€€€€€IBEX      D         ,p      ,                             €€€€€€€€Logical_source                                                                                                                                                                                                                                                         `                 3       (            €€€€€€€€ibex_h3_ena_lo_r03_ct_rate_analysis_7day      D         .!      -і                             €€€€€€€€Logical_file_id                                                                                                                                                                                                                                                        m                 3       5            €€€€€€€€ibex_h3_ena_lo_r03_ct_rate_analysis_7day_00000000_v01      D         /√      /e                             €€€€€€€€Logical_source_description                                                                                                                                                                                                                                             ^                 3       &            €€€€€€€€IBEX-Hi Release 3; Count Rate analysis      D         1O      1                             €€€€€€€€Time_resolution                                                                                                                                                                                                                                                        H                 3                   €€€€€€€€7.5 days cadence      D         3Г      2У                             €€€€€€€€Rules_of_use                                                                                                                                                                                                                                                           р                 3       Є            €€€€€€€€The IBEX Release 3 data are archived as fully citable data. Please consult IBEX team publications and personnel for further details on production, processing, and usage of these data.       D         5      4«                             €€€€€€€€Generated_by                                                                                                                                                                                                                                                           E                 3                   €€€€€€€€Sonya Lyatsky      D         6Я      6P                             €€€€€€€€Generation_date                                                                                                                                                                                                                                                        O                 3                   €€€€€€€€Sun Sep 8 17:08:02 2019      D         8Д      7г                             €€€€€€€€Acknowledgement                                                                                                                                                                                                                                                        °                 3       i            €€€€€€€€Please acknowledge the IBEX Mission Principal Investigator, Dr. David J McComas of Princeton University.       D         >-      9»                             €€€€€€€€MODS                                                                                                                                                                                                                                                                  e                 3      -            €€€€€€€€The latest Release 16 data extends through Map 22 and contains modications and updates of Maps 1-2 from Release 2, Maps 1-6 from Release 4, and Maps 1-10 from Release 7, maps 1-14 from Release 10, maps 15-22 from Release 16. The present CDF data set was converted from the originally archived data in ascii list format but otherwise includes no changes in the data. The original data are given in 30 rows for Solar Ecliptic Latitude and 60 columns for Solar Ecliptic East Longitude. The accompanying documentation described the row latitude data as starting from the north Ecliptic pole (+90 degrees) and decreasing in value to the south Ecliptic pole (-90 degrees). During preparation of the data set in CDF format, SPDF discovered that the correct order was increasing from row 1 for the South Ecliptic pole to row 30 for the north Ecliptic pole. East longitude is defined correctly for the column order but we have instead used west longitude to better represent the outward-looking viewpoint from IBEX to the outer heliosphere as typically used in IBEX team plots.       D         ?q                  €€€€                €€€€€€€€ADID_ref                                                                                                                                                                                                                                                              D         AД      @µ                            €€€€€€€€LINK_TEXT                                                                                                                                                                                                                                                              o         A$      3       7            €€€€€€€€IBEX Mission, Instrument, and Data Release Descriptions       `                 3      (            €€€€€€€€IBEX Data Release 3, Count Rate analysis      D         C{      B»                            €€€€€€€€LINK_TITLE                                                                                                                                                                                                                                                             g         C/      3       /            €€€€€€€€IBEX The Interstellar Boundary Explorer mission       L                 3                  €€€€€€€€IBEX Data Release 3       D         Ep      Dњ                            €€€€€€€€HTTP_LINK                                                                                                                                                                                                                                                              S         E      3                   €€€€€€€€https://ibex.princeton.edu/       ^                 3      &            €€€€€€€€https://ibex.princeton.edu/DataRelease      D         G0      Fі                             €€€€€€€€spase_DatasetResourceID                                                                                                                                                                                                                                                |                 3       D            €€€€€€€€spase://VSPO/NumericalData/IBEX/H3/ENA/Lo/R03/CTRateAnalysis/1AU/7dy      D         Ht                  €€€€          t№      €€€€CATDESC                                                                                                                                                                                                                                                               D         IЄ                  €€€€          ~'      €€€€DEPEND_0                                                                                                                                                                                                                                                              D         Jь                  €€€€          Тў      €€€€DEPEND_1                                                                                                                                                                                                                                                              D         L@                  €€€€                €€€€€€€€DEPEND_2                                                                                                                                                                                                                                                              D         MД                  €€€€                €€€€€€€€DEPEND_3                                                                                                                                                                                                                                                              D         N»                  €€€€                €€€€€€€€DICT_KEY                                                                                                                                                                                                                                                              D         P                   €€€€          ~d      €€€€DISPLAY_TYPE                                                                                                                                                                                                                                                          D         QP              !    €€€€          u(      €€€€FIELDNAM                                                                                                                                                                                                                                                              D         RФ              "    €€€€          ue      €€€€FILLVAL                                                                                                                                                                                                                                                               D         SЎ              #    €€€€          u•      €€€€FORMAT                                                                                                                                                                                                                                                                D         U              $    €€€€          uл      €€€€LABLAXIS                                                                                                                                                                                                                                                              D         V`              %    €€€€          И      €€€€LABL_PTR_1                                                                                                                                                                                                                                                            D         W§              &    €€€€                €€€€€€€€LABL_PTR_2                                                                                                                                                                                                                                                            D         Xи              '    €€€€                €€€€€€€€LABL_PTR_3                                                                                                                                                                                                                                                            D         Z,              (    €€€€          v(      €€€€UNITS                                                                                                                                                                                                                                                                 D         [p              )    €€€€                €€€€€€€€UNIT_PTR                                                                                                                                                                                                                                                              D         \і              *    €€€€          vБ      €€€€VALIDMIN                                                                                                                                                                                                                                                              D         ]ш              +    €€€€          vЅ      €€€€VALIDMAX                                                                                                                                                                                                                                                              D         _<              ,    €€€€          w      €€€€VAR_TYPE                                                                                                                                                                                                                                                              D         `А              -    €€€€          wE      €€€€SCALETYP                                                                                                                                                                                                                                                              D         aƒ              .    €€€€                €€€€€€€€SCAL_PTR                                                                                                                                                                                                                                                              D         c              /    €€€€          ЙЛ      €€€€VAR_NOTES                                                                                                                                                                                                                                                             D         dL              0    €€€€          wГ      €€€€MONOTON                                                                                                                                                                                                                                                               D         eР              1    €€€€                €€€€€€€€LEAP_SECONDS_INCLUDED                                                                                                                                                                                                                                                 D         f‘              2    €€€€                €€€€€€€€RESOLUTION                                                                                                                                                                                                                                                            D         h              3    €€€€                €€€€€€€€Bin_location                                                                                                                                                                                                                                                          D         i\              4    €€€€          w√      €€€€TIME_BASE                                                                                                                                                                                                                                                             D         j†              5    €€€€                €€€€€€€€TIME_SCALE                                                                                                                                                                                                                                                            D         kд              6    €€€€                €€€€€€€€REFERENCE_POSITION                                                                                                                                                                                                                                                    D         m(              7    €€€€                €€€€€€€€ABSOLUTE_ERROR                                                                                                                                                                                                                                                        D         nl              8    €€€€                €€€€€€€€RELATIVE_ERROR                                                                                                                                                                                                                                                        D         o∞              9    €€€€                €€€€€€€€FORM_PTR                                                                                                                                                                                                                                                              D         pф              :    €€€€                €€€€€€€€VIRTUAL                                                                                                                                                                                                                                                               D         r8              ;    €€€€                €€€€€€€€FUNCT                                                                                                                                                                                                                                                                 D                         <    €€€€                €€€€€€€€COMPONENT_0                                                                                                                                                                                                                                                           `         w€   €€€€                           €€€€€€€€       €€€€€€€€    Epoch                                                                                                                                                                                                                                                                              L   	      y_      3                   €€€€€€€€CDF epoch start time       =   	      y©   !   3                   €€€€€€€€Epoch       @   	      yж   "                      €€€€€€€€$∞ИпН_∆       F   	      z&   #   3                   €€€€€€€€CDF Epoch Time       =   	      zl   $   3                   €€€€€€€€Epoch       Y   	      z©   (   3       !            €€€€€€€€day-month-year hour:minute:second       @   	      {   *                      €€€€€€€€  ќM±ОћB       @   	      {B   +                      €€€€€€€€А€	е§!ЌB       D   	      {В   ,   3                   €€€€€€€€support_data       >   	      {∆   -   3                   €€€€€€€€linear       @   	      |   0   3                   €€€€€€€€INCREASE       <   	      |D   4   3                   €€€€€€€€0 AD      `         |А   €€€€                           €€€€€€€€      €€€€€€€€    Epoch2                                                                                                                                                                                                                                                                             J   	      }а      3                  €€€€€€€€CDF epoch end time       =   	      ~І   !   3                  €€€€€€€€Epoch       @   	      ~н   "                     €€€€€€€€$∞ИпН_∆       F   	      -   #   3                  €€€€€€€€CDF Epoch Time       =   	      j   $   3                  €€€€€€€€Epoch       Y   	      ∞   (   3      !            €€€€€€€€day-month-year hour:minute:second       @   	      й   *                     €€€€€€€€  ќM±ОћB       @   	      А)   +                     €€€€€€€€А€	е§!ЌB       D   	      Аi   ,   3                  €€€€€€€€support_data       >   	      А≠   -   3                  €€€€€€€€linear       @   	           0   3                  €€€€€€€€INCREASE       <   	           4   3                  €€€€€€€€0 AD      `         Ал   €€€€                           €€€€€€€€      €€€€€€€€    Start_GPS_time                                                                                                                                                                                                                                                      $∞ИпН_∆       G   	      ВK      3                  €€€€€€€€Start GPS Time.       =   	      ВР      3                  €€€€€€€€Epoch       C   	      ВЌ       3                  €€€€€€€€time_series       F   	      Г   !   3                  €€€€€€€€Start GPS Time       @   	      ГT   "                     €€€€€€€€$∞ИпН_∆       =   	      ГФ   #   3                  €€€€€€€€F19.7       F   	      Г—   $   3                  €€€€€€€€Start GPS Time       9   	      Д   (   3                  €€€€€€€€        @   	      ДN   *                     €€€€€€€€               @   	      ДО   +                     €€€€€€€€    _†B       D   	      Дќ   ,   3                  €€€€€€€€support_data       >   	      Е   -   3                  €€€€€€€€linear      `         ЕP   €€€€                           €€€€€€€€      €€€€€€€€    End_GPS_time                                                                                                                                                                                                                                                        $∞ИпН_∆       E   	      Ж≤      3                  €€€€€€€€End GPS Time.       =   	      ТЬ      3                  €€€€€€€€Epoch       C   	      У       3                  €€€€€€€€time_series       D   	      З   !   3                  €€€€€€€€End GPS Time       @   	      Зf   "                     €€€€€€€€$∞ИпН_∆       =   	      З†   #   3                  €€€€€€€€F19.7       D   	      ЗЏ   $   3                  €€€€€€€€End GPS Time       9   	      ИS   (   3                  €€€€€€€€        @   	      ИХ   *                     €€€€€€€€               @   	      Иѕ   +                     €€€€€€€€    _†B       D   	      Й	   ,   3                  €€€€€€€€support_data       >   	      ЙM   -   3                  €€€€€€€€linear      b         Лl             КШ      КШ           €€€€€€€€      €€€€€€€€    Bin_Number                                                                                                                                                                                                                                                            €€€€ю€       Z   	      М–      3      "            €€€€€€€€Solar Ecliptic Latitude Bin Number       Z   	      Н   !   3      "            €€€€€€€€Solar Ecliptic Latitude Bin Number       :   	      НT   "                     €€€€€€€€ю€       :   	      НР   #   3                  €€€€€€€€I5       9   	      Нћ   $   3                  €€€€€€€€#       @   	           %   3                  €€€€€€€€Latitude       B   	      О   (   3      
            €€€€€€€€Bin Number       :   	      ОK   *                     €€€€€€€€        :   	      ОЗ   +                     €€€€€€€€        D   	      О√   ,   3                  €€€€€€€€support_data       >   	      П   -   3                  €€€€€€€€linear         	      ПE   /   3      ’            €€€€€€€€Solar Ecliptic Latitude Bin Number corresponding to six-degree latitudinal increments of the current IBEX-Lo viewing sector. There are 30 angular bins in Solar Ecliptic Latitude (NPR) covering from 0 to 180 degree       М                     €€€€€€€€€€€€€€€€€€€€€€€€    €€€€€€€€€€€€€€€€€€€€€€€€      Л$€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€       H           	 
                           d         Рн             ПЁ      ПЁ           €€€€€€€€      €€€€€€€€    Bin_Center                                                                                                                                                                                                                                                            €€€€ тIс       B   	      ТQ      3      
            €€€€€€€€Bin Center       B   	      У^   !   3      
            €€€€€€€€Bin Center       <   	      УЈ   "                     €€€€€€€€|oьт       <   	      Уу   #   3                  €€€€€€€€f6.0       @   	      Ф0   $   3                  €€€€€€€€Latitude       ?   	      Фn   (   3                  €€€€€€€€Degrees       <   	      ФІ   *                     €€€€€€€€           <   	      Фг   +                     €€€€€€€€  4C       D   	      Х   ,   3                  €€€€€€€€support_data       >   	      Х[   -   3                  €€€€€€€€linear       Ш   	           /   3      `            €€€€€€€€Latitude value corresponds to the mid-point of six-degree latitudinal IBEX-Lo NEP viewing sector       М                     €€€€€€€€€€€€€€€€€€€€€€€€    €€€€€€€€€€€€€€€€€€€€€€€€      Рi€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€       Д         ј@  @A  РA  јA  рA  B  (B  @B  XB  pB  ДB  РB  ЬB  ®B  іB  јB  ћB  ЎB  дB  рB  ьB  C  
C  C  C  C  "C  (C  .C      d              €€€€                           €€€€€€€€      €€€€€€€€    Counts                                                                                                                                                                                                                                                                €€€€ тIс       K   	              3                  €€€€€€€€H ENA Total Counts        =   	              3                  €€€€€€€€Epoch       B   	              3      
            €€€€€€€€Bin_Center       C   	               3                  €€€€€€€€spectrogram       Y   	           !   3      !            €€€€€€€€ENA Total Counts at the given bin       <   	           "                     €€€€€€€€|oьт       =   	           #   3                  €€€€€€€€F10.2       >   	           $   3                  €€€€€€€€Counts       9   	           (   3                  €€€€€€€€#       <   	           *                     €€€€€€€€           <   	           +                     €€€€€€€€ @F       <   	           ,   3                  €€€€€€€€data       >   	           -   3                  €€€€€€€€linearbrKEыЩю÷ђgtќIi