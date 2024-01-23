
s/1\/4-1\/128s/0.0078125 sec/

s/1\/8-1\/8192s/0.125 sec/

s/^\ *//
s/^~//
s/1-minute Averages/1 min/
s/1-min/1 min/
s/8-sec/8 sec/
s/60-second/1 min/
s/5-min/5 min/
s/1\/16-8 Samples\/s/16 sec-0.125 sec/
s/\ -\ /-/
s/???//
s/[sS]econds/sec/g
s/minutes/min/
s/s$/\ sec/
s/\ \ /\ /
s/average sec/averages/
s/second/sec/g
s/min\./min/
s/minute resolution/min/
s/minute/min/g
s/4$/4 sec/
s/60 sec/1 min/
s/\ resolution//
s/s-/ sec-/
s/s,/sec-/
s/96sec or 384sec/96 sec-384 sec/
s/irregular, mostly 96 seconds/96 sec/
s/-\ /-/
s/1\.0\/71431\.0 sec//
s/\.0\ sec/ sec/
s/ times the value of spin_avg//
s/3 min 22 sec/202 sec/
s/6 sec or 12 sec, depending on TM rate/6 sec-12 sec/
s/320 msec/0.32 sec/
s/3s nominal/3 sec/
s/\ s\ avg/ sec/
s/3s\ typical/3 sec/
s/ to / min-/
s/(with few exceptions)//
s/1min, typical (3s occasional)/1 min-3 sec/
s/512 ms (science), 1 min (ephemeris)/512 msec/
s/Minute/min/
s/1\ m$/1 min/
s/1 m, 1 h/1 min, 1 hour/
s/hr/hour/
s/Hour/hour/
s/, /-/
s/\ S/ sec/
s/1\.0\/Sample_rate/0.064 sec/
s/1 sample/2 sec/
s/00:00:00.031/0.031 sec/
s/00:00:00.125/0.125 sec/
s/Spin averages/4 sec/
s/hourly averaged/1 hour/
s/See VAR_NOTES for Delta_T-below/128.8 sec/
s/See notes for Delta_T below\./128.8 sec/
s/Varying//
s/2\/8 min/2 min-8 min/
s/1\/4/0.25 sec/
s/1\/128/0.0078125 sec/
s/1\/256/0.00390625 sec/
s/1\/2/0.5 sec/
s/^1\/64 sec/0.015625 sec/
s/1\/512/0.00195312 sec/
s/1\/8192/0.000122070 sec/
s/1\/8/0.125 sec/
s/1\/16384/0.000061035 sec/
s/sec sec/sec/
s/^$/CadenceUnknown/
s/second/sec/

s/^1Hz$/1 sec/
s/^20Hz$/0.05 sec/
s/^32s$/32 sec/
s/^40s$/40 sec/
s/^4Hz$/0.25 sec/
s/^4s$/4 sec/

s/irregular, mostly 96 seconds/96s/

/[0-9]sec$/s/sec/ sec/

s/\ year/year/g
s/\ month/month/g
s/\ day/day/g
s/\ hour/hr/g
s/\ min/min/g
s/\ sec/s/g
s/\ msec/ms/g
s/\ ms/ms/g

s/irregular-mostly 96s/96s/

