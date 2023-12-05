//
//  resultadoBusquedaView.swift
//  projectETPS04
//
//  Created by Roberto Flores on 4/12/23.
//

import SwiftUI

struct resultadoBusquedaView: View {
    var farmacias: [String]
    
    var body: some View {
        NavigationView{
            ZStack{
                bgColorStyle()
                VStack{
                    List(farmacias, id: \.self) { farmacia in
                        Text(farmacia)
                    }
                    .navigationBarTitle("Resultado de Farmacias")
                }
            }
        }
    }
}
//
//#Preview {
//    resultadoBusquedaView()
//}
