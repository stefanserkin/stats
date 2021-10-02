trigger LeagueTrigger on League__c (before insert, before update) {
    LeagueHandler.handleTriggerEvent(Trigger.new, Trigger.isBefore, Trigger.isInsert, Trigger.isUpdate);
}