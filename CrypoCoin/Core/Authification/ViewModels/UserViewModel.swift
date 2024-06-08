//
//  ViewModel.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 02/06/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

enum AuthFlowState : Hashable {
    case login
    case signup
}

class UserViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var state: AuthFlowState = .login
    @Published var isAuth:Bool? = nil

    func switchState(){
            if state == .login{
                clenUp()
                withAnimation{
                    state = .signup
                }
            }
            else{
                clenUp()
                withAnimation{
                    state = .login
                }
            }
    }
    func signup(){
        Auth.auth().createUser(withEmail: email, password: password){authResult, error in
            guard let authResult = authResult, error == nil else{
                if let error = error{
                    print(error)
                }
                return
            }
            UserModel.shared.userUid = authResult.user.uid
            UserManager.shared.createUser(auth: UserModel.shared)
            print("\(authResult.user.uid) createdUser")
            withAnimation{
                self.isAuth = true
            }
            self.clenUp()
        }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){authResult, error in
            guard let authResult = authResult, error == nil else{
                if let error = error{
                    print(error)
                }
                return
            }
            print("\(authResult.user.uid) Signin")
            UserModel.shared.userUid = authResult.user.uid
            withAnimation{
                self.isAuth = true
            }
            self.clenUp()
        }
    }
    func chekAuth(){
        if UserModel.shared.userUid.isEmpty{
            isAuth = false
        }
        else{
            isAuth = true
        }
    }
    
    func clenUp(){
        self.email = ""
        self.password = ""
    }
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        UserModel.shared.userUid = ""
        withAnimation{
            isAuth = false
        }
    }
}
