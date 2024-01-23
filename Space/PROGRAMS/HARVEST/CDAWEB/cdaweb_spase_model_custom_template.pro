
function cdaweb_spase_model,spase_version,spase_dir,project_dir,data_product_name,date_style

start_process=systime(1)

stars=strjoin(replicate('*',275))

printf,20,stars,format='(a/)'

printf,20,'Function:          CDAWEB_SPASE_MODEL',format='(a/)'

printf,20,'Processing Start:  ',systime(),format='(2a/)'

printf,20,stars,format='(a/)'

;
;   Define SPASE using the ontology tree and enumeration lists listed in the
;   SPASE pdf document and a reverse engineering technique to construct the
;   full schema.
;

data_product_name='DATA_PRODUCT_NAME'

date_style='DATE_STYLE'

;spase_model_raw_text_file_name= $
;   spase_dir+'REVERSE_MODEL/spase_model_raw_'+spase_version.version_date+'.txt'

;spase_model_file_name= $
;   spase_dir+'REVERSE_MODEL/spase_model_'+spase_version.version_date+'.txt'

;spase_model_reformat_error= $
;   spase_model_reformat(spase_model_raw_text_file_name,spase_model_file_name)

;spase_ontology_raw=spase_model_tree(spase_model_file_name,exist_flag,/verbose)

;spase_ontology=spase_model_ontology(spase_ontology_raw,/verbose)

;spase_keyword_list=spase_model_keyword(spase_ontology)

;spase_model_enumerate_file_name= $
;   spase_dir+'REVERSE_MODEL/spase_model_enumerate_'+ $
;   spase_version.version_date+'.txt'

;print,spase_model_enumerate_file_name,format='(/a)'

;spase_enumeration_list= $
;   spase_model_enumerate(spase_model_enumerate_file_name,/verbose)

;
;   Define SPASE by using a forward technique and SPASE master "tab" files:
;
;   dictionary.tab, history.tab, list.tab, member.tab, ontology.tab, type.tab
;

dictionary_file_name= $
   spase_dir+'TAB_FILES/'+spase_version.version_num+'/dictionary.tab'

history_file_name= $
   spase_dir+'TAB_FILES/'+spase_version.version_num+'/history.tab'

list_file_name=spase_dir+'TAB_FILES/'+spase_version.version_num+'/list.tab'

member_file_name=spase_dir+'TAB_FILES/'+spase_version.version_num+'/member.tab'

ontology_file_name= $
   spase_dir+'TAB_FILES/'+spase_version.version_num+'/ontology.tab'

type_file_name=spase_dir+'TAB_FILES/'+spase_version.version_num+'/type.tab'

;
;   Set up the SPASE Ontology
;

spase_ontology=read_ontology(ontology_file_name,type_file_name, $
                             history_file_name,dictionary_file_name,'Spase', $
                             dictionary_usage_num,dictionary_type_check_num)

spase_keyword_list=spase_model_keyword(spase_ontology)

print,stars,format='(/a/)'

;
;   Set up the SPASE Enumeration Lists
;

spase_enumeration_list= $
   read_enumeration(list_file_name,member_file_name,dictionary_file_name, $
                    type_file_name,'Spase',dictionary_usage_num, $
                    dictionary_type_check_num)

print,stars,format='(a/)'

;
;   Sparse SPASE structures can be created if they are defined via the following
;   setting of occur_num to occur_req thus resulting in structures that only
;   contain required elements.
;

;spase_ontology.occur_num=spase_ontology.occur_required

;
;   Set the Number of Revision History Occurrences
;

revision_history_mask=where(spase_ontology.tag_name eq 'revision_history',revision_history_mask_num)

spase_ontology(revision_history_mask).occur_num=15

;
;   Set the Number of Qualifier Occurrences
;

qualifier_mask=where(spase_ontology.tag_name eq 'qualifier',qualifier_mask_num)

spase_ontology(qualifier_mask).occur_num=5

;
;   Set the Information URL Container Occurrence Number to five.
;

information_url_mask=where(spase_ontology.tag_name eq 'information_url', $
                           information_url_mask_num)

spase_ontology(information_url_mask).occur_num=15

;
;   Set the Occurrence Status of InformationURL to Required and
;   set the Occurrence Status of the Name and Description Elements
;   contained within the InformationURL Structure to Required.
;

for loop=0,information_url_mask_num-1 do begin

    sub_information_url_mask=information_url_mask(loop)+indgen(5)

    spase_ontology(sub_information_url_mask).occur_required=1

endfor

