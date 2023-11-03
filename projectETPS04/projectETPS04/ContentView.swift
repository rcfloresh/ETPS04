//
//  ContentView.swift
//  projectETPS04
//
//  Created by Roberto Flores on 22/10/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State var email:String=""
    @State var password:String=""
    
    var body: some View {
        ZStack{
            bgColorStyle()
            
            VStack {
                Image(.logo)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .shadow(color:.black.opacity(0.25),radius: 10, x:0,y: 20)
                
                TextField("✉️ email:", text: $email)
                    .keyboardType(.numberPad)
                    .disableAutocorrection(true)
                    .padding(8)
                    .font(.headline)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(6)
                    .padding(.horizontal, 60)
                    .padding(.top, 20)
          
                SecureField("🔑 Password", text: $password)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .padding(8)
                    .font(.headline)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(6)
                    .padding(.horizontal, 60)
                    .padding(.top, 7)
                
                Button(action:{
                    login()
                },
                       label : {
                    Text("Ingresar".uppercased())
                        .frame(width: 200, height: 20)
                        .foregroundColor(.white)
                        .padding()
                        .background(.orange)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.horizontal, 60)
                        .padding(.top, 7)
                        .font(.system(size:15, weight: .bold))
                })
            }
            .padding()
        }
    }
    
    func login()
    {
        Auth.auth().signIn(withEmail: email, password: password)
        {
            result, error in
            if error != nil{
                print(error?.localizedDescription)
            }
        }
    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password)
        {
            result, error in
            if error != nil{
                print(error?.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
