
function populate_person,spase_ontology,contact,release_date,verbose=verbose

person=spase_model_create(spase_ontology,'person',/verbose,/keyword_end_date, $
                          /keyword_measured,/keyword_field)

person=replicate(person,15)

contact_num=n_elements(person)

for contact_loop=0,contact_num-1 do begin

    person(contact_loop).resource_id=contact(contact_loop).resource_id

    person(contact_loop).release_date=release_date

    person(contact_loop).person_name=contact(contact_loop).name

    person(contact_loop).organization_name= $
       contact(contact_loop).organization_name

    person(contact_loop).address=contact(contact_loop).address

    person(contact_loop).email=contact(contact_loop).email

    person(contact_loop).phone_number= $
       string_condition(contact(contact_loop).phone_number,'-',' ')

endfor

return,person

end

