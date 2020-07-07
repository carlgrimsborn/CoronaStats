//
//  ContentView.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-06-15.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            RecentView().tabItem{Tab(imageName: "chart.bar", text: "Recent")}.tag(0)
            MapContainerView().edgesIgnoringSafeArea(.vertical).tabItem{Tab(imageName: "map", text: "Map")}.tag(1)
        }
    }
}

private struct Tab: View {
    let imageName: String
    let text: String
    
     var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
