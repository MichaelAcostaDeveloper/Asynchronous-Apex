global with sharing class ExampleBatchApexQLStateFul implements Database.Batchable<sObject>, Database.Stateful {

    global Integer totalCuentasInsertadas = 0;
    global Database.queryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id, Industry,Name FROM Account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC,List<Account> scope){
        List<Account> lstAccountToInsert = new List<Account>();
        for(Account account : scope){
            String removeQL=account.Name.replace(' queryLocator','');
            account.Name = 'Cuenta creada por batch '+removeQL;
            account.Industry = 'Finance';
            account.id=NULL;
            lstAccountToInsert.add(account);
            totalCuentasInsertadas++;
        }
        insert lstAccountToInsert;

    }
    global void finish(Database.BatchableContext BC){
        AsyncApexJob apxJob = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems FROM AsyncApexJob WHERE Id=:BC.getJobId()];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses= new String[]{'michael.acosta@gmail.com'};
        mail.setToAddresses(toAddresses);
        mail.setSenderDisplayName('Michael Job Result');
        mail.setSubject('El  job resulto '+apxJob.Status+ ' se insertaron '+totalCuentasInsertadas+ ' registros');
        mail.setHtmlBody('Se ejecutaron '+apxJob.TotalJobItems+' y hubo '+apxJob.NumberOfErrors+ ' errores.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});

    }
}
