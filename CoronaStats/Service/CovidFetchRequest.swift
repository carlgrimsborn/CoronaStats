//
//  CovidFetchRequest.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-06-15.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CovidfetchRequest: ObservableObject {
    @Published var allCountries: [CountryData] = [];
    @Published var totalData: TotalData = testTotalData;
    
    let headers: HTTPHeaders = [
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
            "x-rapidapi-key": "d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59"
        ]
    
    init() {
        getAllCountries()
        getCurrentTotal()
    }
   func getCurrentTotal() {

    AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers: headers).responseJSON { response in
    
        let result = response.data;
        
        if (result != nil) {
            let json = JSON(result!);
       
            
            let confirmed = json[0]["confirmed"].intValue;
             let deaths = json[0]["deaths"].intValue;
             let critical = json[0]["critical"].intValue;
             let recovered = json[0]["recovered"].intValue;
            
            self.totalData = TotalData(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered);
        } else {
            self.totalData = testTotalData;
       
        }
    }
     
    }
    
    func getAllCountries() {
        
        AF.request("https://covid-19-data.p.rapidapi.com/country/all?format=json", headers: headers).responseJSON { response in
        
            let result = response.value;
            var allCount :[CountryData] = [];
            if (result != nil) {
                let dataDictionary = result as! [Dictionary<String, AnyObject>];
                for countryData in dataDictionary {
                    let country = countryData["country"] as? String ?? "Error";
                    let longitude = countryData["longitude"] as? Double ?? 0.0;
                    let latitude = countryData["latitude"] as? Double ?? 0.0;
                    let deaths = countryData["deaths"] as? Int64 ?? 0;
                    let recovered = countryData["recovered"] as? Int64 ?? 0;
                    let confirmed = countryData["confirmed"] as? Int64 ?? 0;
                    let critical = countryData["critical"] as? Int64 ?? 0;
                    
                    let countryObject = CountryData(country: country, confirmed: confirmed, recovered: recovered, critical: critical, deaths: deaths, latitude: latitude, longitude: longitude);
                    
                    allCount.append(countryObject);
                }
            }
            self.allCountries = allCount.sorted(by: {$0.confirmed > $1.confirmed});
            
        }
    }
}
