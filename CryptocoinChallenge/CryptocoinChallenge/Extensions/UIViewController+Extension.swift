//
//  UIViewController+Extension.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit

extension UIViewController {
    func addChildViewController(_ viewController: UIViewController, in container: UIView) {
        viewController.willMove(toParent: self)
        addChild(viewController)
        viewController.didMove(toParent: self)
        container.addSubview(viewController.view)
        viewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func displayMissingFeature() {
        let alertController = UIAlertController(title: "Missing feature", message: "This feature has not been implemented yet", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok!", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
