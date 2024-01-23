
function cdaweb_harvest_data_product,  $
            spase_ontology,spase_version,project_program_dir,data_dir,project, $
            data_product_name,date_style,data_product_cdf_info,process_yymmdd, $
            cdf_file_name

start_process=systime(1)

dashes='+'+strjoin(replicate('-',273))+'+'

stars=strjoin(replicate('*',275))

print,stars,format='(a/)'

print,'Yataaaaa!!!   cdaweb_harvest_data_product start',format='(a/)'

print,stars,format='(a/)'

print,'Function:          CDAWEB_HARVEST_DATA_PRODUCT',format='(a/)'

print,'Processing Start:  ',systime(),format='(2a/)'

print,stars,format='(a/)'

printf,20,stars,format='(a/)'

printf,20,'Function:          CDAWEB_HARVEST_DATA_PRODUCT',format='(a/)'

printf,20,'Processing Start:  ',systime(),format='(2a/)'

printf,20,stars,format='(a/)'

xml_dir=project_program_dir+'XML/'

info_dir=project_program_dir+'INFO/'

project_data_dir=data_dir+strupcase(project)+'/'

test=0

if (test ne 0) then begin

   tab_table_input_file=info_dir+strlowcase(project)+'_station_info.txt'

   station_table_structure= $
      read_tab_table(tab_table_input_file,exist_flag,/verbose)

   print,stars,format='(/a/)'

   print,station_table_structure.header, $
         format='(a-28,a-29,a-19,a-15,6x,a-15,a-20,a-21,a-21,a22,a8,x,a-17)'

   print,dishes,format='(/a/)'

   for loop=0,station_table_structure.record_num-1 do $
       print,station_table_structure.table(loop), $
             format='(a-28,a-29,a-19,6x,a-15,6x,a-15,2x,a-21,a-21,a-22,a-15,'+ $
                     'a-10,a-13)'

   print,stars,format='(/a/)'

   station_code_list=['DSO']

   station_code_list=station_table_structure.table.station_code_3

endif

station_code_list=['CDAWEB']

harvest_info_log_file_name= $
   project_program_dir+'station_info_'+process_yymmdd+'.log'

;openw,80,harvest_info_log_file_name

authority='VMO'

repository_acronym='VMOU'

if (test ne 0) then begin

   station_info=cdaweb_station_info(spase_ontology,project_program_dir, $
                                    station_code_list,authority, $
                                    repository_acronym,project)

   station_num=n_elements(station_info)

   instrument_num=n_elements(station_info(0).instrument)

endif

;
;  Dummy up a single resource type for harvesting
;

contact_num=spase_ontology(11).occur_num

contact_info_record= $
   create_struct(name='CONCACT INFO','resource_id','','name','', $
                 'organization_name','','address','','email','', $
                 'phone_number','','fax','','role_num',0)

contact=replicate(contact_info_record,contact_num)

contact(0).name=''

contact(0).role_num=7

name='Lee Frost Bargatze'

name_conditioned=string_condition(string_condition(name,' ','.'),'..','.')

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

caldat,systime(/julian),month,day,year,hour,minute,second

release_date=date_time_string(year,month,day,'12','34','56.789')

;elease_date=date_time_string(year,month,day,hour,minute,second)

time_resolution='PT4S'

time_resolution='UNKNOWN'

repository_contact=replicate(contact_info_record,contact_num)

name=['Raymond J. Walker']

;emp_name=string_condition(name,'.','')

name_conditioned=string_condition(string_condition(name,' ','.'),'..','.')

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

instrument_contact=replicate(contact_info_record,contact_num)

instrument_info_record= $
   create_struct('name','','resource_id','','type','', $
                 'measurement_type_num','','contact',instrument_contact, $
                 'acknowledgement','','url','')

instrument=replicate(instrument_info_record,1)

information_url=create_struct(name='INFORMATION URL','name','', $
                              'url','','description','','language','')

instrument_num=1

