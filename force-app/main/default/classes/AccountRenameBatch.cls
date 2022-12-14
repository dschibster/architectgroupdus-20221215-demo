public with sharing class AccountRenameBatch extends BatchJobBase implements Database.Batchable<SObject>, Database.RaisesPlatformEvents {
    public AccountRenameBatch() {
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        super.startLogging(BC?.getJobId());
        return Database.getQueryLocator([SELECT Id, Name FROM Account]);
    }

    public void execute(Database.BatchableContext BC, List<Account> scope) {
        super.logInformation(scope, BC?.getJobId(), 'Updating these Accounts');
        for (Account acc : scope) {
            String newAccountName = acc.Name;
            if (acc.Name.containsIgnoreCase('dennis-was-here')) {
                super.logInformation(BC?.getJobId(), 'The account has already been updated at least once');
                newAccountName = acc.Name.left(acc.Name.indexOf('dennis-was-here') - 1);
            }
            newAccountName += ' dennis-was-here-' + Datetime.now().getTime();
            super.logInformation(BC?.getJobId(), 'New Account Name:' + newAccountName);
            acc.Name = newAccountName;
        }
        update scope;
        super.logEndOfBatch(scope, BC?.getJobId(), true, 'Successful Update');
    }

    public void finish(Database.BatchableContext BC) {
        super.finishBatch(BC?.getJobId());
    }
}
