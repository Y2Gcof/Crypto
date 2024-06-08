//
//  HomeViewModel.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 06/06/2024.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject{
    @Published var allCoinsArray: [CoinModel] = []
    @Published var usersCoinsArray: [CoinModel] = []
    private let dataService = CoinDataService()
    
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        addSubscribtion()
    }
    
    func addSubscribtion(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){ [self] in
            self.dataService.$allCoinsArray
                .sink{ [weak self] (returnedCoin) in
                    self?.allCoinsArray = returnedCoin
                }
                .store(in: &cancellable)
        }
    }
    func getCoins() async throws -> [CoinModel]{
        let userData = try await UserManager.shared.getUserData(auth: UserModel.shared)
        self.usersCoinsArray = self.allCoinsArray.filter {coin in
            userData.contains(coin.id)
        }
        return self.usersCoinsArray
    }
    
    func addCoin(coin: CoinModel) async throws{
        try await UserManager.shared.addCoinToUser(auth: UserModel.shared, coin: coin)
        
    }
    
    func deleteCoin(coin: CoinModel) async throws{
        
    }
    
    func refreshCoin(){
        dataService.getAllCoins()
    }
}
// понять
