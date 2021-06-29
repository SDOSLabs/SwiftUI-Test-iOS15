//
//  LocationButtonViewModel.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 29/6/21.
//

import Foundation
import CoreLocation
import MapKit

class LocationButtonViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    private lazy var manager = CLLocationManager()
    private static let span = MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.408672852282024, longitude: -5.944668759610994), span: LocationButtonViewModel.span)
    @Published var fetchingLocation: Bool = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        fetchingLocation = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first?.coordinate {
            region = MKCoordinateRegion(center: location, span: LocationButtonViewModel.span)
        }
        fetchingLocation = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        fetchingLocation = false
    }
}
