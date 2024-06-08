//
//  CoinRowView.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 05/06/2024.
//

import SwiftUI

struct CoinRowView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    let coin: CoinModel
    let colors = Color.themeApp.textColor
    let remove: ()->()
    var showHoldingsColumn: Bool = true
    var body: some View {
        HStack(spacing: 0){
            leftRowCollum
            rightRowCollum
            if showHoldingsColumn {
                trash
            }
        }
    }
}

//#Preview {
//    CoinRowView(coin: DeveloperPreviewProvider.instance.coin, remove: {})
//}
extension CoinRowView{
    
    var leftRowCollum: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.custom(.ibmPlexMono, size: 16))
                .foregroundStyle(colors)
                .padding(.leading, 2)
                .frame(minWidth: 30, alignment: .leading)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.custom(.ibmPlexMono, size: 30))
                .foregroundStyle(colors)
                .padding(.leading, 6)
            Spacer()
        }
    }
    
    var centerRowCollum: some View{
        VStack(alignment:.trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .font(.custom(.ibmPlexMono, size: 16))
        .foregroundStyle(colors)
    }
    
    var rightRowCollum: some View{
        VStack(alignment:.trailing){
            Text("\(coin.currentPrice.asCurrencyWith6Decimals())")
                .bold()
            Text("\((coin.priceChangePercentage24H ?? 0).asPercnetageString())")
                .foregroundStyle((coin.priceChangePercentage24H ?? 0) >= 0 ? .green : .red)
        }
        .font(.custom(.ibmPlexMono, size: 16))
        .foregroundStyle(colors)
        .frame(width: UIScreen.main.bounds.width / 4, alignment: .trailing)
    }
    
    var trash: some View{
        VStack(alignment:.trailing){
            ButtonApp(iconName: "trash")
        }
        .font(.custom(.ibmPlexMono, size: 16))
        .foregroundStyle(colors)
        .frame(width: UIScreen.main.bounds.width / 4, alignment: .trailing)
    }
}
