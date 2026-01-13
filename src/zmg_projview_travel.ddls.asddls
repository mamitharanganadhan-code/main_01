@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for travel'
@Metadata.allowExtensions: true
define root view entity zmg_projview_travel
  provider contract transactional_query
  as projection on zmg_datadef_travel
{
  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ] --- to get the agency name along with ID
      AgencyId,
      _agency.Name       as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      @ObjectModel.text.element: [ 'Text' ]
      OverallStatus,
      _status._Text.Text : localized, -- to fetch the text from associated tabel in login language
      //      CreatedBy,
      //      CreatedAt,
      //      LastChangedBy,
      @UI.hidden: true ----to hide the field in app
      LastChangedAt,
      /* Associations */
      _agency,
      _cbooking : redirected to composition child zmg_projview_booking,
      _currency,
      _customer,
      _status
}
