public with sharing class MixedDMLFuture {
    public static void userFutureMethod(){
        Account objetAccountToInsert = new Account(Name='ExampleFutureMethod');
        System.debug('First DML operation');
        insert objetAccountToInsert;

        FutureMethodExample.insertUserWithRole('method@future.com', 'methFut', 'method@future.com','future');
    }
}
