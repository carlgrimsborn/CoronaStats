//
//  CountryDetailView.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-06-25.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    @ObservedObject var countryStatisticsRequest = CountryStatisticsFetchRequest()
    
    var countryName: String
    
    var body: some View {
        VStack {
            VStack {
              
                CountryDetailRow(number: countryStatisticsRequest.detailedCountriesData?.confirmedCases.formatNumber() ?? "Err", name: "Confirmed")
                    .padding(.top)
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountriesData?.activeCases.formatNumber() ?? "Err", name: "Active Cases")
                
                CountryDetailRow(number: "+" + (countryStatisticsRequest.detailedCountriesData?.newCases.formatNumber() ?? "Err"), name: "New Cases")
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountriesData?.recoveredCases.formatNumber() ?? "Err", name: "Recovered Cases", color: .green)
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountriesData?.criticalCases.formatNumber() ?? "Err", name: "Critical Cases", color: .yellow)
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountriesData?.deaths.formatNumber() ?? "Err", name: "Deaths", color: .red)
                
                CountryDetailRow(number: "+" + (countryStatisticsRequest.detailedCountriesData?.newDeaths.formatNumber() ?? "Err"), name: "New Deaths", color: .red)
                
                  CountryDetailRow(number: countryStatisticsRequest.detailedCountriesData?.testsDone.formatNumber() ?? "Err", name: "Tests done", color: .yellow)
                
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailedCountriesData?.fatalityRate ?? 0.0) + "%", name: "Fatality Rate", color: .red)
                
                     CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailedCountriesData?.recoveredRate ?? 0.0) + "%", name: "Recovery Rate", color: .green)
                
            }
            .background(Color("cardBackgroundGrey"))
    .cornerRadius(8)
    .padding()
            Spacer()
        }
        .padding(.top, 25)
        .navigationBarTitle(countryName)
        .onAppear() {
            self.getStatistics()
        }
    }
    
    private func getStatistics() {
      
        countryStatisticsRequest.getStatsFor(country: self.countryName.replacingOccurrences(of: " ", with: "-"))
    }
}
