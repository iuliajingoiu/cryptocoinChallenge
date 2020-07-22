//
//  FiatModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation

struct FiatModel: Decodable, AssetsBaseProtocol {
    let name: String
    let symbol: String
    let logo: String
    let logoDark: String
    let type: String?
    let hasWallets: Bool
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case symbol = "symbol"
        case logo = "logo"
        case logoDark = "logo_dark"
        case type = "type"
        case hasWallets = "has_wallets"
    }
    
    init(_ fiat: Fiat) {
        name = fiat.attributes.name
        symbol = fiat.attributes.symbol
        logo = fiat.attributes.logo
        logoDark = fiat.attributes.logoDark
        hasWallets = fiat.attributes.hasWallets
        type = fiat.type
    }
}