string_array=make_array(instrument_num,/string,value='')

project_lower=strlowcase(project)

resource_info_record= $
   create_struct('type','','name','','registry_name','','registry_acronym','', $
                 'registry_contact',registry_contact, $
                 'registry_information_url','', $
                 'repository_name','Virtual Magnetospheric Observatory', $
                 'repository_acronym',repository_acronym, $
                 'repository_host','IGPP, UCLA', $
                 'repository_address', $
                    'Institute of Geophysics and Planetary Physics, '+ $
                    'University of California, Los Angeles', $
                 'repository_contact',repository_contact, $
                 'repository_information_url', $
                    'http://vmo-repository.ucla.igpp.edu', $
                 'original_repository_name','Virtual Magnetospheric Observatory', $
                 'original_repository_information_url','', $
                 'original_logical_information_url','', $
                 'original_format','', $
                 'resource_name','', $
                 'association_id','', $
                 'time_resolution','','grep_pattern','','dir_depth_num',0, $
                 'search_path_root','/Volumes/SILVER_SURF/DATA/'+project, $
                 'search_path_sub_dir','', $
                 'dot_position',0,'parent_type','', $
                 'instrument_num',make_array(instrument_num,/integer,value=0), $
                 'extent','','measurement_type_num','', $
                 'observed_region_num','','time_description','','suffix','', $
                 'time_span_start_date','','time_span_stop_date','', $
                 'authority','','url_root','','release_date','', $
                 'information_url',replicate(information_url,instrument_num), $
                 'expiration_date','','contact',contact, $
                 'numerical_data_resource_id',string_array, $
                 'granule_resource_id_root',string_array, $
                 'physical_parameter_elements',['X','Y','Z'], $
                 'physical_parameter_components',[4,5,6], $
                 'project',project, $
                 'project_conditioned',string_condition(project,'_',' '))

resource_info=replicate(resource_info_record,1)

resource_info(0)={type:'DATA', $
                  name:'Ground Magnetic Field Data', $
                  registry_name:'Virtual Magnetospheric Observatory', $
                  registry_acronym:'VMO', $
                  registry_contact:registry_contact, $
                  registry_information_url:'http://vmo.igpp.ucla.edu', $
                  repository_name:'Virtual Magnetospheric Observatory', $
                  repository_acronym:repository_acronym, $
                  repository_host:'IGPP, UCLA', $
                  repository_address: $
                    'Institute of Geophysics and Planetary Physics, '+ $
                    'University of California, Los Angeles', $
                  repository_contact:repository_contact, $
                  repository_information_url: $
                    'http://vmo-repository.ucla.igpp.edu', $
                  original_repository_name:'', $
                  original_repository_information_url:'', $
                  original_logical_information_url: $
                     'http://PROJECT.igpp.ucla.edu/about_PROJECT.html', $
                  original_format:'', $
                  resource_name:'Ground Magnetic Field Data', $
                  association_id: $
                     'spase://SMWG/Observatory/'+project+'_Logical', $
                  time_resolution:time_resolution, $
                  grep_pattern:'"\.txt\.gz"', $
                  dir_depth_num:2, $
                  search_path_root:'/Volumes/SILVER_SURF/DATA/'+project, $
                  search_path_sub_dir:'', $
                  dot_position:fix(strlen('a8100353')), $
                  parent_type:'NumericalData', $
                  instrument_num:[0], $
                  extent:'6311878', $
                  measurement_type_num:'11', $
                  observed_region_num:'26', $
                  time_description: $
                     'Ground Magnetic Field Data - '+time_resolution+ $
                     ' Time Resolution ', $
                  suffix:'.dat', $
                  time_span_start_date:'', $
                  time_span_stop_date:'', $
                  authority:authority, $
                  url_root:'http://vmo.igpp.ucla.edu/data1/index/'+project, $
                  release_date:release_date, $
                  information_url:replicate(information_url,instrument_num), $
                  expiration_date:'', $
                  contact:contact, $
                  numerical_data_resource_id:string_array, $
                  granule_resource_id_root:string_array, $
                  physical_parameter_elements:['X','Y','Z'], $
                  physical_parameter_components:[4,5,6], $
                  project:project, $
                  project_conditioned:string_condition(project,'_',' ')}

