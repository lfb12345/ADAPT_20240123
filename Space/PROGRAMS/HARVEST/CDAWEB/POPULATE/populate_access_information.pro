
function populate_access_information,spase_ontology,station_info,verbose=verbose

access_information=spase_model_create(spase_ontology,'access_information',verbose=verbose)

;
;-------------------------------------------------------------------------------
;
;  ACCESS_INFORMATION List Num:                     4
;
;-------------------------------------------------------------------------------
;

availability_list=['','Offline','Online']

encoding_list= $
   ['','ASCII','Base64','BZIP2','GZIP','None','S3_BUCKET','TAR','Unicode','ZIP']

format_list= $
   ['','AVI','Binary','CDF','CEF','CEF1','CEF2','CSV','Excel','FITS','GIF', $
    'Hardcopy','Hardcopy.Film','Hardcopy.Microfiche','Hardcopy.Microfilm', $
    'Hardcopy.Photograph','Hardcopy.PhotographicPlate','Hardcopy.Print','HDF', $
    'HDF4','HDF5','HTML','IDFS','IDL','JPEG','JSON','MATLAB_4','MATLAB_6', $
    'MATLAB_7','MPEG','NCAR','NetCDF','PDF','PDS4','PDS3','PNG','Postscript', $
    'QuickTime','RINEX2','RINEX3','Text','Text.ASCII','Text.Unicode','TFCat', $
    'TIFF','UDF','VOTable','XML']

style_list= $
   ['','EPNTAP','File','Git','HAPI','Listing','Search','TAP','Template', $
    'Overview','WebService']

access_information.repository_id=''

access_information.availability=''

access_information.access_rights=''

for access_url_loop=0,4 do begin

    access_information.access_url(access_url_loop).name=''

    access_information.access_url(access_url_loop).url=''

    access_information.access_url(access_url_loop).style=''

    access_information.access_url(access_url_loop).product_key=''

    access_information.access_url(access_url_loop).description=''

    access_information.access_url(access_url_loop).language=''

endfor

access_information.format=''

access_information.encoding=''

access_information.access_directory_template=''

access_information.access_filename_template=''

access_information.data_extent.quantity=''

access_information.data_extent.units=''

access_information.data_extent.per=''

access_information.acknowledgement=''

return,access_information

end

