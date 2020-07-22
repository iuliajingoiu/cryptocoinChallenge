//
//  CryptocoinViewModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation
class CryptocoinViewModel {
        
    var cryptocoins = [CryptocoinModel]()
    
    init(model: [CryptocoinModel]? = nil) {
        if let inputModel = model {
            cryptocoins = inputModel
        }
    }
}

// MARK: - Helpers
extension CryptocoinViewModel {
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

}
