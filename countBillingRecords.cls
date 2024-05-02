List <String> billingObjects = new List <String> {
    'blng__BillingRule__c',
    'blng__BillingTreatment__c',
    'blng__GLAccount__c',
    'blng__GLRule__c',
    'blng__GLTreatment__c',
    'blng__InvoicePlan__c',
    'blng__InvoicePlanLine__c',
    'blng__LegalEntity__c',
    'blng__RevenueDistributionMethod__c',
    'blng__RevenueRecognitionRule__c',
    'blng__RevenueRecognitionTreatment__c',
    'blng__TaxIntegration__c',
    'blng__TaxRate__c',
    'blng__TaxRule__c',
    'blng__TaxTreatment__c',
    'blng__PaymentGateway__c',
    'blng__PaymentScheduler__c'
};
    
Integer totalRecordCount = 0;
    
for (String objName: billingObjects) {
    Integer localCount = Database.countQuery('SELECT count() FROM ' + objName);
    if (localCount > 0) {
        System.debug(objName + ': ' + localCount);
        totalRecordCount += localCount;
    } 
}

System.debug('Total record count: ' + totalRecordCount);
