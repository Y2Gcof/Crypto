//
//  Duable.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 05/06/2024.
//

import Foundation

extension Double {
    private var currencyFormatter6: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.currencySymbol = "$"
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    func asCurrencyWith6Decimals() -> String {
        return currencyFormatter6.string(from: NSNumber(value: self)) ?? "0.00$"
    }
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    func asPercnetageString() -> String {
        return asNumberString() + "%"
    }
}
