//
//  CountryDetailRow.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-06-25.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

import SwiftUI

struct CountryDetailRow: View {
    
    var number: String = "Error"
    var name: String = "Confirmed"
    var color: Color = .primary
    
    var body: some View {
        VStack {
            HStack {
            Text(self.name)
                .font(.body)
                .padding(5)
                Spacer()
            Text(self.number)
                .font(.subheadline)
                .padding(5)
                .foregroundColor(color)
            }
            Divider()
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct CountryDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailRow()
    }
}
