
XML_FILE_NAME=$1

PARAMETER_KEY_LIST=`grep ^'         <ParameterKey>' $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

for PARAMETER_KEY in $PARAMETER_KEY_LIST

do

    parameter_grep.com $XML_FILE_NAME $PARAMETER_KEY

done

