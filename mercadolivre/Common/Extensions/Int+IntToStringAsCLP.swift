//
//  Int+IntToStringAsCLP.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 10-11-23.
//

import Foundation

extension Int {
    func intToStringAsCLP() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = "$"
        numberFormatter.locale = Locale(identifier: "es_CL") // Configura la localización adecuada
        if let formattedString = numberFormatter.string(from: NSNumber(value: self)) {
            return formattedString
        } else {
            return String(self)
        }
    }
}