temp_info_record= $
   create_struct('name','Ground Magnetic Field Data', $
                 'alternate_name','', $
                 'name_conditioned','GROUND MAGNETIC FIELD DATA', $
                 'alternate_name_conditioned','','code','','comment','', $
                 'latitude','','longitude','','elevation','', $
                 'magnetic_latitude','','magnetic_longitude','','l_value','', $
                 'acknowledgement','','contact',contact,'authority',authority, $
                 'registry_name','Virtual Magnetospheric Observatory', $
                 'registry_acronym','VMO', $
                 'registry_contact',registry_contact, $
                 'registry_information_url','http://vmo.igpp.ucla.edu', $
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
                    replicate(information_url,2), $
                 'instrument_information_url', $
                    replicate(information_url,2), $
                 'alternate_observatory_name_conditioned','', $
                 'observatory_resource_id','','instrument',instrument, $
                 'release_date',release_date,'time_span_start_date','', $
                 'time_span_stop_date','','structure_type','Scalar', $
                 'physical_parameter_elements',['X','Y','Z'], $
                 'physical_parameter_components',[4,5,6], $
                 'coordinate_representation_num',2, $
                 'information_url',information_url, $
                 'expiration_date','', $
                 'url_root','http://vmo.igpp.ucla.edu/data1/index/'+project, $
                 'service','MANGO', $
                 'project',string_condition(project,'_',' '))

;resource_info(0).search_path_root= $
;   '/Users/admin/Space/DATA/MAGNETOGRAM/'+ $
;   string_condition(strupcase(resource_info(0).project),' ','_')

resource_num=n_elements(resource_info)

temp_info=replicate(temp_info_record,resource_num)

spase_xml_full=replicate('',99999L)

full_index=0L

station_num=1

for station_loop=0,station_num-1 do begin

    for resource_loop=0,resource_num-1 do begin

        spase_xml=''

;
;       Read in the Resource Acknowledgement Information from the ".ack" Files
;

;       temp_info(resource_loop)= $
;          read_ack(temp_info(resource_loop),project_program_dir, $
;                   ack_file_exist_flag)

;       resource_info(resource_loop).contact(0)= $
;          station_info(station_loop).contact(0)

;       for instrument_loop=0,instrument_num-1 do begin

;           resource_info(resource_loop).numerical_data_resource_id(instrument_loop)= $
;              'spase://'+authority+'/NumericalData/'+ $
;              station_info(station_loop).name_conditioned+'/'+ $
;              station_info(station_loop).instrument(instrument_loop).name+'/'+ $
;              time_resolution

;           resource_info(resource_loop).granule_resource_id_root(instrument_loop)= $
;              'spase://'+authority+'/Granule/'+ $
;              station_info(station_loop).name_conditioned+'/'+ $
;              station_info(station_loop).instrument(instrument_loop).name+'/'+ $
;              time_resolution+'/'

;           resource_info(resource_loop).information_url(instrument_loop).url= $
;              station_info(station_loop).instrument_information_url.url

;              station_info(station_loop).information_url

;       endfor

;       command='grep '+data_product_name+'_ '+data_dir+'CDAWEB/pub/data/filelist | '+ $
;               'grep "\.cdf"$ | grep -v _00000000_ | '+ $
;               'grep -v "AUTO-INGEST" | grep -v "\/save\/" | '+ $
;               'grep -v "pub\/test\/" | grep -v "pub\/test2\/"'

