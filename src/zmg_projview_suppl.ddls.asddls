@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for supplement'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zmg_projview_suppl
  as projection on zmg_datadef_suppl
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      @ObjectModel.text.element: [ 'suplementedesc' ]
      SupplementId,
      _SupplementText.Description as suplementedesc : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _booking : redirected to parent zmg_projview_booking,
      _supplement,
      _SupplementText,
      _travel  : redirected to zmg_projview_travel
}

