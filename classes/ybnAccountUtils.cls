global class ybnAccountUtils {
		
	public static void updateSatisfactionScores(List<Account> scope) {
		
		Id TaskRelationshipRecordTypeId = ybnUtils.getInstance().getYbnCorporateRelationshipTaskRecordTypeId();
		
		Map<Id, Account> accounts = new Map<Id, Account>();
		
		for(Account a: scope) {
			
			// Reset all values
			a.Customer_Sat_Score_Past_45_Days__c		= 0;
			a.Customer_Sat_Score_Past_120_Days__c		= 0;
			a.Customer_Sat_Score_Past_90_Days__c		= 0;
			
			a.Sales_Rated_Sat_Score_Past_45_Days__c		= 0;
			a.Sales_Rated_Sat_Score_Past_120_Days__c	= 0;
			a.Sales_Rated_Sat_Score_Past_90_Days__c		= 0;
			
			a.CS_Satisfaction_Score_Past_45_Da__c		= 0;
			a.CS_Sat_Score_Past_120_Day__c				= 0;
			a.CS_Satisfaction_Score_Past_90_Days__c		= 0;
			
			accounts.put(a.Id, a);
		}
		
		AggregateResult[] groupedResults45 =
				[SELECT AccountId, AVG(CS_Customer_Satisfaction_Score__c), AVG(Customer_Rated_Satisfaction_Score__c), AVG(Sales_Customer_Satisfaction_Score__c) 
				FROM Task 
				WHERE AccountId IN :accounts.keySet() AND ActivityDate = LAST_N_DAYS:45 
					AND RecordTypeId = :TaskRelationshipRecordTypeId
					AND Status = 'Completed'
				GROUP BY AccountId];
		AggregateResult[] groupedResults90 =
				[SELECT AccountId, AVG(CS_Customer_Satisfaction_Score__c), AVG(Customer_Rated_Satisfaction_Score__c), AVG(Sales_Customer_Satisfaction_Score__c) 
				FROM Task 
				WHERE AccountId IN :accounts.keySet() AND ActivityDate = LAST_N_DAYS:90
					AND RecordTypeId = :TaskRelationshipRecordTypeId
					AND Status = 'Completed'
				GROUP BY AccountId];
		AggregateResult[] groupedResults120 =
				[SELECT AccountId, AVG(CS_Customer_Satisfaction_Score__c), AVG(Customer_Rated_Satisfaction_Score__c), AVG(Sales_Customer_Satisfaction_Score__c) 
				FROM Task 
				WHERE AccountId IN :accounts.keySet() AND ActivityDate = LAST_N_DAYS:120
					AND RecordTypeId = :TaskRelationshipRecordTypeId
					AND Status = 'Completed'
				GROUP BY AccountId];
				
		
		for (AggregateResult ar: groupedResults45) {
			Account a = accounts.get((Id) ar.get('AccountId'));
			a.CS_Satisfaction_Score_Past_45_Da__c = (Decimal) ar.get('expr0');
			a.Customer_Sat_Score_Past_45_Days__c = (Decimal) ar.get('expr1');
			a.Sales_Rated_Sat_Score_Past_45_Days__c = (Decimal) ar.get('expr2');
		}
		
		for (AggregateResult ar: groupedResults90) {
			Account a = accounts.get((Id) ar.get('AccountId'));
			a.CS_Satisfaction_Score_Past_90_Days__c = (Decimal) ar.get('expr0');
			a.Customer_Sat_Score_Past_90_Days__c = (Decimal) ar.get('expr1');
			a.Sales_Rated_Sat_Score_Past_90_Days__c = (Decimal) ar.get('expr2');
		}
		
		for (AggregateResult ar: groupedResults120) {
			Account a = accounts.get((Id) ar.get('AccountId'));
			a.CS_Sat_Score_Past_120_Day__c = (Decimal) ar.get('expr0');
			a.Customer_Sat_Score_Past_120_Days__c = (Decimal) ar.get('expr1');
			a.Sales_Rated_Sat_Score_Past_120_Days__c = (Decimal) ar.get('expr2');
		}
		
		update accounts.values();
	} 
}