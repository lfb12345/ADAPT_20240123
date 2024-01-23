
function populate_repository,spase_ontology,resource_info,verbose=verbose

repository=spase_model_create(spase_ontology,'repository',/verbose, $
                              /keyword_end_date,/keyword_measured, $
                              /keyword_field)

repository.resource_id= $
   'spase://SMWG/Repository/'+resource_info.repository_acronym

repository.resource_header.resource_name= $
   'The '+resource_info.repository_name+' Data Repository.'

repository.resource_header.alternate_name= $
   'The '+resource_info.repository_acronym+' Data Repository hosted by the '+ $
   resource_info.repository_host+'.'

repository.resource_header.release_date=resource_info.release_date

repository.resource_header.expiration_date=resource_info.expiration_date

repository.resource_header.description= $
   'The '+resource_info.repository_name+' Data Repository hosted by the '+ $
   resource_info.repository_address+'.'

repository.resource_header.acknowledgement= $
   'If data downloaded from the '+resource_info.repository_acronym+' Data '+ $
   'Repository are used in publication kindly acknowledge the '+ $
   resource_info.repository_name+', '+resource_info.repository_address+ $
   ' for providing access to the data.'

role_list=['','ArchiveSpecialist','Co-Investigator','DataProducer', $
           'Deputy-PI','GeneralContact','MetadataContact', $
           'PrincipalInvestigator','ProjectScientist','Scientist', $
           'TeamLeader','TeamMember','TechnicalContact']

for contact_loop=0,n_elements(resource_info.repository_contact)-1 do begin

    if (resource_info.repository_contact(contact_loop).resource_id ne '') then $
       begin

       repository.resource_header.contact(contact_loop).person_id= $
          resource_info.repository_contact(contact_loop).resource_id

       repository.resource_header.contact(contact_loop).role= $
          role_list(resource_info.repository_contact(contact_loop).role_num)

    endif

endfor

repository.resource_header.information_url.name= $
   'The '+resource_info.repository_acronym+' Data Repository Web Site'

repository.resource_header.information_url.url= $
   resource_info.repository_information_url

repository.resource_header.information_url.description= $
   'The main web page for information concerning data holdings hosted '+ $
   'by the '+resource_info.repository_name+' Data Repository.'

repository.resource_header.association_id=''

repository.resource_header.prior_id=''

return,repository

end

