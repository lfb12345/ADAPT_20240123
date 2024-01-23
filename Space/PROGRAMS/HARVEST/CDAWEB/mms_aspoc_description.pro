
function mms_aspoc_description,data_product_name

data_product_name_split=strsplit(data_product_name,'_',/extract)

mms_spacecraft=data_product_name_split(0)

mms_spacecraft_num=strmid(data_product_name_split(0),3,1)

description='MMS '+mms_spacecraft_num+' Active Spacecraft Potential Control '+ $
            '(ASPOC) - Sensors 1 and 2 Ion Beam Current Rates, Beam '+ $
            'Energies, and Instrument Status variables. In tenuous plasma '+ $
            'regions, the floating potential of a sunlit spacecraft is '+ $
            'positively charged, reaching up to tens of Volts. The '+ $
            'corresponding electric field disturbs the ambient plasma '+ $
            'measurements obtained from electron and ion sensors and the '+ $
            'large fluxes of attracted photo-electrons can significantly '+ $
            'reduce the lifetime of the micro-channel plate. The electric '+ $
            'field measurements can be also contaminated by the high '+ $
            'spacecraft potential values. The Active Spacecraft Potential '+ $
            'Control neutralizes the spacecraft potential by releasing '+ $
            'positively charged Indium ions. The ASPOCs neutralize the '+ $
            'electrical potential of the spacecraft, limiting or '+ $
            'eliminating spurious electric fields that can contaminate '+ $
            'measurements. This allows observations of the more '+ $
            'scientifically important low-energy ions and electrons.'

return,description

end

