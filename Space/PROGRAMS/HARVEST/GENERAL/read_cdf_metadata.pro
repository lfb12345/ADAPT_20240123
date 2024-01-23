
function read_cdf_metadata,cdf_file_name

stars=strjoin(replicate('*',275))

dashes='+'+strjoin(replicate('-',273))+'+'

split=strsplit(cdf_file_name,'.',/extract)

split_num=n_elements(split)

cdf_file_name=strjoin(split(0:split_num-2),".")+'.cdf'

output_file=strjoin(split(0:split_num-2),".")+'.txt'

openw,70,output_file

printf,70,dashes,format='(/a/)'

;
;    Create the CDF metadata file
;

metadata_file_name=strjoin(split(0:split_num-2),".")+'.metadata'

home_directory=getenv('HOME_DIR')

cdf_directory=getenv('CDF_DIR')

command=cdf_directory+'/cdfdump -dump metadata '+cdf_file_name+' | sed -f '+home_directory+'/Space/PROGRAMS/HARVEST/CDAWEB/fix_cntl_m.sed > '+metadata_file_name

command=cdf_directory+'/cdfdump -dump metadata -output '+metadata_file_name+' '+cdf_file_name

;f (cdf_file_name ne '/Users/astropooch/Space/DATA/CDAWEB/MASTERS/CDF_MGET/po_h2_tim_00000000_v01.cdf' and $
;   cdf_file_name ne '/Users/astropooch/Space/DATA/CDAWEB/MASTERS/CDF_MGET/tha_l1_scmode_00000000_v01.cdf' and $
;   cdf_file_name ne '/Users/astropooch/Space/DATA/CDAWEB/MASTERS/CDF_MASTERLESS_SAMURAI/apollo12_pdssws_1hr_00000000_v01.cdf') then $
;  spawn,command,spawn_output,spawn_error

command='sed -f '+home_directory+'/Space/PROGRAMS/HARVEST/CDAWEB/fix_cntl_m.sed '+metadata_file_name

spawn,command,spawn_output,spawn_error

command='echo '+cdf_file_name+" | sed 's/^.*\///' | sed 's/_[0-2][09][0-9][0-9].*\.cdf$//'"

spawn,command,spawn_output,spawn_error

data_product_id=spawn_output

print,dashes,format='(a/)'

ascii_text=read_ascii(metadata_file_name,'Metadata ',exist_flag)

help,ascii_text

print,dashes,format='(a/)'

ascii_text_num=n_elements(ascii_text)

equal_sign_mask=where(strpos(ascii_text,'=====') eq 0,equal_sign_mask_num)

;
;    Start parsing information from the CDF metadata file
;

for loop=1,equal_sign_mask_num-1 do $
    print,ascii_text(equal_sign_mask(loop)-1),format='(a/)'

split=strsplit(ascii_text(equal_sign_mask(1)-1),/extract)

global_attribute_num=strmid(split(2),1,strlen(split(2))-1)

loop_offset=equal_sign_mask(1)+1

loop_num=equal_sign_mask(2)-equal_sign_mask(1)-3

global_attribute_count=0

global_attribute_list_temp_record=create_struct('name','','record_num',0)

global_attribute_list_temp= $
   replicate(global_attribute_list_temp_record,global_attribute_num)

for loop=loop_offset,loop_offset+loop_num do begin

    if (ascii_text(loop) ne '') then begin

;      print,'ASCII Text:'+string(9B)+strtrim(string(loop))+string(9B)+ascii_text(loop)

       if (strmid(ascii_text(loop),0,1) ne string(9B)) then begin

;         print,'OOPS:	'+ascii_text(loop)

          split=strsplit(ascii_text(loop),/extract)

          global_attribute_list_temp(global_attribute_count).name=split(0)

          if (n_elements(split) eq 5) then $
             global_attribute_list_temp(global_attribute_count).name= $
                split(0)+' '+split(1)

          global_attribute_list_temp(global_attribute_count).record_num= $
                strmid(split(n_elements(split)-2),1, $
                strlen(split(n_elements(split)-2))-1)

          global_attribute_count=global_attribute_count+1

       endif

    endif

