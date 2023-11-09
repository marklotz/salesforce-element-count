Map < String, Schema.SObjectType > globalDescribe = Schema.getGlobalDescribe();

List < String > cpqObjects = new List < String > {
    'Product2',
    'PriceBook2'
};
    
    
List < String > sbaaObjects = new List < String > {
    'sbaa__ApprovalChain__c',
	'sbaa__ApprovalCondition__c',
	'sbaa__ApprovalRule__c',
	'sbaa__ApprovalVariable__c',
	'sbaa__Approver__c',
	'sbaa__EmailTemplate__c',
	'sbaa__TrackedField__c'
};

Boolean hasAdvancedApprovals = false;

List<String> excludeCpqObjects = new List<String> {
    'sbqq__contractedprice__c',
    'sbqq__quote__c',
    'sbqq__quotedocument__c',
    'sbqq__quoteline__c',
    'sbqq__quotelinegroup__c',
    'sbqq__subscription__c',
    'sbqq__subscribedasset__c',
    'sbqq__subscribedquoteline__c',
    'sbqq__subscriptionconsumptionrate__c',
    'sbqq__subscriptionconsumptionschedule__c',
    'sbqq__webquote__c',
    'sbqq__webquoteline__c',
    'sbqq__quotelineconsumptionschedule__c',
    'sbqq__quotelineconsumptionrate__c',
    'sbqq__installprocessorlog__c',
    'sbqq__processinputvalue__c',
    'sbqq__recordjob__c',
    'sbqq__timinglog__c'
};

Integer totalRecordCount = 0, product2Count = 0, product2CountInactive = 0;

for (String objectName: globalDescribe.keySet()) {
    
    if(objectName.startsWith('sbaa')){
        hasAdvancedApprovals = true;
        
    }
    
    else if (objectName.startsWith('sbqq__') && !objectName.contains('__changeevent') && !objectName.contains('__share') && !objectName.contains('__history') && !excludeCpqObjects.contains(objectName) ) {
        
        cpqObjects.add(objectName);
    }
}

if(hasAdvancedApprovals){
    cpqObjects.addAll(sbaaObjects);
}

for (String objName: cpqObjects) {
    Integer localCount = Database.countQuery('SELECT count() FROM ' + objName);
    if (localCount > 0) {
        System.debug(objName + ': ' + localCount);
        totalRecordCount += localCount;
    }
    product2Count = objName == 'Product2' ? localCount : product2Count;
}

product2CountInactive = Database.countQuery('SELECT count() FROM Product2 where IsActive=False');

System.debug('TOTAL CPQ RECORDS: ' + totalRecordCount);
System.debug('Out of '+product2Count+' Product2 records, '+product2CountInactive+' are inactive (IsActive = false). You can remove inactive Products from the Salto environment by using the following config: saltoManagementFieldSettings = {defaultFieldName = "IsActive"}');
