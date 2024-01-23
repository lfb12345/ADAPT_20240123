
function cdaweb_granulate,data_product_name,data_product_file_name_list, $
                          data_product_file_hash_list

data_product_file_name_list_num=n_elements(data_product_file_name_list)

data_product_file_hash_list_num=n_elements(data_product_file_hash_list)

granule_file_info_record= $
   create_struct('name','','quantity','','ls_date','','hash_value','', $
                 'start_date','','stop_date','','parent_id','', $
                 'resource_id','','url','','release_date','')

granule_file_info= $
   replicate(granule_file_info_record,data_product_file_name_list_num)

caldat,systime(1,/julian),month,day,year,hour,minute,seconds

granule_file_info.release_date= $
   string(year,format='(i4)')+'-'+string(month,format='(i2.2)')+'-'+ $
   string(day,format='(i2.2)')+'T12:34:56.789'

;  string(day,format='(i2.2)')+'T'+string(hour,format='(i2.2)')+':'+ $
;  string(minute,format='(i2.2)')+':'+string(seconds,format='(i2.2)')

ftp_root_string='ftp://cdaweb.gsfc.nasa.gov/'

cdf_name_time_format='YYYYMMDD'

cluster_name=['Rumba','Salsa','Samba','Tango']

;ata_product_file_name_list_num=min([5,data_product_file_name_list_num])

file_name=make_array(data_product_file_hash_list_num,/string,value='')

hash_value=make_array(data_product_file_hash_list_num,/string,value='')

for loop=0L,data_product_file_hash_list_num-1L do begin

    split=strsplit(data_product_file_hash_list(loop),/extract)

    file_name(loop)=split(1)

    hash_value(loop)=split(0)

endfor

for loop=0L,data_product_file_name_list_num-1L do begin

    split=strsplit(data_product_file_name_list(loop),/extract)

    split_name=strsplit(split(3),'/',/extract)

    project=split_name(2)

    granule_file_info(loop).name=split_name(n_elements(split_name)-1)

    granule_file_info(loop).quantity=split(2)

    granule_file_info(loop).ls_date=split(0)

    granule_file_info(loop).url=ftp_root_string+split(3)

    split=strsplit(granule_file_info(loop).name,'_',/extract)

    date_string=split(n_elements(split)-2)

    granule_file_info(loop).resource_id= $
       'spase://VMO/Granule/'+project+'/'+data_product_name+'/'

    granule_file_info(loop)= $
       cdaweb_granule_date_time(date_string,granule_file_info(loop))

;   granule_file_info(loop)=granule_file_info_temp

    granule_file_info(loop).parent_id= $
       'spase://VMO/NumericalData/'+project+'/'+data_product_name

    granule_file_info_mask= $
       where(granule_file_info(loop).name eq file_name, $
             granule_file_info_mask_num)

    if (granule_file_info_mask_num eq 1) then $
       granule_file_info(loop).hash_value=hash_value(granule_file_info_mask)

endfor

sort_mask=sort(granule_file_info.name)

granule_file_info=granule_file_info(sort_mask)

return,granule_file_info

end

;
;ls_file_name= $
;   '/Users/lfb/Space/PROGRAMS/HARVEST/CDAWEB/CDAWEB_DIRECTORY/cluster_cp_ls_file_list.txt'
;
;sha1sum_file_name= $
;   '/Users/lfb/Space/PROGRAMS/HARVEST/CDAWEB/CDAWEB_DIRECTORY/cluster_cp_sha1sum_file_list_all.txt'
;
;<URL>ftp://cdaweb.gsfc.nasa.gov/pub/istp/cluster/c3/cp/2003/c3_cp_fgm_spin_20031129_v01.cdf</URL>
;
;grep -v ^# cluster_cp_sha1sum_file_concatenate.txt | grep -v aareadme > cluster_cp_sha1sum_file_list_all.txt
;
;grep 'pub/istp/' filelist | grep "\.cdf" | grep cluster | grep "\/cp\/" > cluster_cp_ls_file_list.txt
;
;==> /Users/lfb/Space/PROGRAMS/HARVEST/CDAWEB/CDAWEB_DIRECTORY/cluster_cp_ls_file_list.txt <==
;
;2007-10-15T14:53:59 GMT    1053829 pub/istp/cluster/c3/cp/2003/c3_cp_fgm_spin_20031129_v01.cdf
;2007-10-15T14:53:59 GMT    1046303 pub/istp/cluster/c3/cp/2003/c3_cp_fgm_spin_20030422_v01.cdf
;2007-10-15T14:53:59 GMT     705253 pub/istp/cluster/c3/cp/2003/c3_cp_fgm_spin_20030707_v01.cdf
;2007-10-15T14:53:59 GMT     591460 pub/istp/cluster/c3/cp/2003/c3_cp_fgm_spin_20030425_v01.cdf
;2007-10-15T14:53:59 GMT    1045204 pub/istp/cluster/c3/cp/2003/c3_cp_fgm_spin_20030428_v01.cdf
;2007-10-15T14:53:59 GMT    1046677 pub/istp/cluster/c3/cp/2003/c3_cp_fgm_spin_20030513_v01.cdf
;2007-10-15T14:53:59 GMT    1052587 pub/istp/cluster/c3/cp/2003/c3_cp_fgm_spin_20030826_v01.cdf
;2007-10-15T14:53:59 GMT     850946 pub/istp/cluster/c3/cp/2003/c3_cp_fgm_spin_20030927_v01.cdf
;2007-10-15T14:53:59 GMT    1045684 pub/istp/cluster/c3/cp/2003/c3_cp_fgm_spin_20030316_v01.cdf
;2007-10-15T14:53:59 GMT    1053412 pub/istp/cluster/c3/cp/2003/c3_cp_fgm_spin_20031210_v01.cdf
;
;==> /Users/lfb/Space/PROGRAMS/HARVEST/CDAWEB/CDAWEB_DIRECTORY/cluster_cp_sha1sum_file_list_all.txt <==
;
;7d5f70513501d500380932a56c6b3534ed7c858b  c1_cp_fgm_spin_20011112_v01.cdf
;a899fe8a0e4a429113919838b18494c817c64f72  c1_cp_fgm_spin_20011227_v01.cdf
;d55fbca27ff85fee36b02ab44df429d8a7781718  c1_cp_fgm_spin_20011026_v01.cdf
;58cfbe131baab36cd8432f29c353f714f2602b83  c1_cp_fgm_spin_20010212_v01.cdf
;5236933c1d7277e81ca104fdd7ccdd45ba047993  c1_cp_fgm_spin_20010603_v01.cdf
;29d093662830b76127dc02a28846b4e0eaac8812  c1_cp_fgm_spin_20011216_v01.cdf
;b3692f869daa1ea9829788861c008b71056359a8  c1_cp_fgm_spin_20010402_v01.cdf
;8c34ba72d4886363e42f0b12ee3dd02b5928bbca  c1_cp_fgm_spin_20011015_v01.cdf
;d1895e39cf222c7b4904d717dfc3fcc9864bc47e  c1_cp_fgm_spin_20010316_v01.cdf
;c857770357e24d732728158d411587923b659e21  c1_cp_fgm_spin_20010201_v01.cdf
;