endfor

max_record_num=max(global_attribute_list_temp.record_num)

attribute_record=create_struct('record_num',0,'type','','char_num',0,'text','')

global_attribute_list_record= $
   create_struct('name','','record_num',0, $
                 'attribute',replicate(attribute_record,max_record_num))

global_attribute_list= $
   replicate(global_attribute_list_record,global_attribute_num)

loop_offset=2

printf,70,'Global Attribute Num:  '+global_attribute_num,format='(a/)'

for loop=0,global_attribute_num-1 do begin

    global_attribute_list(loop).name=global_attribute_list_temp(loop).name

    global_attribute_list(loop).record_num= $
       global_attribute_list_temp(loop).record_num

    printf,70,global_attribute_list(loop).name, $
              global_attribute_list(loop).record_num,format='(a30,5x,a30)'

    for record_loop=0,global_attribute_list(loop).record_num-1 do begin

        split=strsplit(ascii_text(equal_sign_mask(1)+record_loop+loop_offset), $
                       ' ',/extract)

        global_attribute_list(loop).attribute(record_loop).record_num=split(0)

        slash_position=strpos(split(1),'/')

        global_attribute_list(loop).attribute(record_loop).type= $
           strmid(split(1),1,slash_position-1)

        global_attribute_list(loop).attribute(record_loop).char_num= $
           strmid(split(1),slash_position+1,strlen(split(1))-slash_position-3)

        split=strsplit(ascii_text(equal_sign_mask(1)+record_loop+loop_offset), $
                       string(9B),/extract)

        split_num=n_elements(split)

;       split=strsplit(split(split_num-1),'"',/extract)

;       global_attribute_list(loop).attribute(record_loop).text=split(0)

        global_attribute_list(loop).attribute(record_loop).text=strtrim(split(split_num-1),2)

    endfor

    loop_offset=loop_offset+global_attribute_list(loop).record_num+1

endfor

printf,70,''

for loop=0,global_attribute_num-1 do begin

    printf,70,global_attribute_list(loop).name, $
              global_attribute_list(loop).record_num,format='(a30,5x,a30)'

    for record_loop=0,global_attribute_list(loop).record_num-1 do begin

        printf,70,global_attribute_list(loop).attribute(record_loop).record_num, $
                  global_attribute_list(loop).attribute(record_loop).type, $
                  global_attribute_list(loop).attribute(record_loop).char_num, $
                  global_attribute_list(loop).attribute(record_loop).text, $
                  format='(a36,x,a12,x,a5,x,a)'

    endfor

    printf,70,''

endfor

printf,70,'Maximum Record Num:      '+strtrim(string(max_record_num),2), $
          format='(a/)'

split=strsplit(ascii_text(equal_sign_mask(2)-1),/extract)

variable_attribute_num=strmid(split(2),1,strlen(split(2))-1)

variable_attribute_list=make_array(variable_attribute_num,/string,value='')

printf,70,'Variable Attribute Num:   '+variable_attribute_num,format='(a/)'

loop_offset=equal_sign_mask(2)+1

for loop=loop_offset,loop_offset+variable_attribute_num-1 do begin

    index=loop-loop_offset

    variable_attribute_split=strsplit(strtrim(ascii_text(loop),2),/extract)

    variable_attribute_list(index)=variable_attribute_split(0)

    if (variable_attribute_list(index) eq 'FUNCTION') then $
       variable_attribute_list(index)='FUNCXION'

    printf,70,'Variable Attribute List:  ',variable_attribute_list(index)

endfor

printf,70,''

attribute_record= $
   create_struct('name','','data_type','','data_bytes','','text','','metadata','','dict_key','')

guts=strjoin("'"+strlowcase(variable_attribute_list)+"',attribute_record,")

guts=strmid(guts,0,strlen(guts)-1)

command='attribute_list_record=create_struct('+guts+')'

execute_result=execute(command)

attribute_list=attribute_list_record

split=strsplit(ascii_text(equal_sign_mask(3)-1),/extract)

