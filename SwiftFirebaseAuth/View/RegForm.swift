//
//  RegForm.swift
//  SwiftFirebaseAuth
//
//  Created by Shrikanta Mazumder on 15/9/21.
//

import SwiftUI

struct RegForm: View {
    @EnvironmentObject var model: AppViewModel
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @Binding var isRegFormShowing: Bool
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
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
                    model.signUp(name: name, email: email, password: password)
                    isRegFormShowing = model.isAuthenticated
                }, label: {
                    HStack {
                        Spacer()
                        Text("Sign Up")
                        Spacer()
                    }
                })
            }
            .navigationTitle("Sign Up")
        }
    }
}

struct RegForm_Previews: PreviewProvider {
    static var previews: some View {
        RegForm(isRegFormShowing: Binding.constant(true))
    }
}
