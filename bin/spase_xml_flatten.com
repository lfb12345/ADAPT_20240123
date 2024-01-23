
FILE_NAME=$1

RANDOM_NUMBER=$RANDOM

grep -v "<\!\-\-.*\-\->" $FILE_NAME | sed 's/><\//>|<\//g' | sed 's/	/ /g' | sed 's///g' | sed 's/^\ */ /g' | sed 's/\ *$/ /g' | sed 's/>\ */>/g' | sed 's/\ *<\//<\//g' | grep -v ^"\ *"$ | tr -d '\n' | sed 's/^\ </</' | sed 's/> </></g' | sed 's/  */\ /g' | awk 'BEGIN { FS="><" } { for (i=1; i<=NF; i++ ) print "<"$i">" }' | sed 's/>|<\//><\//g' | sed 's/^<</</' | sed 's/>>$/>/' | sed 's/>\ />/' | sed 's/\ </</' | sed 's/\ \ *\/>$/\/>/' | grep -v "\/>"$ | sed "s/['‘’]/\&apos;/g" | sed 's/[“”]/\&quot;/g' | sed 's/∕/\//g' | sed 's/ﬂ/fl/g' | sed 's/ﬁ/fi/g' | sed 's/–/-/g' > spase_xml_flatten_$RANDOM_NUMBER"_"$$.xml

mv spase_xml_flatten_$RANDOM_NUMBER"_"$$.xml $FILE_NAME

