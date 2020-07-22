//
//  DataManager.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 22/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation

enum CollectionKeyType: String {
    case cryptocoins = "cryptocoins"
    case commodities = "commodities"
    case fiats = "fiats"
    case wallets = "wallets"
    case commodityWallets = "commodity_wallets"
    case fiatWallets = "fiatwallets"
    case unknown
}

enum CollectionType: String {
    case cryptocoin = "cryptocoin"
    case commodity = "commodity"
    case fiat = "fiat"
    case wallet = "wallet"
    case fiatWallet = "fiat_wallet"
    case unknown
}

// MARK: - DataManager
class DataManager: NSObject {

    static let sharedInstance = DataManager()
    var data: MasterDataModel?
    
    // Computed Variables
    var collections: [CollectionKeyType] {
        guard let data = data else {
            DataManager.sharedInstance.parseData()
            if let newlyParcedData = self.data {
                return mapCollectionsToSegmentItems(for: newlyParcedData)
            }
            return []
        }
        return mapCollectionsToSegmentItems(for: data)
    }
    
    var wallets: [CollectionKeyType] {
        guard let data = data else {
            DataManager.sharedInstance.parseData()
            if let newlyParcedData = self.data {
                return mapWalletsToSegmentItems(for: newlyParcedData)
            }
            return []
        }
        return mapWalletsToSegmentItems(for: data)
    }
    
    var cryptocoins: [Cryptocoin] {
        guard let data = data else {
            DataManager.sharedInstance.parseData()
            if let newlyParcedData = self.data {
                return newlyParcedData.data.attributes.cryptocoins
            }
            return []
        }
        return data.data.attributes.cryptocoins
    }
    
    var commodities: [Commodity] {
        guard let data = data else {
            DataManager.sharedInstance.parseData()
            if let newlyParcedData = self.data {
                return newlyParcedData.data.attributes.commodities
            }
            return []
        }
        return data.data.attributes.commodities
    }
    
    var fiats: [Fiat] {
        guard let data = data else {
            DataManager.sharedInstance.parseData()
            if let newlyParcedData = self.data {
                return newlyParcedData.data.attributes.fiats
            }
            return []
        }
        return data.data.attributes.fiats
    }
}

extension DataManager {
    // MARK: - Helpers
    func parseData() {
        if let dataPath = Bundle.main.path(forResource: "Mastrerdata", ofType: "json") {
            do {
                data = try JSONDecoder().decode(MasterDataModel.self, from: Data(contentsOf: URL(fileURLWithPath: dataPath)))
                print("data successfully parsed!")
            } catch {
                print("Error while loading masterdata")
            }
        }
    }
    
    private func mapCollectionsToSegmentItems(for data: MasterDataModel) -> [CollectionKeyType] {
        var collectionTypes = [CollectionKeyType]()
        if !data.data.attributes.cryptocoins.isEmpty { collectionTypes.append(.cryptocoins) }
        if !data.data.attributes.commodities.isEmpty { collectionTypes.append(.commodities) }
        if !data.data.attributes.fiats.isEmpty { collectionTypes.append(.fiats) }
        return collectionTypes
    }
    
    private func mapWalletsToSegmentItems(for data: MasterDataModel) -> [CollectionKeyType] {
        var collectionTypes = [CollectionKeyType]()
        if !data.data.attributes.wallets.isEmpty { collectionTypes.append(.wallets) }
        if !data.data.attributes.commodityWallets.isEmpty { collectionTypes.append(.commodityWallets) }
        if !data.data.attributes.fiatwallets.isEmpty { collectionTypes.append(.fiatWallets) }
        return collectionTypes
    }
}


// MARK: - Models
struct MasterDataModel: Decodable {
    let data: DataAttributesModel
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct DataAttributesModel: Decodable {
    let attributes: DataAttributes
    enum CodingKeys: String, CodingKey {
        case attributes
    }
}

struct DataAttributes: Decodable {
    let cryptocoins: [Cryptocoin]
    let commodities: [Commodity]
    let fiats: [Fiat]
    let wallets: [Wallet]
    let commodityWallets: [Commoditywallet]
    let fiatwallets: [Fiatwallet]

    enum CodingKeys: String, CodingKey {
        case cryptocoins, commodities, fiats, wallets, fiatwallets
        case commodityWallets = "commodity_wallets"
    }
}

// Collections
struct Cryptocoin: Decodable {
    let type: String
    let attributes: CryptocoinModel
    let id: String
}

struct Commodity: Decodable {
    let type: String
    let attributes: CommodityModel
    let id: String
}

struct Fiat: Decodable {
    let type: String
    let attributes: FiatModel
    let id: String
}

// Wallets
struct Wallet: Decodable {
    let type: String
    let attributes: WalletModel
    let id: String
}

struct Commoditywallet: Decodable {
    let type: String
    let attributes: CommodityWalletModel
    let id: String
}

struct Fiatwallet: Decodable {
    let type: String
    let attributes: FiatWalletModel
    let id: String
}
