//
//  CommodityModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation

struct CommodityModel: Codable, CollectionBaseProtocol {
    let name: String
    let symbol: String
    let logo: String
    let logoDark: String
    let price: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case symbol = "symbol"
        case logo = "logo"
        case logoDark = "logo_dark"
        case price = "avg_price"
    }
}
