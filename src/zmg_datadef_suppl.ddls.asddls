@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for supplement table'
@ObjectModel.usageType : {
serviceQuality: #X,
sizeCategory: #S,
dataClass: #MIXED }
define view entity zmg_datadef_suppl
  as select from zmg_mang_suppl
  association        to parent zmg_datadef_booking as _booking        on  $projection.TravelId  = _booking.TravelId
                                                                      and $projection.BookingId = _booking.BookingId
  association [1..1] to zmg_datadef_travel         as _travel         on  $projection.TravelId = _travel.TravelId
  association [1..1] to /DMO/I_Supplement          as _supplement     on  $projection.SupplementId = _supplement.SupplementID
  association [1..*] to /DMO/I_SupplementText      as _SupplementText on  $projection.SupplementId = _SupplementText.SupplementID
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at       as LastChangedAt,
      _booking,
      _travel,
      _supplement,
      _SupplementText

}
