//
//  UIView+Extension.swift
//  CryptocoinChallenge
//
//  Created by George Jingoiu on 23/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit

extension UIView {

    static var spacing: UIView {
        let view = UIView()
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        return view
    }
}
