//
//  CoinDataService.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 06/06/2024.
//

import Foundation
import Combine

class CoinDataService{
    @Published var allCoinsArray: [CoinModel] = []
    var allCoinsSubscription: AnyCancellable?
    init(){
        getAllCoins()
    }
    
    func getAllCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
            print("ER")
            return }
        allCoinsSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ (output) -> Data in
                guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                print("ERORR")
                return output.data
            })
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { (completion) in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    print("Error decoding data: \(error)")
                }
            }, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoinsArray = returnedCoins
                self?.allCoinsSubscription?.cancel()
            })
    }
}

