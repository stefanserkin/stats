public without sharing class FranchiseCreator {

    private static List<Franchise__c> franchises;

    public static void run() {
        createMLB();
    }
    
    private static void createMLB() {
        List<League__c> leagues = createLeagues();
        List<Division__c> divisions = createDivisions(leagues);
        List<Franchise__c> franchises = createFranchises(divisions);
    }

    private static List<League__c> createLeagues() {
        List<League__c> leagues = new List<League__c>();
        leagues.add( new League__c(Name='NL', Sort_Order__c = 1) );
        leagues.add( new League__c(Name='AL', Sort_Order__c = 2) );
        insert leagues;
        return leagues;
    }

    private static List<Division__c> createDivisions(List<League__c> leagues) {
        List<Division__c> divisions = new List<Division__c>();
        String[] divisionNames = new List<String>{
            'East', 'Central', 'West'
        };
        Integer sortOrder = 1;
        for (League__c league : leagues) {
            for (String divName : divisionNames) {
                divisions.add( 
                    new Division__c(
                        Name = league.Name + ' ' + divName, 
                        League__c = league.Id, 
                        Sort_Order__c = sortOrder
                    )
                );
                sortOrder++;
            }
        }
        insert divisions;
        return divisions;
    }

    private static List<Franchise__c> createFranchises(List<Division__c> divisions) {

        for (Division__c div : divisions) {

            switch on div.Name {
                when 'NL East' {
                    addToFranchiseList('New York', 'Mets', div.Id);
                    addToFranchiseList('Atlanta', 'Braves', div.Id);
                    addToFranchiseList('Philadelphia', 'Phillies', div.Id);
                    addToFranchiseList('Miami', 'Marlins', div.Id);
                    addToFranchiseList('Washington', 'Nationals', div.Id);
                }
                when 'NL Central' {
                    addToFranchiseList('Chicago', 'Cubs', div.Id);
                    addToFranchiseList('St. Louis', 'Cardinals', div.Id);
                    addToFranchiseList('Pittsburgh', 'Pirates', div.Id);
                    addToFranchiseList('Milwaukee', 'Brewers', div.Id);
                    addToFranchiseList('Cincinnati', 'Reds', div.Id);
                }
                when 'NL West' {
                    addToFranchiseList('San Diego', 'Padres', div.Id);
                    addToFranchiseList('San Francisco', 'Giants', div.Id);
                    addToFranchiseList('Los Angeles ', 'Dodgers', div.Id);
                    addToFranchiseList('Colorado', 'Rockies', div.Id);
                    addToFranchiseList('Arizona', 'Diamondbacks', div.Id);
                }
                when 'AL East' {
                    addToFranchiseList('New York', 'Yankees', div.Id);
                    addToFranchiseList('Boston', 'Red Sox', div.Id);
                    addToFranchiseList('Toronto', 'Blue Jays', div.Id);
                    addToFranchiseList('Baltimore', 'Orioles', div.Id);
                    addToFranchiseList('Tampa Bay', 'Rays', div.Id);
                }
                when 'AL Central' {
                    addToFranchiseList('Chicago', 'White Sox', div.Id);
                    addToFranchiseList('Minnesota', 'Twins', div.Id);
                    addToFranchiseList('Cleveland', 'Guardians', div.Id);
                    addToFranchiseList('Kansas City', 'Royals', div.Id);
                    addToFranchiseList('Detroit', 'Tigers', div.Id);
                }
                when 'AL West' {
                    addToFranchiseList('Oakland', 'Athletics', div.Id);
                    addToFranchiseList('Houston', 'Astros', div.Id);
                    addToFranchiseList('Seattle', 'Mariners', div.Id);
                    addToFranchiseList('Texas', 'Rangers', div.Id);
                    addToFranchiseList('Los Angeles', 'Angels', div.Id);
                }
                when else {
                    continue;
                }
            }

        }

        insert franchises;
        return franchises;

    }

    private static void addToFranchiseList(String hometown, String teamName, Id divisionId) {
        if (franchises == null) {
            franchises = new List<Franchise__c>();
        }
        franchises.add(
            new Franchise__c(
                Hometown__c  = hometown,
                Team_Name__c = teamName,
                Division__c  = divisionId
            )
        );
    }

}