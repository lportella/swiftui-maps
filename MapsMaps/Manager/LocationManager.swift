import Foundation
import MapKit

@MainActor final class LocationManager {
    static let shared = LocationManager()
    let manager: CLLocationManager = CLLocationManager()
    
    init() {
        manager.desiredAccuracy = kCLLocationAccuracyBest
        handleAuth()
    }
}

private extension LocationManager {
    func handleAuth() {
        if self.manager.authorizationStatus == .notDetermined {
            self.manager.requestWhenInUseAuthorization()
        }
    }
}
