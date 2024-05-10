//
//  CustomFonts.swift
//  CrypoCoin
//
//  Created by Александр Харламов on 09/05/2024.
//

import Foundation
import SwiftUI

enum CustomFonts: String {
    case ibmPlexMono = "IBMPlexMono-Regular"
}

extension Font{
    static func custom(_ name: CustomFonts, size: CGFloat) -> Font {
        Font.custom(name.rawValue, size: size)
    }
}
