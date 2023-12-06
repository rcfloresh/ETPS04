//
//  resultadoBusquedaView.swift
//  projectETPS04
//
//  Created by Roberto Flores on 4/12/23.
//

import SwiftUI
import Firebase

struct resultadoBusquedaView: View {
    var farmacias: [Farmacia]

    var body: some View {
        NavigationView{
            ZStack{
                bgColorStyle()
                VStack{
                    List(farmacias) { farmacia in
                        NavigationLink(destination: locationFarmacia(longitud: farmacia.longitud, latitud: farmacia.latitud)) {
                            Text(farmacia.id)
                        }
                    }
                    .navigationBarTitle("Resultado de Farmacias")
                }
            }
        }
    }
}
