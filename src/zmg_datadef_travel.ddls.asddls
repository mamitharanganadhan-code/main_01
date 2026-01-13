@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for travel table'
@ObjectModel.usageType : {
serviceQuality: #X,
sizeCategory: #S,
dataClass: #MIXED }
define root view entity zmg_datadef_travel
  as select from zmg_mang_travel
  composition [0..*] of zmg_datadef_booking      as _cbooking
  association [0..1] to /DMO/I_Agency            as _agency   on $projection.AgencyId = _agency.AgencyID
  --to get the agency related details
  association [0..1] to /DMO/I_Customer          as _customer on $projection.CustomerId = _customer.CustomerID
  -- to get customer related details
  association [1..1] to I_Currency               as _currency on $projection.CurrencyCode = _currency.Currency
  --to get the currency related datas
  association [0..1] to /DMO/I_Overall_Status_VH as _status   on $projection.OverallStatus = _status.OverallStatus
  --to get the value help for status field
{
  key travel_id       as TravelId,
      agency_id       as AgencyId,
      customer_id     as CustomerId,
      begin_date      as BeginDate,
      end_date        as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee     as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price     as TotalPrice,
      currency_code   as CurrencyCode,
      description     as Description,
      overall_status  as OverallStatus,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at as LastChangedAt,
      _cbooking,
      _agency,
      _customer,
      _currency,
      _status
}

