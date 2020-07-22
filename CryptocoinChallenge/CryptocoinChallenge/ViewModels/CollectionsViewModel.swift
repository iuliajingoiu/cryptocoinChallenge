//
//  CryptocoinViewModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation
class CollectionsViewModel {
    var cryptocoins = [CryptocoinModel]()
    var commodities = [CommodityModel]()
    var fiats = [FiatModel]()
    var wallets = [WalletModel]()
    var commodityWallets = [CommodityWalletModel]()
    var fiatWallets = [FiatWalletModel]()
}

// MARK: - Helpers
extension CollectionsViewModel {
    func fetchCryptocoins(completion: @escaping (Result<[CryptocoinModel], Error>) -> Void) {
        // Get the objects
        let cryptocoins: [Cryptocoin] = DataManager.sharedInstance.cryptocoins
        
        // Map them  to the model we need
        self.cryptocoins = cryptocoins.compactMap {
            return CryptocoinModel($0)
        }
        
        completion(.success(self.cryptocoins))
        // TODO: - Handle error if some network errors may occur
    }
    
    func fetchCommodities(completion: @escaping (Result<[CommodityModel], Error>) -> Void) {
        // Get the objects
        let commodities: [Commodity] = DataManager.sharedInstance.commodities
        
        // Map them  to the model we need
        self.commodities = commodities.compactMap {
            return CommodityModel($0)
        }
        
        completion(.success(self.commodities))
    }

    func fetchFiats(completion: @escaping (Result<[FiatModel], Error>) -> Void) {
        // Get the objects
        let fiats: [Fiat] = DataManager.sharedInstance.fiats
        
        // Map them  to the model we need
        self.fiats = fiats.compactMap {
            return FiatModel($0)
        }
        
        completion(.success(self.fiats))
    }
    
    // Wallets
    func fetchWallets(completion: @escaping (Result<[WalletModel], Error>) -> Void) {
        // Get the objects
        let wallets: [Wallet] = DataManager.sharedInstance.walletsList
        
        // Map them  to the model we need
        self.wallets = wallets.compactMap {
            return WalletModel($0)
        }
        
        completion(.success(self.wallets))
    }
    
    func fetchCommodityWallets(completion: @escaping (Result<[CommodityWalletModel], Error>) -> Void) {
        // Get the objects
        let wallets: [Commoditywallet] = DataManager.sharedInstance.commodityWalletsList
        
        // Map them  to the model we need
        self.commodityWallets = wallets.compactMap {
            return CommodityWalletModel($0)
        }
        
        completion(.success(self.commodityWallets))
    }
    
    func fetchFiatWallets(completion: @escaping (Result<[FiatWalletModel], Error>) -> Void) {
        // Get the objects
        let wallets: [Fiatwallet] = DataManager.sharedInstance.fiatWalletsList
        
        // Map them  to the model we need
        self.fiatWallets = wallets.compactMap {
            return FiatWalletModel($0)
        }
        
        completion(.success(self.fiatWallets))
    }
}
