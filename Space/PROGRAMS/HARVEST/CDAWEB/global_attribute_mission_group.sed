
s/(.*//

s/^\ *//
s/\ *$//

s/ALOUETTE/Alouette/

s/POLAR/Polar/

s/VOYAGER/Voyager/

s/\\$//

s/^XXX\ //

/^Geosynchronous Investigations>GOES5 XXX !___Magnetospheric Data$/s/^.*$/GOES5 XXX !___Magnetospheric Data XXX !___Geosynchronous Investigations/
/^Geosynchronous Investigations>GOES6 XXX !___Magnetospheric Data$/s/^.*$/GOES6 XXX !___Magnetospheric Data XXX !___Geosynchronous Investigations/
/^Geosynchronous Investigations>GOES12 XXX !___Magnetospheric Data$/s/^.*$/GOES12 XXX !___Magnetospheric Data XXX !___Geosynchronous Investigations/
/^Geosynchronous Investigations>LANL XXX !___Magnetospheric Data$/s/^.*$/LANL XXX !___Geosynchronous Investigations/

