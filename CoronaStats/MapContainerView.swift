//
//  MapContainerView.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-06-26.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
    
    @ObservedObject var covidFetch = CovidfetchRequest()
    
    var body: some View {
        MapView(countryData: $covidFetch.allCountries)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
