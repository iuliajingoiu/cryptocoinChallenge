//
//  BaseViewController.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func displayMissingFeature() {
        let alertController = UIAlertController(title: "Missing feature", message: "This feature has not been implemented yet", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok!", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
