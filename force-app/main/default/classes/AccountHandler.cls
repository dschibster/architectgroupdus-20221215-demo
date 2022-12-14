public with sharing class AccountHandler extends TriggerHandler {
    public AccountHandler() {
        super('AccountHandler');
    }

    public override void afterInsert() {
        insertScheduleTaskForNewAccount();
    }

    private void insertScheduleTaskForNewAccount() {
        List<Task> newTaskList = new List<Task>();
        Logger.debug('This is the list of new Accounts', Trigger.new);
        for (Account newAccount : (List<Account>) Trigger.new) {
            Task scheduleCallTask = new Task(
                Subject = 'Schedule a Call with the customer',
                OwnerId = newAccount.OwnerId,
                ActivityDate = Date.today().addDays(2),
                WhatId = newAccount.Id
            );
            newTaskList.add(scheduleCallTask);
        }
        Logger.debug('Inserting new Tasks');
        try {
            insert newTaskList;
            Logger.debug('Save completed');
        } catch (Exception e) {
            Logger.error('Ran into an exception saving the records', e);
        }
        Logger.saveLog();
    }
}
