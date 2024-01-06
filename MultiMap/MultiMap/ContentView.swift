//
//  ContentView.swift
//  MultiMap
//
//  Created by Brandon Johns on 1/5/24.
//

import SwiftUI
import MapKit

struct Location: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}


struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    let locations = [
        Location(name: "London", latitude: 51.507222, longitude: -0.1275),
        Location(name: "Glasgow",latitude: 55.8616752, longitude: -4.2546099)
    ]
    
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            //MapMarker(coordinate: location.coordinate)
            
            MapAnnotation(coordinate: location.coordinate) {
                Text(location.name)
                    .font(.headline)
                    .padding(5)
                    .padding(.horizontal, 5)
                    .background(.black)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
            }
        }
    }
}

#Preview {
    ContentView()
}
