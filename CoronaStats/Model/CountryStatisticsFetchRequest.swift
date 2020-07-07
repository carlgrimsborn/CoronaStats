//
//  CountryStatisticsFetchRequest.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-07-03.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CountryStatisticsFetchRequest: ObservableObject {
    
    @Published var detailedCountriesData: DetailedCountryData?
    
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "d22c87edc4msh6a77b07ded5ac87p151164jsnbbf4bb8c5600"
    ]
    
    init() {
        
    }
    
    func getStatsFor(country: String) {
        
        AF.request("https://covid-193.p.rapidapi.com/statistics?country=\(country)", headers: headers).responseJSON { response in
            
            let result = response.data;
            
            if (result != nil) {
                let json = JSON(result!);
                // print(json["response"][0])
                
                let country = json["response"][0]["country"].stringValue
                
                let deaths = json["response"][0]["deaths"]["total"].intValue
                let newDeaths = json["response"][0]["deaths"]["new"].intValue
                
                let tests = json["response"][0]["tests"]["total"].intValue
                
                let criticalCases = json["response"][0]["cases"]["critical"].intValue
                let totalCases = json["response"][0]["cases"]["total"].intValue
                let activeCases = json["response"][0]["cases"]["active"].intValue
                let newCases = json["response"][0]["cases"]["new"].intValue
                let recoveredCases = json["response"][0]["cases"]["recovered"].intValue
                
                
                self.detailedCountriesData = DetailedCountryData(country: country, confirmedCases: totalCases, newCases: newCases, recoveredCases: recoveredCases, criticalCases: criticalCases, activeCases: activeCases, deaths: deaths, newDeaths: newDeaths, testsDone: tests)
            }
        }
        
    }
    
}


