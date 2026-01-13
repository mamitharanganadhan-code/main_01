@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zmg_projview_booking
  as projection on zmg_datadef_booking
{
  key TravelId,
  key BookingId,
      BookingDate,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _customer.LastName         as CustomerName,
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId,
      _carrier.Name              as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      @ObjectModel.text.element: [ 'BookingStatustext' ]
      BookingStatus,
      _booking_status._Text.Text as BookingStatustext : localized,
      LastChangedAt,
      /* Associations */
      _booking_status,
      _booksuppl : redirected to composition child zmg_projview_suppl,
      _carrier,
      _connection,
      _customer,
      _travel    : redirected to parent zmg_projview_travel
}
