//
//  UISegmentedControl+Extension.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit
import SnapKit

extension UISegmentedControl {
    func setSegments(with items: [String], andUnderlineSelection underlineSelection: Bool, underlineColor: UIColor) {
        removeAllSegments()
        items.forEach {
            insertSegment(withTitle: $0, at: numberOfSegments, animated: false)
        }
        selectedSegmentIndex = 0

        if underlineSelection {
            setUnderlineForSelectedSegment(with: underlineColor)
        }
    }

    func setUnderlineForSelectedSegment(with color: UIColor) {
        // Check if it already exists and remove it from superview
        if let underline = subviews.first(where: { $0 is SegmentedControlUnderlineView }) {
            underline.removeFromSuperview()
        }

        // Create it and add as subview
        let underline = SegmentedControlUnderlineView()
        underline.backgroundColor = color
        addSubview(underline)

        underline.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(numberOfSegments)
            $0.bottom.equalToSuperview()
        }
    }

    func changeUnderlinePosition() {
        guard let underline = subviews.first(where: { $0 is SegmentedControlUnderlineView }) else {
            return
        }

        let underlineXPosition = (bounds.width / CGFloat(numberOfSegments)) * CGFloat(selectedSegmentIndex)
        underline.snp.updateConstraints {
            $0.leading.equalTo(underlineXPosition)
        }
    }

    func setupUnderlineColor(_ color: UIColor) {
        guard let underline = subviews.first(where: { $0 is SegmentedControlUnderlineView }) else {
            return
        }

        underline.backgroundColor = color
    }
}


class SegmentedControlUnderlineView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        snp.makeConstraints {
            $0.height.equalTo(2)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
