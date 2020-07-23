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
        if let floatPrice = Float(self) {
            return floatPrice.string(precission: precission)
        } else {
            return self
        }
    }
    
    func floatValue() -> Float {
        guard let newVal = Float(self) else {
            return 0.0
        }
        return newVal
    }
}

extension Float {
    func string(precission: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = precission
        formatter.maximumFractionDigits = precission
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
