//
//  projectETPS04App.swift
//  projectETPS04
//
//  Created by Roberto Flores on 22/10/23.
//

import SwiftUI
import Firebase


@main
struct projectETPS04App: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
