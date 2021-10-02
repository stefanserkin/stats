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
        leagues.add( new League__c(Name='NL') );
        leagues.add( new League__c(Name='AL') );
        insert leagues;
        return leagues;
    }

    private static List<Division__c> createDivisions(List<League__c> leagues) {
        List<Division__c> divisions = new List<Division__c>();
        for (League__c league : leagues) {
            divisions.add( new Division__c(Name = league.Name + ' East', League__c = league.Id) );
            divisions.add( new Division__c(Name = league.Name + ' Central', League__c = league.Id) );
            divisions.add( new Division__c(Name = league.Name + ' West', League__c = league.Id) );
        }
        insert divisions;
        return divisions;
    }

    private static List<Franchise__c> createFranchises(List<Division__c> divisions) {

        for (Division__c div : divisions) {

            switch on div.Name {
                when 'NL East' {
                    List<String> teamNames = new List<String>{
                        'New York Mets',
                        'Atlanta Braves',
                        'Philadelphia Phillies',
                        'Miami Marlins',
                        'Washington Nationals'
                    };
                    addToFranchiseList(teamNames, div.Id);
                }
                when 'NL Central' {
                    List<String> teamNames = new List<String>{
                        'Chicago Cubs',
                        'Cincinnati Reds',
                        'St. Louis Cardinals',
                        'Pittsburgh Pirates',
                        'Milwaukee Brewers'
                    };
                    addToFranchiseList(teamNames, div.Id);
                }
                when 'NL West' {
                    List<String> teamNames = new List<String>{
                        'San Diego Padres',
                        'San Francisco Giants',
                        'Los Angeles Dodgers',
                        'Colorado Rockies',
                        'Arizona Diamondbacks'
                    };
                    addToFranchiseList(teamNames, div.Id);
                }
                when 'AL East' {
                    List<String> teamNames = new List<String>{
                        'New York Yankees',
                        'Boston Red Sox',
                        'Toronto Blue Jays',
                        'Baltimore Orioles',
                        'Tampa Bay Rays'
                    };
                    addToFranchiseList(teamNames, div.Id);
                }
                when 'AL Central' {
                    List<String> teamNames = new List<String>{
                        'Chicago White Sox',
                        'Minnesota Twins',
                        'Cleveland Guardians',
                        'Kansas City Royals',
                        'Detroit Tigers'
                    };
                    addToFranchiseList(teamNames, div.Id);
                }
                when 'AL West' {
                    List<String> teamNames = new List<String>{
                        'Oakland Athletics',
                        'Houston Astros',
                        'Seattle Mariners',
                        'Texas Rangers',
                        'Los Angeles Angels'
                    };
                    addToFranchiseList(teamNames, div.Id);
                }
                when else {
                    continue;
                }
            }

        }

        insert franchises;
        return franchises;

    }

    private static void addToFranchiseList(List<String> teamNames, Id divisionId) {
        if (franchises == null) {
            franchises = new List<Franchise__c>();
        }
        for (String team : teamNames) {
            franchises.add(
                new Franchise__c(
                    Name        = team,
                    Division__c = divisionId
                )
            );
        }
    }

}