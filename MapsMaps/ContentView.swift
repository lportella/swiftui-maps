//
//  ContentView.swift
//  MapsMaps
//
//  Created by Lucas Portella on 15/01/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var selectedMapOption: MapOptions = .standard
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var locationManager = LocationManager.shared
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(position: $cameraPosition) {
                Annotation("Brauð & Co", coordinate: .testLocation) {
                    Image(systemName: "fork.knife.circle")
                }
                UserAnnotation()
            }
            .mapStyle(selectedMapOption.mapStyle)
            .onChange(of: locationManager.region) {
                withAnimation {
                    cameraPosition = .region(locationManager.region)
                }
            }
            
            Picker("Map Styles", selection: $selectedMapOption) {
                ForEach(MapOptions.allCases) { option in
                    Text(option.rawValue.capitalized).tag(option)
                }
            }
            .pickerStyle(.segmented)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
