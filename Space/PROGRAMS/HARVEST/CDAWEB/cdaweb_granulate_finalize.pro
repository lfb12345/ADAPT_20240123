
function cdaweb_granulate_finalize,parent_id,ftp_root_string, $
            data_product_file_name_list,data_product_file_hash_list

data_product_file_name_list_num=n_elements(data_product_file_name_list)

data_product_file_hash_list_num=n_elements(data_product_file_hash_list)

granule_file_info_record= $
   create_struct('name','','quantity','','ls_date','','hash_value','', $
                 'start_date','','stop_date','','parent_id','', $
                 'resource_id','','url','','release_date','')

granule_file_info= $
   replicate(granule_file_info_record,data_product_file_hash_list_num)

caldat,systime(1,/julian),month,day,year,hour,minute,seconds

granule_file_info.release_date= $
   string(year,format='(i4)')+'-'+string(month,format='(i2.2)')+'-'+ $
   string(day,format='(i2.2)')+'T12:34:56.789'

cdf_name_time_format='YYYYMMDD'

file_name=make_array(data_product_file_hash_list_num,/string,value='')

hash_value=make_array(data_product_file_hash_list_num,/string,value='')

for loop=0L,data_product_file_hash_list_num-1L do begin

    split=strsplit(data_product_file_hash_list(loop),/extract)

    file_name(loop)=split(1)

    hash_value(loop)=split(0)

endfor

file_loop=0

for loop=0L,data_product_file_name_list_num-1L do begin

    split=strsplit(data_product_file_name_list(loop),/extract)

    split_name=strsplit(split(3),'/',/extract)

    if (file_loop lt data_product_file_hash_list_num) then begin

       granule_file_info(file_loop).name=split_name(n_elements(split_name)-1)

       granule_file_info_mask= $
          where(granule_file_info(file_loop).name eq file_name, $
                granule_file_info_mask_num)

       if (granule_file_info_mask_num eq 1) then begin

          granule_file_info(file_loop).resource_id= $
             strjoin(strsplit(parent_id,'NumericalData',/regex,/extract), $
                     'Granule')+'/'

          granule_file_info(file_loop).quantity=split(2)

          granule_file_info(file_loop).ls_date=split(0)

          granule_file_info(file_loop).url=ftp_root_string+split(3)

          split=strsplit(granule_file_info(file_loop).name,'_',/extract)

          date_string=split(n_elements(split)-2)

          granule_file_info(file_loop)= $
             cdaweb_granule_date_time(date_string,granule_file_info(file_loop))

          granule_file_info(file_loop).parent_id=parent_id

          granule_file_info(file_loop).hash_value=hash_value(granule_file_info_mask)

          file_loop=file_loop+1

       endif

    endif

endfor

sort_mask=sort(granule_file_info.name)

granule_file_info=granule_file_info(sort_mask)

return,granule_file_info

end

