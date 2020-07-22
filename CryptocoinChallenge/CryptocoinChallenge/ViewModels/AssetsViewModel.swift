//
//  AssetsViewModel.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 22/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import Foundation
class AssetsViewModel {
        
    var collections = [CollectionType]()
    
    init(model: [CollectionType]? = nil) {
        if let inputModel = model {
            collections = inputModel
        }
    }
}

// MARK: - Helpers
extension AssetsViewModel {
    func fetchCollections(completion: @escaping (Result<[CollectionType], Error>) -> Void) {
        self.collections = DataManager.sharedInstance.collections
        completion(.success(self.collections))
    }
}
