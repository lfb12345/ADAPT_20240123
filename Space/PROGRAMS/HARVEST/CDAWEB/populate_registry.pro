
function populate_registry,spase_ontology,resource_info,verbose=verbose

registry=spase_model_create(spase_ontology,'registry',/verbose, $
                            /keyword_end_date,/keyword_measured,/keyword_field)

registry.resource_id='spase://SMWG/Registry/'+resource_info.registry_acronym

registry.resource_header.resource_name= $
   'The '+resource_info.registry_name+' Registry.'

registry.resource_header.alternate_name= $
   'The '+resource_info.authority+' Registry'

caldat,systime(/julian,/utc),month,day,year,hour,minute,second

registry.resource_header.release_date=resource_info.release_date

registry.resource_header.expiration_date=resource_info.expiration_date

registry.resource_header.description= $
   'The '+resource_info.registry_acronym+' provides one stop access to space '+ $
   'physics data products and other resources.'

registry.resource_header.acknowledgement= $
   'Please acknowledge the '+resource_info.registry_name+' for data '+ $
   'products downloaded via the '+resource_info.registry_acronym+' registry '+ $
   'and associated services for search and extraction.'

role_list=['','ArchiveSpecialist','Co-Investigator','DataProducer', $
           'Deputy-PI','GeneralContact','MetadataContact', $
           'PrincipalInvestigator','ProjectScientist','Scientist', $
           'TeamLeader','TeamMember','TechnicalContact']

for contact_loop=0,n_elements(resource_info.registry_contact)-1 do begin

    if (resource_info.registry_contact(contact_loop).resource_id ne '') then $
       begin

       registry.resource_header.contact(contact_loop).person_id= $
          resource_info.registry_contact(contact_loop).resource_id

       registry.resource_header.contact(contact_loop).role= $
          role_list(resource_info.registry_contact(contact_loop).role_num)

    endif

endfor

registry.resource_header.information_url.name= $
   'The '+resource_info.authority+' Registry Home Page'

registry.resource_header.information_url.url= $
   resource_info.registry_information_url

registry.resource_header.information_url.description= $
   'The home page for access to the '+resource_info.authority+' Registry'

registry.resource_header.association_id=''

registry.resource_header.prior_id=''

return,registry

end

