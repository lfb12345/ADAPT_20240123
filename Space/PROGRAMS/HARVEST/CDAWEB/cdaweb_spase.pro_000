
function cdaweb_spase,spase_ontology,spase_version,data_dir, $
                      project_program_dir,project_data_dir,granule_info, $
;                     project_program_dir,project_data_dir,station_info, $
                      resource_info,data_product_name,date_style, $
                      data_product_cdf_info,cdf_file_name,access_url, $
                      spase_xml_file_name,spase_xml,verbose=verbose

stars=strjoin(replicate('*',275))

print,stars,format='(a/)'

print,'Yataaaaa!!!   cdaweb_spase start',format='(a/)'

print,stars,format='(a/)'

file_check=file_info(project_program_dir)

if (file_check.exists eq 0) then file_mkdir,project_program_dir

openw,10,spase_xml_file_name

;
;  Open SPASE Form
;

tab=0

spase_xml=replicate('',99999L)

person_registry=replicate('',99)

person_registry_index=0

granule_registry=replicate('',99999L)

granule_registry_index=0L

spase_xml_tag_open,spase_version,spase_xml

index_mask=where(spase_xml ne '',index)

version=strjoin(strsplit(spase_version.version_num,'_',/extract),'.')

xml_element_write,version,spase_ontology(1),spase_xml,index,/blank_check

granule_info_harvest_style= $
   make_array(n_elements(resource_info),/string,value='NATIVE_HARVEST')

info_dir=project_program_dir+'INFO/'

file_num_total=0

for resource_loop=0,n_elements(resource_info)-1 do begin

;   search_path=resource_info(resource_loop).search_path_root

;   search_path='/'+string_condition(search_path,'//','/')

;   command='ls -R '+search_path+' | grep '+ $
;           resource_info(resource_loop).grep_pattern

;   spawn,command,file_listing,error_ls

;   file_num=n_elements(file_listing)

;   if (file_num eq 1 and file_listing(0) eq '') then file_num=0

;   if (file_num gt 0) then begin

;      file_num_total=file_num_total+file_num

;   endif else begin

;      ls_list=read_ls(station_info.code,info_dir,ls_exist_flag)

;      md5_list=read_md5(station_info.code,info_dir,md5_exist_flag)

;      if (ls_exist_flag eq 0 and md5_exist_flag eq 0) then begin

;         ls_list_file_num=n_elements(ls_list)

;         md5_list_file_num=n_elements(md5_list)

;         if (ls_list_file_num ne md5_list_file_num) then $
;            print,'Warning:  The number of files in the directory list is'+ $
;                  ' not ','          equal to the number of files in the '+ $
;                  'hash file list.',format='(2(a/))'

;         if (ls_list_file_num eq md5_list_file_num) then $
;            file_num=ls_list_file_num

;         if (file_num gt 0) then begin

;            granule_info_harvest_style(resource_loop)='REMOTE_HARVEST'

;            file_listing=make_array(file_num,/string,value='')

;            for file_loop=0,file_num-1 do begin

;                ls_element=strsplit(ls_list(file_loop),/extract)

;                file_listing(file_loop)=ls_element(8)

;            endfor

;            file_num_total=file_num_total+file_num

;         endif

;      endif

;   endelse

endfor

;ile_num_total=n_elements(granule_info)

file_num_total=1 ; 3d MHD KLUGE

;f (file_num_total gt 0) then begin

;
;  Process Registry Information
;

;  registry=populate_registry(spase_ontology,resource_info(0),/verbose)

;  registry_xml=write_registry(registry,spase_ontology(828:869),spase_xml, $
;                              index,/blank_check)

;  for line_loop=0,n_elements(registry_xml)-1 do print,registry_xml(line_loop)

;  print,''

;  registry_person= $
;     populate_registry_person_ucla(spase_ontology,resource_info(0),/verbose, $
;                                   /keyword_stop_date,/keyword_measured, $
;                                   /keyword_field)

;  registry_person=register_resource(registry_person,person_registry, $
;                                    person_registry_index,new_flag)

;  if (new_flag eq 1) then begin

;     for person_loop=0,n_elements(registry_person)-1 do begin

;         registry_person_xml= $
;            write_person(registry_person(person_loop),spase_ontology(816:827), $
;                         spase_xml,index,/blank_check)

;         for line_loop=0,n_elements(registry_person_xml)-1 do $
;             print,registry_person_xml(line_loop)

;         print,''

;      endfor

;  endif

;
;  Process Repository Information
;

;  repository=populate_repository(spase_ontology,resource_info(0),/verbose)

