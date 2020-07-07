 //
//  MapView.swift
//  CoronaStats
//
//  Created by Carl Grimsborn on 2020-06-26.
//  Copyright © 2020 Carl Grimsborn. All rights reserved.
//

 import SwiftUI
 import UIKit
 import MapKit

 struct MapView: UIViewRepresentable {
 
    
    @Binding var countryData: [CountryData]
    
    func updateUIView(_ uiView: MKMapView , context: UIViewRepresentableContext<MapView>) {
        var allAnnotations: [CoronaCaseAnnotation] = []
        
        for data in countryData {
            let title = data.country + "\n Confirmed " + data.confirmed.formatNumber() + "\n Deaths " + data.deaths.formatNumber()
            let coordinate = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
            allAnnotations.append(CoronaCaseAnnotation(title: title, coordinate: coordinate))
        }
        
        uiView.annotations.forEach{ uiView.removeAnnotation($0) }
        uiView.addAnnotations(allAnnotations)
    }
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }
    
}
 
 class CoronaCaseAnnotation: NSObject, MKAnnotation {
   
    let coordinate: CLLocationCoordinate2D
    let title: String?
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
                     self.title = title
                     self.coordinate = coordinate
        super.init()
    }
 }
 
