//
//  SingupView.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 24/05/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SingupView: View {
    @EnvironmentObject var userMV : UserViewModel
    var body: some View {
        ZStack(){
            Color.themeApp.backgoundColor.ignoresSafeArea()
            VStack(alignment:.leading, spacing: 0){
                HStack(spacing: 0){
                    Text("Create account!")
                        .foregroundStyle(.white)
                        .font(.custom(.ibmPlexMono, size: 32))
                        .bold()
                }
                .padding(.top, 16)
                Spacer()
                Text("Email")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.custom(.ibmPlexMono, size: 16))
                HStack {
                    Image(systemName: "envelope")
                        .foregroundStyle(.white)
                        .padding(.leading,10)
                    TextField("email", text: $userMV.email)
                        .font(.custom(.ibmPlexMono, size: 16))
                        .padding(.leading, 10)
                        .background(Color.black)
                        .foregroundColor(.green)
                        .cornerRadius(20)
                    if(!userMV.email.isEmpty) {
                        Image(systemName: userMV.email.isValidEmail() ? "checkmark" : "xmark")
                            .foregroundStyle(.white)
                            .padding(.trailing, 10)
                    }
                        
                }
                .frame(width: 343,height: 48)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.themeApp.backgroundFieldColor, lineWidth: 2)
                )
            .padding([.bottom, .top], 16)
                
                Text("Password")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.custom(.ibmPlexMono, size: 16))
                
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                    SecureField("password", text: $userMV.password)
                        .font(.custom(.ibmPlexMono, size: 16))
                        .padding(.leading, 10)
                        
                        .background(Color.black)
                        .foregroundColor(Color.green)
                        .cornerRadius(20)
                    
                }
                .frame(width: 343,height: 48)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.themeApp.backgroundFieldColor, lineWidth: 2)
                )
                .padding([.bottom, .top], 16)
                
                HStack {
                    Button(action: {
                        userMV.clenUp()
                        userMV.switchState()
                    }, label: {
                        Text("Already have an account?")
                            .foregroundStyle(.white.opacity(0.5))
                            .font(.custom(.ibmPlexMono, size: 16))
                    })
                }
                Spacer()
                Button{
                    withAnimation{
                        userMV.signup()
                        userMV.switchState()
                    }
                } label: {
                    Text("Create account")
                        .font(.custom(.ibmPlexMono, size: 16))
                        .foregroundColor(.white)
                        .frame(width: 343,height: 48)
                        .background(Color.themeApp.buttonColorOrange)
                        .cornerRadius(10)
                }.padding([.bottom, .top], 16)
            }
        }
    }
}

