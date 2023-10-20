List<String> metadataTypes = new List<String>{'LightningComponentBundle','AuraDefinitionBundle','ApexClass','ApexTrigger','ApexPage','Profile','ValidationRule','EmailTemplate','Flow',' PermissionSet'};
Integer totalCount = 0;
for(String mdType : metadataTypes){
        String query = 'SELECT Count(Id) FROM '+mdType;
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
                    totalCount += mdCount;
                    System.debug(mdType+': '+ mdCount);
                }
            }
        }
}    
    
System.debug('TOTAL COUNT: '+totalCount);
