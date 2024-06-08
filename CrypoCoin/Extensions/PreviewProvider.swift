//
//  PreviewProvider.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 05/06/2024.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreviewProvider{
        return DeveloperPreviewProvider.instance
    }
}

class DeveloperPreviewProvider{
    static let instance = DeveloperPreviewProvider()
    private init(){}
    
    let coin = CoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: 1.0, marketCap: 1.0, marketCapRank: 1.0, fullyDilutedValuation: 1.0, totalVolume: 1.0, high24H: 1.0, low24H: 1.0, priceChange24H: 1.0, priceChangePercentage24H: 1.0, marketCapChange24H: 1.0, marketCapChangePercentage24H: 1.0, circulatingSupply: 1.0, totalSupply: 1.0, maxSupply: 1.0, ath: 1.0, athChangePercentage: 1.0, athDate: "2024-06-05", atl: 1.0, atlChangePercentage: 1.0, atlDate: "2024-06-05", lastUpdated: "2024-06-05", sparklineIn7D: nil, priceChangePercentage24HInCurrency: 1.0, currentHoldings: 1.0)
}
