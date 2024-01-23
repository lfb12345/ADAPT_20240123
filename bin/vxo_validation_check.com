
VERSION=$1

FILE_NAME=$2

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

printf "%s\n\n%s\t%s\n\n" $DASHES 'SPASE Validation Check:' $FILE_NAME

#ode /Users/astropooch/Space/SPASE/TOOLS_190520/resource-tools-node-master/src/validate.js -s http://spase-group.org/data/model/schema/spase-$VERSION.xsd $FILE_NAME | sed 's/^\ \ *//' | grep xml

node /Users/astropooch/Space/SPASE/TOOLS_190520/resource-tools-node-master/src/validate.js -s /Users/astropooch/Space/SPASE/VERSION/SCHEMA/SPASE_$VERSION/spase-$VERSION.xsd $FILE_NAME | grep xml | sed 's/^\ \ *//' | sed 's/^OK:\ /SPASE OK, Yataaaaa !!!:	/' | sed 's/^INVALID/SPASE Metadata Invalid/'

echo

#ode /Users/astropooch/Space/SPASE/TOOLS_190520/resource-tools-node-master/src/validate.js -s http://spase-group.org/data/model/schema/spase-$VERSION.xsd $FILE_NAME | sed 's/^\ \ *//' | grep -v xml

node /Users/astropooch/Space/SPASE/TOOLS_190520/resource-tools-node-master/src/validate.js -s /Users/astropooch/Space/SPASE/VERSION/SCHEMA/SPASE_$VERSION/spase-$VERSION.xsd $FILE_NAME | grep -v xml | grep -v ^$ | sed 's/^\ \ *//'

LINE_NUM=`node /Users/astropooch/Space/SPASE/TOOLS_190520/resource-tools-node-master/src/validate.js -s /Users/astropooch/Space/SPASE/VERSION/SCHEMA/SPASE_$VERSION/spase-$VERSION.xsd $FILE_NAME | sed 's/^\ \ *//' | grep -v xml | grep -v ^$ | wc -l | awk '{ print $1 }'`

if [ $LINE_NUM != 0 ]; then echo; fi

printf "%s\n" $DASHES

