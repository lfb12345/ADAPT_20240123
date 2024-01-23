
DASHES='+'$(printf "%0.s-" $(seq 1 130))'+'

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-het-rates10_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-het-rates10_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-het-rates300_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-het-rates300_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-het-rates3600_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-het-rates3600_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-het-rates60_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-het-rates60_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-let1-rates10_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-let1-rates10_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-let1-rates300_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-let1-rates300_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-let1-rates3600_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-let1-rates3600_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-let1-rates60_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-let1-rates60_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-let2-rates10_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-let2-rates10_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-let2-rates300_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-let2-rates300_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-let2-rates3600_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-let2-rates3600_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-let2-rates60_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-let2-rates60_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epihi_l2-second-rates_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois-epihi_l2-second-rates_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epilo_l2-ic_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_001/cdaweb_psp_isois-epilo_l2-ic_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois-epilo_l2-pe_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_001/cdaweb_psp_isois-epilo_l2-pe_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois_l2-ephem_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois_l2-ephem_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

diff XML_20210609_PSP_ISOIS_20210726/cdaweb_psp_isois_l2-summary_yyyymmdd.xml XML_20210609_PSP_ISOIS_20210727_000/cdaweb_psp_isois_l2-summary_yyyymmdd.xml

printf "\n%s\n\n" $DASHES