;       spawn,command,data_product_file_name_list,error_grep

        command='grep '+data_product_name+'_ '+data_dir+'CDAWEB/cdaweb_cdf_file_list.txt | '+ $
                'grep "\.cdf"$ | grep -v _00000000_ | '+ $
                'grep -v "AUTO-INGEST" | grep -v "\/save\/" | '+ $
                'grep -v "pub\/test\/" | grep -v "pub\/test2\/" | sort -k4'

        spawn,command,data_product_file_name_list,error_grep

        command='grep -hr '+data_product_name+'_ '+data_dir+ $
                'CDAWEB/pub/data/themis | grep -v ^"#" | sort -k 2'

        command='grep '+data_product_name+' cdaweb_cdf_file_hash_list.txt | grep -v ^"#"'

        spawn,command,data_product_file_hash_list,error_grep

        data_product_file_name_list_num=n_elements(data_product_file_name_list)

        data_product_file_hash_list_num=n_elements(data_product_file_hash_list)

        if (data_product_file_name_list_num gt 0 and $
            data_product_file_name_list(0) ne '') then begin

           if (data_product_name eq 'im_k0_len') then data_product_name='im_k0_lena'

           time_span_temp=strsplit(data_product_file_name_list(0),data_product_name+'_',/regex,/extract)

           time_span_temp=strsplit(time_span_temp(1),'_',/extract)

           time_span_temp=cdaweb_date_time(time_span_temp(0))

           resource_info(resource_loop).time_span_start_date=time_span_temp(0)

           time_span_temp=strsplit(data_product_file_name_list(data_product_file_name_list_num-1),data_product_name+'_',/regex,/extract)

           time_span_temp=strsplit(time_span_temp(1),'_',/extract)

           time_span_temp=cdaweb_date_time(time_span_temp(0))

           resource_info(resource_loop).time_span_stop_date=time_span_temp(1)

        endif

        access_url='ftp://cdaweb.gsfc.nasa.gov/pub/data'

        if (data_product_file_hash_list(0) ne '') then begin

           path=strsplit(data_product_file_name_list(0),/extract)

           path=strsplit(path(n_elements(path)-1),'/',/extract)

           path_node_num=n_elements(path)

           path_node=make_array(data_product_file_name_list_num,path_node_num,/string,value='')

           path_node_uniq_num=make_array(path_node_num,/integer,value=0)

           for file=0L,data_product_file_name_list_num-1 do begin

               path=strsplit(data_product_file_name_list(file),/extract)

               path=strsplit(path(n_elements(path)-1),'/',/extract)

               path_num=n_elements(path)

               if (path_num eq path_node_num and path_node_num ge 2) then begin

                  path_node(file,*)=path(0:path_node_num-1)

               endif else begin

                  print,'Wrong Path:  '+data_product_file_name_list(file),format='(a/)'

               endelse

           endfor

           good_file_path_mask=where(path_node(*,0) ne '',good_file_path_mask_num)

           if (good_file_path_mask_num gt 0) then begin

              path_node=path_node(good_file_path_mask,*)

              for node=0,path_node_num-1 do begin

                  temp=path_node(*,node)

                  path_node_uniq_num(node)=n_elements(temp(uniq(temp,sort(temp))))

              endfor

              common_path_mask=where(path_node_uniq_num eq 1,common_path_mask_num)

              common_path=strjoin(path_node(0,2:common_path_mask_num-1),'/',/SINGLE)

              access_url=access_url+'/'+common_path

           endif

        endif

        spase_xml_file_name=''

        if (data_product_file_name_list_num ne 0 and $
            data_product_file_hash_list_num ne 0) then begin

