//
//  forgotPasswordView.swift
//  projectETPS04
//
//  Created by Roberto Flores on 3/11/23.
//

import SwiftUI
import Firebase

struct forgotPasswordView: View {
    
    @State var email:String=""
    
    var body: some View {
        NavigationView{
            ZStack {
                bgColorStyle()
                
                VStack{
                    Image(.logo)
                        .resizable()
                        .frame(width: 75, height: 75)
                        .foregroundColor(.white)
                        .shadow(color:
                                .black
                            .opacity(0.25),
                                radius: 10,
                                x:0, y: 20)
                        .frame(width:300, alignment: .trailing)
                    
                    Text("Olvidó Contraseña")
                        .foregroundColor(.white)
                        .frame(width: 300, alignment: .trailing)
                        .padding(.bottom, 30)
                        .font(.title)
                    
                    
                    TextField("✉️ email:", text: $email)
                        .textCase(.lowercase)
                        .keyboardType(.emailAddress)
                        .frame(width: 300, height: 30)
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(.headline)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(25)
                        .padding(.horizontal, 60)
                        .padding(.top, 7)
                    
                    Button(action:{
                        Auth.auth().sendPasswordReset(withEmail: email)
                    },
                           label : {
                        Text("Recuperar contraseña".uppercased())
                            .frame(width: 300, height: 30)
                            .foregroundColor(.white)
                            .padding()
                            .background(.orange)
                            .cornerRadius(25)
                            .shadow(radius: 10)
                            .padding(.horizontal, 60)
                            .padding(.top, 7)
                            .font(.system(size:15, weight: .bold))
                    }) // Button
                } //VStack
            } // ZStack
        } // NavigationView
    } // var body: some View
} // struct forgotPasswordView: View

#Preview {
    forgotPasswordView()
}
