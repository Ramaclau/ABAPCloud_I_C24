@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS with Parameters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcds_02_param_957 
    with parameters
      pAirline : abap.char(3),
      pCurrencyCode : abap.cuky
    as select from /DMO/I_Flight
{
  key AirlineID,
  key ConnectionID,
  key FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  Price,
  CurrencyCode,
  PlaneType,
  MaximumSeats,
  OccupiedSeats,
  ZZTest,
  /* Associations */
  _Airline,
  _Connection,
  _Currency  
}
where
    AirlineID = $parameters.pAirline and CurrencyCode = $parameters.pCurrencyCode;
 