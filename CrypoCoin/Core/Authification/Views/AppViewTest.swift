//
//  AppViewTest.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 25/05/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth
struct AppViewTest: View {
    @EnvironmentObject var userMV: UserViewModel
    var body: some View {
        Text("Hello, !")
        Button("Log out") {
            userMV.signOut()
        }
    }
}

//#Preview {
//    AppViewTest()
//}
