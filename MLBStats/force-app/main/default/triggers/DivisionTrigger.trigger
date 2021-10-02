trigger DivisionTrigger on Division__c (before insert, before update) {
    DivisionHandler.handleTriggerEvent(Trigger.new, Trigger.isBefore, Trigger.isInsert, Trigger.isUpdate);
}