public with sharing class DivisionHandler {
    
    public static void handleTriggerEvent(
        List<Division__c> lstDivsInTrigger,
        Boolean isBefore,
        Boolean isInsert,
        Boolean isUpdate
    ) {
        if (isBefore && (isInsert || isUpdate)) {
            handleBefore(lstDivsInTrigger);
        }
    }

    private static void handleBefore(List<Division__c> lstDivsInTrigger) {
        for (Division__c div : lstDivsInTrigger) {
            if (div.Sort_Order__c == null) {
                setDefaultSortOrder(div);
            }
        }
    }

    private static void setDefaultSortOrder(Division__c div) {
        div.Sort_Order__c = 1;
    }
}