;
;   Set the Number of Contact Occurrences and check for Uniqueness!
;

contact_mask=where(spase_ontology.tag_name eq 'contact',contact_mask_num)

spase_ontology(contact_mask).occur_num=15

spase_ontology(contact_mask).occur_required=0

spase_ontology(contact_mask).unique=1

;
;   Set the Number of Contact Role Occurrences
;

role_mask=where(spase_ontology.tag_name eq 'role',role_mask_num)

spase_ontology(role_mask).occur_num=5

spase_ontology(role_mask).occur_required=1

;
;   Set the Number of Prior ID Occurrences
;

prior_id_mask=where(spase_ontology.tag_name eq 'prior_id',prior_id_mask_num)

spase_ontology(prior_id_mask).occur_num=9

;
;   Set the Number of Instrument ID Occurrences
;

instrument_id_mask= $
   where(spase_ontology.tag_name eq 'instrument_id',instrument_id_mask_num)

spase_ontology(instrument_id_mask).occur_num=99

;
;   Set the Number of Phenomena Type ID Occurrences
;

phenomenon_type_mask=where(spase_ontology.tag_name eq 'phenomenon_type', $
                          phenomenon_type_mask_num)

spase_ontology(phenomenon_type_mask).occur_num=5

;
;   Set the Number of Keyword Occurrences
;

keyword_mask=where(spase_ontology.tag_name eq 'keyword',keyword_mask_num)

spase_ontology(keyword_mask).occur_num=99

;
;   Set the Number of Display Data Measurement Type ID Occurrences
;

measurement_type_mask=where(spase_ontology.tag_name eq 'measurement_type', $
                            measurement_type_mask_num)

spase_ontology(measurement_type_mask).occur_num=5

;
;   Set the Number of Access Information Occurrences
;

access_information_mask=where(spase_ontology.tag_name eq 'access_information',access_information_mask_num)

spase_ontology(access_information_mask).occur_num=5

;
;   Set the Number of Access URL Occurrences
;

access_url_mask=where(spase_ontology.tag_name eq 'access_url',access_url_mask_num)

spase_ontology(access_url_mask).occur_num=5

;
;   Set the Number of Observed Region Occurrences
;

observed_region_mask=where(spase_ontology.tag_name eq 'observed_region',observed_region_mask_num)

spase_ontology(observed_region_mask).occur_num=15

;
;   Set the Number of Catalog, Display Data and Numerical Data
;   Parameter Occurrences
;

parameter_mask=where(spase_ontology.tag_name eq 'parameter',parameter_mask_num)

spase_ontology(parameter_mask).occur_num=206

spase_ontology(parameter_mask).occur_num=186

spase_ontology(parameter_mask).occur_num=140

spase_ontology(parameter_mask).occur_num=99

spase_ontology(parameter_mask).occur_num=58

spase_ontology(parameter_mask).occur_num=41

;
;   New populate_numerical_data.pro 13/04/30
;

spase_ontology(parameter_mask).occur_num=25

spase_ontology(parameter_mask).occur_num=62

spase_ontology(parameter_mask).occur_num=155

spase_ontology(parameter_mask).occur_num=383

spase_ontology(parameter_mask).occur_num=24

spase_ontology(parameter_mask).occur_num=85

spase_ontology(parameter_mask).occur_num=208

spase_ontology(parameter_mask).occur_num=26

spase_ontology(parameter_mask).occur_num=16

spase_ontology(parameter_mask).occur_num=43

spase_ontology(parameter_mask).occur_num=53

spase_ontology(parameter_mask).occur_num=115

spase_ontology(parameter_mask).occur_num=206

spase_ontology(parameter_mask).occur_num=38

spase_ontology(parameter_mask).occur_num=47

spase_ontology(parameter_mask).occur_num=25

spase_ontology(parameter_mask).occur_num=83

spase_ontology(parameter_mask).occur_num=14

spase_ontology(parameter_mask).occur_num=97

;
;   Test run on a1_k0_mpa
;

;spase_ontology(parameter_mask).occur_num=39

spase_ontology(parameter_mask).occur_num=OCCUR_NUM_PARAMETER

;
;   Set the Number of Catalog, Display Data and Numerical Data
;   Parameter Structure Bin Occurrences
;

element_mask=where(spase_ontology.tag_name eq 'bin',element_mask_num)

spase_ontology(element_mask).occur_num=32

;
;   Set the Number of Catalog, Display Data and Numerical Data
;   Parameter Structure Element Occurrences
;

element_mask=where(spase_ontology.tag_name eq 'element',element_mask_num)

