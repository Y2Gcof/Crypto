//
//  UserManager.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 08/06/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
class UserManager{
    static let shared = UserManager()
    private init(){} 
    func createUser(auth: UserModel) {
        var userData : [String: Any] = [
            "userUid": auth.userUid,
            "arrayOfCoins": []
        ]
        Firestore.firestore().collection("users").document(auth.userUid).setData(userData, merge: false)
    }
    
    func getUserData(auth: UserModel) async throws -> Array<String>{
        let snap = try await Firestore.firestore().collection("users").document(auth.userUid).getDocument()
        guard let data = snap.data() else{
            throw URLError(.badServerResponse)
        }
        
        let arrayOfCoins = data["arrayOfCoins"] as? Array<String>
        return arrayOfCoins!
    }
    
    func addCoinToUser(auth: UserModel, coin: CoinModel) async throws {
        var arrayOfCoins = try await getUserData(auth: auth)
        arrayOfCoins.append(coin.id)
        try await Firestore.firestore().collection("users").document(auth.userUid).updateData(["arrayOfCoins": arrayOfCoins])
    }
    
    
    func deleteCoinToUser(auth: UserModel, coin: CoinModel) async throws {
        var arrayOfCoins = try await getUserData(auth: auth)
        arrayOfCoins.removeAll(where: {$0 == coin.id})
        
    }
}
