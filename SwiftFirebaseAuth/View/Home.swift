//
//  Home.swift
//  SwiftFirebaseAuth
//
//  Created by Shrikanta Mazumder on 13/9/21.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var model: AppViewModel
    
    var body: some View {
        VStack {
            Text("You are logged in")
            
            Button(action: {
                model.signOut()
            }, label: {
                Text("Sign out")
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
