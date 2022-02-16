//
//  MapView.swift
//  Lone Wanderer
//
//  Created by Камиль Сулейманов on 15.02.2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.mapRegion, showsUserLocation: true)
        .ignoresSafeArea()
        .preferredColorScheme(.light)
        .onAppear(perform: viewModel.checkLocationServicesIsEnabled)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
