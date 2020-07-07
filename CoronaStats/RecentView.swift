//
//  RecentView.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-06-19.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var covidFetch = CovidfetchRequest();
    @ObservedObject var test = CountryStatisticsFetchRequest()
    
    @State var searchText = ""
    @State var isSearchVisible = false
    
    var body: some View {
        NavigationView {
            VStack {

                if self.isSearchVisible {
                    SearchView(searchText: self.$searchText)
                }

                TotalDataView(totalData: covidFetch.totalData)
                ListheaderView()
                List{
                    ForEach(covidFetch.allCountries.filter{
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) { countryData in
                        NavigationLink(destination: CountryDetailView(countryName: countryData.country)) {
                              CountryDataRowView(countryData: countryData);
                        }
                      
                    }
                }
            }// End of VStack
                .navigationBarTitle("Recent Data", displayMode: .inline)
                .navigationBarItems(trailing:
            Button(action: {
                self.isSearchVisible.toggle()
                    if !self.isSearchVisible {
                        self.searchText = ""
                    }
                }, label: {
                Image(systemName: "magnifyingglass")
                
            })
            )
            
        }// End of Navigation View
           
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
