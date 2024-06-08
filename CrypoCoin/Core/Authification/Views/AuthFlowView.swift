//
//  AuthFlowView.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 24/05/2024.
//

import SwiftUI

struct AuthFlowView: View {
    
    @EnvironmentObject var userMV : UserViewModel
    var body: some View {
        switch userMV.state{
        case .login:
            AuthificationView()
                .preferredColorScheme(.dark)
                
            
        case .signup:
            SingupView()
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }
    }
}

//#Preview {
//    AuthFlowView(userMV: Ev)
//}

