//
//  ContentView.swift
//  SwiftFirebaseAuth
//
//  Created by Shrikanta Mazumder on 12/9/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: AppViewModel
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView{
            if  model.isAuthenticated {
                Home()
            } else {
                AuthPage()
            }
        }
    }
}

