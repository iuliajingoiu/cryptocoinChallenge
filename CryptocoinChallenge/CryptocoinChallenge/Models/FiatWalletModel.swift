//
//  FiatWalletModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation

struct FiatWalletModel: Codable {
    let fiatId: String
    let fiatSymbol: String
    let balance: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case fiatId = "fiat_id"
        case fiatSymbol = "fiat_symbol"
        case balance, name
    }
}