r_variable_num=string_condition(split(2),'(','')

z_variable_num=string_condition(split(4),'(','')

total_variable_num=strtrim(string(fix(r_variable_num)+fix(z_variable_num)),2)

split=strsplit(ascii_text(equal_sign_mask(4)-1),/extract)

variable_num=strmid(split(1),1,strlen(split(1))-1)

print,'R Variable Num:      ',r_variable_num,format='(a,a5/)'

print,'Z Variable Num:      ',z_variable_num,format='(a,a5/)'

print,'Total Variable Num:  ',total_variable_num,format='(a,a5/)'

print,'Variable Num:        ',variable_num,format='(a,a5/)'

printf,70,'R Variable Num:      ',r_variable_num,format='(a,a5/)'

printf,70,'Z Variable Num:      ',z_variable_num,format='(a,a5/)'

printf,70,'Total Variable Num:  ',total_variable_num,format='(a,a5/)'

printf,70,'Variable Num:        ',variable_num,format='(a,a5/)'

variable_list_record= $
   create_struct('name','','type','','type_num','','structure','', $
                 'data_type_flag','','attribute',attribute_list)

variable_list=replicate(variable_list_record,variable_num)

loop_offset=equal_sign_mask(3)+1

for loop=loop_offset,loop_offset+variable_num-1 do begin

    index=loop-loop_offset

    split=strtrim(strsplit(ascii_text(loop),/extract),2)

    split_mask=indgen(n_elements(split)-3)

    temp_text=strjoin(split(split_mask)+' ')

    variable_list(index).name=strmid(temp_text,0,strlen(temp_text)-1)

    sub_split=strtrim(strsplit(split(n_elements(split)-3),'/',/extract))

    variable_list(index).type=sub_split(0)

    variable_list(index).type_num=sub_split(1)

    variable_list(index).structure=strtrim(split(2),2)

    variable_list(index).data_type_flag=split(3)

;   print,ascii_text(loop)

    printf,70,variable_list(index).name,' ',variable_list(index).type,' ', $
              variable_list(index).type_num,' ', $
              variable_list(index).structure,' ', $
              variable_list(index).data_type_flag

endfor

;rint,''

printf,70,''

dash_mask=where(strpos(ascii_text,'-') eq 0,dash_mask_num)

no_space_mask=where(strpos(ascii_text(dash_mask),' ') eq -1,no_space_mask_num)

dash_mask=dash_mask(no_space_mask)

dash_mask_num=no_space_mask_num

for loop=0,dash_mask_num-1 do begin

    printf,70,ascii_text(dash_mask(loop)-1)

    printf,70,ascii_text(dash_mask(loop))

    if (loop lt dash_mask_num-1) then begin

       loop_num=dash_mask(loop+1)-dash_mask(loop)-4

    endif else begin

       loop_num=ascii_text_num-dash_mask(loop)-3

    endelse

    loop_offset=dash_mask(loop)+2

    for attribute_loop=loop_offset,loop_offset+loop_num-1 do begin

        if (ascii_text(attribute_loop) ne '') then begin

           split=strsplit(ascii_text(attribute_loop),/extract)

           attribute_name=strlowcase(split(0))

           if (attribute_name eq 'function') then attribute_name='funcxion'

           sub_split=strsplit(split(1),'/',/extract)

           attribute_data_type=strmid(sub_split(0),1,strlen(sub_split(0))-1)

           attribute_data_bytes=strmid(sub_split(1),0,strlen(sub_split(1))-2)

           split=strtrim(strsplit(ascii_text(attribute_loop),'):',/extract,/regex),2)

           split_num=n_elements(split)

           attribute_text=strtrim(string_condition(strjoin(split(1:split_num-1),'):'),'"',''),2)

           command='variable_list(loop).attribute.'+attribute_name+ $
                   '.name=attribute_name'

           execute_result=execute(command)

           command='variable_list(loop).attribute.'+attribute_name+ $
                   '.data_type=attribute_data_type'

           execute_result=execute(command)

           command='variable_list(loop).attribute.'+attribute_name+ $
                   '.data_bytes=attribute_data_bytes'

           execute_result=execute(command)

           command='variable_list(loop).attribute.'+attribute_name+ $
                   '.text=attribute_text'

           execute_result=execute(command)

