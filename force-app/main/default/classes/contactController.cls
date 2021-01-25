public with sharing class contactController {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getAllContacts() {
        List<Contact> allContacts;
        allContacts = [
            SELECT LastName, Id
            FROM Contact
            LIMIT 100
        ];
        
        return allContacts;    
    }

    @AuraEnabled
    public static void deleteContact(String contactId) {
        List<Contact> contactToDelete = [
            SELECT LastName
            FROM Contact
            WHERE id = :contactId
        ];
        delete contactToDelete[0];
    }
    
    @AuraEnabled
    public static void createContact(String firstName, String lastName, String email,
                                     String mobilePhone, String accountId) {
        Contact newContact = new Contact();
        newContact.LastName = lastName;
        if(firstName != ''){
            newContact.firstName = firstName;
        }
        if(Email != ''){
            newContact.Email = email;
        }
        if(mobilePhone != ''){
            newContact.mobilePhone = mobilePhone;
        }
        if(accountId != ''){
            newContact.AccountId = accountId;
        }
        
        insert newContact;
    }
}
