public with sharing class ExampleQueueableChainingClass implements Queueable {
    
    public List<Contact> lstInboundContacts = new List<Contact>();

    public ExampleQueueableChainingClass(List<Contact> lstInboundContacts) {
        this.lstInboundContacts = lstInboundContacts;
    }

    public void execute(QueueableContext qContext) {
        List<Case> lstCaseToInserter = new List<Case>();
        for(Contact objContact : lstInboundContacts){
            Case objCase = new Case();
            objCase.ContactId=objContact.Id;
            objCase.Subject='Case creado por chain';
            lstCaseToInserter.add(objCase);
        }
        insert lstCaseToInserter;
    }
}
