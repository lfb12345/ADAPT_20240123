
pro nasa_authority_update,iso8601_date_time,project_lower,project_program_directory,project_log_directory,project_log_file_name,project_output_directory

dashes='+'+strjoin(replicate('-',274))+'+'

hashes=strjoin(replicate('#',276))

stars=strjoin(replicate('*',276))

printf,20,hashes,'Yataaaaa!!!   '+project_lower+' start',hashes,format='(a//a//a/)'

;
;*******************************************************************************
;

printf,20,'Project Program Directory:  ',project_program_directory, $
          'Project Log Directory:      ',project_log_directory, $
          'Project Log File Name:      ',project_log_directory, $
          'Project Output Directory:   ',project_output_directory, $
          hashes,format='(a-28,a//a-28,a//a-28,a//a-28,a//a/)'

xml_file_name='/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/VXO/200201/SMWG/Person/Lee.Frost.Bargatze.xml'

printf,20,dashes,format='(a/)'

xml_text=read_ascii(xml_file_name,'XML')

printf,20,dashes,format='(a/)'

for loop=0,n_elements(xml_text)-1 do printf,20,strtrim(xml_text(loop),2)

printf,20,dashes,format='(/a/)'

container_name_list=spase_xml_tab(xml_text)

printf,20,container_name_list

printf,20,''

;
;*******************************************************************************
;

printf,20,hashes,'Yataaaaa!!!   '+project_lower+' stop',hashes,  format='(a//a//a/)'

end

