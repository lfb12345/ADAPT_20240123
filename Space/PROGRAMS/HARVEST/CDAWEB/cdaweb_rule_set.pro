
function cdaweb_rule_set,resource_info,project_program_dir,file_name, $
                         station_code,granule_info_harvest_style,verbose=verbose

granule_info= $
   create_struct(name='GRANULE INFO','full_path_file_name','','file_name','', $
                 'file_name_for_registry','','year','','day_of_year','', $
                 'month','','day','','start_date','','stop_date','', $
                 'suffix_check','','size','','hash_value','','error',1)

if (granule_info_harvest_style eq 'NATIVE_HARVEST') then begin

   command='find '+resource_info.search_path_root+' -iname '+file_name

endif else begin

   full_path_file_name= $
      project_program_dir+'INFO/'+strlowcase(station_code)+'_ls_list.txt'

   command='grep "'+file_name+'" '+full_path_file_name

endelse

spawn,command,file_listing,error_file_listing

file_num=n_elements(full_path_file_name)

if (error_file_listing eq '') then begin

   if (n_elements(file_listing) gt 1) then print,file_listing

   ls_element=strsplit(file_listing(0),/extract)

   full_path_file_name=ls_element(8)

   granule_info.size=ls_element(4)

   if (file_num gt 1) then begin

      for file=0,file_num-1 do $
          print,'DUPLICATE:  ',file_num,full_path_file_name(file)

      print,''

   endif

   for file=0,file_num-1 do begin

       granule_info.full_path_file_name=full_path_file_name(file)

       sub_path_file_name=strmid(full_path_file_name(file), $
                                 strlen(resource_info.search_path_root)+1, $
                                 strlen(full_path_file_name(file))-1)

       slash_position=string_position(sub_path_file_name,'/')

       slash_position_num=n_elements(slash_position)

       path_node=make_array(resource_info.dir_depth_num+1,/string)

       if (slash_position_num eq resource_info.dir_depth_num) then begin

          path_node(0)=strmid(sub_path_file_name,0,slash_position(0))

          path_node(resource_info.dir_depth_num)= $
             strmid(sub_path_file_name,slash_position(0)+1, $
                    strlen(sub_path_file_name)-slash_position(0)-1)

;
;         Project Specific Rule Sets
;

          two_digit_year=strmid(path_node(resource_info.dir_depth_num),5,2)

          if (strmid(two_digit_year,0,1) eq '9') then begin

             granule_info.year='19'+two_digit_year

          endif else begin

             granule_info.year='20'+two_digit_year

          endelse

          granule_info.day_of_year= $
             strmid(path_node(resource_info.dir_depth_num),7,3)

          caldat,julday(1,granule_info.day_of_year,granule_info.year)-0.5, $
                 month,day,year

          granule_info.month=month

          granule_info.day=day

          dot_position= $
             string_position(path_node(resource_info.dir_depth_num),'.')

          dot_position_first=dot_position(0)

          wrong_string_length=0

          if (dot_position_first ne resource_info.dot_position and $
              keyword_set(verbose)) then begin

             print,'XXXXX Wrong String Length XXXXX',dot_position_first, $
                   resource_info.dot_position,format='(a,2i3)'

             print,'XXXXX Wrong String Length XXXXX '+ $
                   path_node(resource_info.dir_depth_num),format='(a/)'

             wrong_string_length=1

          endif

          dot_position_last=dot_position(n_elements(dot_position)-1)

          granule_info.suffix_check= $
             strmid(path_node(resource_info.dir_depth_num), $
                    dot_position_last+1, $
                    strlen(sub_path_file_name)-dot_position_last-1)

          granule_info.file_name_for_registry= $
             path_node(resource_info.dir_depth_num)

          if (granule_info.suffix_check eq 'gz') then $
             granule_info.file_name_for_registry= $
                strmid(granule_info.file_name_for_registry,0, $
                       strlen(granule_info.file_name_for_registry)-3)

;         year_position=string_position(sub_path_file_name,granule_info.year)

;         if (n_elements(year_position) ne 2) then $
;            print,'^^^^^ Year String Match Count ^^^^^  '+sub_path_file_name, $
;                  format='(a/)'

;         year_position=year_position(1)

;         month_string=strmid(sub_path_file_name,year_position+5,2)

          if (wrong_string_length eq 0) then begin

             granule_info.error=0

;
;            Calculate Start and Stop Dates
;

             date=granule_info.year+'-'+ $
                  string(granule_info.month,format='(i2.2)')+'-'+ $
                  string(granule_info.day,format='(i2.2)')

             granule_info.start_date=date+'T00:00:00.000'

             granule_info.stop_date=date+'T23:59:59.000'

             if (granule_info_harvest_style eq 'NATIVE_HARVEST') then begin

                command='md5 '+file_name

             endif else begin

                md5_file_name=project_program_dir+'INFO/'+ $
                              strlowcase(station_code)+'_md5_list.txt'

                command='grep "'+file_name+'" '+md5_file_name

             endelse

             spawn,command,md5_listing,error_md5

             if (error_md5 eq '') then begin

                md5_element=strsplit(md5_listing(file),/extract)

                granule_info.hash_value=md5_element(n_elements(md5_element)-1)

             endif

          endif

       endif

   endfor

endif

return,granule_info

end

