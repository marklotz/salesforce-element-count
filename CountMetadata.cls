String query = 'SELECT Count(Id) FROM LightningComponentBundle';
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
            System.debug('LightningComponentBundle: ' + parser.getText());
        }
    }
}
query = 'SELECT Count(Id) FROM ApexClass';
req = new HttpRequest();
req.setEndpoint(Url.getOrgDomainURL().toExternalForm() + '/services/data/v57.0/tooling/query?q=' + EncodingUtil.urlEncode(query, 'UTF-8'));
req.setMethod('GET');
req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
res = http.send(req);
body = res.getBody();
parser = JSON.createParser(body);
while (parser.nextToken() != null) {
    if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        String fieldName = parser.getText();
        parser.nextToken();
        if (fieldName == 'expr0') {
            System.debug('ApexClass: ' + parser.getText());
        }
    }
}
query = 'SELECT Count(Id) FROM ApexTrigger';
req = new HttpRequest();
req.setEndpoint(Url.getOrgDomainURL().toExternalForm() + '/services/data/v57.0/tooling/query?q=' + EncodingUtil.urlEncode(query, 'UTF-8'));
req.setMethod('GET');
req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
res = http.send(req);
body = res.getBody();
parser = JSON.createParser(body);
while (parser.nextToken() != null) {
    if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        String fieldName = parser.getText();
        parser.nextToken();
        if (fieldName == 'expr0') {
            System.debug('ApexTrigger: ' + parser.getText());
        }
    }
}
query = 'SELECT Count(Id) FROM ApexPage';
req = new HttpRequest();
req.setEndpoint(Url.getOrgDomainURL().toExternalForm() + '/services/data/v57.0/tooling/query?q=' + EncodingUtil.urlEncode(query, 'UTF-8'));
req.setMethod('GET');
req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
res = http.send(req);
body = res.getBody();
parser = JSON.createParser(body);
while (parser.nextToken() != null) {
    if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        String fieldName = parser.getText();
        parser.nextToken();
        if (fieldName == 'expr0') {
            System.debug('ApexPage: ' + parser.getText());
        }
    }
}
query = 'SELECT Count(Id) FROM AuraDefinitionBundle';
req = new HttpRequest();
req.setEndpoint(Url.getOrgDomainURL().toExternalForm() + '/services/data/v57.0/tooling/query?q=' + EncodingUtil.urlEncode(query, 'UTF-8'));
req.setMethod('GET');
req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
res = http.send(req);
body = res.getBody();
parser = JSON.createParser(body);
while (parser.nextToken() != null) {
    if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        String fieldName = parser.getText();
        parser.nextToken();
        if (fieldName == 'expr0') {
            System.debug('AuraDefinitionBundle: ' + parser.getText());
        }
    }
}
query = 'SELECT Count(Id) FROM EmailTemplate';
req = new HttpRequest();
req.setEndpoint(Url.getOrgDomainURL().toExternalForm() + '/services/data/v57.0/tooling/query?q=' + EncodingUtil.urlEncode(query, 'UTF-8'));
req.setMethod('GET');
req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
res = http.send(req);
body = res.getBody();
parser = JSON.createParser(body);
while (parser.nextToken() != null) {
    if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        String fieldName = parser.getText();
        parser.nextToken();
        if (fieldName == 'expr0') {
            System.debug('EmailTemplate: ' + parser.getText());
        }
    }
}
query = 'SELECT Count(Id) FROM Flow';
req = new HttpRequest();
req.setEndpoint(Url.getOrgDomainURL().toExternalForm() + '/services/data/v57.0/tooling/query?q=' + EncodingUtil.urlEncode(query, 'UTF-8'));
req.setMethod('GET');
req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
res = http.send(req);
body = res.getBody();
parser = JSON.createParser(body);
while (parser.nextToken() != null) {
    if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        String fieldName = parser.getText();
        parser.nextToken();
        if (fieldName == 'expr0') {
            System.debug('Flow: ' + parser.getText());
        }
    }
}
query = 'SELECT Count(Id) FROM Profile';
req = new HttpRequest();
req.setEndpoint(Url.getOrgDomainURL().toExternalForm() + '/services/data/v57.0/tooling/query?q=' + EncodingUtil.urlEncode(query, 'UTF-8'));
req.setMethod('GET');
req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
res = http.send(req);
body = res.getBody();
parser = JSON.createParser(body);
while (parser.nextToken() != null) {
    if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        String fieldName = parser.getText();
        parser.nextToken();
        if (fieldName == 'expr0') {
            System.debug('Profile: ' + parser.getText());
        }
    }
}
query = 'SELECT Count(Id) FROM ValidationRule';
req = new HttpRequest();
req.setEndpoint(Url.getOrgDomainURL().toExternalForm() + '/services/data/v57.0/tooling/query?q=' + EncodingUtil.urlEncode(query, 'UTF-8'));
req.setMethod('GET');
req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
res = http.send(req);
body = res.getBody();
parser = JSON.createParser(body);
while (parser.nextToken() != null) {
    if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        String fieldName = parser.getText();
        parser.nextToken();
        if (fieldName == 'expr0') {
            System.debug('ValidationRule: ' + parser.getText());
        }
    }
}
query = 'SELECT Count(Id) FROM PermissionSet';
req = new HttpRequest();
req.setEndpoint(Url.getOrgDomainURL().toExternalForm() + '/services/data/v57.0/tooling/query?q=' + EncodingUtil.urlEncode(query, 'UTF-8'));
req.setMethod('GET');
req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
res = http.send(req);
body = res.getBody();
parser = JSON.createParser(body);
while (parser.nextToken() != null) {
    if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        String fieldName = parser.getText();
        parser.nextToken();
        if (fieldName == 'expr0') {
            System.debug('PermissionSet: ' + parser.getText());
        }
    }
}
