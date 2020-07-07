//
//  Model.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-06-16.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

import Foundation

struct TotalData {
    let confirmed: Int;
    let critical: Int;
    let deaths: Int;
    let recovered: Int;
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}

struct CountryData {
    let country:String;
    let confirmed:Int64;
    let recovered:Int64;
    let critical:Int64;
    let deaths:Int64;
    let latitude:Double;
    let longitude:Double;
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
    
}

struct DetailedCountryData {
    let country:String;
    
    let confirmedCases:Int
    let newCases: Int
    
    let recoveredCases:Int
    let criticalCases:Int
    let activeCases: Int
    
    let deaths:Int
    let newDeaths:Int
    let testsDone: Int
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmedCases)
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recoveredCases)) / Double(confirmedCases)
    }
    
}



let testTotalData = TotalData(confirmed: 200, critical: 100, deaths: 20, recovered: 50);
let testCountryData = CountryData(country: "Test", confirmed: 20, recovered: 100, critical: 40, deaths: 10, latitude: 0.0, longitude: 0.0);
