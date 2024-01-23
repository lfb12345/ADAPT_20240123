
function populate_registry_person_ucla, $
            spase_ontology,station_info,verbose=verbose, $
            keyword_end_date=keyword_end_date, $
            keyword_relative_end_date=keyword_relative_end_date, $
            keyword_measured=keyword_measured,keyword_support=keyword_support, $
            keyword_field=keyword_field,keyword_mixed=keyword_mixed, $
            keyword_particle=keyword_particle,keyword_photon=keyword_photon

person=spase_model_create(spase_ontology,'person',/verbose,/keyword_end_date, $
                          /keyword_measured,/keyword_field)

registry_person=replicate(person,2)

name='Raymond J. Walker'

temp_name=string_condition(name,'.','')

registry_person(0)= $
   create_struct('resource_id', $
                   'spase://SMWG/Person/'+string_condition(temp_name,' ','.'), $
                 'release_date',station_info.release_date, $
                 'person_name',name, $
                 'organization_name', $
                    'Institute of Geophysics and Planetary Physics, UCLA', $
                 'address', $
                    'Institute of Geophysics and Planetary Physics, '+ $
                    'University of California Los Angeles, Box 951567, '+ $
                    'Los Angeles, CA 90095-1567', $
                 'email','rwalker@igpp.ucla.edu', $
                 'phone_number','+1 310 825 7685')

name='Lee Frost Bargatze'

temp_name=string_condition(name,'.','')

registry_person(1)= $
   create_struct('resource_id', $
                   'spase://SMWG/Person/'+string_condition(temp_name,' ','.'), $
                 'release_date',station_info.release_date, $
                 'person_name',name, $
                 'organization_name', $
                    'Institute of Geophysics and Planetary Physics, UCLA', $
                 'address', $
                    'Institute of Geophysics and Planetary Physics, '+ $
                    'University of California Los Angeles, Box 951567, '+ $
                    'Los Angeles, CA 90095-1567', $
                 'email','lfb@igpp.ucla.edu', $
                 'phone_number','+1 310 206 6073')

;                'phone_number','+1 310 206 6073', $
;                'fax','+1 310 206 8042')

return,registry_person

end

