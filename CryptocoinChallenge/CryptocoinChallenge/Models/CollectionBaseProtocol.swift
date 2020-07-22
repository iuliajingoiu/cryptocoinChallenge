//
//  CollectionBaseModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 22/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation

// Protocol for collections
protocol CollectionBaseProtocol {
    var name: String { get }
    var symbol: String { get }
    var logo: String { get }
    var logoDark: String { get }
}

// Protocol for wallets
protocol WalletsBaseProtocol {
    var name: String { get }
    var balance: String { get }
    var cryptocoinId: String { get }
    var cryptocoinSymbol: String { get }
    var isDefault: Bool { get }
    var deleted: Bool { get }
}