;  repository_xml=write_repository(repository,spase_ontology(870:911), $
;                                  spase_xml,index,/blank_check)

;  for line_loop=0,n_elements(repository_xml)-1 do $
;      print,repository_xml(line_loop)

;  print,''

;  repository_person= $
;     populate_person(spase_ontology,resource_info(0).repository_contact, $
;                     resource_info(0).release_date,/verbose)

;  repository_person=register_resource(repository_person,person_registry, $
;                                      person_registry_index,new_flag)

;  if (new_flag eq 1) then begin

;     for person_loop=0,n_elements(repository_person)-1 do begin

;         repository_person_xml= $
;            write_person(repository_person(person_loop),spase_ontology(816:827), $
;                         spase_xml,index,/blank_check)

;         for line_loop=0,n_elements(repository_person_xml)-1 do $
;             print,repository_person_xml(line_loop)

;         print,''

;     endfor

;  endif

;
;  Process Logical Observatory Information
;

;  acknowledgement= $
;     'Please acknowledge Mark Moldwin, Institute of Geophysics and '+ $
;     'Planetary Physics and the Department of Earth and Space Sciences, '+ $
;     'University of California, Los Angeles, Los Angeles, CA 90095-1567 '+ $
;     'for providing access to '+resource_info.project+' Array data resources.'

;  observatory_logical= $
;     populate_observatory_logical(spase_ontology,resource_info(0), $
;                                  acknowledgement,station_name_list,/verbose)

;  observatory_logical_xml= $
;     write_observatory(observatory_logical,spase_ontology(770:827),spase_xml, $
;                       index,/blank_check)

;  for line_loop=0,n_elements(observatory_logical_xml)-1 do $
;      print,observatory_logical_xml(line_loop)

;  print,''

;  observatory_logical_person=registry_person(n_elements(registry_person)-1)

;  observatory_logical_person= $
;     register_resource(observatory_logical_person,person_registry, $
;                       person_registry_index,new_flag)

;  if (new_flag eq 1) then begin

;     for person_loop=0,n_elements(observatory_logical_person)-1 do begin

;         observatory_logical_person_xml= $
;            write_person(observatory_logical_person(person_loop), $
;                         spase_ontology(816:827),spase_xml,index,/blank_check)

;         for line_loop=0,n_elements(observatory_logical_person_xml)-1 do $
;             print,observatory_logical_person_xml(line_loop)

;         print,''

;     endfor

;  endif

;
;  Process Observatory Information
;

;  observatory=populate_observatory(spase_ontology,station_info,/verbose)

;  observatory_xml=write_observatory(observatory,spase_ontology(770:827), $
;                                    spase_xml,index,/blank_check)

;  for line_loop=0,n_elements(observatory_xml)-1 do $
;      print,observatory_xml(line_loop)

;  print,''

;  observatory_person=populate_person(spase_ontology,station_info.contact, $
;                                     station_info.release_date,/verbose)

;  observatory_person=register_resource(observatory_person,person_registry, $
;                                       person_registry_index,new_flag)

;  if (new_flag eq 1) then begin

;     for person_loop=0,n_elements(observatory_person)-1 do begin

;         if (observatory_person(person_loop).resource_id ne '') then $
;            observatory_person_xml= $
;               write_person(observatory_person(person_loop), $
;                            spase_ontology(816:827),spase_xml,index, $
;                            /blank_check)

;         for line_loop=0,n_elements(observatory_person_xml)-1 do $
;             print,observatory_person_xml(line_loop)

;         print,''

;     endfor

;  endif

;
;  Process Instrument Information
;

;  for instrument_loop=0,n_elements(station_info.instrument)-1 do begin

;      if (station_info.instrument(instrument_loop).type ne '') then begin

;         instrument=populate_instrument(spase_ontology,station_info, $
;                                        resource_info,instrument_loop,/verbose)

;         instrument_xml=write_instrument(instrument,spase_ontology(727:769), $
;                                         spase_xml,index,/blank_check)

;         for line_loop=0,n_elements(instrument_xml)-1 do $
;             print,instrument_xml(line_loop)

;         print,''

;
;         Process Instrument Person Information
;

;         instrument_person= $
;            populate_person(spase_ontology, $
;                            station_info.instrument(instrument_loop).contact, $
;                            station_info.release_date,/verbose)

;         instrument_person= $
;            register_resource(instrument_person,person_registry, $
;                              person_registry_index,new_flag)

;         if (new_flag eq 1) then begin

;            for person_loop=0,n_elements(instrument_person)-1 do begin