;          command='printf,70,variable_list(loop).attribute.'+attribute_name

           command='printf,70,variable_list(loop).attribute.'+attribute_name+'.name+string(9B)+'+ $
                             'variable_list(loop).attribute.'+attribute_name+'.data_type+string(9B)+'+ $
                             'variable_list(loop).attribute.'+attribute_name+'.data_bytes+string(9B)+'+ $
                             'variable_list(loop).attribute.'+attribute_name+'.text'

           execute_result=execute(command)

;          printf,70,'Execute Result:  '+strtrim(string(execute_result),2)

        endif

    endfor

endfor

metadata_variable_mask=where(strmid(variable_list.data_type_flag,0,1) eq 'F', $
                             metadata_variable_mask_num)

data_variable_mask= $
   where(strmid(variable_list.data_type_flag,0,1) eq 'T',data_variable_mask_num)

if (metadata_variable_mask_num gt 0) then begin

   metadata_text=make_array(metadata_variable_mask_num,/string,value='')

   dict_key_text=make_array(metadata_variable_mask_num,/string,value='')

   printf,70,stars,format='(a/)'

   printf,70,'Metadata Variable Text:',format='(a/)'

   printf,70,stars,format='(a/)'

   for loop=0,metadata_variable_mask_num-1 do begin

       print,'Variable Name:  '+variable_list(metadata_variable_mask(loop)).name

       command=cdf_directory+'/cdfdump -vars '+variable_list(metadata_variable_mask(loop)).name+' '+cdf_file_name

       command=string_condition(command,'(','\(')

       command=string_condition(command,')','\)')

       spawn,command,cdf_dump_text,cdf_dump_error

       if (strmid(cdf_dump_text(2),0,26) eq 'NOT_A_CDF_OR_NOT_SUPPORTED') then $
          begin

          print,'Warning:  NOT_A_CDF_OR_NOT_SUPPORTED  '+cdf_file_name

          printf,70,'Warning:  NOT_A_CDF_OR_NOT_SUPPORTED  '+cdf_file_name

       endif

       if (strmid(cdf_dump_text(2),0,26) ne 'NOT_A_CDF_OR_NOT_SUPPORTED' and $
           cdf_dump_text(n_elements(cdf_dump_text)-2) ne 'Variable Data:' and $
           cdf_dump_text(n_elements(cdf_dump_text)-2) ne '') then begin

          split= $
             strtrim(strsplit(cdf_dump_text(n_elements(cdf_dump_text)-2),':', $
                              /extract,/regex),2)

          print,'CDF Dump Check: ',cdf_dump_text(n_elements(cdf_dump_text)-2)

          split_num=n_elements(split)

          metadata_text(loop)=strjoin(split(1:split_num-1),':')

          test=0

          while(test eq 0) do begin

               position=strpos(metadata_text(loop),' "')

               if (position eq -1) then begin

                  test=1

               endif else begin

                  prefix=strmid(metadata_text(loop),0,position)

                  suffix=strmid(metadata_text(loop),position+1, $
                                strlen(metadata_text(loop))-position)

                  metadata_text(loop)=prefix+suffix

               endelse

          endwhile

          dict_key_mask=where(strmid(cdf_dump_text,0,30) eq '     DICT_KEY        (CDF_CHAR',dict_key_mask_num)

          if (dict_key_mask_num eq 1) then begin

             split=strsplit(cdf_dump_text(dict_key_mask),'"',/extract)

             dict_key_text(loop)=strtrim(split(1),2)

          endif

;         metadata_text(loop)=string_condition(metadata_text(loop),'"',"'")

;         metadata_text(loop)=string_condition(metadata_text(loop),'"','')

