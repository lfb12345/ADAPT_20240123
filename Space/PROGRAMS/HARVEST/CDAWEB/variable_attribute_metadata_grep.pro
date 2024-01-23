
function variable_attribute_metadata_grep,variable_attribute,attribute,size

variable_attribute_metadata=''

variable_attribute_num=n_tags(variable_attribute)

for loop=0,variable_attribute_num-1 do begin

    attribute_mask=where(strmatch(variable_attribute.(loop).name,attribute, $
                         /fold_case),attribute_mask_num)

    if (attribute_mask_num gt 0) then begin

       variable_attribute_metadata=variable_attribute.(loop).metadata

       if (variable_attribute_metadata ne '') then $
          print,'ATTRIBUTE:  '+attribute+' '+variable_attribute_metadata

    endif

endfor

cdaweb_metadata=''

;ariable_attribute_metadata= $
;  strjoin(strsplit(variable_attribute_metadata,"&",/extract,/regex),'&amp;')

variable_attribute_metadata= $
   strjoin(strsplit(variable_attribute_metadata,"'",/extract,/regex),'&apos;')

variable_attribute_metadata= $
   strjoin(strsplit(variable_attribute_metadata,">",/extract,/regex),'&gt;')

variable_attribute_metadata= $
   strjoin(strsplit(variable_attribute_metadata,"<",/extract,/regex),'&lt;')

variable_attribute_metadata= $
   strtrim(string_condition(strjoin(strsplit(variable_attribute_metadata, $
                                             '""',/extract,/regex),"''"), $
                                             '"',"'"),2)

command='cdaweb_metadata='+variable_attribute_metadata

if (variable_attribute_metadata ne '') then begin

   first_character=strmid(variable_attribute_metadata,0,1)

   if(first_character ne '[') then $
      variable_attribute_metadata="['"+variable_attribute_metadata+"']"

   command='cdaweb_metadata='+variable_attribute_metadata

   command_char_num=strlen(command)

   if (command_char_num le 2048) then begin

      command_error=execute(command)

      if (command_error eq 1) then begin

         cdaweb_metadata_num=n_elements(cdaweb_metadata)

         for loop=0,cdaweb_metadata_num-1 do begin

             cdaweb_metadata(loop)=strtrim(cdaweb_metadata(loop),2)

             cdaweb_metadata(loop)=string_condition(cdaweb_metadata(loop),'""','" "')

             cdaweb_metadata(loop)=string_condition(cdaweb_metadata(loop),'  ',' ')

;            cdaweb_metadata(loop)=string_condition(cdaweb_metadata(loop),'@Ú¿_ÿ','""')

         endfor

         zero_test_num=n_elements(uniq(sort(cdaweb_metadata)))

         if (zero_test_num eq 1) then begin

            if (uniq(sort(cdaweb_metadata)) ne 0) then begin

               mask=where(cdaweb_metadata ne '',cdaweb_metadata_num)

               if (mask ne -1) then cdaweb_metadata=cdaweb_metadata(mask)

            endif

         endif

         if (cdaweb_metadata_num eq 1) then begin $

            size=cdaweb_metadata_num

            cdaweb_metadata=make_array(size,/string,value=cdaweb_metadata)

         endif

      endif else begin

         print,'Warning:  Metadata unpack failed.',format='(a/)'

      endelse

      cdaweb_metadata_num=n_elements(cdaweb_metadata)

   endif else begin

      print,'Warning:  Metadata string exceeds 4096 the character limit for the IDL EXECUTE function.',format='(a/)'

   endelse

endif

return,cdaweb_metadata

end

