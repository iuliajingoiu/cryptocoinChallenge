//
//  FiatModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation

struct FiatModel: Codable, CollectionBaseProtocol {
    let name: String
    let symbol: String
    let logo: String
    let logoDark: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case symbol = "symbol"
        case logo = "logo"
        case logoDark = "logo_dark"
    }
}
