using CatalogService as service from '../../srv/CatalogService';


annotate CatalogService.POs with @(
    Common.DefaultValuesFunction: 'getOrderDefaults',
    UI.SelectionFields:[
        PO_ID,
        GROSS_AMOUNT,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY
    ],
    UI.LineItem:[
        {
            $Type: 'UI.DataField',
            Value:PO_ID
        },
        {
            $Type: 'UI.DataField',
            Value:GROSS_AMOUNT
        },
        {
            $Type: 'UI.DataField',
            Value:CURRENCY_code
        },
        {
            $Type:'UI.DataField',
            Value:OVERALL_STATUS,
            Criticality:Criticality,
            CriticalityRepresentation: #WithIcon
        },
        {
            $Type: 'UI.DataField',
            Value:PARTNER_GUID.COMPANY_NAME
        },
        {
            $Type: 'UI.DataField',
            Value:PARTNER_GUID.ADDRESS_GUID.COUNTRY
        },
        {
            $Type:'UI.DataFieldForAction',
            Action:'CatalogService.boost',
            Label:'Boost',
            Inline:true
        }   
    ],
    UI.HeaderInfo:{
        TypeName :'PO',
        TypeNamePlural : 'POs',
        Title : {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        // Image : ![data:image/png;base64,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],
        Description : {
            $Type: 'UI.DataField',
            Value: LIFECYCLE_STATUS
        }
       

    },
    UI.Facets:[
        {
        $Type : 'UI.CollectionFacet',
        Label : 'PO Details',
        Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'More Info',
                    Target : '@UI.FieldGroup#MoreInfo',
                },{
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Pricing Details',
                    Target : '@UI.FieldGroup#Spiderman',
                }
            ]
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'PO Items',
        Target : 'Items/@UI.LineItem'
    }
    ],
    UI.FieldGroup #MoreInfo: {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
            }
        ],
    },
    UI.FieldGroup #Spiderman:{
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
        ],
    },
    UI.Identification:[{
        $Type : 'UI.DataFieldForAction',
        Label : 'Set to Delivered',
        Action :'CatalogService.setOrderProcessing'
    } ]
);

annotate CatalogService.POs with {
    PARTNER_GUID@(
        Common : { 
            Text : PARTNER_GUID.COMPANY_NAME,
         },
         ValueList.entity: CatalogService.BusinessPartnerSet
    )
};

annotate CatalogService.PurchaseOrderItems with {
    PRODUCT_GUID@(
        Common : { 
            Text : PRODUCT_GUID.DESCRIPTION,
         },
         ValueList.entity: CatalogService.ProductSet
    )
};

@cds.odata.valuelist
annotate CatalogService.BusinessPartnerSet with @(
UI.Identification:[{
    $Type : 'UI.DataField',
    Value : COMPANY_NAME
}]
);

@cds.odata.valuelist
annotate CatalogService.ProductSet with @(
    UI.Identification:[{
    $Type : 'UI.DataField',
    Value : DESCRIPTION
    }]
);


annotate CatalogService.PurchaseOrderItems with @(
    UI.LineItem:[
        {
            $Type: 'UI.DataField',
            Value:PO_ITEM_POS
        },
        {
            $Type: 'UI.DataField',
            Value:PRODUCT_GUID_NODE_KEY
        },
        {
            $Type: 'UI.DataField',
            Value:GROSS_AMOUNT
        },
        {
            $Type:'UI.DataField',
            Value:NET_AMOUNT
        },
        {
            $Type: 'UI.DataField',
            Value:CURRENCY_code
        }
    ],

    UI.HeaderInfo:{
        Title : {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS
    },
    TypeName : 'Line Item',
    TypeNamePlural : 'Line Items'
    },

UI.Facets : [
    {
        $Type : 'UI.CollectionFacet',
        Label : 'Item Details',
        Facets : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#ItemDetails',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#ProductDeatils',
            },
        ],
    },
],

UI.FieldGroup #ItemDetails : {
    Data:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
    ]


},

UI.FieldGroup #ProductDeatils :{
    Data:[
   {
       $Type : 'UI.DataField',
       Value : PRODUCT_GUID.CATEGORY,
   },
   {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.DESCRIPTION,
            },{
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.PRICE,
            },{
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.SUPPLIER_GUID.ADDRESS_GUID.COUNTRY,
            }
    ]
}

);
