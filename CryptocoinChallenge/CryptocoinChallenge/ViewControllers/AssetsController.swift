//
//  AssetsController.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit

class AssetsController: UIViewController {

    private(set) weak var segmentedControlView: SegmentedControlView!
    private(set) var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    private(set) var pages = [UIViewController]()
    private(set) var assetsViewModel = AssetsViewModel()
    private(set) var collectionsViewModel = CollectionsViewModel()
    
    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchCollections()
    }
    
    // MARK: - Navigation
    override var navigationItem: UINavigationItem {
        let item = super.navigationItem
        // TODO: - Add localization
        item.title = "Assets"
        return item
    }
    
    // MARK: - Setup
    private func setupUI() {
        let segmentedControlView = SegmentedControlView()
        segmentedControlView.delegate = self
        segmentedControlView.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        let container = UIView()
        let mainStack = [segmentedControlView, container]
            .stacked(axis: .vertical)
        view.addSubview(mainStack)
        mainStack.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        self.segmentedControlView = segmentedControlView
        addChildViewController(pageViewController, in: container)
    }
}

// MARK: - Helpers
extension AssetsController {
    private func fetchCollections() {
        assetsViewModel.fetchCollections{ [weak self] collections in
            DispatchQueue.main.async {
                guard let self = self else {
                    return
                }
                self.segmentedControlView.items = self.assetsViewModel.collections.map { $0.rawValue }
            }
        }
        
        collectionsViewModel.fetchCryptocoins { [weak self] cryptocoins in
            guard let self = self else {
                return
            }
            let cryptocoinController = AssetsTableViewController(data: self.collectionsViewModel.cryptocoins)
            self.pages.append(cryptocoinController)
        }
        
        collectionsViewModel.fetchCommodities { [weak self] commodities in
            guard let self = self else {
                return
            }
            let commoditiesController = AssetsTableViewController(data: self.collectionsViewModel.commodities)
            self.pages.append(commoditiesController)
        }
        
        collectionsViewModel.fetchFiats { [weak self] fiats in
            guard let self = self else {
                return
            }
            let fiatsController = AssetsTableViewController(data: self.collectionsViewModel.fiats)
            self.pages.append(fiatsController)
        }
    }
}

// MARK: - SegmentedControlViewDelegate
extension AssetsController: SegmentedControlViewDelegate {
    func segmentedControlViewDidSelectIndex(_ view: SegmentedControlView, index: Int) {
        guard index < pages.count else {
            return
        }

        pageViewController.setViewControllers([pages[index]], direction: .forward, animated: false, completion: nil)
    }
}
