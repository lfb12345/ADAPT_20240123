close,20                                                    
close,70                                                    
openw,20,'test.txt'                                         
.run adapt/GENERAL/variable_attribute_superset.pro          
.run adapt/GENERAL/fix_invalid_xml_characters.pro           
.run adapt/SPASE/spase_model_blank_check.pro                
.run adapt/GENERAL/string_condition.pro                     
.run adapt/GENERAL/read_ascii.pro                           
.run adapt/GENERAL/read_cdf_metadata.pro                    
aaa=read_cdf_metadata('mms1_aspoc_srvy_l2_00000000_v01.cdf')
