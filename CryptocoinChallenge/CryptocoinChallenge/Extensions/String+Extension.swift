//
//  String+Extension.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 23/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation
extension String {
    
    func format(for precission: Int) -> String {
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = precission
        formatter.maximumFractionDigits = precission
        let preciseNumber = formatter.number(from: self)
        formatter.numberStyle = .currency
        // NSLocale.current is the default one
        // formatter.locale = Locale(identifier: "es_ES")
        
        guard let obtainedString  = formatter.string(for: preciseNumber) else {
            return self
        }
        return obtainedString
    }
    
    func doubleValue() -> Double {
        guard let newVal = Double(self) else {
            return 0.0
        }
        return newVal
    }
}
