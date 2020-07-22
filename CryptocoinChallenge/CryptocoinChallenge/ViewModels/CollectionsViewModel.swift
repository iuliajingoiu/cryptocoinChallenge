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
}
