//
//  Login.swift
//  projectETPS04
//
//  Created by Roberto Flores on 29/11/23.
//

import SwiftUI

import Firebase
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

struct Login: View {
    
 @State private var email:String=""
 @State private var password:String=""
 @State private var userIsLoggedIn: Bool=false
    
 @StateObject private var vm = SignIn_withGoogle_VM()

    var body: some View {
        if userIsLoggedIn{
            drugSearch()
        }
        else if vm.userIsLoggedIn {
            drugSearch()
        }
        else {
            content
        }
    }
    
    var content: some View {
        NavigationView{
            ZStack{
                bgColorStyle()
                
                VStack {
                    Image(.logo)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                        .shadow(color:.black.opacity(0.25),radius: 10, x:0,y: 20)
                    
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
                        .padding(.top, 20)
                    
                    SecureField("🔑 Password", text: $password)
                        .frame(width: 300, height: 30)
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(.headline)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(25)
                        .padding(.horizontal, 60)
                        .padding(.top, 7)
                    
                    NavigationLink(destination: forgotPasswordView()){
                        Text("Olvido su contraseña?")
                            .foregroundColor(.white)
                            .frame(width: 300, alignment: .trailing)
                            .padding(10)
                            .padding(.bottom, 30)
                    }
                    
                    
                    Button(action:{
                        login()
                    },
                           label : {
                        Text("Iniciar Sesion".uppercased())
                            .frame(width: 300, height: 30)
                            .foregroundColor(.white)
                            .padding()
                            .background(.orange)
                            .cornerRadius(25)
                            .shadow(radius: 10)
                            .padding(.horizontal, 60)
                            .padding(.top, 7)
                            .font(.system(size:15, weight: .bold))
                    })
                    

                    Text("No posee una cuenta? ")
                        .foregroundColor(.white)

                    NavigationLink(destination: registerView()){
                        Text("Registrate")
                            .textCase(.uppercase)
                            .frame(width: 300, height: 30)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                    }

                    Button{
                                    vm.signInWithGoogle()
                                } label: {
                                    Image(.google)
                                        .padding(35)
                                }
                                //End Google
                            }
                            .padding()
                            .onAppear {
                                // Asignar el closure aquí
                                vm.onSuccessfulLogin = { userIsLoggedIn = true }
                    
                    
                    
                }
                .padding()
            }
        }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){
            result, error in
            if error != nil{
                print(error?.localizedDescription as Any)
            }
            
        }
    }

    
}

#Preview {
    Login()
}
