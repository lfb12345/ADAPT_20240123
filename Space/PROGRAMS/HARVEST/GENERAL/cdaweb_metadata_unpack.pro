
function cdaweb_metadata_unpack,cdaweb_metadata,size,cdaweb_metadata_variable

command='metadata='+cdaweb_metadata

if (cdaweb_metadata ne '') then begin

   command_error=execute(command)

   if (command_error eq 1) then begin

      metadata_num=n_elements(metadata)

      for loop=0,metadata_num-1 do begin

          metadata(loop)=strtrim(metadata(loop),2)

;         metadata(loop)=string_condition(metadata(loop),'(','')

;         metadata(loop)=string_condition(metadata(loop),')','')

          metadata(loop)=string_condition(metadata(loop),',',', ')

          metadata(loop)=string_condition(metadata(loop),'  ',' ')

          metadata(loop)=string_condition(metadata(loop),'@Ú¿_ÿ','""')

      endfor

      mask=where(metadata ne '',metadata_num)

      if (metadata_num ne -1) then metadata=metadata(mask)

      if (metadata_num eq 1) then metadata=make_array(size,/string,value=metadata)

   endif else begin

      print,'Warning:  Metadata unpack failed.',format='(a/)'

   endelse

endif else begin

   metadata=''

endelse

metadata_num=n_elements(metadata)

help,cdaweb_metadata,cdaweb_metadata_variable,size

print,''

help,metadata_num,metadata

print,command,format='(/a/)'

for loop=0,metadata_num-1 do print,metadata(loop)

print,''

return,metadata

end

