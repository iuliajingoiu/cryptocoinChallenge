//
//  FiatWalletModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation

struct FiatWalletModel: Codable, CollectionBaseProtocol {
    let fiatId: String
    let fiatSymbol: String
    let balance: String
    let name: String
    let type: String?

    enum CodingKeys: String, CodingKey {
        case fiatId = "fiat_id"
        case fiatSymbol = "fiat_symbol"
        case type, balance, name
    }
    
    init(_ wallet: Fiatwallet) {
        fiatId = wallet.attributes.fiatId
        fiatSymbol = wallet.attributes.fiatSymbol
        name = wallet.attributes.name
        balance = wallet.attributes.balance
        type = wallet.type
    }
}
