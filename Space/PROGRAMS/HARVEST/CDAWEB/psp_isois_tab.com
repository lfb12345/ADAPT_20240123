
XML_FILE_NAME=$1

sed -f psp_isois_tab.sed $XML_FILE_NAME | sed -e "/^         <Description>\* .*\.$/a\\
'XXX'" | sed "s/^'XXX'$//" | sed '/^         <Description>\* .*\.$/s/\*\ //' &> psp_isois_tab_$$.xml

mv psp_isois_tab_$$.xml $XML_FILE_NAME

