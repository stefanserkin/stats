trigger SeasonTrigger on Season__c (before insert, before update) {
    SeasonHandler.handleTriggerEvent(Trigger.new, Trigger.isBefore, Trigger.isInsert, Trigger.isUpdate);
}