;                instrument_person_xml= $
;                   write_person(instrument_person(person_loop), $
;                                spase_ontology(816:827),spase_xml,index, $
;                                /blank_check)

;                for line_loop=0,n_elements(instrument_person_xml)-1 do $
;                    print,instrument_person(line_loop)

;                print,''

;            endfor

;         endif

;      endif

;  endfor

   for resource_loop=0,n_elements(resource_info)-1 do begin

;      search_path=resource_info(resource_loop).search_path_root

;      search_path='/'+string_condition(search_path,'//','/')

;      if (granule_info_harvest_style(resource_loop) eq 'NATIVE_HARVEST') then $
;         begin

;         command='ls -R '+search_path+' | grep '+ $
;                 resource_info(resource_loop).grep_pattern

;         spawn,command,file_listing,error_ls

;         file_num=n_elements(file_listing)

;         if (file_num eq 1 and file_listing(0) eq '') then file_num=0

;      endif else begin

;         ls_list=read_ls(station_info.code,info_dir,ls_exist_flag)

;         if (ls_exist_flag eq 0) then begin

;            file_num=n_elements(ls_list)

;            granule_info_harvest_style(resource_loop)='REMOTE_HARVEST'

;            file_listing=make_array(file_num,/string,value='')

;            for file_loop=0,file_num-1 do begin

;                ls_element=strsplit(ls_list(file_loop),/extract)

;                file_listing(file_loop)=ls_element(8)

;            endfor

;         endif

;      endelse

       file_num=n_elements(granule_info)

       file_num=1 ; 3d MHD KLUGE

       if (file_num gt 0) then begin

;         if (resource_info(resource_loop).type eq 'DATA') then begin

;            name=resource_info(resource_loop).name

;            format_000=strtrim(string(strlen(name)),1)

;            format_001=strtrim(string(30-strlen(name)),1)

;            print,resource_info(resource_loop).name,'   Number of Files:  ', $
;                  file_num,format='(a'+format_000+','+format_001+'x,a,i8/)'

;         endif

;         granule_info_record= $
;            create_struct(name='GRANULE INFO','full_path_file_name','', $
;                          'file_name','','file_name_for_registry','', $
;                          'year','','day_of_year','','month','','day','', $
;                          'start_date','','stop_date','','suffix_check','', $
;                          'size','','hash_value','','error',1)

;         granule_info=replicate(granule_info_record,file_num)

;         for file_loop=0,file_num-1 do begin

;             granule_info_record= $
;                cdaweb_rule_set(resource_info(resource_loop), $
;                                project_program_dir,file_listing(file_loop), $
;                                station_info.code,granule_info_harvest_style)

;             granule_info(file_loop)=granule_info_record

;         endfor

;         good_mask=where(granule_info.error eq 0,good_mask_num)

;         if (good_mask_num gt 0) then begin

;            resource_info(0).time_span_start_date= $
;               granule_info(good_mask(0)).start_date

;            resource_info(0).time_span_stop_date= $
;               granule_info(good_mask(file_num-1)).stop_date

;         endif else begin

;            print,'WARNING:  There are no valid file names so the', $
;                  'WARNING:  Time Span Start Date and Stop Date cannot be '+ $
;                  'set!',format='(2(a/))'

;         endelse

          file_num=n_elements(granule_info)

;
;         Process Numerical Data Information
;

          instrument_num=0

          print,stars,format='(a/)'

          print,'Yataaaaa!!!   populate_numerical_data start',format='(a/)'

          print,stars,format='(a/)'

          numerical_data= $
             populate_numerical_data(spase_ontology,granule_info, $
             resource_info(resource_loop),instrument_num,data_product_name, $
             date_style,data_product_cdf_info,cdf_file_name,access_url, $
             project_program_dir,/verbose,/keyword_stop_date)

          print,stars,format='(a/)'

          print,'Yataaaaa!!!   populate_numerical_data stop',format='(a/)'

          print,stars,format='(a/)'

