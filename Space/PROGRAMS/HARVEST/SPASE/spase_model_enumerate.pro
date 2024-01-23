
function spase_model_enumerate,spase_enumerate_filename,verbose=verbose

!EXCEPT=2

spase_enumeration_record=make_array(1000,/string,value='')

directory='/Users/lfb/Desktop/XML/'

printf,20,'SPASE Model Enumerate Input File Name:',spase_enumerate_filename, $
          format='(a,2x,a/)'

record_count=0L

record=''

openr,30,spase_enumerate_filename,error=error

if (error eq 0) then begin

   while not eof(30) do begin

         readf,30,record

         if (record ne '') then begin

            spase_enumeration_record(record_count)=record

            record_count=record_count+1L

         endif

   endwhile

   close,30

   spase_enumeration_record=spase_enumeration_record(indgen(record_count))

   enumeration_num=make_array(record_count,/integer,value=0)

   for record=0,record_count-1 do $
       enumeration_num(record)= $
          n_elements(strsplit(spase_enumeration_record(record),' ',/extract))

   list_element_max_num=max(enumeration_num)-1

;  spase_enumeration_list_record= $
;     create_struct(name='Enumeration List','num',0,'tag_name','', $
;                   'list',make_array(list_element_max_num,/string,value=''))

   spase_enumeration_list_record= $
      create_struct( $
         name='Enumeration List','num',0,'tag_name','','parent',0, $
         'list',make_array(list_element_max_num,/string,value=''))

   spase_enumeration_list=replicate(spase_enumeration_list_record,record_count)

   spase_enumeration_list.num=enumeration_num-1

   for record=0,record_count-1 do begin

      temp=strsplit(spase_enumeration_record(record),' ',/extract)

      spase_enumeration_list(record).tag_name=temp(0)

      array_window=indgen(spase_enumeration_list(record).num)

      spase_enumeration_list(record).list(array_window)=temp(array_window+1)

      printf,20,spase_enumeration_list(record).tag_name

   endfor

endif

printf,20,''

return,spase_enumeration_list

end

