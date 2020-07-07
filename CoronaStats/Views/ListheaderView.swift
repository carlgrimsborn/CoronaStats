//
//  ListheaderView.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-06-20.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

import SwiftUI

struct ListheaderView: View {
    var body: some View {
        HStack {
            Text("Country").fontWeight(.bold).font(.subheadline).frame(width: 110, alignment: .leading).padding(.leading, 15)
            Spacer()
            Text("Conf.").fontWeight(.bold).font(.subheadline).frame(height: 40).padding(.leading, 5)
            Spacer()
            Text("Death").fontWeight(.bold).font(.subheadline).frame(height: 40).padding(.leading, 5)
            Spacer()
            Text("Country").fontWeight(.bold).font(.subheadline).frame(height: 40).padding(.trailing, 15)
        }.background(Color("cardBackgroundGrey"))
    }
}

struct ListheaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListheaderView()
    }
}
