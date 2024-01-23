
pro spase_xml_tag_open,spase_version,spase_xml,preview=preview

spase_xml(0)='<?xml version="'+spase_version.xml_version_num+'" encoding="UTF-8" standalone="yes"?>

spase_xml(1)='<Spase xmlns="http://www.spase-group.org/data/schema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.spase-group.org/data/schema http://www.spase-group.org/data/schema/spase-'+spase_version.version_num+'.xsd">'

if (not keyword_set(preview)) then printf,10,spase_xml(0)

if (not keyword_set(preview)) then printf,10,spase_xml(1)

return

end

