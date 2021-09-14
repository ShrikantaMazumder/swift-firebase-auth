//
//  AuthPage.swift
//  SwiftFirebaseAuth
//
//  Created by Shrikanta Mazumder on 13/9/21.
//

import SwiftUI

struct AuthPage: View {
    @EnvironmentObject var model: AppViewModel
    @State var isLogFormShowing: Bool = false
    @State var isRegFormShowing: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // login with email and pass
                Button(action: {
                    isLogFormShowing = true
                }, label: {
                    Text("Sign in email")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .sheet(isPresented: $isLogFormShowing, onDismiss: {
                            model.checkLogin()
                        }, content: {
                            LoginForm(isLogFormShowing: $isLogFormShowing)
                        })
                })
                // TODO: google signin
                Button(action: {
                    print("google sign in")
                }, label: {
                    Text("Sign in with google")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                })
                
                Spacer()
                
                // SignUp
                Button(action: {
                    isRegFormShowing = true
                }, label: {
                    Text("Sign up")
                        .sheet(isPresented: $isRegFormShowing, onDismiss: {
                            model.checkLogin()
                        }, content: {
                            RegForm(isRegFormShowing: $isRegFormShowing)
                        })
                })
            }
            .onAppear(perform: {
                model.checkLogin()
            })
        }
    }
}

struct AuthPage_Previews: PreviewProvider {
    static var previews: some View {
        AuthPage()
    }
}
