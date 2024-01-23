
function populate_instrument,spase_ontology,station_info,resource_info, $
                             instrument_num,verbose=verbose

instrument=spase_model_create(spase_ontology,'instrument',/verbose, $
                              /keyword_end_date,/keyword_measured, $
                              /keyword_field)

role_list=['','ArchiveSpecialist','Co-Investigator','DataProducer', $
           'Deputy-PI','GeneralContact','MetadataContact', $
           'PrincipalInvestigator','ProjectScientist','Scientist', $
           'TeamLeader','TeamMember','TechnicalContact']

instrument_type_list=['','Antenna','Channeltron','Coronograph','DoubleSphere', $
                      'ElectronDriftInstrument','ElectrostaticAnalyser', $
                      'EnergeticParticleInstrument','Ephemeris','FaradayCup', $
                      'FluxFeedback','FourierTransform','Spectrograph', $
                      'Geiger-MuellerTube','Imager','ImagingSpectrometer', $
                      'Interferometer','LangmuirProbe','LongWire', $
                      'Magnetometer','MassSpectrometer','MicrochannelPlate', $
                      'MultispectralImager','NeutralAtomImager', $
                      'ParticleCorrelator','ParticleDetector','Photometer', $
                      'Photopolarimeter','ProportionalCounter', $
                      'QuadrisphericalAnalyser','Radar','Radiometer', $
                      'ResonanceSounder','RetardingPotentialAnalyser', $
                      'Riometer','Scintillation','Detector','SearchCoil', $
                      'Sounder','SpacecraftPotentialControl', $
                      'SpectralPowerReceiver','Spectrometer','Time-of-flight', $
                      'Unspecified','WaveformReceiver']

instrument.resource_id=station_info.instrument(instrument_num).resource_id

instrument.resource_header.resource_name= $
   'The '+station_info.name+' Fluxgate '+ $
   station_info.instrument(instrument_num).type+' Instrument.'

if (station_info.alternate_name ne '') then $
   instrument.resource_header.alternate_name= $
      'The '+station_info.alternate_name+' Fluxgate '+ $
      station_info.instrument(instrument_num).type+' Instrument.'

instrument.resource_header.release_date=station_info.release_date

instrument.resource_header.expiration_date=station_info.expiration_date

instrument.resource_header.description=$
   'The Fluxgate '+station_info.instrument(instrument_num).type+ $
   ' instrument at the '+station_info.name+' geomagnetic observatory.'

instrument.resource_header.acknowledgement= $
   station_info.instrument(instrument_num).acknowledgement

for loop=0,n_elements(station_info.contact)-1 do begin

    if (station_info.instrument(instrument_num).contact(loop).resource_id ne $
        '') then begin

       instrument.resource_header.contact(loop).person_id= $
          station_info.instrument(instrument_num).contact(loop).resource_id

       instrument.resource_header.contact(loop).role(0)= $
       role_list(station_info.instrument(instrument_num).contact(loop).role_num)

    endif

endfor

for loop=0,n_elements(station_info.instrument_information_url)-1 do begin

    instrument.resource_header.information_url(loop).name= $
       'The '+station_info.observatory_name+' geomagnetic observatory web site.'

    instrument.resource_header.information_url(loop).url= $
       station_info.instrument_information_url(loop).url
    
    instrument.resource_header.information_url(loop).description= $
       'The '+station_info.observatory_name+' geomagnetic observatory web site.'
       
endfor

;nstrument.resource_header.information_url.name= $
;  'The '+station_info.name+' '+ $
;  station_info.instrument(instrument_num).type+' web site'

;nstrument.resource_header.information_url.url= $
;  station_info.instrument(instrument_num).url

;nstrument.resource_header.information_url.description= $
;  'The '+station_info.name+' '+ $
;  station_info.instrument(instrument_num).type+' web site'

instrument.resource_header.association_id= $
   'spase://SMWG/Observatory/'+station_info.observatory_name_conditioned

instrument.resource_header.prior_id=''

instrument.instrument_type=station_info.instrument(instrument_num).type

instrument.investigation_name='The '+resource_info.project+' Magnetometer Array'

instrument.observatory_id= $
   'spase://SMWG/Observatory/'+station_info.observatory_name_conditioned

instrument.caveats=''

return,instrument

end

;  <Instrument>
;     <ResourceID>spase://SMWG/Instrument/Hermanus/Magnetometer</ResourceID>
;     <ResourceHeader>
;        <ResourceName>Hermanus Magnetometer Instrument</ResourceName>
;        <ReleaseDate>2008-08-22T23:39:22.000</ReleaseDate>
;        <Description>The Magnetometer instrument at the Hermanus geomagnetic observatory</Description>
;        <Acknowledgement>Please acknowledge Pieter Kotze, Hermanus Magnetic Observatory, P.O. Box 32 (Hermanus, South Africa 7200) for use of data from the Hermanus Magnetometer instrument.</Acknowledgement>
;        <Contact>
;           <PersonID>spase://SMWG/Person/Pieter.Kotze</PersonID>
;           <Role>PrincipalInvestigator</Role>
;        </Contact>
;        <Contact>
;           <PersonID>spase://SMWG/Person/Lee.Frost.Bargatze</PersonID>
;           <Role>MetadataContact</Role>
;        </Contact>
;        <InformationURL>
;           <Name>The Hermanus Magnetometer web site</Name>
;           <URL></URL>
;           <Description>The Hermanus Magnetometer web site</Description>
;        </InformationURL>
;        <AssociationID>spase://SMWG/Observatory/Hermanus</AssociationID>
;     </ResourceHeader>
;     <InstrumentType>Magnetometer</InstrumentType>
;     <InvestigationName></InvestigationName>
;     <ObservatoryID>spase://SMWG/Observatory/Hermanus</ObservatoryID>
;  </Instrument>

