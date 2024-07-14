//
//  HomeView.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 20/05/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    @EnvironmentObject var userMV: UserViewModel
    @State var switcher = false
    let textColor = Color.themeApp.textColor
    var body: some View {
        NavigationStack{
            ZStack{
                Color.themeApp.backgoundColor.ignoresSafeArea()
                VStack(spacing: 0){
                    HStack(spacing: 0){
                        ButtonApp(iconName: "door.left.hand.closed")
                            .onTapGesture {
                                withAnimation(){
                                    userMV.signOut()
                                }
                            }
                        
                        Spacer()
                        Text(switcher ? "Favorit" : "Live")
                            .foregroundStyle(textColor)
                            .font(.custom(.ibmPlexMono, size: 24))
                            .bold()
                        
                        // на текст сделать анимацию если успеещь
                        Spacer()
                        ButtonApp(iconName: switcher ? "star.fill" : "star")
                            .rotationEffect(Angle(degrees: switcher ? 360 : 0))
                            .onTapGesture {
                                
                                withAnimation(){
                                    switcher.toggle()
                                }
                            }
                        //помеять кнопку на прямоугольную со сменой текста из фразы чуть выше
                    }
                    .padding(.top, 16)
                    topNavigation
                    if !switcher{
                        listAllCoins
                            .transition(.move(edge: .leading))
                    }
                    if switcher{
                        listFavoriteCoins
                            .transition(.move(edge: .trailing))
                    }
                    Spacer()
                    
                }
            }
        }
    }
}
#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
}



extension HomeView{
    var listAllCoins: some View{
        List{
            ForEach(homeVM.allCoinsArray){coin in
                CoinRowView(coin: coin, remove: {}, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print("dad")
                        Task {
                            do{
                                try await homeVM.addCoin(coin: coin)
                            } catch {
                                print(error)
                            }
                        }
                    }
            }
        }
        .listStyle(PlainListStyle())
        .foregroundStyle(Color.themeApp.backgoundColor)
    }
    
    var listFavoriteCoins: some View{
        List{
            ForEach(homeVM.allCoinsArray){coin in
                CoinRowView(coin: coin, remove: {}, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .listStyle(PlainListStyle())
        .foregroundStyle(Color.themeApp.backgoundColor)
    }
    
    
    var topNavigation: some View{
        HStack{
            Text("Coin")
//            Spacer()
//            ButtonApp(iconName: "arrow.clockwise")
//                .rotationEffect(Angle(degrees: switcher ? 360 : 0))
//                .onTapGesture {
//                    withAnimation(){
//                        homeVM.refreshCoin()
//                    }
//                }
//            Spacer()
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing)
        }
        .padding(.horizontal, 10 )
        .font(.custom(.ibmPlexMono, size: 12))
        .foregroundStyle(Color.themeApp.stringColorBack)
    }
}

