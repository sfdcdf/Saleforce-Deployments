global class PC_ConvertLead {
    
    webService static String cLead (Id leadId) {
        Database.LeadConvert lc = new database.LeadConvert();
        lc.setLeadId(leadId);
        
        LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];
        try {
            lc.setConvertedStatus(convertStatus.MasterLabel);
            Database.LeadConvertResult lcr = Database.convertLead(lc);
            
            return 'Success:true,ContactId:' + lcr.getContactId() + ',OpportunityId:' + 
                lcr.getOpportunityId() + ',AccountId:' + lcr.getAccountId() + ',LeadId:' + lcr.getLeadId();
            
        }
        catch (Exception e) {
            
            return 'Success:False';
        }
        
        
    }
    
    static testMethod void testCLead() {
        Lead testLead = new Lead();
        testLead.FirstName = 'Bob';
        testLead.LastName = 'Test';
        testLead.Company = 'Test';
        testLead.Email = 'test@test.com';
        testLead.Phone = '(555) 555-5555';
        insert testLead;
        
        String convResult = cLead(testLead.id);
        List<String> resultSplit = convResult.split(',');
        for (Integer i=0;i < resultSplit.size();i++) {
            if (i==0) {
                List<String> status = resultSplit[i].split(':');
                System.assertEquals(status[1], 'true');
            }
        }
        
        convResult = cLead(testLead.id);
        resultSplit = convResult.split(',');
        for (Integer i=0;i < resultSplit.size();i++) {
            if (i==0) {
                List<String> status = resultSplit[i].split(':');
                System.assertEquals(status[1], 'False');
            }
        }
        
    }

}