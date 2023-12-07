//
//  ContentView.swift
//  projectETPS04
//
//  Created by Roberto Flores on 22/10/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @AppStorage("log_status") var logStatus: Bool = false

    
    var body: some View {
        if(logStatus){
            drugSearch()
        }
        else{
            Login()
        }
        
    }
}

#Preview {
    ContentView()
}
