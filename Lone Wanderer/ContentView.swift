//
//  ContentView.swift
//  Lone Wanderer
//
//  Created by Камиль Сулейманов on 15.02.2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.96663, longitude: 47.51263), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    var body: some View {
        Map(coordinateRegion: $mapRegion)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, .init(identifier: "ru"))
    }
}
