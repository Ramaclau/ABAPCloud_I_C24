@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Tree'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_01_TREE_957
  as select from ztree_957

  association [0..*] to ZCDS_01_TREE_957 as _tree on $projection.ParentId = _tree.Id  

{
  key id        as Id,
  key parent_id as ParentId,
      name      as Name,
      _tree
}