spase_ontology(element_mask).occur_num=2816

spase_ontology(element_mask).occur_num=2048

spase_ontology(element_mask).occur_num=256

spase_ontology(element_mask).occur_num=180

spase_ontology(element_mask).occur_num=176

spase_ontology(element_mask).occur_num=16

spase_ontology(element_mask).occur_num=3

spase_ontology(element_mask).occur_num=1

;
;   New populate_numerical_data.pro 13/04/30
;

spase_ontology(element_mask).occur_num=33

spase_ontology(element_mask).occur_num=60

spase_ontology(element_mask).occur_num=32

spase_ontology(element_mask).occur_num=76

spase_ontology(element_mask).occur_num=64

spase_ontology(element_mask).occur_num=180

spase_ontology(element_mask).occur_num=19

spase_ontology(element_mask).occur_num=16

spase_ontology(element_mask).occur_num=180

spase_ontology(element_mask).occur_num=335

;
;   Test run on a1_k0_mpa
;

;spase_ontology(element_mask).occur_num=3

spase_ontology(element_mask).occur_num=OCCUR_NUM_ELEMENT

;
;   Set the Occurrence Status of ValidMin, ValidMax, and FillValue
;   that are contained within the Parameter Structure to Required.
;

;valid_min_mask=where(spase_ontology.tag_name eq 'valid_min',valid_min_mask_num)

;spase_ontology(valid_min_mask).occur_required=1

;valid_max_mask=where(spase_ontology.tag_name eq 'valid_max',valid_max_mask_num)

;spase_ontology(valid_max_mask).occur_required=1

;fill_value_mask= $
;  where(spase_ontology.tag_name eq 'fill_value',fill_value_mask_num)

;spase_ontology(fill_value_mask).occur_required=1

;
;   Unset the "C" designation for the mutually exclusive SPASE
;   structures Field, Particle, Wave, Mixed, and Support.
;

spase_mask=where(spase_ontology.tag_name eq 'spase',spase_mask_num)

spase_ontology(spase_mask).group_incl='AB'

catalog_mask=where(spase_ontology.tag_name eq 'catalog',catalog_mask_num)

spase_ontology(catalog_mask).group_incl='AB'

display_data_mask= $
   where(spase_ontology.tag_name eq 'display_data',display_data_mask_num)

spase_ontology(display_data_mask).group_incl='AB'

numerical_data_mask= $
   where(spase_ontology.tag_name eq 'numerical_data',numerical_data_mask_num)

spase_ontology(numerical_data_mask).group_incl='AB'

numerical_output_mask= $
   where(spase_ontology.tag_name eq 'numerical_output',numerical_output_mask_num)

spase_ontology(numerical_output_mask).group_incl='AB'

display_output_mask= $
   where(spase_ontology.tag_name eq 'display_output',display_output_mask_num)

spase_ontology(display_output_mask).group_incl='AB'

spase_ontology(parameter_mask).group_incl=''

;
;   Set the Number of Particle Type Occurrences
;

particle_type_mask=where(spase_ontology.tag_name eq 'particle_type',particle_type_mask_num)

spase_ontology(particle_type_mask).occur_num=5

;
;  089    3        1    1    0    1   90  100                         Field                         field    0                     Field                          
;  101    3        1    1    0    1  102  129                      Particle                      particle    0                  Particle                          
;  130    3        1    1    0    1  131  159                          Wave                          wave    0                      Wave                          
;  160    3        1    1    0    1  161  163                         Mixed                         mixed    0                     Mixed                          
;  164    3        1    1    0    1  165  166                       Support                       support    0                   Support                          
;

;
;   Set the Number of Atomic Number Occurrences
;

atomic_number_mask=where(spase_ontology.tag_name eq 'atomic_number',atomic_number_mask_num)

spase_ontology(atomic_number_mask).occur_num=5

field_mask=where(spase_ontology.tag_name eq 'field',field_mask_nume)

spase_ontology(field_mask).group=''

spase_ontology(field_mask).group_incl=''

spase_ontology(field_mask).occur_required=0

particle_mask=where(spase_ontology.tag_name eq 'particle',particle_mask_nume)

spase_ontology(particle_mask).group=''

spase_ontology(particle_mask).group_incl=''

spase_ontology(particle_mask).occur_required=0

wave_mask=where(spase_ontology.tag_name eq 'wave',wave_mask_nume)

spase_ontology(wave_mask).group=''

spase_ontology(wave_mask).group_incl=''

spase_ontology(wave_mask).occur_required=0

