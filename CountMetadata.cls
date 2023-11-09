List<String> categoriesThatSupportNamespace = new List<String>{'code','emailTemplate','validationRule','permissionSets','workflowElement','flexipage'};

Map<String,String> friendlyNameByCategory = new Map<String,String>();
friendlyNameByCategory.put('code','Apex, LWC and Aura');
friendlyNameByCategory.put('profiles','Profiles');
friendlyNameByCategory.put('permissionSets','Permission Sets');
friendlyNameByCategory.put('workflowElement','Workflow Elements');
friendlyNameByCategory.put('validationRule','Validation Rule');
friendlyNameByCategory.put('emailTemplate','Email Template');
friendlyNameByCategory.put('flow','Flow');
friendlyNameByCategory.put('flexipage','Lightning Page');

Map<String,Integer> countByCategory = new Map<String,Integer>();
countByCategory.put('code',0);
countByCategory.put('permissionSets',0);
countByCategory.put('profiles',0);
countByCategory.put('workflowElement',0);
countByCategory.put('validationRule',0);
countByCategory.put('emailTemplate',0);
countByCategory.put('flow',0);
countByCategory.put('flexipage',0);

Map<String,List<String>> typesByCategory = new Map<String,List<String>>();
typesByCategory.put('code',new List<String>{'LightningComponentBundle','AuraDefinitionBundle','ApexClass','ApexTrigger','ApexPage','ApexComponent'});
typesByCategory.put('profiles',new List<String>{'Profile'});
typesByCategory.put('permissionSets',new List<String>{'PermissionSet'});
typesByCategory.put('workflowElement',new List<String>{'WorkflowAlert','WorkflowFieldUpdate','WorkflowRule','WorkflowOutboundMessage','WorkflowTask'});
typesByCategory.put('validationRule',new List<String>{'ValidationRule'});
typesByCategory.put('emailTemplate',new List<String>{'EmailTemplate'});
typesByCategory.put('flow',new List<String>{'FlowDefinition'});
typesByCategory.put('flexipage',new List<String>{'FlexiPage'});
                    
for(String category : typesByCategory.keySet()){
    for(String mdType : typesByCategory.get(category)){
        
        Integer localCountByCategory = countByCategory.get(category);
        String query = 'SELECT Count(Id) FROM ' + mdType;
        
        if(categoriesThatSupportNamespace.contains(category)){
            query += ' WHERE namespaceprefix = \'\'';
        }
        
        if(category == 'permissionSets'){
            query += ' AND IsOwnedByProfile = false';
        }
                
        HttpRequest req = new HttpRequest();
        req.setEndpoint(Url.getOrgDomainURL().toExternalForm() + '/services/data/v57.0/tooling/query?q=' + EncodingUtil.urlEncode(query, 'UTF-8'));
        req.setMethod('GET');
        req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
        Http http = new Http();
        HttpResponse res = http.send(req);
        String body = res.getBody();
        JSONParser parser = JSON.createParser(body);
        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                String fieldName = parser.getText();
                parser.nextToken();
                if (fieldName == 'expr0') {
                    
                    Integer mdCount = Integer.valueOf(parser.getText());
                    
                    localCountByCategory += mdCount;
                    countByCategory.put(category,localCountByCategory);
                    
                }
            }
        }
    }
}

Integer profileAndPermSets = 0;
                 
for(String category : countByCategory.keySet()){
    
    if(category == 'profiles' || category == 'permissionSets'){
        profileAndPermSets += countByCategory.get(category);
    }
    else{
        String friendlyName = friendlyNameByCategory.get(category);
    	System.debug(friendlyName+': '+countByCategory.get(category));
    }
     
}
              
System.debug('Profiles and Permission Sets: '+profileAndPermSets);

//System.debug('TOTAL COUNT: '+totalCount);
