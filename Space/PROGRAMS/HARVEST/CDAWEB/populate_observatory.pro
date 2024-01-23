
function populate_observatory,spase_ontology,station_info,verbose=verbose

observatory=spase_model_create(spase_ontology,'observatory',/verbose, $
                               /keyword_end_date,/keyword_measured, $
                               /keyword_field)

role_list=['','ArchiveSpecialist','Co-Investigator','DataProducer', $
           'Deputy-PI','GeneralContact','MetadataContact', $
           'PrincipalInvestigator','ProjectScientist','Scientist', $
           'TeamLeader','TeamMember','TechnicalContact']

observatory_region_list=['','Asteroid','Comet','Earth','Earth.Magnetosheath', $
                         'Earth.Magnetosphere', $
                         'Earth.Magnetosphere.Magnetotail', $
                         'Earth.Magnetosphere.Main', $
                         'Earth.Magnetosphere.Polar', $
                         'Earth.Magnetosphere.RadiationBelt', $
                         'Earth.NearSurface','Earth.NearSurface.Atmosphere', $
                         'Earth.NearSurface.AuroralRegion', $
                         'Earth.NearSurface.EquatorialRegion', $
                         'Earth.NearSurface.Ionosphere', $
                         'Earth.NearSurface.Ionosphere.D-Region', $
                         'Earth.NearSurface.Ionosphere.E-Region', $
                         'Earth.NearSurface.Ionosphere.F-Region', $
                         'Earth.NearSurface.Ionosphere.Topside', $
                         'Earth.NearSurface.Mesosphere', $
                         'Earth.NearSurface.Plasmasphere', $
                         'Earth.NearSurface.PolarCap', $
                         'Earth.NearSurface.SouthAtlanticAnomalyRegion', $
                         'Earth.NearSurface.Stratosphere', $
                         'Earth.NearSurface.Thermosphere', $
                         'Earth.NearSurface.Troposphere', $
                         'Earth.Surface','Heliosphere','Heliosphere.Inner', $
                         'Heliosphere.NearEarth','Heliosphere.Outer', $
                         'Heliosphere.Remote1AU','Jupiter','Mars','Mercury', $
                         'Neptune','Pluto','Saturn','Sun','Sun.Chromosphere', $
                         'Sun.Corona','Sun.Interior','Sun.Photosphere', $
                         'Sun.TransitionRegion','Uranus','Venus']

coordinate_system_name_list=['','Carrington','CGM','DM','GEI','GEO','GSE', $
                             'GSEQ','GSM','HAE','HCI','HEE','HEEQ','HG','HGI', $
                             'J2000','LGM','MAG','MFA','RTN','SC','SE','SM', $
                             'Spacecraft','Orbit','Plane','SR','SR2','SSE', $
                             'WGS84']

observatory.resource_id=station_info.observatory_resource_id

observatory.resource_header.resource_name= $
   'The '+station_info.observatory_name+' Geomagnetic Observatory.'

if(station_info.alternate_observatory_name ne '') then $
   observatory.resource_header.alternate_name= $
      station_info.alternate_observatory_name+' Ground Observatory.'

observatory.resource_header.release_date=station_info.release_date

observatory.resource_header.expiration_date=station_info.expiration_date

observatory.resource_header.description= $
   'The '+station_info.observatory_name+' ('+station_info.code+ $
   ') Geomagnetic Observatory.'

observatory.resource_header.acknowledgement=station_info.acknowledgement

for contact_loop=0,n_elements(station_info.contact)-1 do begin

    if (station_info.contact(contact_loop).resource_id ne '') then begin

       observatory.resource_header.contact(contact_loop).person_id= $
          station_info.contact(contact_loop).resource_id

       observatory.resource_header.contact(contact_loop).role= $
          role_list(station_info.contact(contact_loop).role_num)

    endif

endfor

for loop=0,n_elements(station_info.observatory_information_url)-1 do begin

    observatory.resource_header.information_url(loop).name= $
       'The '+station_info.observatory_name+' geomagnetic observatory web site.'

    observatory.resource_header.information_url(loop).url= $
       station_info.observatory_information_url(loop).url

    observatory.resource_header.information_url(loop).description= $
       'The '+station_info.observatory_name+' geomagnetic observatory web site.'

endfor

observatory.resource_header.association_id= $
   'spase://SMWG/Observatory/'+string_condition(station_info.project,' ','_')+ $
   '_Logical'

observatory.resource_header.prior_id=''

observatory.observatory_group=''

observatory_region_num=26

observatory.location.observatory_region= $
   observatory_region_list(observatory_region_num)

coordinate_system_name_num=5

observatory.location.coordinate_system_name= $
   coordinate_system_name_list(coordinate_system_name_num)

observatory.location.latitude=station_info.latitude

observatory.location.longitude=station_info.longitude

observatory.location.elevation=station_info.elevation

return,observatory

end

