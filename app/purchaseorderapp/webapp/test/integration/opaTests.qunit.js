sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'po/app/purchaseorderapp/test/integration/FirstJourney',
		'po/app/purchaseorderapp/test/integration/pages/POsList',
		'po/app/purchaseorderapp/test/integration/pages/POsObjectPage',
		'po/app/purchaseorderapp/test/integration/pages/PurchaseOrderItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, PurchaseOrderItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('po/app/purchaseorderapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePurchaseOrderItemsObjectPage: PurchaseOrderItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);