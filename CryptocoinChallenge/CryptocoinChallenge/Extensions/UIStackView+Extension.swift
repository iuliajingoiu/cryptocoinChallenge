//
//  UIStackView+Extension.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit

extension Array where Element: UIView {

    func stacked(axis: NSLayoutConstraint.Axis = .horizontal) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: self)
        stack.axis = axis
        return stack
    }
}

extension UIStackView {

    func spacing(_ value: CGFloat) -> UIStackView {
        spacing = value
        return self
    }

    func spacing(_ value: CGFloat, after view: UIView) -> UIStackView {
        setCustomSpacing(value, after: view)
        return self
    }

    func alignment(_ value: Alignment) -> UIStackView {
        alignment = value
        return self
    }

    func distribution(_ value: Distribution) -> UIStackView {
        distribution = value
        return self
    }
}
