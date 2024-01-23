
XML_PREFIX=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $1 }'`

DATA_PRODUCT_ID=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $2 }'`

MISSION_NAME=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $3 }'`

MISSION_NAME_ACRONYM=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $4 }'`

INSTRUMENT=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $5 }'`

INSTRUMENT_ACRONYM=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $6 }'`

INSTRUMENT_DETAIL=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $7 }'`

PROCESSING_LEVEL=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $8 }'`

PROCESSING_LEVEL_ACRONYM=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $9 }'`

TIME_RESOLUTION=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $10 }'`

RELATIVE_STOP_DATE=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $11 }'`

HYPHEN=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $12 }'`

PI_NAME=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $13 }'`

PI_INSTITUTION=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $14 }'`

XML_SUFFIX=`echo "$@" | awk 'BEGIN { FS="	" } ; { print $15 }'`

echo $XML_PREFIX"	"$DATA_PRODUCT_ID"	"$MISSION_NAME"	"$MISSION_NAME_ACRONYM"	"$INSTRUMENT"	"$INSTRUMENT_ACRONYM"	"$INSTRUMENT_DETAIL"	"$PROCESSING_LEVEL"	"$PROCESSING_LEVEL_ACRONYM"	"$TIME_RESOLUTION"	"$RELATIVE_STOP_DATE"	"$HYPHEN"	"$PI_NAME"	"$PI_INSTITUTION"	"$XML_SUFFIX | awk 'BEGIN { FS="	" } ; { printf "%-10s\t%-53s\t%-104s\t%-25s\t%-185s\t%-28s\t%-540s\t%-22s\t%-24s\t%-31s\t%-18s\t%-6s\t%-103s\t%-224s\t%-10s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15 }'

