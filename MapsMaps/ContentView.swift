//
//  ContentView.swift
//  MapsMaps
//
//  Created by Lucas Portella on 15/01/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Map()
        }
    }
}

#Preview {
    ContentView()
}
