public with sharing class TestAccountClass {
    public AccountInsertClass() {

    }
    public static void insertAccount(List<Account> accList){
        System.debug('Account::');
        for(Account acc:accList){
            acc.Description='Happy Welcome';
        }
       
        System.debug('Account List::'+accList);
    }

    public static void insertAccountTest(List<Account> accList){
        System.debug('Account List::'+accList);
        System.debug('Account List::'+accList);
        System.debug('Account List::'+accList);
        System.debug('Account List::'+accList);
    }
}
