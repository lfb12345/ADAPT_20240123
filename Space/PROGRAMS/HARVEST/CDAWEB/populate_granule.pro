
function populate_granule,spase_ontology,data_product_name,cadence, $
                          granule_info,verbose=verbose

granule=spase_model_create(spase_ontology,'granule',/verbose,/keyword_stop_date)

;
;-------------------------------------------------------------------------------
;
; GRANULE List Num:         2
;
;-------------------------------------------------------------------------------
;

source_type_list=['','Browse','Ancillary','Thumbnail','Layout','Data']

hash_function_list=['','SHA1','SHA256','MD5']

stop_date_time='23:59:59.999'

if (strmatch(strmid(data_product_name,0,11),'thg_l2_mag_',/fold_case) eq 1) then begin

   if (cadence eq 'PT0.5S') then stop_date_time='23:59:59.500'

   if (cadence eq 'PT1S') then stop_date_time='23:59:59.000'

   if (cadence eq 'PT20S') then stop_date_time='23:59:40.000'

   if (cadence eq 'PT60S') then stop_date_time='23:59:00.000'

endif

granule.resource_id=granule_info.resource_id

granule.release_date=granule_info.release_date

granule.expiration_date=''

granule.parent_id=granule_info.parent_id

granule.prior_id=''

granule.start_date=granule_info.start_date

split=strsplit(granule_info.stop_date,'T',/extract)

granule_info.stop_date=split(0)+'T'+stop_date_time

granule.stop_date=granule_info.stop_date

granule.source.source_type=source_type_list(5)

granule.source.url=granule_info.url

granule.source.mirror_url=''

granule.source.checksum.hash_value=granule_info.hash_value

granule.source.checksum.hash_function=hash_function_list(1)

granule.source.data_extent.quantity=granule_info.quantity

granule.source.data_extent.units='Bytes'

granule.source.data_extent.per=''

return,granule

end

;
;  create_struct('name','','bytes','','ls_date','','hash_value','', $
;                'start_date','','stop_date','','parent_id','', $
;                'resource_id','','url','','release_date','')
;

