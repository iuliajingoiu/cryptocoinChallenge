//
//  CommodityWalletModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation

struct CommodityWalletModel: Codable, WalletsBaseProtocol {
    let cryptocoinId, cryptocoinSymbol, balance: String
    let isDefault: Bool
    let name: String
    let pendingTransactionsCount: Int
    let deleted: Bool

    enum CodingKeys: String, CodingKey {
        case cryptocoinId = "cryptocoin_id"
        case cryptocoinSymbol = "cryptocoin_symbol"
        case balance
        case isDefault = "is_default"
        case name
        case pendingTransactionsCount = "pending_transactions_count"
        case deleted
    }
}
