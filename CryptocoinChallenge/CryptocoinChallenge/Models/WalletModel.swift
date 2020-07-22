//
//  WalletModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation

struct WalletModel: Decodable, WalletsBaseProtocol {
    let name: String
    let balance: String
    let cryptocoinId: String
    let cryptocoinSymbol: String
    let isDefault: Bool
    let deleted: Bool
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case balance = "balance"
        case cryptocoinId = "cryptocoin_id"
        case cryptocoinSymbol = "cryptocoin_symbol"
        case isDefault = "is_default"
        case deleted = "deleted"
        case type = "type"
    }
    
    init(_ wallet: Wallet) {
        name = wallet.attributes.name
        balance = wallet.attributes.balance
        cryptocoinId = wallet.attributes.cryptocoinId
        cryptocoinSymbol = wallet.attributes.cryptocoinSymbol
        isDefault = wallet.attributes.isDefault
        deleted = wallet.attributes.deleted
        type = wallet.type
    }
}
