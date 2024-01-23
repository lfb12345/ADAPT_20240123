
function mms_dsp_description,data_product_name

data_product_name_split=strsplit(data_product_name,'_',/extract)

mms_spacecraft=data_product_name_split(0)

mms_spacecraft_num=strmid(data_product_name_split(0),3,1)

data_type=data_product_name_split(4)

if (data_type eq 'bpsd') then $
   description= $
      'The MMS magnetic field power spectral density (BPSD) is computed '+ $
      'onboard by the Digital Signal Processor (DSP). The fast Fourier '+ $
      'transform (FFT) calculation is performed on a digitized version of '+ $
      'analog signals from the Search Coil Magnetometer (SCM) in the SCM123 '+ $
      'coordinate system (scm1 = - x sensor; scm2 = -z sensor; scm3 = -y '+ $
      'sensor). This data product is computed in space from individual '+ $
      'components that are not synchronized to the 1 second pulse. '+ $
      'Therefore, the timing between channels can be inaccurate by a '+ $
      'fraction of a second. The samples times are interval start times '+ $
      'taken from the x component. The spectra are calculated via a '+ $
      '1024-point FFT algorithm on piecewise continuous sets of waveform '+ $
      'data. Nine signals can be processed simultaneously. Six of the '+ $
      'twelve DC-coupled E, DC-coupled V, or SCM signals (16384 samples/s) '+ $
      'are selected for spectral processing at 100% duty cycle. In '+ $
      'addition, the three AC-coupled signals (262,144 kS/s) each can be '+ $
      'processed at 6.25% duty cycle. Each of the nine signals has 16, '+ $
      '1024-point FFT operations every second; the field-programmable gate '+ $
      'array (FPGA) performs 144 FFTs per second. The FFT is performed by '+ $
      'an arithmetic logic unit (ALU), which is controlled by a state '+ $
      'machine. Both are hard-coded into the FPGA. The operation starts by '+ $
      'applying a 1024-point Hanning window onto a waveform. Next, an FFT '+ $
      'is implemented. The FFT is broken into a series of '+ $
      '&quot;butterfly&quot; operations performed by the ALU. The result '+ $
      'has real and imaginary data. Power spectra are calculated by taking '+ $
      'the sum of squares of real and imaginary values (the ALU includes a '+ $
      'multiplier), which produces a power spectrum with 512 frequency '+ $
      'bins. The frequency bins are then combined to give '+ $
      'pseudo-logarithmic frequency spacing (del f)/f. The spectra are '+ $
      'reduced to 88 frequency bins with (del f)/f between 6% and 12% when '+ $
      'possible. Narrow-band emissions can be fit to an accuracy of '+ $
      '(del f)/f ~3%, allowing for an accurate determination of plasma '+ $
      'density. The spectra can be averaged in time. The fastest reporting '+ $
      'rate of any signal is 16 spectra per second. Reporting rates can be '+ $
      'as slow a one spectra every 16 s (averaging 256 spectra). The '+ $
      'averaging process has 48-bit accuracy to maximize the dynamic range. '+ $
      'The amplitudes undergo a pseudo-logarithmic compression to an 8-bit '+ $
      'number representing over 120 dB of dynamic range at ~5% precision.'

