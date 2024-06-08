//
//  ValidCheck.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 24/05/2024.
//

import Foundation


extension String{
    func isValidEmail()->Bool{
        let regex = try! NSRegularExpression(pattern:"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$", options: .caseInsensitive)
        return regex.firstMatch(in: self, range: NSRange(location: 0, length: self.count)) != nil
    }
}
