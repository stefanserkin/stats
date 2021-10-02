trigger FranchiseTrigger on Franchise__c (before insert, before update) {
    FranchiseHandler.handleTriggerEvent(Trigger.new, Trigger.isBefore, Trigger.isInsert, Trigger.isUpdate);
}