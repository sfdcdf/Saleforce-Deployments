/*
//Reason : “BeaconHS1Migration” : Inactivated the completed class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019
*/
@isTest
public class Test_icSerWBNOptCasesAut {
    
    static testMethod void test_icServiceWBNOptimizationCasesAutomation() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          icServiceWBNOptimizationCasesAutomation obj = new icServiceWBNOptimizationCasesAutomation();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }   
     

}