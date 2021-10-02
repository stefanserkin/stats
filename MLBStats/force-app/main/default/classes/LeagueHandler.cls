public with sharing class LeagueHandler {
    public static void handleTriggerEvent(
        List<League__c> lstLeaguesInTrigger,
        Boolean isBefore,
        Boolean isInsert,
        Boolean isUpdate
    ) {
        if (isBefore && (isInsert || isUpdate)) {
            handleBefore(lstLeaguesInTrigger);
        }
    }

    private static void handleBefore(List<League__c> lstLeaguesInTrigger) {
        for (League__c league : lstLeaguesInTrigger) {
            if (league.Sort_Order__c == null) {
                setDefaultSortOrder(league);
            }
        }
    }

    private static void setDefaultSortOrder(League__c league) {
        league.Sort_Order__c = 1;
    }
}
