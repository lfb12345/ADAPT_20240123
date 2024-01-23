
DASHES="+"$(printf "%0.s-" $(seq 1 273))"+"

printf "%s\n\n" $DASHES

echo Old File Name: NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/HET/Level2/Rates/PT10S.xml

echo

echo New File Name: DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/HET/Level2/Rates/PT10S.xml

printf "\n%s\n\n" $DASHES

diff NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/HET/Level2/Rates/PT10S.xml DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/HET/Level2/Rates/PT10S.xml

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/HET/Level2/Rates/PT1H.xml

echo

echo New File Name: DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/HET/Level2/Rates/PT1H.xml

printf "\n%s\n\n" $DASHES

diff NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/HET/Level2/Rates/PT1H.xml DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/HET/Level2/Rates/PT1H.xml

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/HET/Level2/Rates/PT1M.xml

echo

echo New File Name: DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/HET/Level2/Rates/PT1M.xml

printf "\n%s\n\n" $DASHES

diff NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/HET/Level2/Rates/PT1M.xml DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/HET/Level2/Rates/PT1M.xml

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET1/Level2/Rates/PT10S.xml

echo

echo New File Name: DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET1/Level2/Rates/PT10S.xml

printf "\n%s\n\n" $DASHES

diff NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET1/Level2/Rates/PT10S.xml DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET1/Level2/Rates/PT10S.xml

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET1/Level2/Rates/PT1H.xml

echo

echo New File Name: DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET1/Level2/Rates/PT1H.xml

printf "\n%s\n\n" $DASHES

diff NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET1/Level2/Rates/PT1H.xml DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET1/Level2/Rates/PT1H.xml

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET1/Level2/Rates/PT1M.xml

echo

echo New File Name: DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET1/Level2/Rates/PT1M.xml

printf "\n%s\n\n" $DASHES

diff NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET1/Level2/Rates/PT1M.xml DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET1/Level2/Rates/PT1M.xml

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET2/Level2/Rates/PT10S.xml

echo

echo New File Name: DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET2/Level2/Rates/PT10S.xml

printf "\n%s\n\n" $DASHES

diff NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET2/Level2/Rates/PT10S.xml DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET2/Level2/Rates/PT10S.xml

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET2/Level2/Rates/PT1H.xml

echo

echo New File Name: DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET2/Level2/Rates/PT1H.xml

printf "\n%s\n\n" $DASHES

diff NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET2/Level2/Rates/PT1H.xml DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET2/Level2/Rates/PT1H.xml

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET2/Level2/Rates/PT1M.xml

echo

echo New File Name: DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET2/Level2/Rates/PT1M.xml

printf "\n%s\n\n" $DASHES

diff NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET2/Level2/Rates/PT1M.xml DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/LET2/Level2/Rates/PT1M.xml

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/Level2/MergedRates/PT1S.xml

echo

echo New File Name: DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/Level2/MergedRates/PT1S.xml

printf "\n%s\n\n" $DASHES

diff NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/Level2/MergedRates/PT1S.xml DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Hi/Level2/MergedRates/PT1S.xml

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Lo/Level2/IonComposition/PT1M.xml

echo

echo New File Name: DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Lo/Level2/IonComposition/PT1M.xml

printf "\n%s\n\n" $DASHES

diff NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Lo/Level2/IonComposition/PT1M.xml DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/EPI-Lo/Level2/IonComposition/PT1M.xml

printf "\n%s\n" $DASHES

printf "%s\n\n" $DASHES

echo Old File Name: NASA/NumericalData/ParkerSolarProbe/ISOIS/Merged/Level2/Summary/PT1M.xml

echo

echo New File Name: DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/Merged/Level2/Summary/PT1M.xml

printf "\n%s\n\n" $DASHES

diff NASA/NumericalData/ParkerSolarProbe/ISOIS/Merged/Level2/Summary/PT1M.xml DELIVERY/PARKER_SOLAR_PROBE/XML_20210607/NASA/NumericalData/ParkerSolarProbe/ISOIS/Merged/Level2/Summary/PT1M.xml

printf "\n%s\n" $DASHES

