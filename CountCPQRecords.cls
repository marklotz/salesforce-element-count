Map < String, Schema.SObjectType > globalDescribe = Schema.getGlobalDescribe();
List < String > cpqObjects = new List < String > {
    'Product2',
    'PriceBook2',
    'PricebookEntry'
};
for (String objectName: globalDescribe.keySet()) {
    if ((objectName.startsWith('sbqq__') || objectName.startsWith('sbaa__')) && !objectName.contains('__changeevent') && !objectName.contains('__share') && !objectName.contains('__history')) {
        cpqObjects.add(objectName);
    }
}
Integer totalRecordCount = 0;
for (String objName: cpqObjects) {
    String queryStr = 'SELECT count() FROM ' + objName;
    Integer localCount = Database.countQuery(queryStr);
    if (localCount > 0) {
        System.debug(objName + ': ' + localCount);
        totalRecordCount += localCount;
    }
}
System.debug('TOTAL CPQ RECORDS: ' + totalRecordCount);
