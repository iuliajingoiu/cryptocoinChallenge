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
    private(set) var cryptocoinController = AssetsTableViewController(data: .init())
    private(set) var commoditiesController = AssetsTableViewController(data: .init())
    private(set) var fiatsController = AssetsTableViewController(data: .init())
    private(set) var pages = [UIViewController]()
    private(set) var assetsViewModel = AssetsViewModel()
    private(set) var collectionsViewModel = CollectionsViewModel()
    
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
        pages = [cryptocoinController, commoditiesController, fiatsController]
    }
}

// MARK: - Helpers
extension AssetsController {
    private func fetchCollections() {
        let group = DispatchGroup()
        group.enter()
        assetsViewModel.fetchCollections{ collections in
            group.leave()
        }
        
        group.enter()
        collectionsViewModel.fetchCryptocoins { cryptocoins in
            group.leave()
        }
        
        group.enter()
        collectionsViewModel.fetchCommodities { commodities in
            group.leave()
        }
        
        group.enter()
        collectionsViewModel.fetchFiats { fiats in
            group.leave()
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self = self else {
                return
            }
            self.segmentedControlView.items = self.assetsViewModel.collections.map { $0.title }
            self.cryptocoinController.dataSource = self.collectionsViewModel.cryptocoins
            self.commoditiesController.dataSource = self.collectionsViewModel.commodities
            self.fiatsController.dataSource = self.collectionsViewModel.fiats
            self.pageViewController.setViewControllers([self.pages[0]], direction: .forward, animated: true, completion: nil)
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
