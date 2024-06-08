//
//  ButtonApp.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 05/06/2024.
//

import SwiftUI

struct ButtonApp: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .foregroundColor(.white)
            .font(.custom(.ibmPlexMono, size: 24))
            .frame(width: 40,height: 40)
            .background{
                Circle()
                    .foregroundStyle(Color.themeApp.buttonColorOrange)
            }
            .shadow(
                color: Color.themeApp.buttonColorOrange.opacity(0.25), radius: 10
            )
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout){
    Group{
        ButtonApp(iconName: "info")
            .colorScheme(.dark)
        ButtonApp(iconName: "plus")
            .colorScheme(.dark)
    }
    
    
}
