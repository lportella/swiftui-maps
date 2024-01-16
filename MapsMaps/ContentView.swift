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
    
    var body: some View {
        ZStack(alignment: .top) {
            Map()
                .mapStyle(selectedMapOption.mapStyle)
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
