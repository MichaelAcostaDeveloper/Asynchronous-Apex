global with sharing class BatchApexExample implements Database.Batchable<sObject> {
    global List<Account>start(Database.BatchableContext BC){
        List<Account> lstAccounts = [SELECT Id, Industry FROM Account];
        return lstAccounts;
    }
    global void execute(Database.BatchableContext BC,List<Account> scope){
        List<Account> lstAccountToUpd = new List<Account>();
        for(Account account : scope){
            account.Industry = 'Technology';
            lstAccountToUpd.add(account);
        }
        update lstAccountToUpd;

    }
    global void finish(Database.BatchableContext BC){

    }
}
