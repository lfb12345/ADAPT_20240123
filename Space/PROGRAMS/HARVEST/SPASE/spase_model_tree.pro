
function spase_model_tree,spase_model_input_file,exist_flag,verbose=verbose

exist_flag=0

if keyword_set(verbose) then $
   printf,20,'Spase Model Input File Name:            ', $
             spase_model_input_file,format='(2a/)'

;
;   Read the Spase Model Configuration File from Disk
;

openr,30,spase_model_input_file,error=error

spase_model_record=''

spase_model_full=make_array(500,/string)

if (error eq 0) then begin

   record_count=0L

   while not eof(30) do begin

      readf,30,spase_model_record,format='(a)'

      spase_model_full(record_count)=spase_model_record

      record_count=record_count+1L

   endwhile

   close,30

   spase_model_full=spase_model_full(indgen(record_count))

   if keyword_set(verbose) then $
      printf,20,'Number of Spase Model Records:        ',record_count, $
                format='(a38,i5/)'

;  spase_model_raw_record= $
;     create_struct(name='Ontology','keyword','','tag_name','','tag_level',0, $
;                   'tag_type',0,'occur_type','','occur_num',1, $
;                   'occur_required',1,'group','','group_incl','','unique',0, $
;                   'element_line',0,'element_start_line',0, $
;                   'element_stop_line',0,'parent_line',0)

   spase_model_raw_record= $
      create_struct(name='Ontology','keyword','','tag_name','','tag_level',0, $
                    'tag_type',0,'occur_type','1','occur_num',1, $
                    'occur_required',1,'group','','group_incl','','unique',0, $
                    'element_line',0,'element_start_line',0, $
                    'element_stop_line',0,'parent_line',0,'entity','', $
                    'enumeration_list','','raw_name','')

   spase_model_raw=replicate(spase_model_raw_record,record_count)

   spase_model_raw.element_line=indgen(record_count)

   spase_model_raw.element_start_line=indgen(record_count)

   spase_model_raw.element_stop_line=indgen(record_count)

   for loop=0,record_count-1 do begin

       plus_pos=strpos(spase_model_full(loop),'+')

       spase_model_raw(loop).tag_level=plus_pos/2

       open_paren_pos=strpos(spase_model_full(loop),'(')+1

       close_paren_pos=strpos(spase_model_full(loop),')')+1

       spase_model_raw(loop).occur_type= $
          strmid(spase_model_full(loop),open_paren_pos,1)

       if (spase_model_raw(loop).occur_type eq '0' or $
           spase_model_raw(loop).occur_type eq '*') then $
          spase_model_raw(loop).occur_required=0

       type_string_length=close_paren_pos-open_paren_pos

       if (type_string_length gt 2) then $
          spase_model_raw(loop).group= $
             strmid(spase_model_full(loop),close_paren_pos-2,1)

       tag_name_length=open_paren_pos-plus_pos-4

       spase_model_raw(loop).keyword= $
          strjoin(strsplit(strmid(spase_model_full(loop),plus_pos+2, $
                                  tag_name_length),/extract),'')

;         string_join(spase_model_full(loop),plus_pos+2,tag_name_length,'')

       spase_model_raw(loop).tag_name= $
          strlowcase(strjoin(strsplit(strmid(spase_model_full(loop), $
                                             plus_pos+2,tag_name_length), $
                                      /extract),'_'))

;         strlowcase(string_join(spase_model_full(loop),plus_pos+2, $
;                                tag_name_length,'_'))

       spase_model_raw(loop).parent_line=0

       if (loop gt 0) then begin

          parent_index=where(spase_model_raw(0:loop-1).tag_level eq $
                             spase_model_raw(loop).tag_level-1)

;         print,'PARENT XXXX:  ',parent_index

          spase_model_raw(loop).parent_line= $
  spase_model_raw(parent_index(n_elements(parent_index)-1)).element_start_line+2

       endif

;      print,'PARENT LINE:  ',spase_model_raw(loop).tag_name, $
;            spase_model_raw(loop).tag_level,spase_model_raw(loop).parent_line

   endfor

   spase_model_raw.group_incl=spase_model_raw.group

endif else begin

   if (error ne 0) then begin

      printf,20,'File does not open properly'
      printf,20,'Error #:',error
      printf,20,!ERR_STRING
      printf,20,''

      exist_flag=error

   endif

endelse

;
;   END OF PROCESSING, YEAH!!!
;

return,spase_model_raw

end

