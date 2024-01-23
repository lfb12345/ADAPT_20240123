
DASHES="+"$(printf "%0.s-" $(seq 1 273))"+"

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-het-rates10_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-het-rates10_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-het-rates10_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-het-rates10_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-het-rates300_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-het-rates300_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-het-rates300_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-het-rates300_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-het-rates3600_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-het-rates3600_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-het-rates3600_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-het-rates3600_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-het-rates60_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-het-rates60_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-het-rates60_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-het-rates60_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let1-rates10_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let1-rates10_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let1-rates10_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let1-rates10_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let1-rates300_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let1-rates300_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let1-rates300_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let1-rates300_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let1-rates3600_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let1-rates3600_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let1-rates3600_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let1-rates3600_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let1-rates60_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let1-rates60_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let1-rates60_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let1-rates60_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let2-rates10_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let2-rates10_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let2-rates10_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let2-rates10_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let2-rates300_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let2-rates300_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let2-rates300_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let2-rates300_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let2-rates3600_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let2-rates3600_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let2-rates3600_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let2-rates3600_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let2-rates60_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let2-rates60_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-let2-rates60_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-let2-rates60_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-second-rates_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-second-rates_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epihi_l2-second-rates_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epihi_l2-second-rates_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epilo_l2-ic_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epilo_l2-ic_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epilo_l2-ic_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epilo_l2-ic_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epilo_l2-pe_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epilo_l2-pe_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois-epilo_l2-pe_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois-epilo_l2-pe_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois_l2-ephem_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois_l2-ephem_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois_l2-ephem_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois_l2-ephem_00000000_v01.metadata

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois_l2-summary_00000000_v01.metadata

echo

echo New File Name: /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois_l2-summary_00000000_v01.metadata

printf "\n%s\n\n" $DASHES

diff /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210204/NEW/psp_isois_l2-summary_00000000_v01.metadata /Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/MASTERS_20210609/NEW/psp_isois_l2-summary_00000000_v01.metadata

printf "\n%s\n" $DASHES

