//
//  locationFarmacia.swift
//  projectETPS04
//
//  Created by Roberto Flores on 5/12/23.
//

import SwiftUI
import MapKit

struct LocationFarmacia: View {
    var longitud: Double
    var latitud: Double

    var body: some View {
        let coordinate = Coordinate(id: UUID(), latitude: latitud, longitude: longitud)
        let region = MKCoordinateRegion(center: coordinate.location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        Map(coordinateRegion: .constant(region), annotationItems: [coordinate]) { location in
            MapMarker(coordinate: location.location, tint: .red)
        }
        .navigationBarTitle("Ubicación de la Farmacia", displayMode: .inline)
    }
}

struct Coordinate: Identifiable {
    var id: UUID
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}





//#Preview {
//    locationFarmacia(farmacia: [1])
//}
