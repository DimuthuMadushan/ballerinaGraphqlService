import ballerina/graphql;

isolated service /covid19 on new graphql:Listener(9090) {

    isolated resource function get name() returns string {
        return "Covid-~19 data";
    }

    isolated resource function get all() returns CovidData[] {
        return covidEntries.toArray();
    }

    isolated resource function get filter(string isoCode) returns CovidData? {
        return covidEntries.get(isoCode);
    }

}

public type CovidEntry record {|
    readonly string isoCode;
    string country;
    int cases?;
    int deaths?;
    int recovered?;
    int active?;
|};

final map<CovidData> & readonly covidEntries = {
    "AFG": {isoCode: "AFG", country: "Afghanistan", cases: 159303, deaths: 7386, recovered: 146084, active: 5833},
    "SL": {isoCode: "SL", country: "Sri Lanka", cases: 598536, deaths: 15243, recovered: 568637, active: 14656},
    "US": {isoCode: "US", country: "USA", cases: 69808350, deaths: 880976, recovered: 43892277, active: 25035097},
    "DEU": {isoCode: "DEU", country: "Germany", cases: 159303, deaths: 7386, recovered: 146084, active: 5833},
    "IND": {isoCode: "IND", country: "India", cases: 598536, deaths: 15243, recovered: 568637, active: 14656},
    "CAN": {isoCode: "CAN", country: "Canada", cases: 69808350, deaths: 880976, recovered: 43892277, active: 25035097},
    "ESP": {isoCode: "ESP", country: "Spain", cases: 159303, deaths: 7386, recovered: 146084, active: 5833},
    "BR": {isoCode: "BR", country: "Brazil", cases: 598536, deaths: 15243, recovered: 568637, active: 14656}
};

public type CovidData record {|
    readonly string isoCode;
    string country;
    int cases?;
    int deaths?;
    int recovered?;
    int active?;
|};