mixed_mask=where(spase_ontology.tag_name eq 'mixed',mixed_mask_nume)

spase_ontology(mixed_mask).group=''

spase_ontology(mixed_mask).group_incl=''

spase_ontology(mixed_mask).occur_required=0

support_mask=where(spase_ontology.tag_name eq 'support',support_mask_nume)

spase_ontology(support_mask).group=''

spase_ontology(support_mask).group_incl=''

spase_ontology(support_mask).occur_required=0

;
;     Make Temporal Description Required
;

temporal_description_mask= $
   where(spase_ontology.tag_name eq 'temporal_description', $
         temporal_description_mask_num)

spase_ontology(temporal_description_mask).occur_required=1

;
;     Make Cadence Required
;

cadence_mask=where(spase_ontology.tag_name eq 'cadence',cadence_mask_num)

;pase_ontology(cadence_mask).occur_required=1

print,'Hello Ontology',format='(a/)'

spase_keyword_list=spase_model_keyword(spase_ontology)

;
;   Set up program subdirectories
;

file_check=file_info(project_dir)

if (file_check.exists eq 0) then file_mkdir,project_dir

file_check=file_info(project_dir+'CREATE/')

if (file_check.exists eq 0) then file_mkdir,project_dir+'CREATE/'

file_check=file_info(project_dir+'WRITE/')

if (file_check.exists eq 0) then file_mkdir,project_dir+'WRITE/'

file_check=file_info(project_dir+'POPULATE/')

if (file_check.exists eq 0) then file_mkdir,project_dir+'POPULATE/'

spase_structure_list=spase_model_structure(spase_ontology,spase_keyword_list, $
                                           project_dir+'CREATE/',/verbose)

spase_ontology=spase_model_write(spase_ontology,spase_keyword_list, $
                                 project_dir+'WRITE/',/verbose)

spase_model_populate_error= $
   spase_model_populate_new(spase_ontology,spase_structure_list, $
                            spase_keyword_list,spase_enumeration_list, $
                            project_dir+'POPULATE/',/verbose)

spase_ontology_num=n_elements(spase_ontology)

printf,20,stars,format='(a/)'

help,spase_ontology,/structure

print,''

print,'loop_number tag_level group_incl group occur_type occur_num occur_required tag_type parent_line element_line element_start_line element_stop_line unique keyword tag_name raw_name enumeration_list entity'

print,''

for loop=0L,spase_ontology_num-1L do $
    print,loop, $
          spase_ontology(loop).tag_level, $                                           ;   TAG_LEVEL          INT              0
          spase_ontology(loop).group_incl, $                                          ;   GROUP_INCL         STRING        'AB'
          spase_ontology(loop).group, $                                               ;   GROUP              STRING          ''                     
          spase_ontology(loop).occur_type, $                                          ;   OCCUR_TYPE         STRING         '1'
          spase_ontology(loop).occur_num, $                                           ;   OCCUR_NUM          LONG             1
          spase_ontology(loop).occur_required, $                                      ;   OCCUR_REQUIRED     INT              1
          spase_ontology(loop).tag_type, $                                            ;   TAG_TYPE           INT              1
          spase_ontology(loop).parent_line, $                                         ;   PARENT_LINE        INT              0
          spase_ontology(loop).element_line, $                                        ;   ELEMENT_LINE       INT              0
          spase_ontology(loop).element_start_line, $                                  ;   ELEMENT_START_LINE INT              1
          spase_ontology(loop).element_stop_line, $                                   ;   ELEMENT_STOP_LINE  INT           2284
          spase_ontology(loop).unique, $                                              ;   UNIQUE             INT              0
          spase_ontology(loop).keyword, $                                             ;   KEYWORD            STRING     'Spase'
          spase_ontology(loop).tag_name, $                                            ;   TAG_NAME           STRING     'spase'                
          spase_ontology(loop).raw_name, $                                            ;   RAW_NAME           STRING     'Spase'
          spase_ontology(loop).enumeration_list, $                                    ;   ENUMERATION_LIST   STRING          ''
          spase_ontology(loop).entity, $                                              ;   ENTITY             STRING          ''
          format='(i5.5,i5,3(1x,a-12),8i8,7x,5a-30)'

stop_process=systime(1)

elapsed_time=stop_process-start_process

printf,20,stars,format='(/a/)'

printf,20,'Processing Stop:   ',systime(),format='(2a/)'

printf,20,'Processing Time:   ',elapsed_time,' sec',format='(a18,f8.2,a4/)'

printf,20,stars,format='(a/)'

error=0

return,spase_ontology

end

