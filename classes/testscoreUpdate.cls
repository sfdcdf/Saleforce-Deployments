@isTest
 private class testscoreUpdate{
 static testMethod void testscoreUpdate(){
 List<Account> newacc = new List<Account>();
List<Account> newacc2 = new List<Account>();

Test.startTest();
Account a = new Account(
            Name = 'Testerson Corp.',
            BillingStreet = '123 Rainey St',
            BillingCity = 'Arlen',
            BillingState = 'TX',
            BillingPostalCode = '76767',
            Number_of_Locations_Specific__c = 99,
            SEO_Rank_Check__c = 24,
            Disposition__c = 'Opportunity',
            Local_Website_Presence__c = 24,
            Brand_Consistency__c = True,
            Mobile_Readiness__c = True,
            Contact_Frequency__c = 1,
            Most_Recent_Contact__c = date.parse('12/27/2012'),
            Profile_Completeness__c = true,
            Existing_Sales__c = 1,
            Segment_Population__c = 1,
            Geographic_Reach__c = 10,
            PPC_Rank_Check__c = 24,
            AnnualRevenue = 20000000
            );
            
        newacc.add(a);
        
Account b = new Account(
            Name = 'Tester, Inc.',
            BillingStreet = '123 Rainey Ave',
            BillingCity = 'Boston',
            BillingState = 'TX',
            BillingPostalCode = '76701',
            Number_of_Locations_Specific__c = 101,
            SEO_Rank_Check__c = 26,
            Disposition__c = 'In Progress',
            Local_Website_Presence__c = 26,
            Brand_Consistency__c = False,
            Mobile_Readiness__c = False,
            Contact_Frequency__c = 3,
            Most_Recent_Contact__c = date.parse('3/27/2013'),
            Profile_Completeness__c = false,
            Existing_Sales__c = 2,
            Segment_Population__c = 11,
            Geographic_Reach__c = 12,
            PPC_Rank_Check__c = 26,
            AnnualRevenue = 200000000
        );
            
        newacc.add(b);
Account c = new Account(
            Name = 'Tester, Inc.',
            BillingStreet = '123 Rainey Ave',
            BillingCity = 'Boston',
            BillingState = 'TX',
            BillingPostalCode = '76701',
            Number_of_Locations_Specific__c = 201,
            SEO_Rank_Check__c = 60,
            Disposition__c = 'In Progress',
            Local_Website_Presence__c = 60,
            Brand_Consistency__c = False,
            Mobile_Readiness__c = False,
            Contact_Frequency__c = 4,
            Most_Recent_Contact__c = date.parse('3/27/2013'),
            Profile_Completeness__c = false,
            Existing_Sales__c = 3,
            Segment_Population__c = 22,
            Geographic_Reach__c = 101,
            PPC_Rank_Check__c = 60,
            AnnualRevenue = 2000000
        );
       
            
        newacc.add(c);  
        
Account d = new Account(
            Name = 'Testerson, Inc.',
            BillingStreet = '123 Rainey Ave',
            BillingCity = 'Boston',
            BillingState = 'TX',
            BillingPostalCode = '76701',
            Number_of_Locations_Specific__c = 502,
            SEO_Rank_Check__c = 90,
            Disposition__c = 'Call Back',
            Local_Website_Presence__c = 90,
            Brand_Consistency__c = False,
            Mobile_Readiness__c = False,
            Contact_Frequency__c = 7,
            Most_Recent_Contact__c = date.parse('3/27/2013'),
            Profile_Completeness__c = false,
            Existing_Sales__c = 4,
            Segment_Population__c = 37,
            Geographic_Reach__c = 450,
            PPC_Rank_Check__c = 90,
            AnnualRevenue = 124245000
        );
      
            
        newacc.add(d); 
        
Account e = new Account(
            Name = 'Testerson, Inc.',
            BillingStreet = '123 Rainey Ave',
            BillingCity = 'Boston',
            BillingState = 'TX',
            BillingPostalCode = '76701',
            Disposition__c = 'Not Interested'
   
        );
            
        
            
        newacc.add(e);   
        
Account f = new Account(
            Name = 'Testerson, Inc.',
            BillingStreet = '123 Rainey Ave',
            BillingCity = 'Boston',
            BillingState = 'TX',
            BillingPostalCode = '76701',
            Number_of_Locations_Specific__c = 1,
            SEO_Rank_Check__c = 10,
            Disposition__c = 'Refusal',
            Local_Website_Presence__c = 60,
            Brand_Consistency__c = False,
            Mobile_Readiness__c = False,
            Contact_Frequency__c = 43,
            Most_Recent_Contact__c = date.parse('3/27/2013'),
            Profile_Completeness__c = false,
            Existing_Sales__c = 100,
            Segment_Population__c = 100,
            Geographic_Reach__c = 100,
            PPC_Rank_Check__c = 100
        );
            
        
            
        newacc.add(f);  
Account g = new Account(
            Name = 'Testerson, Inc.',
            BillingStreet = '123 Rainey Ave',
            BillingCity = 'Boston',
            BillingState = 'TX',
            BillingPostalCode = '76701',
             Number_of_Locations_Specific__c = 1,
            SEO_Rank_Check__c = 10,
            Disposition__c = 'Need More Info',
            Local_Website_Presence__c = 60,
            Brand_Consistency__c = False,
            Mobile_Readiness__c = False,
            Contact_Frequency__c = 3,
            Most_Recent_Contact__c = date.parse('3/27/2013'),
            Profile_Completeness__c = false,
            Existing_Sales__c = 100,
            Segment_Population__c = 100,
            Geographic_Reach__c = 100,
            PPC_Rank_Check__c = 100      
        );
         
        newacc.add(g);    
Account h = new Account(
            Name = 'Testerson, Inc.',
            BillingStreet = '123 Rainey Ave',
            BillingCity = 'Boston',
            BillingState = 'TX',
            BillingPostalCode = '76701',
             Number_of_Locations_Specific__c = 1,
            SEO_Rank_Check__c = 10,
            Disposition__c = 'Contact Parent Company',
            Local_Website_Presence__c = 60,
            Brand_Consistency__c = False,
            Mobile_Readiness__c = False,
            Contact_Frequency__c = 3,
            Most_Recent_Contact__c = date.parse('3/27/2013'),
            Profile_Completeness__c = false,
            Existing_Sales__c = 100,
            Segment_Population__c = 100,
            Geographic_Reach__c = 100,
            PPC_Rank_Check__c = 100

        );
              
        newacc.add(h); 
Account i = new Account(
            Name = 'Testerson, Inc.',
            BillingStreet = '123 Rainey Ave',
            BillingCity = 'Boston',
            BillingState = 'TX',
            BillingPostalCode = '76701',
             Number_of_Locations_Specific__c = 1,
            SEO_Rank_Check__c = 10,
            Disposition__c = 'Not a Good Fit',
            Local_Website_Presence__c = 60,
            Brand_Consistency__c = False,
            Mobile_Readiness__c = False,
            Contact_Frequency__c = 3,
            Most_Recent_Contact__c = date.parse('3/27/2013'),
            Profile_Completeness__c = false,
            Existing_Sales__c = 100,
            Segment_Population__c = 100,
            Geographic_Reach__c = 100,
            PPC_Rank_Check__c = 100
  
        );
           
        newacc.add(i);
Account j = new Account(
            Name = 'Testerson, Inc.',
            BillingStreet = '123 Rainey Ave',
            BillingCity = 'Boston',
            BillingState = 'TX',
            BillingPostalCode = '76701',
             Number_of_Locations_Specific__c = 1,
            SEO_Rank_Check__c = 10,
            Disposition__c = 'Contact Child Accounts',
            Local_Website_Presence__c = 60,
            Brand_Consistency__c = False,
            Mobile_Readiness__c = False,
            Contact_Frequency__c = 3,
            Most_Recent_Contact__c = date.parse('3/27/2013'),
            Profile_Completeness__c = false,
            Existing_Sales__c = 100,
            Segment_Population__c = 100,
            Geographic_Reach__c = 100,
            PPC_Rank_Check__c = 100  
        );
                     
        newacc.add(j);                                                         

Account k = new Account(
            Name = 'Testerson, Inc.',
            BillingStreet = '123 Rainey Ave',
            BillingCity = 'Boston',
            BillingState = 'TX',
            BillingPostalCode = '76701',
             Number_of_Locations_Specific__c = 1,
            SEO_Rank_Check__c = 10,
            Disposition__c = 'Bottoms Up',
            Local_Website_Presence__c = 60,
            Brand_Consistency__c = False,
            Mobile_Readiness__c = False,
            Contact_Frequency__c = 3,
            Most_Recent_Contact__c = date.parse('3/27/2013'),
            Profile_Completeness__c = false,
            Existing_Sales__c = 100,
            Segment_Population__c = 100,
            Geographic_Reach__c = 100,
            PPC_Rank_Check__c = 100  
        );
   
        
newacc.add(k);
Account l = new Account(
            Name = 'Testerson, Inc.',
            BillingStreet = '123 Rainey Ave',
            BillingCity = 'Boston',
            BillingState = 'TX',
            BillingPostalCode = '76701',
             Number_of_Locations_Specific__c = 1,
            SEO_Rank_Check__c = 10,
            Disposition__c = 'Bottoms Up',
            Local_Website_Presence__c = 60,
            Brand_Consistency__c = False,
            Mobile_Readiness__c = False,
            Contact_Frequency__c = 3,
            Most_Recent_Contact__c = date.parse('3/27/2013'),
            Profile_Completeness__c = false,
            Existing_Sales__c = 100,
            Segment_Population__c = 100,
            Geographic_Reach__c = 100,
            PPC_Rank_Check__c = 100  
        );
   
        
newacc.add(l);  
insert newacc; 

a.Number_of_Locations_Specific__c = 101;
a.SEO_Rank_Check__c = 26;
a.Disposition__c = 'In Progress';
a.Local_Website_Presence__c = 26;
a.Brand_Consistency__c = False;
a.Mobile_Readiness__c = False;
a.Contact_Frequency__c = 3;
a.Most_Recent_Contact__c = date.parse('3/27/2013');
a.Profile_Completeness__c = false;
a.Existing_Sales__c = 2;
a.Segment_Population__c = 11;
a.Geographic_Reach__c = 12;
a.PPC_Rank_Check__c = 26;
newacc2.add(a);

b.Number_of_Locations_Specific__c = 201;
b.SEO_Rank_Check__c = 60;
b.Disposition__c = 'In Progress';
b.Local_Website_Presence__c = 60;
b.Brand_Consistency__c = False;
b.Mobile_Readiness__c = False;
b.Contact_Frequency__c = 4;
b.Most_Recent_Contact__c = date.parse('3/27/2013');
b.Profile_Completeness__c = false;
b.Existing_Sales__c = 3;
b.Segment_Population__c = 22;
b.Geographic_Reach__c = 101;
b.PPC_Rank_Check__c = 60;
newacc2.add(b);



c.Number_of_Locations_Specific__c = 502;
c.SEO_Rank_Check__c = 90;
c.Disposition__c = 'Call Back';
c.Local_Website_Presence__c = 90;
c.Brand_Consistency__c = False;
c.Mobile_Readiness__c = False;
c.Contact_Frequency__c = 7;
c.Most_Recent_Contact__c = date.parse('3/27/2013');
c.Profile_Completeness__c = false;
c.Existing_Sales__c = 4;
c.Segment_Population__c = 37;
c.Geographic_Reach__c = 450;
c.PPC_Rank_Check__c = 90;
newacc2.add(c);

d.Number_of_Locations_Specific__c = 99;
d.SEO_Rank_Check__c = 24;
d.Disposition__c = 'Opportunity';
d.Local_Website_Presence__c = 24;
d.Brand_Consistency__c = True;
d.Mobile_Readiness__c = True;
d.Contact_Frequency__c = 1;
d.Most_Recent_Contact__c = date.parse('12/27/2012');
d.Profile_Completeness__c = true;
d.Existing_Sales__c = 1;
d.Segment_Population__c = 1;
d.Geographic_Reach__c = 10;
d.PPC_Rank_Check__c = 24;
newacc2.add(d);


k.Disposition__c = 'Refusal';
j.Disposition__c = 'Need More Info'; 
i.Disposition__c = 'Contact Parent Company';
h.Disposition__c = 'Not a Good Fit';
g.Disposition__c = 'Contact Child Accounts';
f.Disposition__c = 'Bottoms Up';
newacc2.add(f);
newacc2.add(g);
newacc2.add(h);
newacc2.add(i);
newacc2.add(j);
newacc2.add(k);

/**
l.Number_of_Locations_Specific__c = null;
l.SEO_Rank_Check__c = null;
l.Disposition__c = null;
l.Local_Website_Presence__c = null;
l.Brand_Consistency__c = null;
l.Mobile_Readiness__c = null;
l.Contact_Frequency__c = null;
l.Most_Recent_Contact__c = null;
l.Profile_Completeness__c = null;
l.Existing_Sales__c = null;
l.Segment_Population__c = null;
l.Geographic_Reach__c = null;
l.PPC_Rank_Check__c = null;
newacc2.add(l);
**/

e.Name = 'TestCorp Productions';
newacc2.add(e);
            
update newacc2;
    test.stopTest();  
 }
 }