//
//  Location.swift
//  Lone Wanderer
//
//  Created by Камиль Сулейманов on 15.02.2022.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
