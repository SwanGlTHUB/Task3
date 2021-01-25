public with sharing class leadController {

    @AuraEnabled(cacheable=true)
    public static List<Lead> getLeads() {
        List<Lead> leads;
        leads = [
            SELECT Name, Title, Phone, Id
            FROM Lead
            LIMIT 100
        ];
        return leads;
    }

    @AuraEnabled
    public static void changeFields(String title, String phone, String recordId){
        Lead leadToEdit = [
            SELECT Title, Phone
            FROM Lead
            WHERE Id = :recordId
        ][0];
        leadToEdit.Title = title;
        leadToEdit.Phone = phone;
        
        update leadToEdit;
    }
}
