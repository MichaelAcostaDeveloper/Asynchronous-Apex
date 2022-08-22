public with sharing class FutureMethodExample {
@future
public static void createContact(Id accountId){
    Contact objContactToInsert = new Contact();
    objContactToInsert.AccountId = accountId;
    objContactToInsert.firstName = 'New contact created';
    objContactToInsert.lastName = 'Contact created for future method';
    System.debug('Ongoing future method');
    insert objContactToInsert;
}

@future
public static void insertUserWithRole(String uname, String al, String em, String lname){
    Profile prof=[SELECT Id FROM Profile WHERE Name='Standard User'];
    UserRole userR=[SELECT Id FROM UserRole WHERE Name='COO'];
    User objUserToInsert = new User();
    objUserToInsert.alias=al;
    objUserToInsert.email=em;
    objUserToInsert.lastname=lname;
    objUserToInsert.username=uname;
    objUserToInsert.profileid = prof.Id;
    objUserToInsert.userroleid = userR.Id;
    objUserToInsert.EmailEncodingKey='UTF-8';
    objUserToInsert.LanguageLocaleKey='en_US';
    objUserToInsert.LocaleSidKey='en_US';
    objUserToInsert.TimeZoneSidKey='America/Los_Angeles';
    System.debug('Ongoing future method');
    insert objUserToInsert;
}
}
