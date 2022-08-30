public with sharing class ExampleQueueClass implements Queueable{

    public String industryToSearch = '';

    public ExampleQueueClass(String industryToSearch) {
        this.industryToSearch = industryToSearch;
    }

    public void execute(QueueableContext qContext){
        List<Contact>lstContactToInsert = new List<Contact>();
        for(Account objAccount : [SELECT id FROM Account WHERE Industry=:industryToSearch]){
            Contact objContact = new Contact();
            objContact.AccountId = objAccount.Id;
            objContact.LastName = 'Contacto creado por Queueable';
            lstContactToInsert.add(objContact);
        }
        insert lstContactToInsert;
    }
}
