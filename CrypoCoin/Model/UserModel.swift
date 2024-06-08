//
//  File.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 02/06/2024.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
struct UserModel{
    static let shared = UserModel()
    @AppStorage("userUid") var userUid = ""
    private init(){}
}
