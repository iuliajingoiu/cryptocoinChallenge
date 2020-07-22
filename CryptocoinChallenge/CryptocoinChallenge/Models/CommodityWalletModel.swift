//
//  CommodityWalletModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation

struct CommodityWalletModel: Decodable, WalletsBaseProtocol {
    let cryptocoinId: String
    let cryptocoinSymbol: String
    let balance: String
    let isDefault: Bool
    let name: String
    let deleted: Bool
    let type: String?

    enum CodingKeys: String, CodingKey {
        case cryptocoinId = "cryptocoin_id"
        case cryptocoinSymbol = "cryptocoin_symbol"
        case balance
        case isDefault = "is_default"
        case name
        case deleted
        case type
    }
}
