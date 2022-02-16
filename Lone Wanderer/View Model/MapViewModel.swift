//
//  MapViewModel.swift
//  Lone Wanderer
//
//  Created by Камиль Сулейманов on 15.02.2022.
//


import MapKit

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
//    let locations = [Location(name: "Neo", coordinate: CLLocationCoordinate2D(latitude: 42.96663, longitude: 47.51263))]
    
    //MARK: - Location Manager
    
    var locationManager: CLLocationManager?
    
    //MARK: - Publishers
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.96663, longitude: 47.51263), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    
    //MARK: - CoreLocation Methods
    
    func checkLocationServicesIsEnabled() {
        guard CLLocationManager.locationServicesEnabled() else {
            //TODO: show alert
            return
        }
        locationManager = CLLocationManager()
        guard locationManager != nil, let locationManager = locationManager else {
            return
        }
        locationManager.delegate = self
        locationManager.activityType = .fitness
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }

        switch locationManager.authorizationStatus {
             
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("show alert - location is restricted")
        case .denied:
            print("show alert - turn on location permission")
        case .authorizedAlways, .authorizedWhenInUse:
            guard let location = locationManager.location else {
                return
            }
            mapRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
