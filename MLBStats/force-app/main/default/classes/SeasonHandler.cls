public with sharing class SeasonHandler {

    public static void handleTriggerEvent(
        List<Season__c> lstSeasonsInTrigger, 
        Boolean isBefore, Boolean isInsert, Boolean isUpdate
    ) {
        if (isBefore && (isInsert || isUpdate)) {
            setSeasonStatuses(lstSeasonsInTrigger);
        }
    }

    private static void setSeasonStatuses(List<Season__c> lstSeasonsInTrigger) {
        for (Season__c seas : lstSeasonsInTrigger) {
            if (seas.End_Date__c < Date.today()) {
                seas.Status__c = 'Past';
            } else if (seas.Start_Date__c > Date.today()) {
                seas.Status__c = 'Future';
            } else {
                seas.Status__c = 'Current';
            }
        }
    }

}