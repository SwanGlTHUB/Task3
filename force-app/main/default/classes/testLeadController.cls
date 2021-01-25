@isTest public with sharing class testLeadController {
    
    @isTest public static void testGetLeads(){
        Lead testLead = new Lead(LastName = 'last', Company = 'ooo');

        Test.startTest();
        insert testLead;
        List<Lead> leads = leadController.getLeads();
        System.assertEquals(1, leads.size());
        System.assertEquals(leads[0].id, testLead.id);
        Test.stopTest();
    }

    @isTest public static void testChangeFields(){
        Lead testLead = new Lead(LastName = 'last', Company = 'ooo');

        Test.startTest();
        insert testLead;
        leadController.changeFields('lol', 'kek', testLead.id);
        List<Lead> leads = [
            SELECT Title
            FROM Lead
            WHERE Id = :testLead.Id
        ];
        System.assertEquals(1, leads.size());
        System.assertEquals(leads[0].Title, 'lol');
        Test.stopTest();
    }    
}
