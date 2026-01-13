@AbapCatalog.sqlViewName: 'ZKEY_TEST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Testing'
@Metadata.ignorePropagatedAnnotations: true
define view ZMA_TEST as select from ZMG_I_AGENCY
{
    key ' ' as def
}
