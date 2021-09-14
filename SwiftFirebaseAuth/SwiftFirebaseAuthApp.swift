//
//  SwiftFirebaseAuthApp.swift
//  SwiftFirebaseAuth
//
//  Created by Shrikanta Mazumder on 12/9/21.
//

import SwiftUI
import Firebase

@main
struct SwiftFirebaseAuthApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        let appViewModel = AppViewModel()
        WindowGroup {
            ContentView()
                .environmentObject(appViewModel)
        }
    }
}
