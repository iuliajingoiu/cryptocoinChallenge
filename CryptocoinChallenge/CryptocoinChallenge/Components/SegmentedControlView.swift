//
//  SegmentedControlView.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit

protocol SegmentedControlViewDelegate: AnyObject {
    func segmentedControlViewDidSelectIndex(_ view: SegmentedControlView, index: Int)
}

class SegmentedControlView: UIView {
    
    // MARK: - Properties
    private(set) var segmentedControl: UISegmentedControl = .init()
    weak var delegate: SegmentedControlViewDelegate?
    
    var textColor: UIColor = .gray {
        didSet {
            setupSegmentedControlTextColor()
        }
    }

    var textTintColor: UIColor = .white {
        didSet {
            setupSegmentedControlTextTintColor()
        }
    }

    var underlineColor: UIColor = .white {
        didSet {
            setupSegmentedControlUnderlineColor()
        }
    }

    // Make it customizable depending on available keys
    var items = [String]() {
        didSet {
            segmentedControl.setSegments(with: items, andUnderlineSelection: true, underlineColor: underlineColor)
        }
    }

    var selectedSegmentIndex: Int {
        get {
            return segmentedControl.selectedSegmentIndex
        }
        set {
            segmentedControl.selectedSegmentIndex = newValue
            segmentedControl.changeUnderlinePosition()
        }
    }

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        segmentedControl.changeUnderlinePosition()
    }

    // MARK: - Setup
    private func setupUI() {
        backgroundColor = UIColor.clear

        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .clear
        
        if #available(iOS 13.0, *) {
            segmentedControl.selectedSegmentTintColor = .clear
        }

        segmentedControl.addTarget(self, action: #selector(SegmentedControlView.indexChanged(_:)), for: .valueChanged)
        addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        setupSegmentedControlUnderlineColor()
        setupSegmentedControlTextColor()
        setupSegmentedControlTextTintColor()
    }

    private func setupSegmentedControlTextColor() {
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: textColor,
            .font: UIFont.systemFont(ofSize: 12, weight: .semibold)
        ]

        segmentedControl.setTitleTextAttributes(textAttributes, for: .normal)
    }

    private func setupSegmentedControlTextTintColor() {
        let tintTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: textTintColor,
            .font: UIFont.systemFont(ofSize: 12, weight: .semibold)
        ]

        segmentedControl.setTitleTextAttributes(tintTextAttributes, for: .selected)
    }

    private func setupSegmentedControlUnderlineColor() {
        segmentedControl.setupUnderlineColor(underlineColor)
    }

    // MARK: - Helpers
    @objc
    func indexChanged(_ sender: UISegmentedControl) {
        sender.changeUnderlinePosition()
        delegate?.segmentedControlViewDidSelectIndex(self, index: sender.selectedSegmentIndex)
    }
    
}

