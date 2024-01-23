
!EXCEPT=2

start_process=systime(1)

stars=strjoin(replicate('*',276))

dashes='+'+strjoin(replicate('-',274))+'+'

project='NASA_AUTHORITY_UPDATE'

project_lower=strlowcase(project)

project_upper=strupcase(project)

print,stars,'Metadata Project:',project,stars,'Processing Start:',systime(),stars,format='(/a//a-19,a//a//a-19,a//a/)'

;
;  Compile IDL Canned Routines
;

.run caldat

;
;  Project Directory Definitions
;

project_directory='/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/VXO/200201'

project_program_directory=project_directory+'/'+project_upper

project_program_name=project_directory+'/'+project_upper+'/'+project_lower

;
;  Compile Project Specific Programs
;

.run /Users/astropooch/Space/PROGRAMS/HARVEST/GENERAL/read_ascii

.run /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/VXO/200201/NASA_AUTHORITY_UPDATE/nasa_authority_update

.run /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/VXO/200201/NASA_AUTHORITY_UPDATE/spase_xml_tab

;
;  Get the Date for setting Directory and File Name Defintions and for defining ISO8601_DATE_TIME
;

caldat,systime(/julian),month,day,year,hour,minute,second

date_string_file_name=string(year,format='(i4.4)')+'-'+string(month,format='(i2.2)')+'-'+string(day,format='(i2.2)')

date_string_directory=string(year,format='(i4.4)')+string(month,format='(i2.2)')+string(day,format='(i2.2)')

time_string=string(hour,format='(i2.2)')+':'+string(minute,format='(i2.2)')+':'+string(second,format='(i2.2)')

iso8601_date_time=date_string_file_name+'T'+time_string

;
;  Project LOG and OUTPUT Directory Definitions and Project LOG File Name Definition
;

project_log_directory=project_program_directory+'/'+'LOG'

project_output_directory=project_program_directory+'/'+'OUTPUT_'+date_string_directory

project_log_file_name=project_log_directory+'/'+project_lower+'_'+date_string_file_name+'t'+time_string+'.log'

print,stars,'Project Directory:',project_directory,'Project Program Directory:',project_program_directory, $
      'Project Log Directory:',project_log_directory,'Project Log File Name:',project_log_file_name, $
      'Project Output Directory:',project_output_directory,stars,format='(/a//a-28,a//a-28,a//a-28,a//a-28,a//a-28,a//a/)'

openw,20,project_log_file_name

printf,20,stars,'BASH Script:',project_upper,'Processing Start:',systime(),stars,format='(/a//a-19,a//a-19,a//a/)'

nasa_authority_update,iso8601_date_time,project_lower,project_program_directory,project_log_directory,project_log_file_name,project_output_directory

stop_process=systime(1)

elapsed_time=stop_process-start_process

print,stars,'Processing Stop:',systime(),'Processing Time:',elapsed_time,' sec',stars,format='(/a//a-19,a//a-19,f9.3,a//a/)'

printf,20,stars,'Processing Stop:',systime(),'Processing Time:',elapsed_time,' sec',stars,format='(/a//a-19,a//a-19,f9.3,a//a/)'

close,20

exit

