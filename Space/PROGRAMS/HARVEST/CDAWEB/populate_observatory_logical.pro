
function populate_observatory_logical,spase_ontology,resource_info, $
                                      acknowledgement,station_name_list, $
                                      verbose=verbose

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

observatory.resource_id= $
   'spase://SMWG/Observatory/'+ $
   string_condition(resource_info.project,' ','_')+'_Logical'

observatory.resource_header.resource_name= $
   'The Logical Observatory created to represent the chain of stations in '+ $
   'the '+resource_info.project+' Array.'

observatory.resource_header.alternate_name= $
   'The '+resource_info.project+' Logical Observatory Chain'

observatory.resource_header.release_date=resource_info.release_date

observatory.resource_header.expiration_date=resource_info.expiration_date

if (n_elements(station_name_list) eq 2) then $
   observatory.resource_header.description= $
      'The Logical Observatory created to represent the chain of '+ $
      'stations present in the '+resource_info.project+ $
      ' Array.  The chain of stations includes:  '+station_name_list(0)+ $
      ' and '+station_name_list(1)+'.'

if (n_elements(station_name_list) ge 3) then $
   observatory.resource_header.description= $
      'The Logical Observatory created to represent the chain of '+ $
      'stations present in the '+resource_info.project+ $
      '.  The chain of stations includes:  '+ $
      strjoin(station_name_list(0:n_elements(station_name_list)-2),', ')+ $
      ', and '+station_name_list(n_elements(station_name_list)-1)+'.'

observatory.resource_header.acknowledgement=acknowledgement

repository_contact_num=n_elements(resource_info.repository_contact)

observatory.resource_header.contact.person_id=resource_info.contact.resource_id

for contact_loop=0,n_elements(resource_info.contact)-1 do $
   observatory.resource_header.contact(contact_loop).role= $
      role_list(resource_info.contact(contact_loop).role_num)

observatory.resource_header.information_url.name= $
   'The '+resource_info.project+' Magnetometer Array Home Page.'

observatory.resource_header.information_url.url= $
   resource_info.original_logical_information_url

observatory.resource_header.information_url.description= $
   'The '+resource_info.project+' Magnetometer Array information web site.'

observatory.resource_header.association_id=''

observatory.resource_header.prior_id=''

observatory.observatory_group=''

observatory_region_num=26

observatory.location.observatory_region= $
   observatory_region_list(observatory_region_num)

;coordinate_system_name_num=0

;observatory.location.coordinate_system_name= $
;   coordinate_system_name_list(coordinate_system_name_num)

observatory.location.coordinate_system_name=''

observatory.location.latitude=''

observatory.location.longitude=''

observatory.location.elevation=''

return,observatory

end

