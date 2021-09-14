//
//  AppViewModel.swift
//  SwiftFirebaseAuth
//
//  Created by Shrikanta Mazumder on 13/9/21.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

class AppViewModel: ObservableObject {
    let auth = Auth.auth()
    @Published var isAuthenticated = false
    @Published var errorMessage: String?
    let db = Firestore.firestore()
    
    func checkLogin() {
        isAuthenticated = auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
                self.errorMessage = error!.localizedDescription
            } else {
                self.isAuthenticated = self.auth.currentUser != nil
            }
        
        }
    }
    
    func signUp(name: String, email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authUser, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                // specify collection
                let collection = self.db.collection("Users")
                // add document
                collection.addDocument(data: [
                    "name": name,
                    "email": authUser!.user.email!
                ]) { error in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                }
                DispatchQueue.main.async {
                    self.isAuthenticated = self.auth.currentUser != nil
                }
            }
            
        }
    }
    
    func signInWithGoogle() {
        
    }
    
    func signOut() {
        do {
          try auth.signOut()
            checkLogin()
        } catch let signOutError as NSError {
            self.errorMessage = signOutError.localizedDescription
          print("Error signing out: %@", signOutError)
        }
    }
}
