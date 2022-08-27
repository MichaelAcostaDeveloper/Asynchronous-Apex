global with sharing class BatchApexExampleQueryLocator implements Database.Batchable<sObject>  {

    global Database.queryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id, Industry,Name FROM Account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC,List<Account> scope){
        List<Account> lstAccountToUpd = new List<Account>();
        for(Account account : scope){
            account.Name = account.Name+' queryLocatorExample';
            lstAccountToUpd.add(account);
        }
        update lstAccountToUpd;

    }
    global void finish(Database.BatchableContext BC){
        
    }
}
