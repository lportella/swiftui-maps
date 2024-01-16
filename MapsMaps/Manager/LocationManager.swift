import Foundation
import MapKit

@MainActor final class LocationManager {
    static let shared = LocationManager()
    let manager: CLLocationManager = CLLocationManager()
    
    var testLocation: CLLocationCoordinate2D {
        .init(latitude: 64.14421011024561, longitude: -21.925935184657366)
    }
    
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