;         metadata_text(loop)=strtrim(metadata_text(loop),2)

          printf,70,variable_list(metadata_variable_mask(loop)).name, $
                    metadata_text(loop),format='(a-50,a)'

          for variable_loop=0,data_variable_mask_num-1 do begin

              for variable_attribute_loop=0,variable_attribute_num-1 do begin

                  metadata_match_mask= $
                     where(variable_list(metadata_variable_mask(loop)).name eq $
                           variable_list(data_variable_mask(variable_loop)).attribute.(variable_attribute_loop).text, $
                           metadata_match_mask_num)

                  if (metadata_match_mask_num gt 0) then begin

                     variable_list(data_variable_mask(variable_loop)).attribute.(variable_attribute_loop).metadata= $
                        metadata_text(loop)

                     variable_list(data_variable_mask(variable_loop)).attribute.(variable_attribute_loop).dict_key= $
                        dict_key_text(loop)

                  endif

              endfor

          endfor

       endif

   endfor

endif

printf,70,stars,format='(/a/)'

printf,70,'Final Variable Attribute Details:',format='(a/)'

printf,70,stars,format='(a/)'

printf,70,dashes,format='(a/)'

for loop=0,variable_num-1 do begin

    printf,70,variable_list(loop).name, $
              strjoin(replicate('-',strlen(variable_list(loop).name))), $
              format='(a/a/)'

    printf,70,variable_list(loop)

    printf,70,dashes,format='(/a/)'

endfor

print,dashes,format='(a/)'

resource_info=create_struct('global_attribute_info',global_attribute_list, $
                            'variable_attribute_info',variable_attribute_list, $
                            'variable_info',variable_list)

for loop=0,global_attribute_num-1 do begin

    if (resource_info.global_attribute_info(loop).record_num eq 0) then $
       print,resource_info.global_attribute_info(loop).name, $
             resource_info.global_attribute_info(loop).record_num, $
             resource_info.global_attribute_info(loop).attribute(0), $
             format='(a-50,i3,3x,i2.2,3x,a-12,3x,a-12,a)'

    for sub_loop=0,resource_info.global_attribute_info(loop).record_num-1 do $
        begin

        blank_test= $
           spase_model_blank_check(resource_info.global_attribute_info(loop).attribute(sub_loop))

        if (blank_test ne '') then begin $

           text=resource_info.global_attribute_info(loop).attribute(sub_loop).text

;          error_fix=fix_invalid_xml_characters(text)

           resource_info.global_attribute_info(loop).attribute(sub_loop).text=text

           print,resource_info.global_attribute_info(loop).name, $
                 resource_info.global_attribute_info(loop).record_num, $
                 resource_info.global_attribute_info(loop).attribute(sub_loop), $
                 format='(a-50,i3,3x,i2.2,3x,a-12,3x,a-12,a)'

        endif

    endfor

    print,''

endfor

print,dashes,format='(a/)'

for loop=0,variable_attribute_num-1 do $
    print,resource_info.variable_attribute_info(loop)

print,dashes,format='(/a/)'

for loop=0,variable_num-1 do begin

    for sub_loop=0,variable_attribute_num-1 do begin

        blank_test= $
          spase_model_blank_check(resource_info.variable_info(loop).attribute.(sub_loop))

        if (blank_test ne '') then begin

           text=resource_info.variable_info(loop).attribute.(sub_loop).text

           if (resource_info.variable_info(loop).attribute.(sub_loop).name ne 'units') then begin

              error_fix=fix_invalid_xml_characters(text)

           endif else begin

              command='echo "'+text+'" | sed -f '+home_directory+'/Space/PROGRAMS/HARVEST/CDAWEB/variable_attribute_units.sed'

              spawn,command,text,error

           endelse

           resource_info.variable_info(loop).attribute.(sub_loop).text=text

           print,resource_info.variable_info(loop).name, $
                 resource_info.variable_info(loop).type, $
                 resource_info.variable_info(loop).type_num, $
                 resource_info.variable_info(loop).structure, $
                 resource_info.variable_info(loop).data_type_flag, $
                 resource_info.variable_info(loop).attribute.(sub_loop), $
                 format='(a-50,3x,4a-12,a-25,3x,a-12,3x,a-25,3x,a,3x,a,3x,a)'

        endif

    endfor

    print,''

