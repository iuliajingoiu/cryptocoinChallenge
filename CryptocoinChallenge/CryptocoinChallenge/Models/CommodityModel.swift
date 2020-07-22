//
//  CommodityModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation

struct CommodityModel: Decodable, AssetsBaseProtocol {
    let name: String
    let symbol: String
    let logo: String
    let logoDark: String
    let price: String
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case symbol = "symbol"
        case logo = "logo"
        case logoDark = "logo_dark"
        case price = "avg_price"
        case type = "type"
    }
    
    init(_ commodity: Commodity) {
        name = commodity.attributes.name
        symbol = commodity.attributes.symbol
        logo = commodity.attributes.logo
        logoDark = commodity.attributes.logoDark
        price = commodity.attributes.price
        type = commodity.type
    }
}