;
;         Get Master Clean Information
;

          cdaweb_master_notes_file_name=project_program_dir+'cdaweb_master_clean.tab'

          cdaweb_master_notes=read_tab_table(cdaweb_master_notes_file_name,exist_flag,/verbose,/compress)

          numerical_data_parameter_all_file_name=project_program_dir+'numerical_data_parameter_all.tab'

          numerical_data_parameter_all=read_tab_table(numerical_data_parameter_all_file_name,exist_flag,/verbose,/compress)

          data_product_name_mask=where(data_product_name eq numerical_data_parameter_all.table.data_product_name,data_product_name_mask_num)

          data_product_name_upper=strupcase(data_product_name)

          data_product_name_lower=strlowcase(data_product_name)

          data_product_name_upper_mask=where(cdaweb_master_notes.table.data_product_id eq data_product_name_upper)

          if (data_product_name_upper_mask ne -1) then begin

             cdaweb_master_notes=cdaweb_master_notes.table(data_product_name_upper_mask)

             if (cdaweb_master_notes.relative_stop_date eq '') then begin

                numerical_data_xml= $
                   write_numerical_data_custom(numerical_data, $
                      spase_ontology(471:717),resource_info(resource_loop), $
                      spase_xml,index,/keyword_stop_date,/keyword_field, $
                      /blank_check)

             endif else begin

                numerical_data_xml= $
                   write_numerical_data_custom(numerical_data, $
                      spase_ontology(471:717),resource_info(resource_loop), $
                      spase_xml,index,/keyword_relative_stop_date,/keyword_field, $
                      /blank_check)

             endelse          

          endif

;         for line_loop=0L,n_elements(numerical_data_xml)-1L do $
;             print,numerical_data_xml(line_loop)

;         print,''

;         ftp_root_string='ftp://cdaweb.gsfc.nasa.gov/'

;         command='grep '+data_product_name+'_ '+data_dir+'CDAWEB/cdaweb_cdf_file_list.txt | '+ $
;                 'grep "\.cdf"$ | grep -v _00000000_ | '+ $
;                 'grep -v "AUTO-INGEST" | grep -v "\/save\/" | '+ $
;                 'grep -v "pub\/test\/" | grep -v "pub\/test2\/" | sort -k4'

;         spawn,command,data_product_file_name_list,error_grep

;         command='grep -hr '+data_product_name+'_ '+data_dir+ $
;                 'CDAWEB/pub/istp/themis | grep -v ^"#" | sort -k2'

;         command='grep '+data_product_name+'_ FILELIST/filelist | '+ $
;                 'grep "\.cdf"$ | grep -v _00000000_ | '+ $
;                 'grep -v "AUTO-INGEST" | grep -v "\/save\/" | '+ $
;                 'grep -v "pub\/test\/" | grep -v "pub\/test2\/"'

;         spawn,command,data_product_file_name_list,error_grep

;         command='grep '+data_product_name+'_ '+data_dir+'CDAWEB/cdaweb_cdf_file_list.txt | '+ $
;                 'grep "\.cdf"$ | grep -v _00000000_ | '+ $
;                 'grep -v "AUTO-INGEST" | grep -v "\/save\/" | '+ $
;                 'grep -v "pub\/test\/" | grep -v "pub\/test2\/"'+ $
;                 " | awk '{ print $NF }' | sort"

;         spawn,command,data_product_file_name_list_sorted,error_grep

;         command='grep '+data_product_name+' cdaweb_cdf_file_hash_list.txt'+ $
;                 ' | grep -v ^"#"'

;         spawn,command,data_product_file_hash_list,error_grep

;         if (file_num gt 0) then begin

;            granule_info= $
;               cdaweb_granulate_finalize(numerical_data.resource_id,ftp_root_string, $
;                  data_product_file_name_list,data_product_file_hash_list)

;            cadence=numerical_data.temporal_description.cadence

;
;            Process Granule Information
;

;            file_num=n_elements(granule_info)

;            file_num=min([5,file_num])

;            for file_loop=0L,file_num-1L do begin

;                granule=populate_granule(spase_ontology,data_product_name,cadence, $
;                                         granule_info(file_loop),/verbose)

;                granule=populate_granule(spase_ontology, $
;                           resource_info(resource_loop), $
;                           granule_info(file_loop),instrument_num,/verbose)

;                granule=register_resource(granule,granule_registry, $
;                                          granule_registry_index,new_flag)

;                if (new_flag ne 1) then print,'ZZZ Granule Duplicate ZZZ'

;                if (new_flag eq 1) then begin

;                   granule_xml=write_granule(granule,spase_ontology(708:726), $
;                                             spase_xml,index,/blank_check)

;                   for line_loop=0,n_elements(granule_xml)-1 do $
;                       print,granule_xml(line_loop)

;                   print,''

;                endif

;            endfor

;            print,''

;         endif

       endif

   endfor

;ndif

;
;  Close SPASE Form
;

xml_tag_close,spase_ontology(0),spase_xml,index

;or line_loop=0L,n_elements(spase_xml)-1 do print,spase_xml(line_loop)

;rint,''

close,10

station_info=''

print,stars,format='(a/)'

print,'Yataaaaa!!!   cdaweb_spase stop',format='(a/)'

print,stars,format='(a/)'

return,station_info

end

