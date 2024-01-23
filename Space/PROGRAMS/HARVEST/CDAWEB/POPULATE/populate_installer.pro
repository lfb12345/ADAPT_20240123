
function populate_installer,spase_ontology,station_info,verbose=verbose

installer=spase_model_create(spase_ontology,'installer',verbose=verbose)

availability_list=['','Offline','Online']

installer.availability=''

installer.access_rights=''

installer.acknowledgement=''

installer.url=''

return,installer

end