endfor

print,dashes,format='(a/)'

variable_attribute_superset_list=variable_attribute_superset(data_product_id,variable_attribute_list)

command="variable_attribute_superset_list_record=create_struct('"+strjoin(strlowcase(variable_attribute_superset_list),"','','")+"','')"

print,command,dashes,format='(a//a/)'

execute_result=execute(command)

numerical_data_param_table_column_list= $
   ['cdf_metadata_type','character_num','dimension','cdf_variable_type','OOOOO','data_product_name','parameter_key','units','units_conversion', $
    'name','description','measurement_type','parameter_keyword','type','quantity','qualifier','instrument_id_000','instrument_id_001', $
    'coordinate_system_name','coordinate_representation','element__name_0','element__name_1','element__name_2','element__name_3']

short_list=['cdf_metadata_type','character_num','dimension','cdf_variable_type','OOOOO','data_product_name','parameter_key']

variable_attribute_superset_list_record_exist_num=isa(variable_attribute_superset_list_record)

if (variable_attribute_superset_list_record_exist_num eq 1B) then begin

   printf,70,'Astro'+string(9B)+strjoin(numerical_data_param_table_column_list,string(9B)),format='(a/)'

   printf,70,'ASTRO'+string(9B)+strjoin(short_list,string(9B))+string(9B)+strjoin(variable_attribute_superset_list,string(9B)),format='(a/)'

   variable_attribute_superset_table=replicate(variable_attribute_superset_list_record,variable_num)

   for loop=0,variable_num-1 do begin

       units=''

       units_conversion=''

       name=''

       description=''

       measurement_type=''

       parameter_keyword=''

       type=''

       quantity=''

       qualifier=''

       instrument_id_000=''

       instrument_id_001=''

       coordinate_system_name=''

       coordinate_representation=''

       element__name_0=''

       element__name_1=''

       element__name_2=''

       element__name_3=''

       if (resource_info.variable_info(loop).type eq '') then begin

          parameter_keyword='Support'

          quantity='Temporal'

       endif

       for sub_loop=0,variable_attribute_num-1 do begin

           if (strlowcase(resource_info.variable_info(loop).attribute.(sub_loop).name) eq 'units') then units=resource_info.variable_info(loop).attribute.(sub_loop).text

           if (strlowcase(resource_info.variable_info(loop).attribute.(sub_loop).name) eq 'units_conversion') then units_conversion=resource_info.variable_info(loop).attribute.(sub_loop).text

           if (strlowcase(resource_info.variable_info(loop).attribute.(sub_loop).name) eq 'si_conversion') then units_conversion=resource_info.variable_info(loop).attribute.(sub_loop).text

           if (strlowcase(resource_info.variable_info(loop).attribute.(sub_loop).name) eq 'fieldnam') then name=resource_info.variable_info(loop).attribute.(sub_loop).text

           if (strlowcase(resource_info.variable_info(loop).attribute.(sub_loop).name) eq 'catdesc') then description=resource_info.variable_info(loop).attribute.(sub_loop).text

           if (strlowcase(resource_info.variable_info(loop).attribute.(sub_loop).name) eq 'var_type') then parameter_keyword=resource_info.variable_info(loop).attribute.(sub_loop).text

           info_name=string(9B)+resource_info.variable_info(loop).attribute.(sub_loop).name

           info_data_type=string(9B)+resource_info.variable_info(loop).attribute.(sub_loop).data_type

           info_data_bytes=string(9B)+resource_info.variable_info(loop).attribute.(sub_loop).data_bytes

           info_text=string(9B)+resource_info.variable_info(loop).attribute.(sub_loop).text

           info_metadata=string(9B)+resource_info.variable_info(loop).attribute.(sub_loop).metadata

           info_dict_key=string(9B)+resource_info.variable_info(loop).attribute.(sub_loop).dict_key

       endfor

       if (resource_info.variable_info(loop).type eq '') then begin

          parameter_keyword='Support'

          quantity='Temporal'

       endif

       printf,70,'Astro'+string(9B)+ $
             resource_info.variable_info(loop).type+string(9B)+ $
             resource_info.variable_info(loop).type_num+string(9B)+ $
             resource_info.variable_info(loop).structure+string(9B)+ $
             resource_info.variable_info(loop).data_type_flag+string(9B)+ $
             'OOOOO'+string(9B)+data_product_id+string(9B)+ $
             resource_info.variable_info(loop).name+string(9B)+ $
             units+string(9B)+units_conversion+string(9B)+name+string(9B)+ $
             description+string(9B)+measurement_type+string(9B)+ $
             parameter_keyword+string(9B)+type+string(9B)+quantity+string(9B)+ $
             qualifier+string(9B)+instrument_id_000+string(9B)+ $
             instrument_id_001+string(9B)+coordinate_system_name+string(9B)+ $
             coordinate_representation+string(9B)+element__name_0+string(9B)+ $
             element__name_1+string(9B)+element__name_2+string(9B)+ $
             element__name_3,format='(a/)'

       variable_attribute_superset_list_num=n_elements(variable_attribute_superset_list)

       content='ASTRO'+string(9B)+ $
               resource_info.variable_info(loop).type+string(9B)+ $
               resource_info.variable_info(loop).type_num+string(9B)+ $
               resource_info.variable_info(loop).structure+string(9B)+ $
               resource_info.variable_info(loop).data_type_flag+string(9B)+ $
               'OOOOO'+string(9B)+data_product_id+string(9B)+ $
               resource_info.variable_info(loop).name

       for sub_loop=0,variable_attribute_superset_list_num-1 do begin

           match_mask=where(strlowcase(variable_attribute_list) eq strlowcase(variable_attribute_superset_list(sub_loop)),match_mask_num)

           if (match_mask_num eq 1) then begin

              if (strlowcase(resource_info.variable_info(loop).attribute.(match_mask).name) eq 'units') then units=resource_info.variable_info(loop).attribute.(match_mask).text

              if (strlowcase(resource_info.variable_info(loop).attribute.(match_mask).name) eq 'units_conversion') then units_conversion=resource_info.variable_info(loop).attribute.(match_mask).text

              if (strlowcase(resource_info.variable_info(loop).attribute.(match_mask).name) eq 'si_conversion') then units_conversion=resource_info.variable_info(loop).attribute.(match_mask).text

              if (strlowcase(resource_info.variable_info(loop).attribute.(match_mask).name) eq 'fieldnam') then name=resource_info.variable_info(loop).attribute.(match_mask).text

              if (strlowcase(resource_info.variable_info(loop).attribute.(match_mask).name) eq 'catdesc') then description=resource_info.variable_info(loop).attribute.(match_mask).text

              if (strlowcase(resource_info.variable_info(loop).attribute.(match_mask).name) eq 'var_type') then parameter_keyword=resource_info.variable_info(loop).attribute.(match_mask).text

              info_name=string(9B)+resource_info.variable_info(loop).attribute.(match_mask).name

              info_data_type=string(9B)+resource_info.variable_info(loop).attribute.(match_mask).data_type

              info_data_bytes=string(9B)+resource_info.variable_info(loop).attribute.(match_mask).data_bytes

              info_text=string(9B)+resource_info.variable_info(loop).attribute.(match_mask).text

              info_metadata=string(9B)+resource_info.variable_info(loop).attribute.(match_mask).metadata

              info_dict_key=string(9B)+resource_info.variable_info(loop).attribute.(match_mask).dict_key

              content=content+info_text

           endif else begin

              content=content+string(9B)

           endelse

       endfor

       printf,70,content

   endfor

endif

printf,70,dashes,format='(/a/)'

close,70

print,stars,format='(a/)'

return,resource_info

end

;
;   data_product_name	parameter_key	units	units_conversion	name	description	measurement_type	parameter_keyword	type	quantity	qualifier	instrument_id_000	instrument_id_001	coordinate_system_name	coordinate_representation	element__name_0	element__name_1	element__name_2	element__name_3
;