if (data_type eq 'epsd') then $
   description= $
      'The MMS electric field power spectral density (EPSD) is computed '+ $
      'onboard by the Digital Signal Processor (DSP). The fast Fourier '+ $
      'transform (FFT) calculation is performed on a digitized version of '+ $
      'analog signals from the Axial Double Probe (ADP) and Spin-Plane '+ $
      'Double Probe (SDP). This data product is computed in space from '+ $
      'individual components that are not synchronized to the 1 second '+ $
      'pulse. Therefore, the timing between channels can be inaccurate by a '+ $
      'fraction of a second. The samples times are interval start times '+ $
      'taken from the x component. The spectra are calculated via a '+ $
      '1024-point FFT algorithm on piecewise continuous sets of waveform '+ $
      'data. Nine signals can be processed simultaneously. Six of the '+ $
      'twelve DC-coupled E, DC-coupled V, or SCM signals (16384 samples/s) '+ $
      'are selected for spectral processing at 100% duty cycle. In '+ $
      'addition, the three AC-coupled signals (262,144 kS/s) each can be '+ $
      'processed at 6.25% duty cycle. Each of the nine signals has 16, '+ $
      '1024-point FFT operations every second; the field-programmable gate '+ $
      'array (FPGA) performs 144 FFTs per second. The FFT is performed by '+ $
      'an arithmetic logic unit (ALU), which is controlled by a state '+ $
      'machine. Both are hard-coded into the FPGA. The operation starts by '+ $
      'applying a 1024-point Hanning window onto a waveform. Next, an FFT '+ $
      'is implemented. The FFT is broken into a series of '+ $
      '&quot;butterfly&quot; operations performed by the ALU. The result '+ $
      'has real and imaginary data. Power spectra are calculated by taking '+ $
      'the sum of squares of real and imaginary values (the ALU includes a '+ $
      'multiplier), which produces a power spectrum with 512 frequency '+ $
      'bins. The frequency bins are then combined to give '+ $
      'pseudo-logarithmic frequency spacing (del f)/f. The spectra are '+ $
      'reduced to 56 frequency bins with (del f)/f between 6% and 12% when '+ $
      'possible. Narrow-band emissions can be fit to an accuracy of '+ $
      '(del f)/f ~3%, allowing for an accurate determination of plasma '+ $
      'density. The spectra can be averaged in time. The fastest reporting '+ $
      'rate of any signal is 16 spectra per second. Reporting rates can be '+ $
      'as slow a one spectra every 16 s (averaging 256 spectra). The '+ $
      'averaging process has 48-bit accuracy to maximize the dynamic range. '+ $
      'The amplitudes undergo a pseudo-logarithmic compression to an 8-bit '+ $
      'number representing over 120 dB of dynamic range at ~5% precision.'

if (data_type eq 'swd') then $
   description= $
      'The Solitary Wave Detector (SWD) is a fairly new approach to '+ $
      'observing plasma structures such as electron phase-space holes. Its '+ $
      'intention is to detect structures that are associated with magnetic '+ $
      'reconnection.  The solitary structure detector examines of the time '+ $
      'series data from one of the AC-coupled channels, planned to be '+ $
      'E12ac. The algorithm is fairly basic. A window of data is examined '+ $
      'periodically. The size of the window, planned to be ~1 ms of data, '+ $
      'can be configured. The average average of the data within the window '+ $
      'is calculated and subtracted from the original data in the window. '+ $
      'The variation is estimated by averaging the absolute values all of '+ $
      'the points in the window, x(1:n), where x is a set of n data values '+ $
      'in the window. Mathematically, this differs from a true standard '+ $
      'deviation. If x is random noise, this average is equal to ~0.8; '+ $
      'whereas if x is sinusoidal, the value would be equal to ~0.9. If the '+ $
      'peak amplitude of x exceeds the variation of x by a factor of four, '+ $
      'a solitary structure is considered to be in the window. One of four '+ $
      'counters is incremented depending on the peak value in the window. '+ $
      'The amplitude range of each of the counters can be configured. In '+ $
      'the initial configuration, the lowest amplitude counter includes all '+ $
      'structures with x peak less than ~1 mV/m. The next counters include '+ $
      'structures with ~1 mV/m but less than ~10 mV/m, ~10 mV/m but less '+ $
      'than ~100 mV/m, and greater than ~100 mV/m. The counters are '+ $
      'reported and zeroed periodically (planned once every 10 seconds) and '+ $
      'can be used as burst triggers or as indicators of strong kinetic '+ $
      'activity in the plasma. Even though the solitary wave detector is '+ $
      'inexact, the results show a good correlation with electron '+ $
      'phase-space holes; high counts rates were seen when electron '+ $
      'phase-space holes were present and low count rates correlated with '+ $
      'the absence of electron phase-space holes.'

return,description

end

