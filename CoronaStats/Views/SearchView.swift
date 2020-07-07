//
//  SearchView.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-06-25.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Country...", text: $searchText)
                .padding()
        }
        .frame(height: 50)
        .background(Color("cardBackgroundGrey"))
    }
}
