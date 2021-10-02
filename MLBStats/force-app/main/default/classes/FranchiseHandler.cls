public class FranchiseHandler {
    
    public static void handleTriggerEvent(
        List<Franchise__c> lstFranchisesInTrigger,
        Boolean isBefore, Boolean isInsert, Boolean isUpdate
    ) {
        if (isBefore && (isInsert || isUpdate)) {
            handleBefore(lstFranchisesInTrigger);
        }
    }

    private static void handleBefore(List<Franchise__c> lstFranchisesInTrigger) {
        for (Franchise__c fran : lstFranchisesInTrigger) {
            setFranchiseName(fran);
        }
    }

    private static void setFranchiseName(Franchise__c fran) {
        fran.Name = fran.Hometown__c + ' ' + fran.Team_Name__c;
    }

}