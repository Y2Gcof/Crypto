//
//  ContentView.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 09/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("EtheriumSVG")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200, alignment: .center)
            .cornerRadius(20)
            .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 4)
            )
            .padding(20)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
    }
}

#Preview {
    ContentView()
}
