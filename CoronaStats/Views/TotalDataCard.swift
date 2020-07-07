//
//  TotalDataCard.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-06-23.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

import SwiftUI

struct TotalDataCard: View {
    
    var number: String = "Error"
    var name: String = "Confirmed"
    var color: Color = .primary
    
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Text(self.number).font(.subheadline).padding(5).foregroundColor(self.color)
                Text(self.name).font(.body).padding(5).foregroundColor(self.color)
            } // End of VStack
                .frame(width: geometry.size.width, height: 80, alignment: .center)
                .background(Color("cardBackgroundGrey"))
                 .cornerRadius(8.0)
        } // End of Geometry
    }
}

struct TotalDataCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataCard()
    }
}
