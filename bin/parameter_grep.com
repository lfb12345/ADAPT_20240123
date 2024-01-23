
XML_FILE_NAME=$1

PARAMETER_KEY=$2

PARAMETER_KEY_NUM=`grep -c ^'         <ParameterKey>'$PARAMETER_KEY'</ParameterKey>'$ $XML_FILE_NAME`

PRODUCT_KEY=`grep ^'            <ProductKey>.*</ProductKey>'$ $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | tr 'A-Z' 'a-z'`

if [ $PARAMETER_KEY_NUM -eq 1 ]; then

   PRODUCT_KEY=`grep ^'            <ProductKey>.*</ProductKey>'$ $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }' | tr 'A-Z' 'a-z'`

   XML_LINE_NUM=`wc -l $XML_FILE_NAME | awk '{ print $1 }'`

   HEAD_NUM=`grep -n ^'         <ParameterKey>'$PARAMETER_KEY'</ParameterKey>$' $XML_FILE_NAME | awk 'BEGIN { FS=":" } ; { print $1 }'`

   PARAMETER_LINE_NUM_000=`head -$HEAD_NUM $XML_FILE_NAME | grep -n ^'      <Parameter>'$ | tail -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

   TAIL_NUM=$((XML_LINE_NUM-PARAMETER_LINE_NUM_000+1))

   TAIL_NUM=`tail -$TAIL_NUM $XML_FILE_NAME | grep -n ^'      </Parameter>'$ | head -1 | awk 'BEGIN { FS=":" } ; { print $1 }'`

   HEAD_NUM=$((HEAD_NUM+TAIL_NUM-3))

   head -$HEAD_NUM $XML_FILE_NAME | tail -$TAIL_NUM >& parameter_grep_$$.xml

   UNITS=`grep ^'         <Units>.*</Units>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   UNITS_CONVERSION=`grep ^'         <UnitsConversion>.*</UnitsConversion>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   NAME=`grep ^'         <Name>.*</Name>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   DESCRIPTION=`grep ^'         <Description>.*</Description>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   MEASUREMENT_TYPE=`grep ^'      <MeasurementType>.*</MeasurementType>'$ $XML_FILE_NAME | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   FIELD_NUM=`grep -c ^'         <Field>'$ parameter_grep_$$.xml`

   PARTICLE_NUM=`grep -c ^'         <Particle>'$ parameter_grep_$$.xml`

   SUPPORT_NUM=`grep -c ^'         <Support>'$ parameter_grep_$$.xml`

   WAVE_NUM=`grep -c ^'         <Wave>'$ parameter_grep_$$.xml`

   TYPE=''

   if [ $FIELD_NUM -eq 1 ]; then

      PARAMETER_KEYWORD=Field

      QUANTITY=`grep ^'            <FieldQuantity>.*</FieldQuantity>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   fi

   if [ $PARTICLE_NUM -eq 1 ]; then

      PARAMETER_KEYWORD=Particle

      TYPE=`grep ^'            <ParticleType>.*</ParticleType>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

      QUANTITY=`grep ^'            <ParticleQuantity>.*</ParticleQuantity>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   fi

   if [ $SUPPORT_NUM -eq 1 ]; then

      PARAMETER_KEYWORD=Support

      QUANTITY=`grep ^'            <SupportQuantity>.*</SupportQuantity>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   fi

   if [ $WAVE_NUM -eq 1 ]; then

      PARAMETER_KEYWORD=Wave

      TYPE=`grep ^'            <WaveType>.*</WaveType>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

      QUANTITY=`grep ^'            <WaveQuantity>.*</WaveQuantity>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   fi

   QUALIFIER=`grep ^'            <Qualifier>.*</Qualifier>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   INSTRUMENT_ID=`grep ^'         <InstrumentID>.*</InstrumentID>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   COORDINATE_REPRESENTATION=`grep ^'            <CoordinateRepresentation>.*</CoordinateRepresentation>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   COORDINATE_SYSTEM_NAME=`grep ^'            <CoordinateSystemName>.*</CoordinateSystemName>'$ parameter_grep_$$.xml | awk 'BEGIN { FS="[<>]" } ; { print $3 }'`

   echo $PRODUCT_KEY'	'$PARAMETER_KEY'	'$UNITS'	'$UNITS_CONVERSION'	'$NAME'	'$DESCRIPTION'	'$MEASUREMENT_TYPE'	'$PARAMETER_KEYWORD'	'$TYPE'	'$QUANTITY'	'$QUALIFIER'	'$INSTRUMENT_ID'		'$COORDINATE_SYSTEM_NAME'	'$COORDINATE_REPRESENTATION'				'

   rm parameter_grep_$$.xml

else

   echo $PRODUCT_KEY'	'$PARAMETER_KEY'																	'

fi

