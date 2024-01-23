
function cdaweb_station_info,spase_ontology,project_program_dir, $
                             station_code_list,authority,repository_acronym, $
                             project

start_process=systime(1)

!EXCEPT=2

data_map_file_exist_flag=0

stars=strjoin(replicate('*',275))

printf,80,stars,format='(/a/)'

;
;  Now set Values that are Needed to Populate the Station_Info Structure
;

caldat,systime(/julian,/utc),month,day,year,hour,minute,second

release_date=date_time_string(year,month,day,hour,minute,second)

;
;  Set up Structures to Capture Harvested Information for the Magnetometer Array
;  Stations.  Start with the Contact Information Structure set up.
;

contact_num=spase_ontology(11).occur_num

contact_info_record= $
   create_struct(name='CONCACT INFO','resource_id','','name','', $
                 'organization_name','','address','','email','', $
                 'phone_number','','fax','','role_num',0)

contact=replicate(contact_info_record,contact_num)

contact(0:1).role_num=7

name='Lee Frost Bargatze'

name_conditioned=string_condition(name,' ','.')

metadata_contact= $
      create_struct('resource_id','spase://SMWG/Person/'+name_conditioned, $
                    'name',name, $
                    'organization_name', $
                       'Institute of Geophysics and Planetary Physics, UCLA', $
                    'address', $
                       'Institute of Geophysics and Planetary Physics, '+ $
                       'University of California Los Angeles, Box 951567, '+ $
                       'Los Angeles, CA 90095-1567', $
                    'email','lfb@igpp.ucla.edu', $
                    'phone_number','+1-310-206-6073', $
                    'fax','+1-310-206-8042','role_num',6)

contact(contact_num-1)=metadata_contact

information_url_record=create_struct(name='INFORMATION URL','name','', $
                                     'url','','description','','language','')

;nformation_url=replicate(information_url_record,2)

information_url=information_url_record

instrument_contact=replicate(contact_info_record,contact_num)

instrument_contact(contact_num-1)=metadata_contact

instrument_info_record= $
   create_struct('name','','resource_id','','type','', $
                 'measurement_type_num','','contact',instrument_contact, $
                 'acknowledgement','','url','')

instrument=replicate(instrument_info_record,5)

repository_contact=replicate(contact_info_record,contact_num)

name=['Raymond J. Walker']

;emp_name=string_condition(name,'.','')

name_conditioned=string_condition(string_condition(name,'.',''),' ','.')

email=['rwalker@igpp.ucla.edu']

for loop=0,n_elements(name_conditioned)-1 do begin

    repository_contact(loop).resource_id= $
       'spase://SMWG/Person/'+name_conditioned(loop)

    repository_contact(loop).name=name_conditioned(loop)

    repository_contact(loop).organization_name= $
       'Institute of Geophysics and Planetary Physics, UCLA'

    repository_contact(loop).address= $
       'Institute of Geophysics and Planetary Physics, '+ $
       'University of California Los Angeles, Box 951567, '+ $
       'Los Angeles, CA 90095-1567'

    repository_contact(loop).email=email(loop)

    repository_contact(loop).phone_number='+1-310-825-7685'

    repository_contact(loop).role_num=5

endfor

repository_contact(contact_num-1)=metadata_contact

registry_contact=repository_contact

language=['English']

station_info_record= $
   create_struct('name','','alternate_name','','name_conditioned','', $
                 'alternate_name_conditioned','','code','','comment','', $
                 'latitude','','longitude','','elevation','', $
                 'magnetic_latitude','','magnetic_longitude','','l_value','', $
                 'acknowledgement','','contact',contact,'authority',authority, $
                 'repository_name','Virtual Magnetospheric Observatory', $
                 'repository_acronym',repository_acronym, $
                 'repository_host','IGPP, UCLA', $
                 'repository_address', $
                    'Institute of Geophysics and Planetary Physics, '+ $
                    'University of California, Los Angeles', $
                 'repository_contact',repository_contact, $
                 'repository_information_url', $
                    'http://vmo-repository.ucla.igpp.edu', $
                 'original_repository_name','', $
                 'original_repository_information_url','', $
                 'original_logical_information_url','', $
                 'original_format','', $
                 'observatory_name','','alternate_observatory_name','', $
                 'observatory_name_conditioned','', $
                 'observatory_information_url', $
                    replicate(information_url_record,n_elements(language)), $
                 'instrument_information_url', $
                    replicate(information_url_record,n_elements(language)), $
                 'alternate_observatory_name_conditioned','', $
                 'observatory_resource_id','','instrument',instrument, $
                 'release_date',release_date,'time_span_start_date','', $
                 'time_span_stop_date','','structure_type','Vector', $
                 'physical_parameter_elements',['X','Y','Z'], $
                 'physical_parameter_components',[4,5,6], $
                 'coordinate_representation_num',1, $
                 'information_url',information_url, $
                 'expiration_date','', $
                 'url_root','http://www.igpp.ucla.edu/VMO', $
                 'service','MANGO', $
                 'project',project)

station_num=n_elements(station_code_list)

station_info=replicate(station_info_record,station_num)

for loop=0,station_num-1 do begin

    station_info(loop).code=station_code_list(loop)

;
;   Read in the Station Acknowledgement Information from the ".ack" Files
;

    station_info(loop)=read_ack(station_info(loop),project_program_dir, $
                                ack_file_exist_flag)

    for url_loop=0,n_elements(language)-1 do begin

        station_info(loop).observatory_information_url(url_loop).language= $
           language(url_loop)

        station_info(loop).observatory_information_url(url_loop).url= $
           'http://PROJECT.igpp.ucla.edu/'+ $
           strlowcase(station_info(loop).code)+'.html'

        station_info(loop).instrument_information_url(url_loop).language= $
           language(url_loop)

        station_info(loop).instrument_information_url(url_loop).url= $
           'http://PROJECT.igpp.ucla.edu/'+ $
           strlowcase(station_info(loop).code)+'.html'

    endfor

endfor

stop_process=systime(1)

elapsed_time=stop_process-start_process

print,stars,format='(a/)'
print,'Station Info Structures Harvested ',systime(),format='(2a/)'
print,'Processing Time:  ',elapsed_time,' sec',format='(a18,f8.2,a4/)'
print,stars,format='(a/)'

return,station_info

end

