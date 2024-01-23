
/^#	$/s/^.*$/	/

/^\[\]	$/s/^.*$/	/

/^Seconds	$/s/^.*$/s	/

/^MK	$/s/^.*$/MK	1.0e-6\&gt;\&#176;K/

/^Earth radii	$/s/^.*$/Re	6.3712e6\&gt;m/
/^Re	$/s/^.*$/Re	6.3712e6\&gt;m/
/^\[Re\]	$/s/^.*$/Re	6.3712e6\&gt;m/
/^RE	$/s/^.*$/Re	6.3712e6\&gt;m/

/^Rs	$/s/^.*$/Rs	5.8232e7\&gt;m/

/^Rv	$/s/^.*$/Rv	6.0518e6\&gt;m/

/^deg	$/s/^.*$/\&#176;	0.0174532925\&gt;rad/
/^Deg	$/s/^.*$/\&#176;	0.0174532925\&gt;rad/
/^Degrees	$/s/^.*$/\&#176;	0.0174532925\&gt;rad/
/^&#176;	$/s/^.*$/\&#176;	0.0174532925\&gt;rad/
/^10&#176;	$/s/^.*$/10\&#176;	0.00174532925\&gt;rad/
/^360\/254 &#176;	$/s/^.*$/(360\/254)\&#176;	127\/180\&gt/

/^deg per sec	$/s/^.*$/\&#176;\/s	0.0174532925\&gt;rad\/s/

/^rads\/sec	$/s/^.*$/rad\/s	/

