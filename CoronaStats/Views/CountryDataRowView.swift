//
//  CountryDataRowView.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-06-20.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

import SwiftUI

struct CountryDataRowView: View {
    
    var countryData : CountryData
    
    var body: some View {
        HStack {
            Text(countryData.country).fontWeight(.medium).font(.subheadline).frame(width: 110, alignment: .leading).lineLimit(2)
            Spacer()
            Text(countryData.confirmed.formatNumber()).font(.subheadline).frame(height: 40).padding(.leading, 5).lineLimit(1).minimumScaleFactor(0.7)
            Spacer()
            Text(countryData.deaths.formatNumber()).frame(width: 50, height: 40, alignment: .center).font(.subheadline).padding(.leading, 5).foregroundColor(.red).lineLimit(1).minimumScaleFactor(0.7)
            Spacer()
            Text(countryData.recovered.formatNumber()).fontWeight(.medium).font(.subheadline).frame(width: 50, height: 40, alignment: .center).foregroundColor(.green).lineLimit(1).minimumScaleFactor(0.7)
        }
    }
}

struct CountryDataRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRowView(countryData: testCountryData)
    }
}
