//
//  resultadoBusquedaView.swift
//  projectETPS04
//
//  Created by Roberto Flores on 4/12/23.
//

//import SwiftUI
//
//struct resultadoBusquedaView: View {
//    var farmacias: [String]
//
//    var body: some View {
//
//        NavigationView{
//            ZStack{
//                bgColorStyle()
//                VStack{
//                    NavigationLink(destination: locationFarmacia(longitud: -89.2181911, latitud: 13.6929403)) {
//                        List(farmacias, id: \.self) { farmacia in
//                                                Text(farmacia)
//                                            }
//                      }
//                    .navigationBarTitle("Resultado de Farmacias")
//                }
//            }
//        }
//    }
//}


/// NUEVO


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