/^(cm^2 s sr eV)^-1	$/s/^.*$/(cm^2 s sr eV)^-1	6.24161e-13\&gt;(m^2 s sr J)^-1/
/^(cm^2 s sr keV)^-1	$/s/^.*$/(cm^2 s sr keV)^-1	6.24161e-16\&gt;(m^2 s sr J)^-1/
/^(cm^2-s-sr-keV)^-1	$/s/^.*$/(cm^2 s sr keV)^-1	6.24161e-16\&gt;(m^2 s sr J)^-1/
/^cm^-2 s^-1 sr^-1 keV^-1	$/s/^.*$/(cm^2 s sr keV)^-1	6.24161e-16\&gt;(m^2 s sr J)^-1/
/^(cm^2 s sr keV\/e)^-1	$/s/^.*$/(cm^2 s sr keV\/q)^-1	6.24161e-16\&gt;(m^2 s sr J\/q)^-1/
/^(cm^2 s sr MeV)^-1	$/s/^.*$/(cm^2 s sr MeV)^-1	6.24161e-19\&gt;(m^2 s sr J)^-1/
/^1\/(m^2 s sr MeV)	$/s/^.*$/(cm^2 s sr MeV)^-1	6.24161e-19\&gt;(m^2 s sr J)^-1/
/^#\/cm^2\/s\/sr\/MeV	$/s/^.*$/(cm^2 s sr MeV)^-1	6.24161e-19\&gt;(m^2 s sr J)^-1/
/^(cm^2 s sr MeV\/n)^-1	$/s/^.*$/(cm^2 s sr MeV\/n)^-1	6.24161e-19\&gt;(m^2 s sr J\/n)^-1/
/^1\/(cm2 sec sr MeV\/n	$/s/^.*$/(cm^2 s sr MeV\/n)^-1	6.24161e-19\&gt;(m^2 s sr J\/n)^-1/
/^particles\/\[cm^2\*second\*steradian\*MeV\/nucleon\]	$/s/^.*$/(cm^2 s sr MeV\/n)^-1	6.24161e-19\&gt;(m^2 s sr J\/n)^-1/
/^1\/\[m\*\*2-sr-s-GeV\]	$/s/^.*$/(m^2 s sr GeV)^-1	6.24161e-26\&gt;(m^2 s sr J)^-1/
/^1\/\[m\*\*2-sr-s-GeV\/n\]	$/s/^.*$/(m^2 s sr GeV\/n)^-1	6.24161e-26\&gt;(m^2 s sr J\/n)^-1/

/^cm^-1	$/s/^.*$/cm^-1	1.0e2\&gt;m^-1/

/^(cm^2 s MeV)^-1	$/s/^.*$/(cm^2 s MeV)^-1	6.24161e-19\&gt;(m^2 s J)^-1/
/^cm!e-2!ns!e-1!nkeV!e-1!n	$/s/^.*$/(cm^2 s keV)^-1	6.24161e-16\&gt;(m^2 s J)^-1/

/^cm^2 sr	$/s/^.*$/cm^2 sr	1.0e-4\&gt;m^2 sr/
/^cm^3 sr	$/s/^.*$/cm^3 sr	1.0e-6\&gt;m^3 sr/

/^cm^2 sr^-1	$/s/^.*$/cm^2\/sr^-1	1.0e-4\&gt;/

/^(cm^2 s)^-1	$/s/^.*$/(cm^2 s)^-1	1.0e4\&gt;(m^2 s)^-1/
/^cm^-2 s^-1	$/s/^.*$/(cm^2 s)^-1	1.0e4\&gt;(m^2 s)^-1/
/^(cm^2 sr)^-1	$/s/^.*$/(cm^2 sr)^-1	1.0e4\&gt;(m^2 sr)/
/^(cm^2 s sr)^-1	$/s/^.*$/(cm^2 s sr)^-1	1.0e4\&gt;(m^2 s sr)/
/^(cm^2 s sr e^-1)^-1	$/s/^.*$/(cm^2 s sr q^-1)^-1	1.0e4\&gt;(m^2 s sr q^-1)^-1/

/^cm^-3 s^-1	$/s/^.*$/(cm^3 s)^-1	1.0e6\&gt;(m^3 s)^-1/
/^(cm^-3 s^-1)	$/s/^.*$/(cm^3 s)^-1	1.0e6\&gt;(m^3 s)^-1/
/^(cm^3 s)^-1	$/s/^.*$/(cm^3 s)^-1	1.0e6\&gt;(m^3 s)^-1/
/^(cm^-3 s^-1)^2	$/s/^.*$/(cm^3 s)^-2	1.0e12\&gt;(m^3 s)^-2/
/^(cm^3 s)^-2	$/s/^.*$/(cm^3 s)^-2	1.0e12\&gt;(m^3 s)^-2/

/^keV\/(cm^2 s sr keV)	$/s/^.*$/keV\/(cm^2 s sr keV)	1.0e4\&gt;J\/(m^2 s sr J)/
/^eV\/(cm^2 s sr eV)	$/s/^.*$/eV\/(cm^2 s sr eV)	1.0e4\&gt;J\/(m^2 s sr J)/
/^eV\/cm^2-s-sr-eV	$/s/^.*$/eV\/(cm^2 s sr eV)	1.0e4\&gt;J\/(m^2 s sr J)/

/^&#181;A	$/s/^.*$/\&#181;A	1.0e-6\&gt;A/
/^nA	$/s/^.*$/nA	1.0e-9\&gt;A/
/^7.03125 nA	$/s/^.*$/7.03125 nA	1\/7.03125\&gt;A/
/^pA	$/s/^.*$/pA	1.0e-12\&gt;A/

/^A cm^-2 Hz^-1\/2	$/s/^.*$/A\/(cm^2 Hz^1\/2)	1.0e4\&gt;A\/(m^2 Hz^1\/2)/
/^A\/h	$/s/^.*$/A\/h	3600\&gt;A\/s/

/^kHz	$/s/^.*$/kHz	1.0e3\&gt;Hz/
/^MHz	$/s/^.*$/MHz	1.0e-6\&gt;Hz/
/^10.0 kHz	$/s/^.*$/10 kHz	1.0e-4\&gt;Hz/

/^Raylieghs	$/s/^.*$/R	1.256637e-9\&gt;(m^2 s sr)^-1/
/^R	$/s/^.*$/R	1.256637e5\&gt;(m^2 s sr)^-1/
/^kR	$/s/^.*$/kR	1.256637e8\&gt;(m^2 s sr)^-1/
/^kRay	$/s/^.*$/kR	1.256637e8\&gt;(m^2 s sr)^-1/
/^Cleaned UV Intensity in kRay	$/s/^.*$/kR	1.256637e8\&gt;(m^2 s sr)^-1/

/^nT	$/s/^.*$/nT	1.0e-9\&gt;T/
/^nT\/Hz^1\/2	$/s/^.*$/nT\/Hz^1\/2	1.0e-9\&gt;T\/Hz^1\/2/
/^100 dB nT\/Hz^1\/2	$/s/^.*$/100 dB nT\/Hz^1\/2	1.0e-9\&gt;100 dB T\/Hz^1\/2/
/^100 dB T\/Hz^1\/2	$/s/^.*$/100 dB T\/Hz^1\/2	1.0\&gt;100 dB T\/Hz^1\/2/
/^1.0 &#215; 10^-15 T\/Hz^2	$/s/^.*$/1.0e-15 T\/Hz^2	1.0e-15\&gt;T\/Hz^2/
/^R_E nT^0.5	$/s/^.*$/nT^1\/2 Re	2.01475e2\&gt;m nT^1\/2/

/^0.01 V	$/s/^.*$/0.01 V	0.01\&gt;V/
/^-VOLTS	$/s/^.*$/-V	-1.0\&gt;V/
/^kV	$/s/^.*$/kV	1.0e3\&gt;V/
/^GV	$/s/^.*$/GV	1.0e9\&gt;V/

/^&#181;V\/m	$/s/^.*$/\&#181;V\/m	1.0e-6\&gt;V\/m/

/^mV\/m	$/s/^.*$/mV\/m	1.0e-3\&gt;V\/m/
/^mV\/m pT\/Hz	$/s/^.*$/mV\/m pT\/Hz	1.0e-15\&gt;V\/m T\/Hz/
/^0.01 mV\/m	$/s/^.*$/0.01 mV\/m	1.0e-5\&gt;V\/m/
/^3\/4 dB nV\/m	$/s/^.*$/3\/4 dB nV\/m	1.0e-9\&gt;3\/4 dB V\/m/

/^100 dB (&#181;V\/m)\/Hz^1\/2	$/s/^.*$/100 dB (\&#181;V\/m)\/Hz^1\/2	1.0e-6\&gt;100 dB (V\/m)\/Hz^1\/2/

/^V^2 m^-2 Hz^-1	$/s/^.*$/(V\/m)^2\/Hz	/

/^mW\/m^2	$/s/^.*$/mW\/m^2	1.0e-3\&gt;W\/m^2/
/^W cm^-2	$/s/^.*$/W\/cm^2	1.0e4\&gt;W\/m^2/
/^W cm^-2 Hz^-1	$/s/^.*$/W\/(cm^2 Hz)	1.0e4\&gt;W\/(m^2 Hz)/

/^GeV	$/s/^.*$/GeV	1.602176565e-10\&gt;J/
/^GeV\/n	$/s/^.*$/GeV\/n	1.602176565e-10\&gt;J\/n/
/^MeV	$/s/^.*$/MeV	1.602176565e-13\&gt;J/
/^MeV\/n	$/s/^.*$/MeV\/n	1.602176565e-13\&gt;J\/n/
/^MeV\/nucleon	$/s/^.*$/MeV\/n	1.602176565e-13\&gt;J\/n/
/^keV	$/s/^.*$/keV	1.602176565e-16\&gt;J/
/^\[keV\]	/s/^.*$/keV	1.602176565e-16\&gt;J/
/^keV\/e	$/s/^.*$/keV\/q	1.602176565e-16\&gt;J\/q/
/^keV\/q	$/s/^.*$/keV\/q	1.602176565e-16\&gt;J\/q/
/^keV\/n	$/s/^.*$/keV\/n	1.602176565e-16\&gt;J\/n/
/^eV	$/s/^.*$/eV	1.602176565e-19\&gt;J/
/^eV\/q	$/s/^.*$/eV\/q	1.602176565e-19\&gt;J\/q/

/^eV\/(cm^2 s sr)	$/s/^.*$/eV\/(cm^2 s sr)	1.602176565e-15\&gt;J\/(m^2 s sr)/
/^n\/(cm^2 s sr)	$/s/^.*$/(cm^2 s sr)^-1	1.0e4\&gt;(m^2 s sr)^-1/
/^MeV cm^2 sr	$/s/^.*$/cm^2 sr MeV	1.602176565e-17\&gt;J m^2 sr/

/^erg\/(cm^3 s)	$/s/^.*/erg\/(cm^3 s)	1.0e-1\&gt;J\/(m^3 s)/

/^e	$/s/^.*$/q	1.60217662e-19\&gt;C/

/^a	$/s/^.*$/a	31536000\&gt;s/

/^d	$/s/^.*$/d	86400\&gt;s/
/^Day of the year	$/s/^.*$/d	86400\&gt;s/

/^h	$/s/^.*$/h	3600\&gt;s/
/^hr	$/s/^.*$/h	3600\&gt;s/
/^Fractional Hour of Day	$/s/^.*$/h	3600\&gt;s/

/^min	$/s/^.*$/min	60\&gt;s/

/^0.1 s	$/s/^.*$/0.1 s	0.1\&gt;s/
/^2\/255 s	$/s/^.*$/2\/255 s	127.5\&gt;s/

/^ms	$/s/^.*$/ms	1.0e-3\&gt;s/

/^ns	$/s/^.*$/ns	1.0e-9\&gt;s/
/^nanoseconds	$/s/^.*$/ns	1.0e-9\&gt;s/

/^day-month-year hour:minute:second	$/s/^.*$/ns	1.0e-9\&gt;s/

/^MLT hours	$/s/^.*$/h	3600\&gt;s/
/^Re and MLT	$/s/^.*$/	/

/^(6 s)^-1	$/s/^.*$/(6 s)^-1	1\/6\&gt;s^-1/
/^(9 ms)^-1	$/s/^.*$/(9 ms)^-1	1000\/9\&gt;s^-1/

/^min^-1	$/s/^.*$/min^-1	1\/60\gt;s^-1/

/^pdyne-au\/cm^2	$/s/^.*/pdyn-ua\/cm^2	1.495978706961e1\&gt;J-m\/m^2/

/^ua	$/s/^.*$/ua	1.495978706961e11\&gt;m/
/^km	$/s/^.*$/km	1.0e3\&gt;m/
/^nm	$/s/^.*$/nm	1.0e-9\&gt;m/

/^1.0 &#215; 10^16 m^-2	$/s/^.*$/1.0e16 m^-2	1.0e16\&gt;m^2/

/^cm^-3	$/s/^.*$/cm^-3	1.0e6\&gt;m^-3/
/^\/cm^(-3)	$/s/^.*$/cm^-3	1.0e6\&gt;m^-3/
/^per cc	$/s/^.*$/cm^-3	1.0e6\&gt;m^-3/
/^0.01 cm^-3	$/s/^.*$/0.01 cm^-3	1.0e8\&gt;m^3/

/^log(cm^-3)	/s/^.*$/log(cm^-3)	(log(cm^-3)+6)\&gt;log(m^-3)/

/^cm^-3 (cm\/s)^-3	$/s/^.*$/cm^-3 (cm\/s)^-3	1\&gt;m^-3 (m\/s)^-3/

/^#\/s	$/s/^.*$/s^-1	/
/^&#181;V\/Hz^1\/2	$/s/^.*$/\&#181;V\/Hz^1\/2	1.0e-6\&gt;V\/Hz^-1\/2/
/^&#181;m	$/s/^.*$/\&#181;m	1.0e6\&gt;m/
/^mrad	$/s/^.*$/mrad	1.0e-3\&gt;rad/
/^&#181;rad	$/s/^.*$/\&#181;rad	1.0e-6\&gt;rad/
/^&#181;rad\/s	$/s/^.*$/\&#181;rad\/s	1.0e-6\&gt;rad\/s/
/^(&#181;V\/m)\/Hz^1\/2	$/s/^.*$/(\&#181;V\/m)\/Hz^1\/2	1.0e-6\&gt;(V\/m)\/Hz^1\/2/

/^km\/s	$/s/^.*$/km\/s	1.0e3\&gt;m\/s/
/^\(km\/s\)\/\(km\/s\)	/s/^.*$/	/
/^km per sec	$/s/^.*$/km\/s	1.0e3\&gt;m\/s/

/^nPa	$/s/^.*$/nPa	1.0e-9\&gt;Pa/
/^pPa	$/s/^.*$/pPa	1.0e-12\&gt;Pa/

/^bar	$/s/^.*$/bar	10e5\&gt;Pa/
/^mbar	$/s/^.*$/mbar	10e2\&gt;Pa/

/^Torr	$/s/^.*$/Torr	1.333224e+02\&gt;Pa/

##### /^dB	$/s/^.*$/dB	1.0\&gt;dB/
/^dBm	$/s/^.*$/dBm	1.0\&gt;dBm/

/^pT^2\/Hz	$/s/^.*$/pT^2\/Hz	1.0e-24\&gt;T^2\/Hz/
/^nT^2	$/s/^.*$/nT^2	1.0e-18\&gt;T^2/
/^nT^2\/Hz	$/s/^.*$/nT^2\/Hz	1.0e-18\&gt;T^2\/Hz/

/^nT V\/m Hz^-1	$/s/^.*$/(nT V\/m)\/Hz	1.0e-9\&gt;(T V\/m)\/Hz/

/^G	$/s/^.*$/G	1.0e-4\&gt;T/

/^nT R_E^2	$/s/^.*$/nT Re^2	4.05922e+4\&gt;T m^2/

/^G (Earth Radii)^3	$/s/^.*$/G Re^3	2.58621e+16\&gt;T m^3/

/^s^3\/cm^6	$/s/^.*$/s^3\/cm^6	1.0e12\&gt;s^3\/m^6/
/^s^3\/km^6	$/s/^.*$/s^3\/km^6	1.0e-18\&gt;s^3\/m^6/
/^s^3\ \/\ km^6	$/s/^.*$/s^3\/km^6	1.0e-18\&gt;s^3\/m^6/
/^s^3\/(km^3 cm^3)	$/s/^.*$/s^3\/(km^3 cm^3)	1.0e-3\&gt;s^3\/m^6/

/^u	$/s/^.*$/u	1.660538782(83)e-27\&gt;kg/

/^0, 1	$/s/^.*$/	/
/^00-32	$/s/^.*$/	/
/^32-bit error flags	$/s/^.*$/	/
/^(0=good)	$/s/^.*$/	/
/^(0=def)	$/s/^.*$/	/
/^(0=out,1=in)	$/s/^.*$/	/
/^(source level)	$/s/^.*$/	/
/^Cleaned UV Intensity in QLC Counts	$/s/^.*$/	/
/^QLC Counts	$/s/^.*$/	/
/^del-phi counts	$/s/^.*$/	/
/^energy index	$/s/^.*$/	/
/^sector index	$/s/^.*$/	/

/^LH:-1\/RH:+1	$/s/^.*$/	/

/^mV^2\/m^2\/Hz	$/s/^.*$/(mV\/m)^2\/Hz	1.0e-6\&gt;(V\/m)^2\/Hz/

/^counts\/sample	$/s/^.*$/	/

/^dimensionless	$/s/^.*$/	/

/^Re|&#176;|h	$/s/^.*$/Re|\&#176;|h	6.3712e6\&gt;m|0.0174532925\&gt;rad|3600\&gt;s/

/^Re|h	$/s/^.*$/Re|h	6.3712e6\&gt;m|3600\&gt;s/

/^#\/s-cm2-sr-eV	$/s/^.*$/(cm^2 s sr eV)^-1	6.24161e-13\&gt;(m^2 s sr J)^-1/
/^#\/s-cm2-sr-keV	$/s/^.*$/(cm^2 s sr keV)^-1	6.24161e-16\&gt;(m^2 s sr J)^-1/
/^1\/keV-sr-s-cm2	$/s/^.*$/(cm^2 s sr keV)^-1	6.24161e-16\&gt;(m^2 s sr J)^-1/
/^#\/s-cm2-sr-keV\/q	$/s/^.*$/(cm^2 s sr keV\/q)^-1	6.24161e-16\&gt;(m^2 s sr J\/q)^-1/
/^keV\/s-cm2-sr-keV	$/s/^.*$/keV\/(cm^2 s sr keV)	1.0e4\&gt;J\/(m^2 s sr J)/
/^keV\/s-cm2-sr-keV\/q	$/s/^.*$/keV\/(cm^2 s sr keV\/q)	1.0e4\&gt;J\/(m^2 s sr J\/q)/

/^cm!E-2!Nsr!E-1!Nsec!E-1!NkeV!E-1!N	$/s/^.*$/(cm^2 s sr keV)^-1	6.24161e-16\&gt;(m^2 s sr J)^-1/

/^cm!E-2!Nsr!E-1!Nsec!E-1!NMeV!E-1!N	$/s/^.*$/(cm^2 s sr MeV)^-1	6.24161e-19\&gt;(m^2 s sr J)^-1/

/^cm!E-2!Nsr!E-1!Nsec!E-1!N(keV\/nuc)!E-1!N	$/s/^.*$/(cm^2 s sr keV\/n)^-1	6.24161e-16\&gt;(m^2 s sr J\/n)^-1/

/^cm!E-2!Nsr!E-1!Nsec!E-1!N(MeV\/nuc)!E-1!N	$/s/^.*$/(cm^2 s sr MeV\/n)^-1	6.24161e-19\&gt;(m^2 s sr J\/n)^-1/

/^eV\/cm2-s-ster-eV	$/s/^.*$/eV\/(cm^2 s sr eV)	1.0e4\&gt;J\/(m^2 s sr J)/

/^keV\/nuc	$/s/^.*$/keV\/n	1.602176565e-16\&gt;J\/n/

/^counts s!E-1!N	$/s/^.*$/s^-1	/

/^Samples\/cycle	$/s/^.*$/samples\/cycle	/

/^segment	$/s/^.*$/	/

/^Volts^2\/Hz	$/s/^.*$/V^2\/Hz	/

/^# \/ pixel	$/s/^.*$/	/
/^#\/pixel	$/s/^.*$/	/
/^(\/cm2-s-sr-keV)^2	/s/^.*$/(cm^2 s sr eV)^-2	3.89577e-25\&gt;(m^2 s sr J)^-2/
/^Bin Number	$/s/^.*$/	/
/^ENAs\/(cm2 s sr keV)	/s/^.*$/(cm^2 s sr eV)^-1	6.24161e-13\&gt;(m^2 s sr J)^-1/

/^(All Qs) cm^{-3}	/s/^.*$/cm^-3	1.0e6\&gt;m^-3/
/^(Good Q) cm^{-3}	/s/^.*$/cm^-3	1.0e6\&gt;m^-3/
/^(Good Qs) cm^{-3}	/s/^.*$/cm^-3	1.0e6\&gt;m^-3/

/^(All Qs) km\/s	/s/^.*$/km\/s	1.0e3\&gt;m\/s/
/^(Good Q) km\/s	/s/^.*$/km\/s	1.0e3\&gt;m\/s/
/^(Good Qs) km\/s	/s/^.*$/km\/s	1.0e3\&gt;m\/s/

/^(All Qs) u\/e	/s/^.*$/u\/e	/
/^(Good Qs) u\/e	/s/^.*$/u\/e	/

/^(cm^2 s sr keV\/n)^-1	/s/^.*$/(cm^2 s sr keV\/n)^-1	6.24161e-16\&gt;(m^2 s sr J)^-1/

/^pA\*cm\*\*-2	/s/^.*$/pA\/cm^-2	1.0e-8\&gt;A\/m^2/

/^0 = good	/s/^.*$/	/
/^Arbitrary	/s/^.*$/	/
/^Normalized	/s/^.*$/	/
/^nT_mag\/nT_SCM	/s/^.*$/	/
/^Range	/s/^.*$/	/
/^Vin\/Vout	/s/^.*$/	/
/^index value	/s/^.*$/	/
/^samples\/cycle	/s/^.*$/	/

/^C\/s	/s/^.*$/s^-1	/
/^RPS	/s/^.*$/s^-1	/
/^Samples\/s	/s/^.*$/s^-1	/

/^cm^-6	/s/^.*$/cm^-6	1.0e12\&gt;m^-6/

/^mV	/s/^.*$/mV	1.0e-3\&gt;V/
/^mV RMS	/s/^.*$/mV	1.0e-3\&gt;V/

/^nT RMS	/s/^.*$/nT	1.0e-9\&gt;T/

/^radian	/s/^.*$/rad	/

/^&#176;\/s	$/s/^.*$/\&#176;\/s	0.0174532925\&gt;rad\/s/
/^&#176;C	$/s/^.*$/\&#176;C	\&#176;C+273.15\&gt;\&#176;K/
/^Db	$/s/^.*$/dB	/
/^DbM	$/s/^.*$/dBm	10^((dBm-30)\/10\)\&gt;W/
/^Dimensionless	$/s/^.*$/	/
/^Integer	$/s/^.*$/	/
/^Sec	$/s/^.*$/s	/
/^V	$/s/^.*$/V	/
/^V-dc	$/s/^.*$/V	/
/^amps\/hr	$/s/^.*$/A\/h	3600\&gt;A\/s/
/^c\/acc	$/s/^.*$/	/
/^cnts\/(cm\*\*2-ster-s)	$/s/^.*$/(cm^2 s sr)^-1	1.0e4\&gt;(m^2 s sr)/
/^cnts\/(cm\*\*2-ster-s-e	$/s/^.*$/(cm^2 s sr eV)^-1	6.24161e-13\&gt;(m^2 s sr J)^-1/
/^cnts\/(cm\*\*2-str-s)	$/s/^.*$/(cm^2 s sr)^-1	1.0e4\&gt;(m^2 s sr)/
/^cnts\/accum	$/s/^.*$/	/
/^coulombs	$/s/^.*$/C	/
/^cubic ft	$/s/^.*$/ft^3	0.02831685\&gt;m^3/
/^dB	$/s/^.*$/dB	/
/^deg(C)	$/s/^.*$/\&#176;C	\&#176;C+273.15\&gt;\&#176;K/
/^degrees C	$/s/^.*$/\&#176;C	\&#176;C+273.15\&gt;\&#176;K/
/^degrees F	$/s/^.*$/\&#176;F	(\&#176;F-32)\/1.8)+273.15\&gt;\&#176;K/
/^degrees K	$/s/^.*$/\&#176;K	/
/^degrees\/s	$/s/^.*$/\&#176;\/s	0.0174532925\&gt;rad\/s/
/^degrees\/sec	$/s/^.*$/\&#176;\/s	0.0174532925\&gt;rad\/s/
/^ergs\/(cm\*\*2-ster-s-e	$/s/^.*$/ergs\/(cm^2 s sr eV)	6.24161e+15\&gt;(m^2 s sr J)^-1/
/^feet	$/s/^.*$/ft	0.3048\&gt;m/
/^feet\/s	$/s/^.*$/ft\/s	0.3048\&gt;m\/s/
/^feet\/sec	$/s/^.*$/ft\/s	0.3048\&gt;m\/s/
/^feet\/sec\*\*2	$/s/^.*$/ft\/s^2	0.3048\&gt;m\/s^2/
/^integer	$/s/^.*$/	/
/^kilofeet	$/s/^.*$/1000 ft	304.8\&gt;m/
/^kilometer	$/s/^.*$/km	1.0e3\&gt;m/
/^log(Torr)	$/s/^.*$/Torr	133.3224\&gt;Pa/
/^m\/s\*\*2	$/s/^.*$/m\/s^2	/
/^meters\/s	$/s/^.*$/m\/s	/
/^meters\/sec	$/s/^.*$/m\/s	/
/^meters\/sec\*\*2	$/s/^.*$/m\/s^2	/
/^milli-g	$/s/^.*$/mGal	1.0e-5\&gt;m\/s^2/
/^milliamps	$/s/^.*$/mA	1.0e-3\&gt;A/
/^millimaps\/m	$/s/^.*$/mA\/m	1.0e-3\&gt;A\/m/
/^mm	$/s/^.*$/mm	1.0e-3\&gt;m/
/^nautical miles	$/s/^.*$/nautical mile	1852\&gt;m/
/^newtons	$/s/^.*$/N	/
/^ohms	$/s/^.*$/ohm	/
/^pascals	$/s/^.*$/Pa	/
/^rad	$/s/^.*$/rad	/
/^radians\/s	$/s/^.*$/rad\/s	/
/^radians\/s\*\*2	$/s/^.*$/rad\/s^2	/
/^radians\/sec	$/s/^.*$/rad\/s	/
/^sec\*\*3\/km\*\*6	$/s/^.*$/s^3\/km^6	1.0e9\&gt;s^3\/m^6/
/^uV\*\*2	$/s/^.*$/\&#181;V^2	1.0e-12\&gt;V^2/
/^uV\*\*2\/Hz	$/s/^.*$/\&#181;V^2\/Hz	1.0e-12\&gt;V^2\/Hz/
/^uamps	$/s/^.*$/\&#181;A	1.0e-6\&gt;A/
/^watts	$/s/^.*$/W	/
/^watts\/hr	$/s/^.*$/W\/h	3600\&gt;W\/s/
