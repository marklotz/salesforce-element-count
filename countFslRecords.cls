List <String> fslObjects = new List <String> {
    'AttributeDefinition',
    'AttributePicklist',
    'AttributePicklistValue',
    'ApptBundlePolicy',
    'ApptBundleConfig',
    'ApptBundleAggrPolicy',
    'ApptBundlePropagatePolicy',
    'ApptBundleRestrictPolicy',
    'ApptBundleSortPolicy',
    'ApptBundlePolicySvcTerr',
    'RecordSetFilterCriteria',
    'RecordSetFilterCriteriaRule',
    'ServiceResource', 
    'ServiceResourceSkill', 
    'ServiceCrew', 
    'ServiceCrewMember',
    'ServiceTerritory', 
    'ServiceTerritoryLocation',
    'ServiceTerritoryMember',
    'ShiftTemplate',
    'ShiftPattern',
    'ShiftPatternEntry',
    'Location', 
    'OperatingHours', 
    'JobProfile',
    'WarrantyTerm',
    'WorkType',
    'WorkTypeGroup',
    'WorkTypeGroupMember', 
    'TimeSlot',
    'WorkPlanTemplate',
    'WorkPlanTemplateEntry',
    'WorkStepTemplate',
    'Product2', 
    'ProductRequired', 
    'ProductWarrantyTerm',
    'SkillRequirement', 
    'ServiceReportLayout',
    'FieldServiceMobileSettings',
    'AppExtension',
    'FieldServiceOrgSettings',
    'MobileSettingsAssignment', 
    'FSL__Polygon__c', 
    'FSL__Scheduling_Policy__c',
    'FSL__Service_Goal__c',
    'FSL__Work_Rule__c',
    'FSL__Work_Rule_Entry__c'
};
    
Integer totalRecordCount = 0;
    
for (String objName: fslObjects) {
    Integer localCount = Database.countQuery('SELECT count() FROM ' + objName);
    if (localCount > 0) {
        System.debug(objName + ': ' + localCount);
        totalRecordCount += localCount;
    }
}

System.debug('Total record count: ' + totalRecordCount);
