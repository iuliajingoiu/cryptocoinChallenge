//
//  WalletsViewModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 22/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation
class WalletsViewModel {
        
    var wallets = [CollectionKeyType]()
    
    init(model: [CollectionKeyType]? = nil) {
        if let inputModel = model {
            wallets = inputModel
        }
    }
}

// MARK: - Helpers
extension WalletsViewModel {
    func fetchWallets(completion: @escaping (Result<[CollectionKeyType], Error>) -> Void) {
        self.wallets = DataManager.sharedInstance.wallets
        completion(.success(self.wallets))
    }
}
