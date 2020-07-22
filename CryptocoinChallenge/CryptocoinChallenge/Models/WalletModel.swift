//
//  WalletModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation

struct WalletModel: Codable, WalletsBaseProtocol {
    let name: String
    let balance: String
    let cryptocoinId: String
    let cryptocoinSymbol: String
    let isDefault: Bool
    let deleted: Bool
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case balance = "balance"
        case cryptocoinId = "cryptocoin_id"
        case cryptocoinSymbol = "cryptocoin_symbol"
        case isDefault = "is_default"
        case deleted = "deleted"
    }
}
