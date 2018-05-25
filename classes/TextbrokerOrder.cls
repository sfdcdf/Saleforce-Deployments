public with sharing class TextbrokerOrder {

    private Case c;
    public String referenceID;
    public String title;
    public String briefing;
    
    public TextbrokerOrder(Case c) {
        if(c != null) {
            this.c = c;
            this.referenceID = c.Id;
        } else {
            this.referenceID = 'testID';
        }
        this.title = c.Account.Name + ' - ' + c.CaseNumber + ' - ' + c.taskId__c;

        System.Debug('String output is: ' + c.Homepage__c);

        if(!String.isBlank(this.briefing)) {
            this.briefing = this.briefing + getPageInfo();
        } else {
            this.briefing = getPageInfo();
        }

        this.briefing = this.briefing + 'COMPANY INFO:\n'
        + ' - Name of Business: ' +  c.Name_of_Business__c + '\n'
        + ' - Type of Business: ' +  c.Segment__c + '\n'
        //+ ' - Business Address: ' +  c.Business_Address__c + '\n'
        + ' - Domain Name to be Used for YO: ' +  c.Domain_Name_to_be_used_for_YO__c + '\n'
        + ' - Short Description of the Business: ' +  c.Description_of_the_Business__c + '\n'
        //+ ' - Hours of Operation: ' +  c.Hours_of_Operation__c + '\n'
        + ' - Homepage (Verticals): ' +  c.Homepage__c + '\n'
        + ' - Services Offered: ' +  c.Services_Offered__c + '\n'
        + ' - Geographic Areas to Service: ' +  c.Geographic_Areas_To_Service__c + '\n'
        + ' - USPs/Certs/Testimonials: ' + c.Unique_Selling_Points__c;
        //+ ' - Payment Methods Accepted: ' + c.Payment_Methods_Accepted__c;
    }

    //TODO: we should write a test for this method
    public String getPageInfo() {
        String result = '';

        if(c != null) {
            List<String> serviceNames = new List<String>();
            List<String> uniquePropositions = new List<String>();

            if(!String.isBlank(c.KeyWord_1_Service_Name__c) && !String.isBlank(c.KeyWord_1_Unique_Proposition__c)) {
                serviceNames.add(c.KeyWord_1_Service_Name__c);
                uniquePropositions.add(c.KeyWord_1_Unique_Proposition__c);
            }
            if(!String.isBlank(c.KeyWord_2_Service_Name__c) && !String.isBlank(c.KeyWord_2_Unique_Proposition__c)) {
                serviceNames.add(c.KeyWord_2_Service_Name__c);
                uniquePropositions.add(c.KeyWord_2_Unique_Proposition__c);
            }
            if(!String.isBlank(c.KeyWord_3_Service_Name__c) && !String.isBlank(c.KeyWord_3_Unique_Proposition__c)) {
                serviceNames.add(c.KeyWord_3_Service_Name__c);
                uniquePropositions.add(c.KeyWord_3_Unique_Proposition__c);
            }

            if(serviceNames.size() > 0 && uniquePropositions.size() > 0)
                result = 'Page 1: ' +  serviceNames[0] + ' (Page 1 Unique Proposition: ' +  uniquePropositions[0] + ')\n';
            if(serviceNames.size() > 1 && uniquePropositions.size() > 1)
                result = result + 'Page 2: ' +  serviceNames[1] + ' (Page 2 Unique Proposition: ' +  uniquePropositions[1] + ')\n';
            if(serviceNames.size() > 2 && uniquePropositions.size() > 2)
                result = result + 'Page 3: ' +  serviceNames[2] + ' (Page 3 Unique Proposition: ' +  uniquePropositions[2] + ')\n';

            result = result + '\n';
        }
        return result;
    }

    public void addToParentAsXmlStream(XmlStreamWriter w) {

        w.writeStartElement(null, 'order', null);
        w.writeAttribute('xsi', TextbrokerHelper.xsi, 'type', 'tbmo:ManagedOrder');

        // referenceID
        w.writeStartElement(null, 'referenceID', null);
        w.writeCharacters(referenceID);
        w.writeEndElement();

        // title
        w.writeStartElement(null, 'title', null);
        w.writeCharacters(title);
        w.writeEndElement();

        // briefing
        w.writeStartElement(null, 'briefing', null);
        w.writeCData(briefing);
        w.writeEndElement();

        //additional fields
        w.writeStartElement(null, 'additionalFields', null);

        w.writeStartElement(null, 'field', null);
        w.writeAttribute(null, null, 'name', 'AccountName');
        w.writeAttribute(null, null, 'value', c.Account.Name);
        w.writeEndElement();

        w.writeStartElement(null, 'field', null);
        w.writeAttribute(null, null, 'name', 'Client');
        w.writeAttribute(null, null, 'value', c.Client_ID__c);
        w.writeEndElement();

        w.writeStartElement(null, 'field', null);
        w.writeAttribute(null, null, 'name', 'TaskId');
        w.writeAttribute(null, null, 'value', c.taskId__c);
        w.writeEndElement();

        w.writeStartElement(null, 'field', null);
        w.writeAttribute(null, null, 'name', 'CaseNumber');
        w.writeAttribute(null, null, 'value', c.CaseNumber);
        w.writeEndElement();

        w.writeStartElement(null, 'field', null);
        w.writeAttribute(null, null, 'name', 'PageCount');
        w.writeAttribute(null, null, 'value', c.Number_of_Pages__c);
        w.writeEndElement();

        w.writeStartElement(null, 'field', null);
        w.writeAttribute(null, null, 'name', 'Country');
        w.writeAttribute(null, null, 'value', c.Country__c);
        w.writeEndElement();

        w.writeEndElement(); // end additional fields

        w.writeEndElement(); // end order
    }
}