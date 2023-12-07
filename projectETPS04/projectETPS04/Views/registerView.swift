//
//  registerView.swift
//  projectETPS04
//
//  Created by Roberto Flores on 2/11/23.
//

import SwiftUI
import Firebase

struct registerView: View {
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name:String=""
    @State private var email:String=""
    @State private var password:String=""
    
    
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
                
                Text("Registro")
                    .foregroundColor(.white)
                    .frame(width: 300, alignment: .trailing)
                    .padding(.bottom, 30)
                    .font(.title)
                
                TextField("👤 Nombre:", text: $name)
                    .frame(width: 300, height: 30)
                    .disableAutocorrection(true)
                    .padding(8)
                    .font(.headline)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(25)
                    .padding(.horizontal, 60)
                    .padding(.top, 7)
                
                TextField("✉️ email:", text: $email)
                    .keyboardType(.emailAddress)
                    .frame(width: 300, height: 30)
                    .disableAutocorrection(true)
                    .padding(8)
                    .font(.headline)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(25)
                    .padding(.horizontal, 60)
                    .padding(.top, 7)
                
                SecureField("🔑 Password", text: $password)
                    .frame(width: 300, height: 30)
                    .disableAutocorrection(true)
                    .padding(8)
                    .font(.headline)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(25)
                    .padding(.horizontal, 60)
                    .padding(.top, 7)
                
                Button(action:{
                    register()
                },
                       label : {
                    Text("Registrar".uppercased())
                        .frame(width: 300, height: 30)
                        .foregroundColor(.white)
                        .padding()
                        .background(.orange)
                        .cornerRadius(25)
                        .shadow(radius: 10)
                        .padding(.horizontal, 60)
                        .padding(.top, 7)
                        .font(.system(size:15, weight: .bold))
                }).alert(isPresented: $showAlert) {
                    Alert(title: Text("Registro de usuario"), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                }
                
                
                // Button
            } // ZStack
        } // NavigationView
    } // var body: some View
} // struct registerView: View
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password)
        {
            result, error in
            if let error = error {
                alertMessage = "Error: \(error.localizedDescription)"
            } else {
                // Usuario creado exitosamente
                alertMessage = "Usuario creado exitosamente."
            }
            showAlert = true
        }
    }

}

#Preview {
    registerView()
}
