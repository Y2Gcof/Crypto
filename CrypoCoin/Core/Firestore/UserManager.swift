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
        do {
            var snapTmp = try await Firestore.firestore().collection("users").document(auth.userUid)
            print("snapTmp: \(snapTmp)")
            var snap = try await snapTmp.getDocument()
            guard let data = snap.data() else{
                throw URLError(.badServerResponse)
            }
            
            let arrayOfCoins = data["arrayOfCoins"] as? Array<String>
            // Обработка полученных данных
            return arrayOfCoins!
        } catch {
            // Вывод или обработка ошибки
            print("Ошибка при получении данных: \(error.localizedDescription)")
            throw error
        }
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
