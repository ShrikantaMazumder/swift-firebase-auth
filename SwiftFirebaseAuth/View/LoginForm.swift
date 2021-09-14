//
//  LoginForm.swift
//  SwiftFirebaseAuth
//
//  Created by Shrikanta Mazumder on 13/9/21.
//

import SwiftUI

struct LoginForm: View {
    @EnvironmentObject var model: AppViewModel
    @State private var email = ""
    @State private var password = ""
    @Binding var isLogFormShowing: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                }
                
                if let message = model.errorMessage {
                    Section{
                        Text(message)
                    }
                }
                
                Button(action: {
                    // TODO: Perform login
                    model.signIn(email: email, password: password)
                    isLogFormShowing = model.isAuthenticated
                }, label: {
                    HStack {
                        Spacer()
                        Text("Login")
                        Spacer()
                    }
                })
            }
            .navigationTitle("Login")
        }
        
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm(isLogFormShowing: Binding.constant(true) )
    }
}
