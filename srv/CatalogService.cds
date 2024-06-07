using{pinky.db} from '../db/datamodel';
// using {pinky.cds} from'../db/CDSView';

service CatalogService @(path:'CatalogService', requires: 'authenticated-user'){
    entity BusinessPartnerSet as projection on db.master.businesspartner;
    entity AddressSet as projection on db.master.address;
    // @readonly
     entity EmployeeSet @(restrict: [ 
                        { grant: ['READ'], to: 'Viewer', where: 'bankName = $user.BankName' },
                        { grant: ['WRITE'], to: 'Admin' }
                        ])as projection on db.master.employees;
    entity PurchaseOrderItems as projection on db.transaction.poitems;
    entity ProductSet as projection on db.master.product;
    entity POs @(odata.draft.enabled : true) as projection on db.transaction.purchaseorder{
        *,
        case OVERALL_STATUS
            when 'N' then 'New'
            when 'B' then 'Blocked'
            when 'P' then 'Paid'
            else 'Delivered' end as OVERALL_STATUS:String(20),
         case OVERALL_STATUS
            when 'N' then 4
            when 'P' then 1
            when 'B' then 2
            else 3 end as Criticality: Integer,    
    }
    actions{
        @cds.odata.bindingparameter.name :'vAmount'
        @Common.SideEffects : { 
            TargetProperties : ['vAmount/GROSS_AMOUNT']
            }    
        action boost() returns POs;
        @cds.odata.bindingparameter.name :'vStatus'
        @Common.SideEffects : { 
            TargetProperties : ['vStatus/OVERALL_STATUS']
            }   
        action setOrderProcessing() returns POs;
        function largestPO() returns array of POs;
    };

      function getOrderDefaults() returns POs;
    // entity PurchaseOrderSet as projection on cds.CDSViews.POWorkList;
    // entity ItemSet as projection on cds.CDSViews.ItemView;
    // entity ProductViewSet as projection on cds.CDSViews.ProductView;
    // entity ProductSales as projection on cds.CDSViews.CProductValuesView;
}