;          granule_info= $
;             cdaweb_granulate(data_product_name,data_product_file_name_list, $
;                              data_product_file_hash_list)

           granule_info_num=0 ; 3d MHD KLUGE

           granule_info_num=n_elements(granule_info)

        endif else begin

           granule_info_num=0

        endelse

        if (data_product_name ne 'voyager1_48Sec_MagneticField_NearTerminationShock' and $
            data_product_name ne 'voyager2_48Sec_MagneticField_NearTerminationShock') then begin

           data_product_file_name_list_num=n_elements(data_product_file_name_list)

           if (data_product_file_name_list(0) ne 0) then begin

              split=strsplit(data_product_file_name_list( $
                                data_product_file_name_list_num-1),/extract)

              split_name=strsplit(split(3),'/',/extract)

              observatory_name=split_name(2)

              spase_xml_file_name=xml_dir+ $
                 string_condition( $
                    strlowcase(resource_info(resource_loop).project),' ','_')+ $
                    '_'+observatory_name+'_'+data_product_name+'.xml'

           endif else begin

             spase_xml_file_name= $
                xml_dir+string_condition(strlowcase(resource_info(resource_loop).project),' ','_')+ $
                '_'+data_product_name+'_'+date_style+'.xml'

           endelse

        endif else begin

           if (data_product_name eq 'voyager1_48Sec_MagneticField_NearTerminationShock') then $
              spase_xml_file_name=xml_dir+'cdaweb_voyager1_48Sec_MagneticField_NearTerminationShock.xml'

           if (data_product_name eq 'voyager2_48Sec_MagneticField_NearTerminationShock') then $
              spase_xml_file_name=xml_dir+'cdaweb_voyager2_48Sec_MagneticField_NearTerminationShock.xml'

        endelse

        print,'Data Product ID:',data_product_name,granule_info_num,format='(a-19,a-146,i12/)'

        station_info_updated= $
           cdaweb_spase(spase_ontology,spase_version,data_dir, $
                        project_program_dir,project_data_dir,granule_info, $
                        resource_info(resource_loop),data_product_name, $
                        date_style,data_product_cdf_info,cdf_file_name, $
                        access_url,spase_xml_file_name,spase_xml)

        print,stars,format='(a/)'

        spase_xml_num=n_elements(spase_xml)

        if (spase_xml_num gt 0 and spase_xml_file_name ne '') then begin

           spase_xml_num=n_elements(spase_xml)

           spase_xml_test=read_spase_xml(spase_xml_file_name,exist_flag,/verbose)

           spase_xml_test_num=n_elements(spase_xml_test)

           mask=full_index+lindgen(spase_xml_num)

           spase_xml_full(mask)=spase_xml

           full_index=full_index+spase_xml_num

           filled_mask=where(spase_xml_full ne '',filled_mask_num)

           if (filled_mask_num gt 0) then spase_xml_full=spase_xml_full(filled_mask)

           print,'HAH HAH HAH !!!',spase_xml_num,full_index,spase_xml_test_num, $
                 total(strcmp(spase_xml,spase_xml_test)),filled_mask_num, $
                 format='(a,5i/)'

           print,stars,format='(a/)'

        endif

    endfor

endfor

;lose,80

spase_xml_num=n_elements(spase_xml)

if (spase_xml_num gt 0) then begin

   spase_xml_test=read_spase_xml(spase_xml_file_name,exist_flag,/verbose)

   spase_xml_test_num=n_elements(spase_xml_test)

   filled_mask=where(spase_xml_full ne '',filled_mask_num)

   if (filled_mask_num gt 0) then spase_xml_full=spase_xml_full(filled_mask)

   print,'HEE HEE HEE !!!',spase_xml_num,full_index,spase_xml_test_num, $
         total(strcmp(spase_xml,spase_xml_test)),filled_mask_num,format='(a,5i/)'

endif

print,stars,format='(a/)'

print,'Yataaaaa!!!   cdaweb_harvest_data_product stop',format='(a/)'

print,stars,format='(a/)'

stop_process=systime(1)

elapsed_time=stop_process-start_process

printf,20,stars,format='(a/)'

printf,20,'Processing Stop:   ',systime(),format='(2a/)'

printf,20,'Processing Time:   ',elapsed_time,' sec FINAL',format='(a18,f8.2,a10/)'

printf,20,stars,format='(a/)'

return,spase_xml_full

end

